package com.websiteshop.model;

import java.util.ArrayList;
import java.util.List;

public class listStatusDao {
	public static List<listStatus> ls = new ArrayList<>();
	public List<listStatus> getAll() {
		ls.clear();
		ls.add(new listStatus(1, "Đang chờ xác nhận", null));
		ls.add(new listStatus(2, "Đang vận chuyển", null));
		ls.add(new listStatus(3, "Đã giao hàng", null));
		ls.add(new listStatus(4, "Đã hủy", null));
		return ls;
	}
}
