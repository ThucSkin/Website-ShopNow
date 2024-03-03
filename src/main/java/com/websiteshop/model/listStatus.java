package com.websiteshop.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListStatus implements Serializable {
	private static final long serialVersionUID = 1L;
	private int id;
	private String status;
	private Long orderId;
}
