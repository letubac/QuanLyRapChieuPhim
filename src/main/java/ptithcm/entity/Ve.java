package ptithcm.entity;

import java.util.Collection;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="VE")
public class Ve {
	@Id
	@Column(name="MaVe")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer maVe; // Mã vé - int - identity
	
	@ManyToOne
	@JoinColumn(name="MaSuatChieu")
	private LichChieu dsLichChieu; // Mã suất chiếu varchar(10)
	
	@ManyToOne
	@JoinColumn(name="maKH")
	private KhachHang khachHang; // Mã khách hàng int 
	
	@Column(name="SoGhe")
	private Integer soGhe; // Số ghế - int
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgayBan")
	private Date ngayBan; // Ngày bán - date
	
	@ManyToOne
	@JoinColumn(name="maLV")
	private LoaiVe loaiVe;// Mã loại vé - varchar(10)
	
	@ManyToOne
	@JoinColumn(name="maNV")
	private NhanVien nhanVien;// Mã nhân viên 
	
	public Ve() {
		// TODO Auto-generated constructor stub
	}
	
	public Integer getMaVe() {
		return maVe;
	}

	public void setMaVe(Integer maVe) {
		this.maVe = maVe;
	}

	public Integer getSoGhe() {
		return soGhe;
	}

	public void setSoGhe(Integer soGhe) {
		this.soGhe = soGhe;
	}

	public Date getNgayBan() {
		return ngayBan;
	}

	public void setNgayBan(Date ngayBan) {
		this.ngayBan = ngayBan;
	}

	public LichChieu getDsLichChieu() {
		return dsLichChieu;
	}

	public void setDsLichChieu(LichChieu dsLichChieu) {
		this.dsLichChieu = dsLichChieu;
	}

	public KhachHang getKhachHang() {
		return khachHang;
	}

	public void setKhachHang(KhachHang khachHang) {
		this.khachHang = khachHang;
	}

	public LoaiVe getLoaiVe() {
		return loaiVe;
	}

	public void setLoaiVe(LoaiVe loaiVe) {
		this.loaiVe = loaiVe;
	}

	public NhanVien getNhanVien() {
		return nhanVien;
	}

	public void setNhanVien(NhanVien nhanVien) {
		this.nhanVien = nhanVien;
	}
}
