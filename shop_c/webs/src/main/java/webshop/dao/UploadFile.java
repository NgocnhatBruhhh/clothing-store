package webshop.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;

@Component
public class UploadFile {
	private final ServletContext context;

	@Autowired
	public UploadFile(ServletContext context) {
		this.context = context;
	}

	public String handleFileUpload(MultipartFile file) throws IOException {
		if (file.isEmpty()) {
			return "Vui lòng chọn file!";
		}

		String[] allowedFileTypes = { "image/jpeg", "image/png", "image/gif", "application/pdf", "application/msword",
				"application/vnd.openxmlformats-officedocument.wordprocessingml.document" };

		boolean fileTypeValid = false;
		for (String type : allowedFileTypes) {
			if (type.equals(file.getContentType())) {
				fileTypeValid = true;
				break;
			}
		}
		String uploadDir = context.getRealPath("/images/avatar/");
	    File uploadDirFile = new File(uploadDir);
	    if (!uploadDirFile.exists()) {
	        uploadDirFile.mkdirs();
	    }

		if (!fileTypeValid) {
			return "Loại file không hợp lệ!";
		}

		 // Tạo tên file và lưu file
	    String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();  // Đảm bảo tên file duy nhất
	    File destFile = new File(uploadDir, fileName);
	    file.transferTo(destFile);

	    return fileName;  // Trả về tên file đã lưu
	}
}
