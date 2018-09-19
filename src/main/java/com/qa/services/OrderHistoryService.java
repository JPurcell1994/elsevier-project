package com.qa.services;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qa.controllers.AddressBookController;
import com.qa.models.Book;
import com.qa.models.OrderHistory;
import com.qa.repositories.OrderHistoryRepository;

import java.util.List;

@Service
public class OrderHistoryService {
	
	@Autowired
	private OrderHistoryRepository orderHistoryRepository;
	
	
	public OrderHistory saveOrder(OrderHistory orderHistory)
	{
		
		return orderHistoryRepository.save(orderHistory);
	}
	
	public Iterable<OrderHistory> findOrderByCustomerId(int customerId)
	{
		return orderHistoryRepository.findOrderByCustomerId(customerId);
	}
	
	
	
//	public int addOrderHistory(
//			String orderDate,
//			double orderCost,
//			List<Book> book,
//			AddressBookController sAddress,
//			int customerId,
//			int orderId){
//		
//		
//		return orderHistoryRepository.addOrderHistory(orderDate, orderCost, book, sAddress, customerId, orderId);
//	}

}
