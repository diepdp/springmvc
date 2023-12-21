package fa.training.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.PositiveOrZero;

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
@Table(name = "dichvu")
public class DichVu {
	@Id
	@Column(name = "dichvu_id", columnDefinition = "varchar(5)")
	@Pattern(regexp = "^(DV)\\d{3}$", message = "Mã DV phải bắt đầu bằng DV và 3 chữ số")
	private String id;

	@Column(name = "tendichvu")
	@NotBlank(message = "Tên không được để trống")
	private String tenDV;
	@Column(name = "donvitinh")
	@NotBlank(message = "Không được để trống")
	private String donViTinh;
	@Column(name = "dongia")
//	@Min(value = 0, message = "Giá trị phải lớn hơn hoặc bằng 0")
	@PositiveOrZero(message="Giá trị phải lớn hơn hoặc bằng 0")
	private int donGia;

	@OneToMany(mappedBy = "suDungDichVuID.dichVu")
	private Set<SuDungDichVu> suDungDichVu;


}
