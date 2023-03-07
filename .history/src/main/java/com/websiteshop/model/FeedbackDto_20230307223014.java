package com.websiteshop.model;

import java.io.Serializable;

import com.websiteshop.entity.Account;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class FeedbackDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private Long feedbackId;
	private String description;
	private Account account;
}
