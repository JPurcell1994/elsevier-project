<%@ include file="header.jsp" %>

<%@page import="com.qa.models.Book"%>


    
    <%!
    
      Book book;
    
       
    %>
    
    
    <%
    
     book = (Book) request.getAttribute("book");
    
    
    
    %>
    
    
   <section>
		<div class="container">
			<div class="row">
				<div class="col-sm-3">
					<div class="left-sidebar">
						<h2>Genre</h2>
						<div class="panel-group category-products" id="accordian"><!--category-products-->
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
					
					</div>
				</div>



     <hr>
     
	<h2 style="text-align: center;"><%=book.getTitle() %></h2>

    <div class="col-sm-9 padding-right">
		<div class="product-details"><!--product-details-->
		
			<div class="col-sm-4">
					<div class="view-product">
								<img class="thumbnail" src="<%=book.getBookImage()%>"/>
							</div>

						</div>
			<div class="col-sm-7">
				<div class="product-information"><!--/product-information-->
				
					<%-- <h2><%=book.getAuthorNameByIndex(0) %></h2>	 --%>	
						
						<% if(book.geteBookISBN() !=null)
          				{
              			%>
            				<p>eBook ISBN : <%=book.geteBookISBN()%></p><br>
            
            			<%
          				}
           				%>
						
						<%if(book.getPaperISBN() !=null)
              {
              %>
            <p>Print book ISBN <%=book.getPaperISBN()%></p><br>
            <%
            }
            %>		
								
								<p>Published On <%=book.getPublishedDate()%></p>
								<p><%=book.getDescription() %></p>
								<span>
									<span>Price :  £<%=book.getPrice()%></span>
									<label>Quantity:</label>
									<input type="text" value="1" />
									
									
									<a href="/addToCart?bookId=<%=book.getBookId()%>" class="btn btn-default">Add to Cart</a>
								</span>
				 
        

        <label>Select the format
        <select>
<!--           <option value="">-- Select -- </option> -->
         <% if(book.getPaperISBN() !=null)
        {%>
        <option value = "Paperback">Paperback
        <%
        }%></option>
             <% if(book.geteBookISBN() !=null)
        {%>
        <option value = "eBook">eBook
        <%
        }%></option>
      
         <!--  <option value="printAndeBook">PrintBook & eBook</option> -->
        </select>
        </label>
        
        <hr>
        
        <div class="blog-socials">
            <a class="button">Facebook</a>
            <a class="button">Twitter</a>
            <a class="button">Yo</a>
          </div>
        </div>
    </div>
    
    </div>
    </div>
    
</div>
</div>
</section>
         
     <%@ include file="footer.jsp" %>