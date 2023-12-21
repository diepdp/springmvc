package fa.training.entity;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Embeddable
@Getter
@Setter
@EqualsAndHashCode
@NoArgsConstructor
@AllArgsConstructor
public class SuDungMayID implements Serializable {
	private static final long serialVersionUID = 1L;
	
	@ManyToOne
	@JoinColumn(name = "khachhang_id")
	@NotNull(message="Không được để trống, phải chọn 1 giá trị")
	private KhachHang khachHang;
	
	@ManyToOne
	@NotNull(message="Không được để trống, phải chọn 1 giá trị")
	@JoinColumn(name = "may_id" )
	private May may;
	
	@Column(name = "ngaybatdausudung")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate ngayBatDauSuDung;
	
	@Column(name = "giobatdausudung")
	private String gioBatDauSuDung;
}
