package fa.training.dto;

import javax.persistence.Entity;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@RequiredArgsConstructor
public class FormDKMay {
	@NotBlank(message="không được để trống")
	private String idKH;
	
	@NotBlank(message="không được để trống")
	private String idMay;
	
	@NotBlank(message="không được để trống")
	private String ngayBDSD;
	
	@NotBlank(message="không được để trống")
	private String gioBDSD;
	
	@NotNull(message="không được để trống")
	private int thoiGianSD;
	
}
