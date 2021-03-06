<!doctype html>
<%@page import="com.qa.models.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.qa.models.Book"%>
<%@page import="com.qa.models.Author"%>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping</title>
    <link rel="stylesheet" href="css/style.css"/>
    
    
  </head>
  <body>
  
   <%!
  
  Customer c;
  boolean loggedIn;
  
  %>
  
  
  <%
  loggedIn = true; 
  c = (Customer) session.getAttribute("logged_in_customer");
  if(c.getFirstName()==null){
	  loggedIn = false;
  }
  
  %>
  
  

    <!-- Start Top Bar -->
    <div class="top-bar">
      <div class="top-bar-left">
        <ul class="menu">
          <li class="menu-text" style="color:red">Online Shopping</li>
          <li><a href="/">Home</a></li>
          
        </ul>
      </div>
      <div class="top-bar-right">
        
             <ul class="dropdown menu" data-dropdown-menu>
            
            <li class="has-submenu">
              <a href="/viewCart"><img src="images/cart.jpg" width="50" height="50"/></a>
              <ul class="submenu menu vertical" data-submenu>
                <li><a href="/viewCart"><img src="images/cart.jpg" width="50" height="50"/></a></li>
                <li><a href="/login">Register | Login</a></li>
              </ul>
            </li>
            <li><a href="#">About Us</a></li>
            <li><a href="#">Contact</a></li>
          </ul>
          
      </div>
    </div>
    <!-- End Top Bar -->
    <%
    if(loggedIn){
    %>
    <h3>You have logged in as <%=c.getFirstName()%></h3>   <!-- IF LOGGED IN PUT LAYOUT HERE -->
    <%}%>
	

 <form action="/search_results" method="get"> 
              
               <label>book search< /label>
                <input type="text" placeholder="Enter Title/Author" name="searchTerm" id="searchTerm"/> 
          
            	<input type="submit" class="button expanded" value="plz work">
              
              </form>
    
    <div class="row column text-center">
      <h2>Our Newest Books
      
      
      <%
         Iterable<Book> books = (Iterable<Book>) session.getAttribute("books");
          
      %>
      
      
      </h2>
      <hr>
    </div>

    <div class="row small-up-2 large-up-4">
    
    <%
    
    for(Book book: books)
    {
      
    	
    	
   
    %>
      <div class="column">
      
        <a href="/bookDetails?bookId=<%=book.getBookId()%>"><img class="thumbnail" src="<%=book.getBookImage()%>"></a>
       
        <h3><%= book.getTitle()%></h3>
                <h5>
        	<% for(Author author : book.getAuthors()) {%>
        		<%= author %>
        	<% } %>
        </h5>
        <p>�<%= book.getPrice()%></p>
        <% if(book.geteBookISBN() !=null)
          {
        	  %>
            eBook Available
            
            <%
          }
            %>
          </div>
          <div class="column">
          
          <%if(book.getPaperISBN() !=null)
        	  {
        	  %>
            Paperbook Available
            <%
            }
            %>
        <a href="/bookDetails?bookId=<%=book.getBookId()%>" class="button expanded">View book details</a>
        <a href="/addToCart?bookId=" class="button expanded">Add to Cart</a>
      </div>
    
    <%
    }
    %>  
    </div>

    <hr>

    <script src="https://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script src="js/elsevier.js"></script>
    <script>
      $(document).foundation();
    </script> 
  </body>
</html>
