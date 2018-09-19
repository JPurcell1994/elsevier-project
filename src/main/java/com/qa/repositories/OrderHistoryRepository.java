package com.qa.repositories;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.qa.controllers.AddressBookController;
import com.qa.models.Book;
import com.qa.models.Customer;
import com.qa.models.OrderHistory;


@Repository
public interface OrderHistoryRepository extends CrudRepository<OrderHistory, Integer> {
	
//	@Modifying
//	@Transactional
//	@Query("ADD OrderHistory o set o.orderDate = :orderDate, o.orderCost = :orderCost, o.book = :book, o.sAddress = :sAddress, o.customerId = :customerId, WHERE o.orderId = :orderId")
//	public int addOrderHistory(
//			@Param("orderDate") String orderDate,
//			@Param("orderCost") double orderCost,
//			@Param("book") List<Book> book,
//			@Param("sAddress")  AddressBookController sAddress,
//			@Param("customerId") int customerId,
//			@Param("OrderId") int orderId);
//	
	
	@Query("select o from OrderHistory o where o.customerId = :customerId")
	public Iterable<OrderHistory> findOrderByCustomerId(@Param("customerId") int customerId);
	
	
}
