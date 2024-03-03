package com.websiteshop.model;

import java.util.ArrayList;
import java.util.List;

public class ListStatusDao {
	public static List<ListStatus> ls = new ArrayList<>();

	static {
		ls.add(new ListStatus(1, "Đang chờ xác nhận", null));
		ls.add(new ListStatus(2, "Đang vận chuyển", null));
		ls.add(new ListStatus(3, "Đã giao hàng", null));
		ls.add(new ListStatus(4, "Đã hủy", null));
	}

	public List<ListStatus> getAll() {
		return ls;
	}
}
