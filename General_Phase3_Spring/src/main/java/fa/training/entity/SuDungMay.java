package fa.training.entity;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@SuppressWarnings("serial")
@Entity
@Table(name = "sudungmay")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class SuDungMay implements Serializable {
	
	@EmbeddedId
	private SuDungMayID suDungMayID;
	
	@Column(name = "thoigiansudung")
	@Min(value = 0, message="Phải lớn hơn không")
	private int thoiGianSuDung;
	
}
