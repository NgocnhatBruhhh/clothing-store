package webshop.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import webshop.dao.AccountDAO;
import webshop.dao.RuleDAO;
import webshop.dao.StaffDAO;
import webshop.entity.Account;
import webshop.entity.Brand;
import webshop.entity.Material;
import webshop.entity.Origin;
import webshop.entity.Rule;
import webshop.entity.Staff;
import webshop.entity.Type;
import webshop.security.Authentication;
import webshop.security.Bcrypt;
import webshop.security.JwtUtil;
import webshop.security.Roles;

@Controller
public class AdminController {
	
	@Autowired
	AccountDAO accd;
	@Autowired
	RuleDAO rd;
	@Autowired
	StaffDAO staffDAO;
	

	@RequestMapping("adhome")
	public String homee(ModelMap model, HttpSession ses,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		int auth = Authentication.redirectAuthen(request, response);
		
		if(auth!=1) return "redirect:home.htm";

		return "admin/home";
	}
	
	
	//xem thông tin nhân viên 
    @RequestMapping(value = "staffInfo", method = RequestMethod.POST)
    public String emplManagerG(
            @RequestParam("id") int accID,
            ModelMap model,
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {

    	int auth = Authentication.redirectAuthen(request, response);
		
		if(auth!=1) return "redirect:home.htm";

        // Lấy thông tin nhân viên từ database
        Staff staff = staffDAO.getStaffByAccountId(accID);

        if (staff == null) {
            // Tạo một nhân viên mới nếu chưa có trong hệ thống
            Staff tmp = new Staff();
            tmp.setAccount(accd.getAccountById(accID));
            tmp.setStatus(1);
            tmp.setName("");
            tmp.setPhone("");
            staff = tmp;

            boolean created = staffDAO.addStaff(staff);
            if (!created) return "error";
        }

        model.addAttribute("staff", staff);
        return "admin/staffInfo";
    }

    
    @RequestMapping(value = "staffinfo", method = RequestMethod.POST)
    public String emplManagerP(
            @RequestParam("id") int staffId,
            @RequestParam("name") String name,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            @RequestParam("status") int status,
            @RequestParam("accountStatus") int accountStatus,
            ModelMap model,
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {

    	int auth = Authentication.redirectAuthen(request, response);
		
		if(auth!=1) return "redirect:home.htm";

        // Lấy thông tin Staff từ database
        Staff staff = staffDAO.getStaffById(staffId);

        if (staff == null) {
//            model.addAttribute("error", "Không tìm thấy nhân viên để cập nhật.");
            return "redirect:account.htm";
        }

        // Cập nhật thông tin nhân viên
        staff.setName(name);
        staff.setPhone(phone);
        staff.setAddress(address);
        staff.setStatus(status);

        // Cập nhật trạng thái tài khoản
        Account account = staff.getAccount();
        if (account != null) {
            account.setStatus(accountStatus);
            boolean accountUpdated = accd.updateAccount(account);
            if (!accountUpdated) {

            }
        }

        boolean updated = staffDAO.updateStaff(staff);

        if (updated) {
//            model.addAttribute("message", "Cập nhật thông tin thành công.");
        } else {
//            model.addAttribute("message", "Cập nhật thông tin thất bại.");
        }

        model.addAttribute("staff", staff);
        return "redirect:staffmanage.htm";
    }


    //thêm nhân viên
    @RequestMapping(value= "addstaff")
    public String addEmplG(
            ModelMap model, 
            HttpServletRequest request, 
            HttpServletResponse response) throws IOException {

    	int auth = Authentication.redirectAuthen(request, response);
		
		if(auth!=1) return "redirect:home.htm";

        
        return "admin/addStaff";
    }

    @RequestMapping(value = "addstaff", method = RequestMethod.POST)
    public String addEmplP(
            @RequestParam("email") String email,
            @RequestParam("password") String password,
            @RequestParam("name") String name,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address,
            @RequestParam("status") int status,
            ModelMap model,
            HttpServletRequest request,
            HttpServletResponse response) throws IOException {

    	int auth = Authentication.redirectAuthen(request, response);
		
		if(auth!=1) return "redirect:home.htm";

        // Kiểm tra email đã tồn tại hay chưa
        Account existingAccount = accd.getAccountByEmail(email);
        if (existingAccount != null) {
            model.addAttribute("error", "Email đã tồn tại. Vui lòng sử dụng email khác.");
            return "admin/addStaff";
        }

        // Tạo mới Account
        Account account = new Account();
        account.setEmail(email);
        account.setPassword(Bcrypt.encodePassword(password)); // Nên mã hóa mật khẩu bằng Bcrypt
        account.setStatus(status);

        // Lấy Rule cho nhân viên (cần tùy chỉnh Rule tương ứng)
        Rule staffRule = rd.getRuleById(2); // Ví dụ Rule ID 2 là nhân viên
        account.setRule(staffRule);

        // Lưu Account vào cơ sở dữ liệu
        boolean isSaved = accd.saveAccount(account);

        if (isSaved) {
            Staff staff = new Staff();
            staff.setName(name);
            staff.setPhone(phone);
            staff.setAddress(address);
            staff.setAccount(account); // Liên kết Staff với Account
            staffDAO.addStaff(staff); // Lưu thông tin Staff

            model.addAttribute("success", "Thêm nhân viên thành công.");
            return "redirect:staffmanage.htm"; // Quay lại danh sách nhân viên
        } else {
            model.addAttribute("error", "Có lỗi xảy ra. Vui lòng thử lại.");
            return "admin/addStaff";
        }
    }

    //quan li nhan vien 
    @RequestMapping("staffmanage")
    public String staffManage(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws IOException {

    	int auth = Authentication.redirectAuthen(request, response);
		
		if(auth!=1) return "redirect:home.htm";

        // Lấy danh sách toàn bộ nhân viên từ cơ sở dữ liệu
        List<Staff> staffList = staffDAO.getAllStaffs();
        
        model.addAttribute("staffList", staffList);
        return "admin/staffManage";
    }
	
}
