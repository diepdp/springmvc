package fa.training.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "khachhang")
public class KhachHang {
	@Id
	@Column(name = "khachhang_id" , columnDefinition = "varchar(7)")
	@Pattern(regexp="^(KH)[0-9]{5}$", message = "Mã KH phải bắt đầu bằng KH và 5 chữ số")
	private String id;
	@Column(name = "tenkhachhang")
	@NotBlank(message="Tên khách hàng không được để trống")
	private String tenKH;
	@Column(name = "diachi")
	@NotBlank(message="Địa chỉ không được để trống")
	private String diaChi;
	@Column(name = "sodienthoai")
	@Pattern(regexp="^(0|\\(84\\)\\+)(90|91)\\d{7}$", message="Số điện thoại: phải theo đúng định dạng 090xxxxxxx hoặc 091xxxxxxx hoặc (84)+90xxxxxxx hoặc (84)+91xxxxxxx")
	private String soDienThoai;
	@Column(name = "email")
	@Pattern(regexp="\\w+@fpt\\.com", message="Email phải có: @fpt.com")
	private String email;
	@OneToMany(mappedBy = "suDungMayID.khachHang")
	private Set<SuDungMay> suDungMay;
	@OneToMany(mappedBy = "suDungDichVuID.khachHang")
	private Set<SuDungDichVu> suDungDichVu;
	
	
}
