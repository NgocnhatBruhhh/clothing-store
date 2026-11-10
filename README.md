# 👕 Clothing Store – Website bán quần áo

Ứng dụng web thương mại điện tử bán quần áo, xây dựng bằng **Spring MVC + Hibernate + JSP**, chạy trên **Apache Tomcat 9** và lưu dữ liệu bằng **SQL Server**. Hệ thống có 3 nhóm người dùng (khách hàng, nhân viên, quản trị viên), giỏ hàng, đặt hàng và thanh toán online qua **VNPay** và **ZaloPay** (môi trường sandbox).

> Đề tài: *"Web mua bán quần áo"* – bài tập nhóm 5 sinh viên.

---

## ✨ Tính năng

### Khách hàng (user)
- Xem danh sách sản phẩm, tìm kiếm, xem chi tiết (size, chất liệu, thương hiệu, xuất xứ, giá, tồn kho).
- Giỏ hàng: thêm / xoá / cập nhật số lượng, chọn sản phẩm để thanh toán. Khách chưa đăng nhập vẫn có giỏ hàng lưu trong session.
- Đặt hàng và thanh toán, mua lại đơn cũ (`repurchase`).
- Xem lịch sử đơn hàng, chi tiết đơn, huỷ đơn kèm lý do.
- Quản lý thông tin cá nhân, ảnh đại diện, đổi mật khẩu.
- Đăng ký, đăng nhập, đăng xuất, quên mật khẩu bằng mã xác nhận gửi qua email.

### Nhân viên (employee)
- Quản lý sản phẩm: thêm, sửa, xoá, tìm kiếm.
- Quản lý chi tiết sản phẩm (size, số lượng, giá) và các thuộc tính: loại, thương hiệu, chất liệu, xuất xứ, kích cỡ.
- Quản lý đơn hàng: xem danh sách, xem chi tiết, cập nhật trạng thái, huỷ đơn kèm lý do.
- Cập nhật thông tin cá nhân.

### Quản trị viên (admin)
- Quản lý nhân viên: thêm, xem, sửa thông tin, quản lý trạng thái làm việc (đang làm / nghỉ).

### Thanh toán
- Nhiều phương thức thanh toán (bảng `payment_methods`).
- Tích hợp **VNPay** và **ZaloPay** (sandbox), có xử lý trang kết quả thanh toán và thanh toán lại cho đơn đã tạo.

### Bảo mật
- Mật khẩu được băm bằng **BCrypt**; kiểm tra độ mạnh mật khẩu (≥ 8 ký tự, có chữ hoa, chữ thường, số, ký tự đặc biệt).
- Phân quyền theo vai trò (admin / employee / user) bằng **JWT** lưu trong cookie `HttpOnly`.
- **CAPTCHA** hiển thị khi đăng nhập sai nhiều lần.
- Lọc đầu vào chống **XSS** bằng Jsoup.
- Kiểm tra loại file khi upload ảnh.

---

## 🛠 Công nghệ sử dụng

| Thành phần | Công nghệ |
|---|---|
| Ngôn ngữ | Java |
| Framework | Spring MVC (cấu hình bằng XML), Hibernate 4 (ORM) |
| View | JSP, CSS, JavaScript |
| Cơ sở dữ liệu | Microsoft SQL Server |
| Application server | Apache Tomcat 9.0.89 |
| Xác thực | JWT (jjwt), BCrypt (jBCrypt) |
| Thanh toán | VNPay, ZaloPay (sandbox) |
| Khác | JavaMail (gửi email), Jsoup (chống XSS), Gson / Jackson, Apache HttpClient, Commons FileUpload |

---

## 📁 Cấu trúc thư mục

```
clothing-store/
├── script_database/
│   ├── script_tao_database.sql      # Tạo database và các bảng
│   └── script_du_lieu_mau.sql       # Dữ liệu mẫu
└── shop_c/
    ├── db_note.txt                  # Mô tả chi tiết các bảng trong CSDL
    ├── data.sql, dbSC_v2.sql, dbSC_v3.sql   # Các phiên bản script cũ
    └── webs/                        # ⭐ Thư mục dự án web (Eclipse Dynamic Web Project)
        ├── apache-tomcat-9.0.89/    # Tomcat kèm theo
        └── src/main/
            ├── java/webshop/
            │   ├── controller/      # Admin, Employee, Login, User, Cart, Order, Payment
            │   ├── dao/             # Lớp truy cập dữ liệu (Hibernate)
            │   ├── entity/          # Các entity ánh xạ bảng
            │   ├── interceptor/     # CartInterceptor (đếm số sản phẩm trong giỏ)
            │   ├── paymentMethod/   # Tích hợp VNPay, ZaloPay
            │   └── security/        # JWT, BCrypt, Email, XSS, phân quyền
            └── webapp/
                ├── css/, js/
                ├── index.jsp
                └── WEB-INF/
                    ├── web.xml
                    ├── configs/     # spring-config-mvc.xml, spring-config-hibernate.xml
                    └── views/       # admin, employee, user, login, payment, layout
```

---

## 🗄 Cơ sở dữ liệu

Database tên **`shop_c`**, gồm các nhóm bảng chính:

- **Tài khoản & phân quyền:** `rules`, `accounts`, `staffs`, `customers`
- **Sản phẩm:** `products`, `product_details`, `types`, `brands`, `materials`, `origins`, `sizes`
- **Mua hàng:** `carts`, `orders`, `order_details`, `invoice_status` (trạng thái đơn), `payment_methods`, `reasons` (lý do huỷ đơn)
- **Khác:** `feedbacks`

Trạng thái đơn hàng: *Đang chờ xử lý → Đã thanh toán → Đang giao hàng → Đã hoàn thành*, hoặc *Đã huỷ*.

Xem mô tả từng cột trong [`shop_c/db_note.txt`](shop_c/db_note.txt).

---

## 🚀 Hướng dẫn cài đặt & chạy

### Yêu cầu
- JDK 8 trở lên
- Apache Tomcat 9 (đã kèm trong `shop_c/webs/apache-tomcat-9.0.89`)
- Microsoft SQL Server (bật giao thức TCP/IP, cổng `1433`, bật SQL Server Authentication)
- Eclipse IDE for Enterprise Java (hoặc IDE khác hỗ trợ Dynamic Web Project)
- Các thư viện `.jar` cần thiết đặt trong `WEB-INF/lib` (Spring, Hibernate, SQL Server JDBC, jjwt, jBCrypt, Jsoup, Gson, Jackson, HttpClient, commons-codec, commons-fileupload, JavaMail, JSTL)

### Bước 1 – Tạo database
Mở SQL Server Management Studio và chạy lần lượt:
1. `script_database/script_tao_database.sql` – tạo database `shop_c` và các bảng.
2. `script_database/script_du_lieu_mau.sql` – nạp dữ liệu mẫu.

### Bước 2 – Cấu hình kết nối
Mở `shop_c/webs/src/main/webapp/WEB-INF/configs/spring-config-hibernate.xml` và chỉnh thông tin kết nối cho đúng với máy của bạn:

```xml
p:url="jdbc:sqlserver://localhost:1433; Database=shop_c"
p:username="<tài khoản SQL Server>"
p:password="<mật khẩu>"
```

### Bước 3 – Cấu hình email (quên mật khẩu)
Trong `spring-config-mvc.xml`, bean `mailSender` dùng SMTP của Gmail. Hãy thay `username` và `password` bằng **tài khoản Gmail + App Password của bạn** (không dùng mật khẩu đăng nhập thường).

### Bước 4 – Cấu hình thanh toán (tuỳ chọn)
- VNPay: `webshop/paymentMethod/VNPayConfig.java` (`vnp_TmnCode`, `secretKey`, `vnp_ReturnUrl`)
- ZaloPay: `webshop/paymentMethod/ZaloPayConfig.java` (`APP_ID`, `KEY1`, `KEY2`)

Các URL trả về mặc định trỏ tới `http://localhost:8080/shop_c/...`, nên cần chạy ứng dụng với context path là **`shop_c`** trên cổng **8080**.

### Bước 5 – Chạy ứng dụng
1. Import thư mục `shop_c/webs` vào Eclipse (*File → Import → Existing Projects into Workspace*).
2. Thêm server **Tomcat 9.0.89** (trỏ tới thư mục `apache-tomcat-9.0.89` trong dự án).
3. *Run As → Run on Server*, đặt context path `shop_c`.
4. Truy cập: **http://localhost:8080/shop_c/**

> Các URL của Spring MVC dùng đuôi `.htm`, ví dụ `http://localhost:8080/shop_c/home.htm`.

---

## 🔗 Một số đường dẫn chính

| Vai trò | URL | Chức năng |
|---|---|---|
| Khách | `/home.htm`, `/productinfo.htm`, `/search.htm` | Trang chủ, chi tiết sản phẩm, tìm kiếm |
| Khách | `/cart.htm`, `/order.htm`, `/payment.htm` | Giỏ hàng, đơn hàng, thanh toán |
| Chung | `/login.htm`, `/register.htm`, `/logout.htm` | Đăng nhập, đăng ký, đăng xuất |
| Chung | `/inputemail.htm` | Bắt đầu quy trình quên mật khẩu |
| Nhân viên | `/emhome.htm`, `/emproduct.htm`, `/emorder.htm` | Trang chủ, sản phẩm, đơn hàng |
| Quản trị | `/adhome.htm`, `/staffmanage.htm`, `/addstaff.htm` | Trang chủ, quản lý nhân viên |

---

## ⚠️ Lưu ý bảo mật khi triển khai thật

Dự án phục vụ mục đích học tập, nên một số thông tin đang đặt trực tiếp trong mã nguồn. Trước khi public hoặc triển khai thật, hãy:

- Chuyển mật khẩu DB, mật khẩu email, khoá VNPay / ZaloPay, khoá bí mật JWT sang **biến môi trường** hoặc file cấu hình không đưa lên Git.
- Đổi mọi khoá / mật khẩu đã từng lộ trong lịch sử commit.
- Đặt thời gian hết hạn cho JWT và bật cờ `Secure` cho cookie khi chạy HTTPS.

---

## 👥 Thành viên nhóm

| MSSV | Họ và tên |
|---|---|
| N21DCAT006 | Ngô Ngọc Minh Châu |
| N21DCAT010 | Ngô Văn Đạt |
| N21DCAT030 | Phan Hoàng Lý |
| N21DCAT035 | Võ Văn Ngọc |
| N21DCAT043 | Nguyễn Anh Quân |
