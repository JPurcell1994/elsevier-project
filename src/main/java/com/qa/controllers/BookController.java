package com.qa.controllers;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

import com.qa.models.Author;
import com.qa.models.Book;
import com.qa.models.Customer;
import com.qa.repositories.AuthorRepository;
import com.qa.repositories.BookRepository;

@Controller
@SessionAttributes(names={"books","cart_items","book_counts","filtered_books","logged_in_customer"})
public class BookController {

	@Autowired
	BookRepository bookService;
	AuthorRepository authorService;
	
	@RequestMapping("/bookDetails")
	public ModelAndView bookDetails(@ModelAttribute("logged_in_customer") Customer loggedInCustomer, @ModelAttribute("books") Iterable<Book> books,@RequestParam("bookId") int bookId)
	{
		Book book = findBookById(books, bookId);
		
		
		ModelAndView modelAndView = new ModelAndView("book_details","book",book);
		modelAndView.addObject("books", books);
		
		modelAndView.addObject("logged_in_customer", loggedInCustomer);
		return modelAndView;
		
	}
	
//	@RequestMapping("/filter_results")
//	public ModelAndView searchBookGenres(@RequestParam("searchTerm") String searchTerm){
//		ModelAndView modelAndView = null;
//		Iterable<Book> search_results = bookService.findBookByGenre(searchTerm);
//		System.out.println(search_results);
//		modelAndView = new ModelAndView("search_results", "books", search_results);
//		return modelAndView;
	
	
//	}
	
	@RequestMapping("/filter_results")
	public ModelAndView filterResults(@RequestParam("genre") String[] genre)
	{
		//ModelAndView modelAndView = null;
		Iterable<Book> filter_results = bookService.findBookByGenre(genre);
	
	//	Iterator<Book> total = new IteratorIterator<Book>(books,filter_results);
		ModelAndView modelAndView = new ModelAndView("search_results","books",filter_results);

		//bookscurent = book session
		// bookcurrent = bookcurren t+ fitler_resultd
		
	//	cartItems.add(book);
		
		//modelAndView.addObject("books", filter_results);
		return modelAndView;
		
	}
	
	@RequestMapping("/search_results")
	public ModelAndView searchBook(@RequestParam("searchTerm") String searchTerm){
		ModelAndView modelAndView = null;
		Iterable<Book> search_results = bookService.findBookByTerm(searchTerm);
		System.out.println(search_results);
		modelAndView = new ModelAndView("search_results", "books", search_results);
		return modelAndView;
	}
	
	@RequestMapping("/addToCart")
	public ModelAndView addToCart(@ModelAttribute("books") Iterable<Book> books,
			@RequestParam("bookId") int bookId,
			@ModelAttribute("cart_items") ArrayList<Book> cartItems)
	{
		
		Book book = findBookById(books, bookId);
	
		ModelAndView modelAndView = new ModelAndView("cart_updated","cart_items",cartItems);
		
		
		cartItems.add(book);
		
		modelAndView.addObject("books", books);
		return modelAndView;
		
	}
	


	
	
	
	@RequestMapping("/viewCart")
	public ModelAndView viewCart(@ModelAttribute("logged_in_customer") Customer loggedInCustomer, @ModelAttribute("books") Iterable<Book> books,@ModelAttribute("cart_items") ArrayList<Book> cartItems)
	{
		
		ModelAndView modelAndView = null;
		
		ArrayList<Integer> bookIds = loadBookIds(cartItems);
		
		Map<Integer,Integer> bookCounts = bookCounts(bookIds);
		
		ArrayList<Book> filteredBooks = filteredBookList(books, bookCounts);
		
		
		
		if(cartItems.size()!=0)
		{
		
			modelAndView = new ModelAndView("cart_details","cart_items",cartItems);
			modelAndView.addObject("book_counts", bookCounts);
			modelAndView.addObject("filtered_books", filteredBooks);
			modelAndView.addObject("logged_in_customer", loggedInCustomer);
			
		}
		else
		{
			modelAndView = new ModelAndView("cart_empty","cart_items",cartItems);
			modelAndView.addObject("book_counts", bookCounts);
			modelAndView.addObject("filtered_books", filteredBooks);
			modelAndView.addObject("logged_in_customer", loggedInCustomer);
		}
		
		return modelAndView;
		
	}

	
	@RequestMapping("/removeFromCart")
	public ModelAndView removeFromCart(@ModelAttribute("filtered_books") ArrayList<Book> cartItems,
			@RequestParam("bookId") int bookId)
	{
		
		cartItems = removeBookById(cartItems, bookId);
		
		ModelAndView modelAndView = null;
		
		if(cartItems.size()!=0)
		{
		
			modelAndView = new ModelAndView("cart_details","cart_items",cartItems);
	    }
		else
		{
			modelAndView = new ModelAndView("cart_empty","cart_items",cartItems);
		}
		
		return modelAndView;
		
	}
	
	public ArrayList<Integer> loadBookIds(ArrayList<Book> cartItems)
	{
		
         ArrayList<Integer> bookIds = new ArrayList<>();
		
		for(Book book : cartItems)
		{
			bookIds.add(book.getBookId());
		}
		
		return bookIds;
		
	}
	

	// Some business methods
	
	public Book findBookById(Iterable<Book> books,int bookId)
	{
		
        Book book = null;
		
		for(Book b : books)
		{
			if(b.getBookId()==bookId)
			{
				book = b;
			}
		}
		return book;

	}
	
	
	
	/*public ArrayList<Book> loadBooksIntoCart(Iterable<Book> books,ArrayList<Integer> bookIds)
	{
		
		ArrayList<Book> bookList = new ArrayList<>();
		
		for(Book book : books)
		{
			for(int bookId : bookIds)
			if(bookId==book.getBookId())
				bookList.add(book);
		}
		
		return bookList;
	}*/
	
	
	
	
	
	
	public boolean findBookInCart(ArrayList<Integer> cartItems,int bookId)
	{
		
		
//		Set<Book> books = cartItems.keySet();
//		
//		
//		for(Book b : books)
//		{
//			if(b.getBookId()==bookId)
//			{
//				bookFound = true;
//			}
//		}
		
		return cartItems.contains(bookId);
		
		
		
	}
	
	
	
	
	
	public  ArrayList<Book> removeBookById(ArrayList<Book> books,int bookId)
	{
	   
		books.removeIf(b-> b.getBookId()==bookId);
		
		return books;
		
	}
	
	
	public Map<Integer,Integer> bookCounts(ArrayList<Integer> bookIds)
	{
		
		Map<Integer, Integer> map = new HashMap<Integer, Integer>();

		

		for (int bookId : bookIds) {
			Integer count = map.get(bookId);
			map.put(bookId, (count == null) ? 1 : count + 1);
		}
		
		for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
			System.out.println("Key : " + entry.getKey() + " Value : "
				+ entry.getValue());
		}

		
		return map;
	}
	
	public ArrayList<Book> filteredBookList(Iterable<Book> books,Map<Integer, Integer> map)
	{
        ArrayList<Book> filteredBooks = new ArrayList<>();
		
        
        
		for(Book book : books)
		{
			for (Map.Entry<Integer, Integer> entry : map.entrySet()) {
				Integer bookId =  entry.getKey(); // Get book ID
				if(bookId==book.getBookId())
					filteredBooks.add(book);
	      		}
		}
	
        System.out.println("Number of filtered items "+filteredBooks.size());
		return filteredBooks;
	
	}
	
}