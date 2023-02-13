package com.websiteshop.entity;

import java.io.Serializable;
import java.util.List;

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
@Table(name = "Statitic")
@NoArgsConstructor
@AllArgsConstructor
public class Statitics implements Serializable {
	
	@Id
	private int id;

	@ManyToOne
	@JoinColumn(name = "OrderId")
	private Order order;

	@ManyToOne
	@JoinColumn(name = "OrderDetailId")
	private OrderDetail OrderDetail;
	
	private long slOrder;
	
	private long slDoanhthu;

}
