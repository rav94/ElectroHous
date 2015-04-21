<%-- 
    Document   : cart
    Created on : Apr 5, 2015, 11:35:06 AM
    Author     : Ravindu
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="cartControl.product"%>
<%@page import="java.sql.Statement"%>
<%@page import="controlClasses.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="cartControl.productShow"%>
<%@page import="controlClasses.errorHandler" %>
<!DOCTYPE html>
<html lang="en">
  
  <!--Header Include -->
  <%@include file="CommonImports/header.jsp"%>
  
  
  <body onload="startclock()">
   
    <!--Navigation Area-->
    <%@include file="CommonImports/navArea.jsp"%>
    
    <div class="product-big-title-area">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="product-bit-title text-center">
                        <h2>Shopping Cart</h2>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End Page title area -->
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    
                    
                    <% 
                        Object session1 = request.getSession().getAttribute("cart");
                    %>
                    
                    
                    
                    <div class="single-sidebar">
                    <%
                        Statement stmt= DbConnection.dbConn().createStatement();
                        ResultSet rset = stmt.executeQuery("SELECT product_image_name, title, ProductCode, Price, old_price FROM product WHERE RAND() LIMIT 4");
                    %>
                        <h2 class="sidebar-title">Products</h2>
                        
                        <%
                        while(rset.next()){ 
                        %>
                        
                        <div class="thubmnail-recent">
                            <input type="text" name="image" hidden="true" value="<%=rset.getString(1) %>" ><img src="img/<%=rset.getString(1) %>" class="recent-thumb" alt="">
                            <h2><input type="text" name="title" hidden="true" value="<%=rset.getString(2) %>" ><a href="single-product.jsp"><%=rset.getString(2)%></a></h2>
                            <h4><input type="text" name="product_id" hidden="true" value="<%=rset.getString(3) %>" ><%=rset.getString(3)%></h4>
                            <div class="product-sidebar-price">
                                <input type="text" name="price" hidden="true" value="<%=rset.getString(4) %>" ><ins>Rs.<%=rset.getString(4) %></ins> <del>Rs.<%=rset.getString(5)%></del>
                            </div>                             
                        </div>
                        
                        <% } %>

                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <% 
                                double totalPrice = 0;            
                                ArrayList<product> list1 = new ArrayList<product>();
                                list1 = (ArrayList)session1;
            
                                for(product list : list1) {   
                            %>
                            
                                <table cellspacing="0" class="shop_table cart">
                                <form method="post" action="cartRemove"> 
                                    <thead>
                                        <tr>
                                            <th class="product-remove">&nbsp;</th>
                                            <th class="product-thumbnail">&nbsp;</th>
                                            <th class="product-name">Product ID</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-subtotal">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <input class="Remove" type="submit" value="X" onclick="removeShoppingCart()">
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="single-product.jsp"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="img/<%= list.getImage() %>"></a>
                                            </td>
                                            
                                            <td class="product-name">
                                                <span><%= list.getProduct_code() %></span> 
                                            </td>
                                            

                                            <td class="product-name">
                                                <a href="single_product_detail.jsp"><%= list.getTitle() %></a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount">Rs.<%= list.getPrice()%></span> 
                                            </td>
                                            
                                            <td class="product-subtotal">
                                                <span class="amount">Rs.<%= list.getPrice()%></span> 
                                            </td>

                                        <tr>
                                            <td class="actions" colspan="6">
                                                <input type="submit" value="Update Cart" name="update_cart" class="button">
                                                <form action="checkout.jsp">
                                                    <input type="submit" value="Proceed to Checkout" name="proceed" class="checkout-button button alt wc-forward" >
                                                </form>
                                            </td>
                                        </tr>    
                                            
                                        </tbody>
                                </form>
                                </table>
                            <% } %>      
                                            
                                        
<!--                            //Proceed to checkout button should be added        -->
                            
                            

                            <div class="cart-collaterals">
                                <div class="cross-sells">
                                <%
                                    Statement stmt1= DbConnection.dbConn().createStatement();
                                    ResultSet rset1 = stmt1.executeQuery("SELECT product_image_name, title, Price FROM product WHERE RAND() LIMIT 2");
                                %>   
                                <h2>You may be interested in...</h2>
                                
                                <ul class="products">
                                <%
                                    while(rset1.next()){ 
                                %>
                                    <li class="product">
                                        
                                        <a href="productTelevision.jsp">
                                            <input type="text" name="image" hidden="true" value="<%=rset1.getString(1) %>" ><img width="325" height="325" alt="T_4_front" class="attachment-shop_catalog wp-post-image" src="img/<%=rset1.getString(1) %>">
                                            <h3><input type="text" name="title" hidden="true" value="<%=rset1.getString(2) %>" ><a href="single-product.jsp"><%=rset1.getString(2)%></a></h3>
                                            <span class="price"><span class="amount"><input type="text" name="price" hidden="true" value="<%=rset1.getString(3) %>" >Rs.<%=rset1.getString(3) %></span></span>
                                        </a>

                                    </li>
                                <% } %>

                                </ul>
                                        
                            </div>


                            <div class="cart_totals ">
                                <h2>Cart Totals</h2>

                                <table cellspacing="0">
                                    <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Cart Subtotal</th>
                                            <td><span class="amount">   </span></td>
                                        </tr>

                                        <tr class="shipping">
                                            <th>Delivery Details</th>
                                            <td>Free Shipping</td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            </div>
                        </div>                        
                    </div>                    
                </div>
            </div>
        </div>
    </div>

    
    <!--Footer Included -->
    <%@include file="CommonImports/footer.jsp" %>
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="E:\pro\WebApplication1\web\js\owl.carousel.min.js"></script>
    <script src="E:\pro\WebApplication1\web\js\jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="E:\pro\WebApplication1\web\js\jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="E:\pro\WebApplication1\web\js\main.js"></script>
    
    <!--Cart Remove Script -->
    <script>
    
    function removeShoppingCart(){
        alert("Product Has Been removed from the Shopping Cart");
    }
        
    </script> 
  </body>
</html>
