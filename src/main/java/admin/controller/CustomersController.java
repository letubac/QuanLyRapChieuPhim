package admin.controller;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import ptithcm.entity.KhachHang;
import ptithcm.entity.NhanVien;

@Transactional
@Controller
@RequestMapping("admin")
public class CustomersController {
	
	@Autowired
	SessionFactory factory;

	public KhachHang getSingleCustomer(Integer maKH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang where maKH=:maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		KhachHang n = (KhachHang) query.list().get(0);

		return n;
	}

	public List<KhachHang> customer() {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		return list;
	}
	
	@RequestMapping(value = "customer/update/{id}.htm",  method=RequestMethod.POST)
	public String updateStatusE(ModelMap model,@ModelAttribute("khachHang") KhachHang khachHang, @PathVariable("id") String id,RedirectAttributes redirectAttributes) {
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			int idI = Integer.parseInt(id);
			KhachHang nvnews = this.getSingleCustomer(idI);
			if(nvnews.getTrangThai()) {
				nvnews.setTrangThai(false);
			} else {
				nvnews.setTrangThai(true);
			}
			session.merge(nvnews);
			t.commit();
			
			return "redirect:/admin/customer.htm";
		}
		catch(Exception e) {
			System.out.println(e);
			t.rollback();
		}
		finally {
			session.close();
		}

		List<KhachHang> listKH = customer();
		
		model.addAttribute("kh", listKH);
		return "admin/customer";
	}
}
