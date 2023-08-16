package ptithcm.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="GIA_VE_CONFIG")
public class GiaVeConfig {
	@Id
	@Column(name="ID")// int - identity
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgayApDung")
	private Date ngayApDung; // Ngày áp dụng giá
	
	@Column(name="MaPhim")
	private Integer maPhim; // mã phim
	
	@Column(name="MaLV")
	private String maLV; // mã loại vé

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getNgayApDung() {
		return ngayApDung;
	}

	public void setNgayApDung(Date ngayApDung) {
		this.ngayApDung = ngayApDung;
	}

	public Integer getMaPhim() {
		return maPhim;
	}

	public void setMaPhim(Integer maPhim) {
		this.maPhim = maPhim;
	}

	public String getMaLV() {
		return maLV;
	}

	public void setMaLV(String maLV) {
		this.maLV = maLV;
	}
	
}
