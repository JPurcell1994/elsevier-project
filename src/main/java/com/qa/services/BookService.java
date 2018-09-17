package com.qa.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qa.models.Book;
import com.qa.repositories.BookRepository;

@Service
public class BookService {
	
	@Autowired
	private BookRepository bookRepository;
	
//	public Iterable<Book> findAllBooks()
//	{
//		return bookRepository.findAll();
//		
//	}
	
	public Book saveBook(Book c) {
//	c.setAuthors("Rus");
//	c.setTitle("My Booky Wooky");
		
		//c.addAuthor(new Author );
		return bookRepository.save(c);
		
	}

	public void findBookById(int bookId) {    //before Book
	//	return //bookRepository.findBookById(bookId);
	}
	
	public List<Book> findBookByTerm(String searchTerm) {
		return (List<Book>) bookRepository.findBookByTerm(searchTerm);
	}
	
	
	public List<Book> loadAllBooks() {
		// TODO Auto-generated method stub
		return (List<Book>) bookRepository.findAll();
	}

}

