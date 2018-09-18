package com.qa.controllers;



import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Customer;
import com.qa.models.Shipping;
import com.qa.services.CustomerService;

@SessionAttributes(names={"book_counts","logged_in_customer","checkout","order_total"})
@Controller
public class CheckoutController {
	
	@Autowired
	CustomerService customerService;

	@RequestMapping("/checkoutProcess")
	public ModelAndView checkoutProcess(@ModelAttribute("logged_in_customer") Customer loggedInCustomer, @ModelAttribute("Shipping") Shipping shipping,@ModelAttribute("book_counts") Map<Integer,Integer> bookCounts,@ModelAttribute("order_total") double orderTotal)
	{
		System.out.println("First name "+shipping.getFirstName());
		ModelAndView modelAndView = new ModelAndView("payment_form","order_total",orderTotal);
		modelAndView.addObject("shipping_address", shipping);
		modelAndView.addObject("order_total", orderTotal);
		modelAndView.addObject("book_counts", bookCounts);
	    return modelAndView;
	}
//	@RequestMapping("/loginThroughCheckout")
//	public ModelAndView loginThroughCheckout(@ModelAttribute("book_counts") Map<Integer,Integer> bookCounts,@RequestParam("order_total") double orderTotal)
//	{
//		
//		ModelAndView modelAndView = new ModelAndView("login_through_checkout","order_total",orderTotal);
//		
//		modelAndView.addObject("order_total", orderTotal);
//		modelAndView.addObject("book_counts", bookCounts);
//	    return modelAndView;
//	}
	
//	@RequestMapping("/loginProcessThroughCheckout")
//	public ModelAndView loginProcessThroughCheckout(@RequestParam("email") String email,
//										@RequestParam("password") String password)
//	{
//		
//		ModelAndView modelAndView  = null;
//		
//		System.out.println("Email is "+email);
//		
//		
//		System.out.println("Password is "+password);
//		
//		
//		Customer c = customerService.loginProcess(email, password);
//		
//	  
//		if(c!=null)
//		{
//			System.out.println("Success");
//	  		modelAndView = new ModelAndView("customer_home","logged_in_customer",c);
//		}
//		else
//		{
//			System.out.println("Failure");
//			modelAndView = new ModelAndView("login_failed");
//		}
//	  		
//		return modelAndView;
//	}
	
	@RequestMapping("/paymentComplete")
	public String paymentComplete()
	{

		return "payment_complete";
	}
	
	
	
	
}
