


<%@page import="com.qa.models.Customer"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.qa.models.Book"%>
<%@page import="com.qa.models.Author"%>

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
    
    <section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Genre</h2>
						<div class="panel-group category-products" id="accordian"><!--category-products-->
						
						     <form action="/search_results" method="get"> 
              
               <label>Book search</label>
                <input type="text" placeholder="Enter Title/Author" name="searchTerm" id="searchTerm" style=""/> 
          
            	<input type="submit" class="btn btn-default" value="Search">
              
              </form>
              
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Business</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Children</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Crime</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Death & Bereavement</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Education</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Fantasy</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Fiction</a></h4>
								</div>
							</div>

									<input type="radio" name="genre" value="foodGenre"><h4 class="panel-title">Food<br></h4>
									
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Historical</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Horror</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Love</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Mythological</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Political</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Self-help</a></h4>
								</div>
							</div>
							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title"><a href="#">Work</a></h4>
								</div>
							</div>
						</div><!--/category-products-->
					
						
						<div class="price-range"><!--price-range-->
							<h2>Price Range</h2>
							<div class="well text-center">
								 <input type="text" class="span2" value="" data-slider-min="0" data-slider-max="600" data-slider-step="5" data-slider-value="[250,450]" id="sl2" ><br />
								 <b class="pull-left">$ 0</b> <b class="pull-right">$ 600</b>
							</div>
						</div><!--/price-range-->
						
						<div class="shipping text-center"><!--shipping-->
							<img src="images/home/shipping.jpg" alt="" />
						</div><!--/shipping-->
					
					</div>
				</div>



     <hr>

	
			<div class="col-sm-9 padding-right">
			
			    <%
    if(loggedIn){
    %>
    <p>You have logged in as <%=c.getFirstName()%></p>   <!-- IF LOGGED IN PUT LAYOUT HERE -->
    <%}%>
    
    
    
    

					<div class="features_items"><!--features_items-->
						<h2 class="title text-center">Our Newest Books</h2>


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
   </div>
  

	<hr>
	
	
	</section>

	
	<%@ include file="footer.jsp" %>
