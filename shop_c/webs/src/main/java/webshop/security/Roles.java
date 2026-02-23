package webshop.security;

public class Roles {
	private static String admin = "admin_role";
	private static String employee = "employee_role";
	private static String user = "user_role";
	
	public static String getAdmin() {
        return admin;
    }

    public static String getEmployee() {
        return employee;
    }

    public static String getUser() {
        return user;
    }
}
