package com.websiteshop.service;

import java.util.List;
import org.springframework.stereotype.Service;
import com.websiteshop.entity.Statitics;
import com.websiteshop.model.StatisticalForMonthProjections;
import com.websiteshop.model.StatisticalForProductProjections;
import com.websiteshop.model.StatisticalForYearProjections;

@Service
public interface StatisticalService {

	Statitics SLOrder();

	List<StatisticalForProductProjections> statisticalForProduct();

	List<StatisticalForYearProjections> statisticalForYear();

	List<StatisticalForMonthProjections> statisticalForMonth();

	List<StatisticalForProductProjections> top10SellingProducts();

}
