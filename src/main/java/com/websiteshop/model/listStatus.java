package com.websiteshop.model;

import java.io.Serializable;

public class listStatus implements Serializable{
	private static final long serialVersionUID = 1L;
	private int id;
	private String status;
	private Long orderId;
	public listStatus(int id, String status, Long orderId) {
		super();
		this.id = id;
		this.status = status;
		this.orderId = orderId;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public Long getOrderId() {
		return orderId;
	}
	public void setOrderId(Long orderId) {
		this.orderId = orderId;
	}
	public listStatus() {
		super();
	}

	
	
}
