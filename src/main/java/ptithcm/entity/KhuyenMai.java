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

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name="KHUYEN_MAI")
@Getter
@Setter
public class KhuyenMai {
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer id;
	
	@Column(name = "MaKM")
	private String maKM; // Mã khuyến mãi - varchar(10)
	
	@Column(name="TenKM")
	private String tenKM; // Tên Khuyến mãi - nvarchar(100)
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgayBatDau")
	private Date ngayBatDau; // Ngày bắt đầu - date
	
	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern="MM/dd/yyyy")
	@Column(name="NgayKetThuc")
	private Date ngayKetThuc; // Ngày kết thúc- date
	
	@Column(name="MucGiamGia")
	private Integer mucGiamGia; // Mức giảm giá - int
	
	@Column(name="MaTT")
	private Integer maTT; // Mã trạng thái - int
	
	@Column(name="MoTa")
	private String moTa; // Mô tả chi tiết phim - nvarchar(1000)
}
