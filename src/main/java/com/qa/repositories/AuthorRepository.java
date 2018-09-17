package com.qa.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.qa.models.Author;
import com.qa.models.Book;

@Repository

public interface AuthorRepository extends CrudRepository<Author, Integer> {
	
//	@Query("SELECT b from Book b WHERE b.title = :searchTerm")
//	public Iterable<Book> findBookByTerm(@Param("searchTerm") String searchTerm);
//	
	
	//@Query("SELECT b from Book b WHERE b.title LIKE %:searchTerm%")
	//@Query("SELECT a FROM Book a LEFT JOIN a.authors author WHERE a.title LIKE %:searchTerm% OR author.authorName LIKE %:searchTerm% OR a.description LIKE %:searchTerm% ")
	//public Iterable<Book> findBookByTerm(@Param("searchTerm") String searchTerm);
	
	// SELECT a FROM Book a LEFT JOIN a.authors author WHERE a.title LIKE %:searchTerm% OR author.authorName LIKE %:searchTerm% OR a.description LIKE %:searchTerm% ")
	@Query("SELECT a from Author a WHERE a.authorId = :authorId")
	public Author findAuthorById(@Param("authorId") int authorId);


	
	
	
}
