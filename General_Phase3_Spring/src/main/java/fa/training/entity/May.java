package fa.training.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
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
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "may")
public class May {

	@Id
	@Column(name = "may_id",columnDefinition = "varchar(5)")
	@Pattern(regexp="^(M)[0-9]{4}$", message="Mã máy phải bắt đầu bằng M và 4 chữ số")
	private String id;
	
	@Column(name = "vitri")
	@NotBlank(message="Không được để trống")
	private String viTri;
	
	@Column(name = "trangthai")
	@NotBlank(message="Không được để trống")
	private String trangThai;
	
	@OneToMany(mappedBy = "suDungMayID.may")
	private Set<SuDungMay> suDungMay;

	
}
