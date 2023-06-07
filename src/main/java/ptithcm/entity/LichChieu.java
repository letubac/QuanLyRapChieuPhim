package ptithcm.entity;

import java.time.LocalTime;
import java.util.Collection;
import java.util.Date;
import java.util.List;

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

import ptithcm.bean.Seat;

@Entity
@Table(name="LICH_CHIEU")
public class LichChieu {
	@Id
	@Column(name="MaSuatChieu")// Mã suất chiếu - int - identity
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer maSC;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgayChieu")
	private Date ngayChieu; // Ngày chiếu - date
	
	@Column(name="GioChieu")
	private Integer gioChieu; // Giờ chiếu - time
	
	@ManyToOne
	@JoinColumn(name="maPhong")
	private PhongChieu dsPhong; // Mã phòng chiếu - varchar(10)
	
	@ManyToOne
	@JoinColumn(name="maPhim")
	private Phim dsPhim; // Mã phim - varchar(10)
	
	@OneToMany(mappedBy="dsLichChieu")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<Ve> veList;
	
	public PhongChieu getDsPhong() {
		return dsPhong;
	}

	public void setDsPhong(PhongChieu dsPhong) {
		this.dsPhong = dsPhong;
	}

	public Phim getDsPhim() {
		return dsPhim;
	}

	public void setDsPhim(Phim dsPhim) {
		this.dsPhim = dsPhim;
	}

	public LichChieu() {
		// TODO Auto-generated constructor stub
	}

	public LichChieu(Integer maSC, Date ngayChieu, Integer gioChieu) {
		super();
		this.maSC = maSC;
		this.ngayChieu = ngayChieu;
		this.gioChieu = gioChieu;
	}

	public Integer getMaSC() {
		return maSC;
	}

	public void setMaSC(Integer maSC) {
		this.maSC = maSC;
	}

	public Date getNgayChieu() {
		return ngayChieu;
	}

	public void setNgayChieu(Date ngayChieu) {
		this.ngayChieu = ngayChieu;
	}

	public Integer getGioChieu() {
		return gioChieu;
	}

	public void setGioChieu(Integer gioChieu) {
		this.gioChieu = gioChieu;
	}

	public Collection<Ve> getVeList() {
		return veList;
	}

	public void setVeList(Collection<Ve> veList) {
		this.veList = veList;
	}

}
