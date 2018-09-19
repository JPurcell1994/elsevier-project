package com.qa.controllers;

import java.util.ArrayList;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Book;
import com.qa.models.Customer;
import com.qa.models.OrderHistory;
import com.qa.models.Shipping;
import com.qa.repositories.OrderHistoryRepository;
import com.qa.services.BookService;
import com.qa.services.CustomerService;
import com.qa.services.OrderHistoryService;

@Controller
@SessionAttributes(names={"books","cart_items","logged_in_customer","Address", "order_total"})
public class OrderHistoryController {
	
	@Autowired
	OrderHistoryRepository orderHistoryService;

	@RequestMapping("/OrderHistory")
	public ModelAndView orderHistory(@ModelAttribute("logged_in_customer") Customer loggedInCustomer)
	{
		
		
		Iterable<OrderHistory> orderHistory = orderHistoryService.findOrderByCustomerId(loggedInCustomer.getCustomerId());
		
		ModelAndView modelAndView = new ModelAndView("order_history","order_history", orderHistory);
		
		

		return modelAndView;
	}
	
	
	
	
}
