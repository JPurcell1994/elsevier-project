
<%@page import="com.qa.models.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.qa.models.Book"%>
<%@page import="com.qa.models.Author"%>
<%@ page import="java.sql.*" %>
<%ResultSet resultset =null;%>

<%@include file="header.jsp" %>

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
  
<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost/elsevier?user=root&password=");
       Statement statement = connection.createStatement() ;
       resultset =statement.executeQuery("SELECT DISTINCT genre FROM book ORDER BY genre ASC;") ;
       System.out.println(resultset);
%>

    <section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Search</h2>
						<div class="panel-group category-products" id="accordian"><!--category-products-->
						
			<form action="/search_results" method="get"> 
              
                <input type="text" placeholder="Book Search" name="searchTerm" id="searchTerm" style=""/> 
          
            	<input type="submit" class="btn btn-default" value="Search">
              <hr>
              </form>

    <form action="/filter_results" method="get">
     <!--  <input type="text" placeholder="Enter book title" name="searchTerm" id="searchTerm"> -->
        <%  while(resultset.next()){ %>
                    <input type="checkbox" name="genre" value="<%=resultset.getString(1)%>"> <%=resultset.getString(1)%><br>
                <% } %>
                
        <input type="submit">
    </form>
    </div>
    </div>
    </div>
         <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
    
    					<div class="features_items"><!--search_result_items-->
						<h2 class="title text-center">Research Results</h2>


   <%
   
   Iterable<Book> books = (Iterable<Book>) session.getAttribute("books");
   for(Book book: books)
   {
       
       
   %>
     <div class="col-sm-4">
				<div class="product-image-wrapper">
					<div class="single-products">
						<div class="productinfo text-center">

       <a href="/bookDetails?bookId=<%=book.getBookId()%>"><img class="thumbnail" src="<%=book.getBookImage()%>"></a>
       <h4>
           <% for(Author author : book.getAuthors()) {%>
               <%= author %>
           <% } %>
       </h4>
       <h5><%= book.getTitle()%></h5>
       
       
       <p>£<%= book.getPrice()%></p>
       
        <% 
        if (book.geteBookISBN() !=null && book.getPaperISBN() !=null)
         {
             %>
           Paper and eBook Available

           <%
         }
           
       
        else if(book.geteBookISBN() !=null)
         {
             %>
           eBook Available

           <%
         }
         
         else
             {
             %>
           Paper book Available
          <%
           }
           
          %>
       
       <a href="/bookDetails?bookId=<%=book.getBookId()%>" class="btn btn-default">View book details</a>
       <a href="/addToCart?bookId=" class="btn btn-default">Add to Cart</a>
      </div>
   </div>
   </div>
   </div>

   <%
   }
   %>

   </div>
       </div>
       </div>
  

	<hr>
	
	
	</section>
    
    <%@ include file="footer.jsp" %>