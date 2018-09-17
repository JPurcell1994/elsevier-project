package com.qa.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qa.models.Author;
import com.qa.repositories.AuthorRepository;

@Service
public class AuthorService {
	
	@Autowired
	private AuthorRepository authorRepository;
	
//	public Iterable<Book> findAllBooks()
//	{
//		return bookRepository.findAll();
//		
//	}
	
	public Author saveAuthor(Author c) {
//	c.setAuthors("Rus");
//	c.setTitle("My Booky Wooky");
		
		//c.addAuthor(new Author );
		return authorRepository.save(c);
		
	}

	public Author findAuthorById(int authorId) {    //before Book
	return (Author)authorRepository.findAuthorById(authorId);
	}
	
//	public List<Book> findBookByTerm(String searchTerm) {
//		return (List<Book>) bookRepository.findBookByTerm(searchTerm);
//	}
	
	
	public List<Author> loadAllAuthors() {
		// TODO Auto-generated method stub
		return (List<Author>) authorRepository.findAll();
	}

}

