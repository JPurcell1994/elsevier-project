package com.qa.controllers;

import java.util.ArrayList;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Author;
import com.qa.models.Book;
import com.qa.models.Customer;
import com.qa.services.AuthorService;
import com.qa.services.BookService;
import com.qa.services.CustomerService;

@Controller
@SessionAttributes(names={"books","cart_items","logged_in_customer","Address","sesssion_cart_total","session_checkout"})
public class CustomerController {

	@Autowired
	BookService bookService;
	@Autowired
	AuthorService authorService;
	
	@Autowired
	CustomerService customerService;
	
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping("/")
	public ModelAndView indexPage(HttpServletRequest request)
	{
		
		ArrayList<Book> cartItems = null;
		
		HttpSession session = request.getSession();
		if(session.getAttribute("logged_in_customer")==null)
		  session.setAttribute("logged_in_customer", new Customer());
		
		Object items = session.getAttribute("cart_items");
		
		if(items!=null)
		{
			cartItems = (ArrayList<Book>) items;
		}else
		{
			cartItems = new ArrayList<Book>();
		}
		
	
		Iterable<Book> books = bookService.loadAllBooks();
		
		ModelAndView modelAndView = new ModelAndView("index","books",books);
		
		modelAndView.addObject("cart_items",cartItems);
		return modelAndView;
		
	}
	
	@RequestMapping("/addAuthorProcess")
	public ModelAndView addAuthorProcess(@ModelAttribute("Author") Author author)
	{
		
		ModelAndView modelAndView = null;
		
		Author a = authorService.saveAuthor(author);
		
		
		
		if(a!= null)
		{
		
			modelAndView = new ModelAndView("author_added");
			
		}
		else
		{
			modelAndView = new ModelAndView("author_failed");
		}
		return modelAndView;
	}
	
	@RequestMapping("/addBookProcess")
	public ModelAndView addBookProcess(@ModelAttribute("Book") Book book, @RequestParam("authorId") int authorId)
	{
		
		ModelAndView modelAndView = null;
		
		Author a = authorService.findAuthorById(authorId);
		
		book.addAuthor(a);
		
		Book b = bookService.saveBook(book);
		
		
		
		
		
		if(b!= null)
		{
		
			modelAndView = new ModelAndView("book_added");
			
		}
		else
		{
			modelAndView = new ModelAndView("book_failed");
		}
		return modelAndView;
	}
	

	@RequestMapping("/login")
	public String login()
	{
		return "login";
	}
	
	
	@RequestMapping("/register")
	public ModelAndView register()
	{
		ModelAndView modelAndView = new ModelAndView("register");
	
	    return modelAndView;
	}
	
	@RequestMapping("/add_author")
	public ModelAndView addAuthor()
	{
		ModelAndView modelAndView = new ModelAndView("add_author");
	
	    return modelAndView;
	}
	
	@RequestMapping("/add_book")
	public ModelAndView addBook()
	{
		ModelAndView modelAndView = new ModelAndView("add_book");
	
	    return modelAndView;
	}
	
	

	@RequestMapping("/registerProcess")
	public ModelAndView registerProcess(@ModelAttribute("Customer") Customer customer)
	{
		
		ModelAndView modelAndView  = null;
		
		//System.out.println("Customer Firstname is "+customer.getFirstName());
		
		
		//System.out.println("Customer Password is "+customer.getPassword());
		
		Customer c = customerService.saveCustomer(customer);
	  
		if(c!=null)
		{
	  		modelAndView = new ModelAndView("registration_success");
		}
		else
		{
			modelAndView = new ModelAndView("registration_failed");
		}
	  		
		return modelAndView;
	}
	
	@RequestMapping("/loginProcess")
	public ModelAndView loginProcess(HttpServletRequest request, @RequestParam("email") String email,
										@RequestParam("password") String password)
	{
		
		ModelAndView modelAndView  = null;
		
		HttpSession session = request.getSession();
		
		//System.out.println("Email is "+email);
		
		//System.out.println("Password is "+password);
		
		
		Customer c = customerService.loginProcess(email, password);
	  
		if(c!=null)
		{
			System.out.println("Success");

			if(session.getAttribute("session_checkout") != null) {
				modelAndView = new ModelAndView("checkout","logged_in_customer",c);
				
			}else {
				modelAndView = new ModelAndView("index","logged_in_customer",c);
	  		}
		}
		else {
			System.out.println("Failure");
			modelAndView = new ModelAndView("login", "failure", true);
		}
		
		session.removeAttribute("session_checkout");
	  		
		return modelAndView;
	}
	
	
	
	@RequestMapping("/profile")
	public ModelAndView profile(@ModelAttribute("logged_in_customer") Customer loggedInCustomer)
	{
		ModelAndView modelAndView = new ModelAndView("profile","logged_in_customer",loggedInCustomer);
	
	    return modelAndView;
	}
	
	
	
	
	@RequestMapping("/updateProfile")
	public ModelAndView updateProfile(@ModelAttribute("logged_in_customer") Customer loggedInCustomer, @ModelAttribute("Customer") Customer customer)
	{
		
		ModelAndView modelAndView  = null;
		
//		System.out.println("Before update ");
//
//		System.out.println("ID "+loggedInCustomer.getCustomerId());
//		System.out.println("Name"+loggedInCustomer.getFirstName());
//		System.out.println("Email"+loggedInCustomer.getEmail());
		
		
		int recordsUpdated = customerService.updateCustomer(loggedInCustomer.getFirstName(),
				loggedInCustomer.getLastName(),
				loggedInCustomer.getEmail(), 
				loggedInCustomer.getCustomerId(),
				loggedInCustomer.getPassword());
		
		if(recordsUpdated>0)
		{
			Customer c  = customerService.findCustomerById(loggedInCustomer.getCustomerId());
		
			//Customer c = null;

//			if(opt.isPresent())
//				c = opt.get();
  
//			System.out.println("After update ");
//
//			System.out.println("ID "+c.getCustomerId());
//			System.out.println("Name"+c.getFirstName());
//			System.out.println("Email"+c.getEmail());
			
			modelAndView = new ModelAndView("index","logged_in_customer",c);
		}
		else
		{
			modelAndView = new ModelAndView("index","logged_in_customer",loggedInCustomer);
		}
		
		return modelAndView;
	}
	
	
	
	@RequestMapping("/addressBook")
	public ModelAndView addressBook(@ModelAttribute("logged_in_customer") Customer loggedInCustomer)
	{
		ModelAndView modelAndView = new ModelAndView("address_book","logged_in_customer",loggedInCustomer);
	
	    return modelAndView;
	}
	
	
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus)
	{
		sessionStatus.setComplete();
		
	    return "redirect:/";
	}
	
}
