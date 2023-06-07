package ptithcm.entity;

import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.LazyCollection;
import org.hibernate.annotations.LazyCollectionOption;

@Entity
@Table(name="PHONG")
public class PhongChieu {
	@Id
	@Column(name="MaPhong")
	private String maPhong; // Mã phòng chiếu - varchar(10)
	
	@Column(name="TrangThai")
	private Boolean trangThai; // Trạng thái phòng chiếu - bit
	
	@Column(name="TongSoGhe")
	private Integer tongSoGhe; // Tổng số ghế - int
	
	@OneToMany(mappedBy="dsPhong")
	@LazyCollection(LazyCollectionOption.FALSE)
	private Collection<LichChieu> lichChieuList;
	
	public PhongChieu() {
		// TODO Auto-generated constructor stub
	}

	public PhongChieu(String maPhong, Boolean trangThai, Integer tongSoGhe) {
		super();
		this.maPhong = maPhong;
		this.trangThai = trangThai;
		this.tongSoGhe = tongSoGhe;
	}

	public String getMaPhong() {
		return maPhong;
	}

	public void setMaPhong(String maPhong) {
		this.maPhong = maPhong;
	}

	public Collection<LichChieu> getLichChieuList() {
		return lichChieuList;
	}

	public void setLichChieuList(Collection<LichChieu> lichChieuList) {
		this.lichChieuList = lichChieuList;
	}

	public Boolean getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(Boolean trangThai) {
		this.trangThai = trangThai;
	}

	public Integer getTongSoGhe() {
		return tongSoGhe;
	}

	public void setTongSoGhe(Integer tongSoGhe) {
		this.tongSoGhe = tongSoGhe;
	}
}
