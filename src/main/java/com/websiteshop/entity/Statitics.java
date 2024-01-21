package com.websiteshop.entity;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@SuppressWarnings("serial")
@Data
@Entity
@Table(name = "Statistic") // Sửa tên bảng
@NoArgsConstructor
@AllArgsConstructor
public class Statitics implements Serializable {

	@Id
	private Long id;

	@ManyToOne
	@JoinColumn(name = "OrderId")
	private Order order;

	@ManyToOne
	@JoinColumn(name = "OrderDetailId")
	private OrderDetail orderDetail;

	private long slOrder;

	private long slDoanhthu;
}
