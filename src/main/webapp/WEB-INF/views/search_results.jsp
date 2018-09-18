<!doctype html>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.qa.models.Book"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>
<html class="no-js" lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Online Shopping</title>
    <link rel="stylesheet" href="css/style.css"/>
  </head>
  <body>
    <!-- Start Top Bar -->
    <div class="top-bar">
      <div class="top-bar-left">
        <ul class="menu">
          <li class="menu-text" style="color:red">Online Shopping</li>
          <li><a href="/index">Home</a></li>
          
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
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/elsevier?user=root&password=");
       Statement statement = connection.createStatement() ;
       resultset =statement.executeQuery("SELECT DISTINCT genre FROM book;") ;
       System.out.println(resultset);
%>

 <div class="row column text-center">
    <form action="/filter_results" method="get">
     <!--  <input type="text" placeholder="Enter book title" name="searchTerm" id="searchTerm"> -->
        <%  while(resultset.next()){ %>
                    <input type="checkbox" name="genre" value="<%=resultset.getString(1)%>"> <%=resultset.getString(1)%><br>
                <% } %>
                
        <input type="submit">
    </form>
    </div>
         <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
    
    <div class="row column text-center">
      <h2>Search Results
      
      
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
        <h5><%= book.getTitle()%></h5>
        <p>$<%= book.getPrice()%></p>
        <a href="/bookDetails?bookId=<%=book.getBookId()%>" class="button expanded">View book details</a>
        <!--  a href="/addToCart?bookId=" class="button expanded">Add to Cart</a>-->
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