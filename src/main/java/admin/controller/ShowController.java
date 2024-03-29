package admin.controller;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptithcm.controller.LoginController;
import ptithcm.entity.ChiTietTheLoai;
import ptithcm.entity.GiaVeConfig;
import ptithcm.entity.KhachHang;
import ptithcm.entity.KhuyenMai;
import ptithcm.entity.LichChieu;
import ptithcm.entity.LoaiVe;
import ptithcm.entity.NhanVien;
import ptithcm.entity.Phim;
import ptithcm.entity.PhongChieu;
import ptithcm.entity.TaiKhoan;
import ptithcm.entity.Ve;

@Transactional
@Controller
@RequestMapping("/admin/")
public class ShowController {
	@Autowired
	SessionFactory factory;

	public List<KhachHang> getUsers() {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();
		return list;
	}

	public List<Ve> getVes() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve";
		Query query = session.createQuery(hql);
		List<Ve> list = query.list();
		return list;
	}

	public List<Phim> getPhimDCs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maTT = 1";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}

	public List<Phim> getPhimNCs() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maTT = 2";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}

	public LichChieu layLC(int MaSC) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu where MaSuatChieu = :id";
		Query query = session.createQuery(hql);
		query.setParameter("id", MaSC);
		LichChieu lc = (LichChieu) query.list().get(0);
		return lc;
	}

	public List<Ve> LayLV() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve";
		Query query = session.createQuery(hql);
		List<Ve> list = query.list();
		return list;
	}

	@SuppressWarnings("deprecation")
	@RequestMapping("dashboard")
	public String dashboard(ModelMap model) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		int countUser = getUsers().size();
		int countVe = getVes().size();
		int countPhim = getPhims().size();
		int price = 0;

		List<Ve> lvs = LayLV();
		for (Ve lv : lvs) {
			LichChieu lc = layLC(lv.getDsLichChieu().getMaSC());
			if (lc.getNgayChieu().getDay() > 0 && lc.getNgayChieu().getDay() < 6) {
				price += 100000;
			} else {
				price += 150000;
			}
		}

		DecimalFormat decimalFormat = new DecimalFormat("###,###");
		String totalPrice = decimalFormat.format(price);

		List<Phim> phims = getPhims();
		List<Phim> phimDCs = getPhimDCs();
		List<Phim> phimNCs = getPhimNCs();
		model.addAttribute("countUser", countUser);
		model.addAttribute("countVe", countVe);
		model.addAttribute("countPhim", countPhim);
		model.addAttribute("totalPrice", totalPrice);
		model.addAttribute("phim", phims);
//		model.addAttribute("phimDC", phimDCs);
//		model.addAttribute("phimNC", phimNCs);

		return "admin/dashboard";
	}

	@RequestMapping("profile")
	public String profile(ModelMap model, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		model.addAttribute("tk", LoginController.taikhoan);
		model.addAttribute("user", LoginController.nv);
		model.addAttribute("mk", LoginController.matKhau);
		return "admin/profile";
	}

	@RequestMapping(value = "employee", method = RequestMethod.GET)
	public String employee(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		HttpSession session = request.getSession();
		if (session.getAttribute("user") == null) {
			model.addAttribute("user", LoginController.nv);
			model.addAttribute("tk", LoginController.taikhoan);
		} else {
			TaiKhoan a = (TaiKhoan) session.getAttribute("tk");
			model.addAttribute("tk", a);

			NhanVien nv = (NhanVien) session.getAttribute("user");
			model.addAttribute("user", nv);
		}

		// XUAT RA HET TAT CA LIST NHAN VIEN

//		Session session_1 = factory.getCurrentSession(); 
//		String hql = "FROM NhanVien ";
//		Query query = session_1.createQuery(hql); 
//		List<NhanVien> list = query.list();
//		model.addAttribute("nv", list);
//		model.addAttribute("NhanVien", new NhanVien());
//		model.addAttribute("TaiKhoan", new TaiKhoan());
//		return "admin/employee";

		// TIM THEO DIEU KIEN SO DIEN THOAI

//		Session session_1 = factory.getCurrentSession(); 
//		String hql = "FROM NhanVien WHERE SDT = :SDT";
//		Query query = session_1.createQuery(hql);
//		query.setParameter("SDT", "0814201800");
//		List<NhanVien> list = query.list();
//		model.addAttribute("nv", list);
//		model.addAttribute("NhanVien", new NhanVien());
//		model.addAttribute("TaiKhoan", new TaiKhoan());
//		return "admin/employee";

		// XUAT RA LIST QUYEN 'NV' ('QL' )
		Session session_1 = factory.getCurrentSession();
		String hql = "SELECT nv FROM NhanVien nv JOIN nv.dstaikhoan tk WHERE tk.quyen.maQuyen = 'NV'";
		Query query = session_1.createQuery(hql);
		List<NhanVien> list = query.list();
		model.addAttribute("nv", list);
		model.addAttribute("NhanVien", new NhanVien());
		model.addAttribute("TaiKhoan", new TaiKhoan());
		return "admin/employee";
	}

	@SuppressWarnings("unchecked")
	public List<Ve> CountListVeByKH(int maKH) {
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve where maKH=:maKH";
		Query query = session.createQuery(hql);
		query.setParameter("maKH", maKH);
		return query.list();
	}

	@RequestMapping("customer")
	public String customer(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM KhachHang";
		Query query = session.createQuery(hql);
		List<KhachHang> list = query.list();

		Map<Integer, Integer> countVeMap = new HashMap<>(); // Khởi tạo Map để lưu trữ số lượng vé đã mua

		for (KhachHang kh : list) {
			int countVe = CountListVeByKH(kh.getMaKH()).size();
			countVeMap.put(kh.getMaKH(), countVe); // Lưu số lượng vé đã mua vào Map
		}

		model.addAttribute("kh", list);
		model.addAttribute("countVeMap", countVeMap); // Truyền Map vào ModelMap

		return "admin/customer";
	}

	@RequestMapping("type")
	public String type(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM ChiTietTheLoai";
		Query query = session.createQuery(hql);
		List<ChiTietTheLoai> list = query.list();
		model.addAttribute("type", list);
		return "admin/type";
	}

	public List<LoaiVe> getListLoaiVe() {
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiVe";
		Query query = session.createQuery(hql);
		List<LoaiVe> list = query.list();

		return list;
	}

	@RequestMapping("movie")
	public String movie(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim order by MaPhim desc";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();

		List<LoaiVe> lv = getListLoaiVe();

		model.addAttribute("phim", list);
		model.addAttribute("dsCTTL", getAllCTTL());
		model.addAttribute("lv", lv);
		model.addAttribute("km", getAllKM());
		return "admin/movie";
	}

	public List<KhuyenMai> getAllKM() {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhuyenMai WHERE MaTT = 0";
		Query query = session.createQuery(hql);
		return query.list();
	}

	public List<ChiTietTheLoai> getAllCTTL() {
		Session session = factory.getCurrentSession();
		String hql = "FROM ChiTietTheLoai";
		Query query = session.createQuery(hql);
		return query.list();
	}

	@RequestMapping("ticket")
	public String ticket(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiVe";
		Query query = session.createQuery(hql);
		List<LoaiVe> list = query.list();

		model.addAttribute("lv", list);
		return "admin/ticket";
	}

	@RequestMapping("room")
	public String room(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql);
		List<PhongChieu> list = query.list();

		model.addAttribute("pc", list);
		return "admin/room";
	}

	@RequestMapping("tickets")
	public String tickets(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiVe";
		Query query = session.createQuery(hql);
		List<LoaiVe> list = query.list();

		model.addAttribute("ve", list);
		return "admin/tickets";
	}

	@RequestMapping("order")
	public String order(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM Ve";
		Query query = session.createQuery(hql);
		List<Ve> list = query.list();

		model.addAttribute("ve", list);
		return "admin/order";
	}

	public List<Phim> getPhimsTrue() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		List<Phim> listTrue = new ArrayList<Phim>();
		for (Phim p : list) {
			if (p.getMaTT() != 2) {
				listTrue.add(p);
			}
		}

		return listTrue;
	}

	public List<Phim> getPhims() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim where maTT <> 2";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();
		return list;
	}

	public List<PhongChieu> getRooms() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql);
		List<PhongChieu> list = query.list();
		return list;
	}

	public List<PhongChieu> getRoomsTrue() {
		Session session = factory.getCurrentSession();
		String hql = "FROM PhongChieu";
		Query query = session.createQuery(hql);
		List<PhongChieu> list = query.list();
		List<PhongChieu> listTrue = new ArrayList<PhongChieu>();
		for (PhongChieu p : list) {
			if (p.getTrangThai() == false) {
				listTrue.add(p);
			}
		}

		return listTrue;
	}

	@RequestMapping("showtimes")
	public String showtimes(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();
		List<Phim> phimTrue = getPhimsTrue();
		List<PhongChieu> phongChieuTrue = getRoomsTrue();

		model.addAttribute("lc", list);
		model.addAttribute("pct", phongChieuTrue);
		model.addAttribute("pt", phimTrue);

		return "admin/showtimes";
	}

	public KhuyenMai getMaxMaKM() {
		Session session = factory.getCurrentSession();
		String hql = "FROM KhuyenMai ORDER BY ID DESC";
		Query query = session.createQuery(hql);
		query.setMaxResults(1);
		KhuyenMai data = (KhuyenMai) query.uniqueResult();
		return data;
	}

	@SuppressWarnings("null")
	@RequestMapping("promotion")
	public String khuyenmai(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM KhuyenMai";
		Query query = session.createQuery(hql);
		List<KhuyenMai> list = query.list();

		// get mã KM hiển thị lên popup
		KhuyenMai data = getMaxMaKM();
		String maxKMNew = "";
		if (Objects.isNull(data)) {
			data = new KhuyenMai();
			maxKMNew = "KM01";
		} else {
			String letters = data.getMaKM().replaceAll("[^a-zA-Z]", ""); // Lấy phần chữ
			String numbers = data.getMaKM().replaceAll("[^0-9]", ""); // Lấy phần số
			Long maKM = Long.parseLong(numbers) + 01L;
			String maKMString = Long.toString(maKM);
			while (true) {
				if (maKMString.length() < 2) {
					maKMString = "0".concat(maKMString);
				} else {
					break;
				}
			}
			maxKMNew = letters + maKMString;
		}
		model.addAttribute("km", list);
		model.addAttribute("maxKMNew", maxKMNew);

		return "admin/promotion";
	}

	// Kiểm tra phim có đang trong lịch chiếu không
	public Boolean getDsPhimByLichChieu(Phim phim) {
		Session session = factory.getCurrentSession();
		String hql = "FROM LichChieu";
		Query query = session.createQuery(hql);
		List<LichChieu> list = query.list();
		
		for (LichChieu l : list) {
			if (l.getDsPhim().getMaPhim().equals(phim.getMaPhim())) {
				return false;
			}
		}

		return true;
	}

	// Lấy danh sách phim
	public List<Phim> getDsPhim() {
		Session session = factory.getCurrentSession();
		String hql = "FROM Phim";
		Query query = session.createQuery(hql);
		List<Phim> list = query.list();

		return list;
	}
	
	// Lấy danh sách loại vé
	public List<LoaiVe> getLoaiVe() {
		Session session = factory.getCurrentSession();
		String hql = "FROM LoaiVe";
		Query query = session.createQuery(hql);
		List<LoaiVe> list = query.list();

		return list;
	}

	@RequestMapping("ticket-config")
	public String ticketConfig(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}
		Session session = factory.getCurrentSession();
		String hql = "FROM GiaVeConfig order by id desc";
		Query query = session.createQuery(hql);
		List<GiaVeConfig> list = query.list();
		
		List<LoaiVe> listLoaiVe = getLoaiVe();
		List<Phim> phimS = getDsPhim();
		List<Phim> phimNewS = new ArrayList<>();
		for(Phim phim : phimS) {
			if(getDsPhimByLichChieu(phim)) {
				phimNewS.add(phim);
			}
		}

		model.addAttribute("lve", listLoaiVe);
		model.addAttribute("lp", phimNewS);
		model.addAttribute("lv", list);

		return "admin/ticket-config";
	}
	
	@RequestMapping("theater")
	public String theater(ModelMap model, HttpServletRequest request, HttpSession ss) {
		if(LoginController.taikhoan.getEmail() == null) {
			model.addAttribute("login", false);
			return "login";
		}

		return "admin/theater";
	}

}