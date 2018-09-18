package com.qa.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.NaturalId;

@Entity(name="Author")
@Table (name="author")
public class Author {

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int authorId;
	
	@NaturalId
	private String authorName;
	
	private String aboutAuthor;
	
	private String affiliations;
	
	private String expertise;

	@ManyToMany(mappedBy = "authors")
    private List<Book> books = new ArrayList<>();
	
	
	public List<Book> getBooks() {
		return this.books;
	}
	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getAboutAuthor() {
		return aboutAuthor;
	}

	public void setAboutAuthor(String aboutAuthor) {
		this.aboutAuthor = aboutAuthor;
	}

	public String getAffiliations() {
		return affiliations;
	}

	public void setAffiliations(String affiliations) {
		this.affiliations = affiliations;
	}

	public String getExpertise() {
		return expertise;
	}

	public void setExpertise(String expertise) {
		this.expertise = expertise;
	}
	

	public String toString() {
		return authorName;
	}
}