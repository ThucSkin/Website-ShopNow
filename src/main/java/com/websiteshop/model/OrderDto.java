package com.websiteshop.model;

import java.io.Serializable;

import com.websiteshop.entity.Account;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class OrderDto implements Serializable {
    private static final long serialVersionUID = 1L;
    private Long orderId;
    private Account account;
    private String createDay;
    private String telePhone;
    private String address;
    private String name;
    private String email;
    private Integer total;
    private String status;
    private Boolean isEdit;
}