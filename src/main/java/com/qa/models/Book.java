package com.qa.models;



import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.servlet.jsp.tagext.Tag;

@Entity(name ="Book")
@Table(name ="book")
public class Book {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int bookId;
	
	private String title;
	
	private String description;
	
	private String publisher;
	
	private String format;
	
	private String publishedDate;
	
	private int pageCount;
	
	private String genre;
	
	public String getGenre() {
		return genre;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}

	public List<Author> getAuthors() {
		return authors;
	}
	
	@ManyToMany(cascade = 
        {CascadeType.PERSIST, CascadeType.MERGE})
    @JoinTable(name = "book_author",
        joinColumns = {
            @JoinColumn(
                name = "book_id", 
                referencedColumnName = "bookId"
            )
        },
        inverseJoinColumns = {
            @JoinColumn(
                name = "author_id", 
                referencedColumnName = "authorId"
            )
        }
    )


	    private List<Author> authors = new ArrayList<>();
	 
	    //Getters and setters ommitted for brevity
	 
	    public void addAuthor(Author a) {
	    	authors.add(a);
	        a.getBooks().add(this);
	    }
	 
	    public void removeAuthor(Author a) {
	    	authors.remove(a);
	        a.getBooks().remove(this);
	        
	    
	    }
	    
	    public Author getAuthor() {
	    	return authors.get(0);
	    }

//	@Autowired
//	@ElementCollection
//	private List<Author> authors;
	
//	@OneToMany(mappedBy="bookId",fetch=FetchType.EAGER)
//	private List<Author> authors;
//	
	public void setAuthors(List<Author> authors) {
		this.authors = authors;
	}

	private double price;
	
	private String paperISBN;
	
	private String eBookISBN;
	
	private String tableOfContents;
	
	
	private String bookImage;
	


	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public String getPublishedDate() {
		return publishedDate;
	}

	public void setPublishedDate(String publishedDate) {
		this.publishedDate = publishedDate;
	}

	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}



	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getPaperISBN() {
		return paperISBN;
	}

	public void setPaperISBN(String paperISBN) {
		this.paperISBN = paperISBN;
	}

	public String geteBookISBN() {
		return eBookISBN;
	}

	public void seteBookISBN(String eBookISBN) {
		this.eBookISBN = eBookISBN;
	}

	public String getTableOfContents() {
		return tableOfContents;
	}

	public void setTableOfContents(String tableOfContents) {
		this.tableOfContents = tableOfContents;
	}

	public String getBookImage() {
		return bookImage;
	}

	public void setBookImage(String bookImage) {
		this.bookImage = bookImage;
	}
	
	
	
}