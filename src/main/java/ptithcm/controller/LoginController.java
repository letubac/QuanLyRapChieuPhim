package ptithcm.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;
import javax.xml.bind.DatatypeConverter;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.entity.KhachHang;
import ptithcm.entity.NhanVien;
import ptithcm.entity.TaiKhoan;

@Transactional
@Controller
@RequestMapping("/login")
public class LoginController {
	@Autowired
	SessionFactory factory;
	
	public static TaiKhoan taikhoan=new TaiKhoan();
	public static NhanVien nv=new NhanVien();
	public static KhachHang kh=new KhachHang();
	public static String matKhau;
	
	@RequestMapping(method = RequestMethod.GET)
	public String index(ModelMap model,HttpServletRequest request,HttpSession ss) {
		
		//HttpSession session = request.getSession();
		if(LoginController.taikhoan.getEmail() == null)
		{
			//model.addAttribute("login","Login");
		}
		else
		{
			LoginController.taikhoan = new TaiKhoan();
		}
		model.addAttribute("login", false);
		return "login";
	}
	
	public NhanVien layNV(String email)
	{
		email.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM NhanVien where Email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		NhanVien p =(NhanVien)query.list().get(0);
		return p;
	}
	
	public KhachHang layKH(String email)
	{
		email.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang where Email = :email";
		Query query = session.createQuery(hql);
		query.setParameter("email", email);
		KhachHang p =(KhachHang)query.list().get(0);
		return p;
	}
	
	@RequestMapping(value = "/login",method=RequestMethod.POST)
	public String insert(ModelMap model,HttpServletRequest request,HttpSession ss) throws NoSuchAlgorithmException
	{
		HttpSession session1 = request.getSession();
		session1.removeAttribute("user");
		
		String username = request.getParameter("email"); 
		String password = request.getParameter("password");
		username.trim();
		password.trim();
		MessageDigest md = MessageDigest.getInstance("MD5");
		md.update(password.getBytes());
		byte[] digest = md.digest();
	    String myHash = DatatypeConverter.printHexBinary(digest).toLowerCase();
		
		
		boolean kt=true;
		//Kiểm tra Email đăng nhập
		if(username.equals("")==true)
		{
			model.addAttribute("errorTK", "Email không được để trống!");
			kt=false;
		}
		
		//Kiểm tra mật khẩu đăng nhập
		if(password.equals("")==true)
		{
			model.addAttribute("errorMK", "Mật khẩu không được để trống!");
			kt=false;
		}

		if(kt==false)
		{
			return "login";
		}
		
		
		Session session = factory.getCurrentSession(); 
		String hql = "FROM TaiKhoan";

		Query query = session.createQuery(hql); 
		List<TaiKhoan> list = query.list();
		
		for(TaiKhoan u : list) {
			if(username.equals(u.getEmail().trim())==true) {
				if(myHash.equals(u.getPassword().trim()) == false) { 
					model.addAttribute("messageA", "Sai mật khẩu!");
					model.addAttribute("login","Login");
					return "login";
				}
				/*if(password.equals(u.getPassword().trim()) == false){
					model.addAttribute("messageA", "Sai mật khẩu!");
					model.addAttribute("login","Login");
					return "login";
				}*/
				else
				{
					//Kiểm tra mã quyền có phải NHÂN VIÊN không!
					if(u.getQuyen().getMaQuyen().trim().equals("NV"))
					{
						taikhoan = u;
						nv = taikhoan.getNhanvienlist().iterator().next();
						matKhau = password;
						if(layNV(u.getEmail()).getTrangThai() == false) {
							model.addAttribute("messageA","Tài khoản đã quá hạn sử dụng!");
							return "login";
						}
						
						return "redirect:/staff/order.htm";
					}
					
					//Kiểm tra mã quyên có phải QUẢN LÝ không!
					else if(u.getQuyen().getMaQuyen().trim().equals("QL"))
					{
						taikhoan=u;
						nv=taikhoan.getNhanvienlist().iterator().next();
						matKhau = password;
						model.addAttribute("tk",taikhoan);
						model.addAttribute("user",nv);
						model.addAttribute("mk", matKhau);
						return "redirect:/admin/profile.htm";
					}
					
					//Kiểm tra mã quyên có phải KHÁCH HÀNG không!
					else if(u.getQuyen().getMaQuyen().trim().equals("KH"))
					{
						taikhoan = u;
						kh = taikhoan.getKhachhanglist().iterator().next();
						matKhau = password;
						if(layKH(u.getEmail()).getTrangThai() == false) {
							model.addAttribute("messageA","Tài khoản đã quá hạn sử dụng!");
							return "login";
						}
						
						model.addAttribute("tk",taikhoan);
						model.addAttribute("user", kh);
						model.addAttribute("mk", matKhau);
						model.addAttribute("login", true);
						return "redirect:/customer/account.htm";
					}
					else
					{
						model.addAttribute("messageA", "Vui lòng đăng nhập lại!");
						model.addAttribute("login","Login");
						return "login";
					}
					
					
				}
			}
		}
		model.addAttribute("messageA", "Email không tồn tại!");
		model.addAttribute("login","Login");
		return "login";
	}
}
