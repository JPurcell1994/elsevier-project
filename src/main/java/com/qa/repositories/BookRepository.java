package com.qa.repositories;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.qa.models.Book;

@Repository

public interface BookRepository extends CrudRepository<Book, Integer> {
	
//	@Query("SELECT b from Book b WHERE b.title = :searchTerm")
//	public Iterable<Book> findBookByTerm(@Param("searchTerm") String searchTerm);
//	
	
	//@Query("SELECT b from Book b WHERE b.title LIKE %:searchTerm%")
	@Query("SELECT a FROM Book a LEFT JOIN a.authors author WHERE a.title LIKE %:searchTerm% OR author.authorName LIKE %:searchTerm% OR a.description LIKE %:searchTerm% OR a.genre LIKE %:searchTerm%")
	public Iterable<Book> findBookByTerm(@Param("searchTerm") String searchTerm);
	
	
	@Query("SELECT a FROM Book a WHERE a.genre IN :searchTerm")
	public Iterable<Book> findBookByGenre(@Param("searchTerm") String[] searchTerm);
	// SELECT a FROM Book a LEFT JOIN a.authors author WHERE a.title LIKE %:searchTerm% OR author.authorName LIKE %:searchTerm% OR a.description LIKE %:searchTerm% ")
//	@Query("SELECT b from Book b WHERE b.bookId = :bookId")
//	public Book findBookById(@Param("bookId") int bookId);
	
	
	
}
