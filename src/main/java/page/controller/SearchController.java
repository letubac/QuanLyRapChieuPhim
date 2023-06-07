package page.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import ptithcm.controller.LoginController;
import ptithcm.entity.Phim;
@Transactional
@Controller
public class SearchController {
	@Autowired
	SessionFactory factory;  
	
	public Phim layPhim(String tenPhim)
	{
		//makh.trim();
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		for(Phim u : list) {
			if(u.getTenPhim().equalsIgnoreCase(tenPhim) == true){
				return u;
			}
		}
		return null;
	}
	
	@RequestMapping("/search")
	public String search(ModelMap model, @ModelAttribute("search") String search) {
		String s = search.trim();
		Phim p = layPhim(s);
		if(p == null) {
			return "redirect: /QuanLyRapChieuPhim/home.htm";
		}		
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
		}
		else {
			model.addAttribute("login", true);
		}
		return "redirect: /QuanLyRapChieuPhim/film/detail/ma=" + p.getMaPhim() + ".htm";
		
	}
}
