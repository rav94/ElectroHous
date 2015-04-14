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
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Search Products</h2>
                        <form action="#">
                            <input type="text" placeholder="Search products...">
                            <input type="submit" value="Search">
                        </form>
                    </div>
                    
                    <% 
                        Object session1 = request.getSession().getAttribute("cart");
                    %>
                    
                    <%
                        Statement stmt= DbConnection.dbConn().createStatement();
                        ResultSet rset = stmt.executeQuery("SELECT product_image_name, title, ProductCode, Price, old_price FROM product WHERE RAND() LIMIT 4");
                    %>
                    
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Products</h2>
                        
                        <%
                        while(rset.next()){ 
                        %>
                        
                        <div class="thubmnail-recent">
                            <input type="text" name="image" hidden="true" value="<%=rset.getString(1) %>" ><img src="img/<%=rset.getString(1) %>" class="recent-thumb" alt="">
                            <h2><input type="text" name="title" hidden="true" value="<%=rset.getString(2) %>" ><a href="single-product.jsp"><%=rset.getString(2)%></a></h2>
                            <h4><input type="text" name="product_id" hidden="true" value="<%=rset.getString(3) %>" ><%=rset.getString(3)%></h4>
                            <div class="product-sidebar-price">
                                <input type="text" name="price" hidden="true" value="<%=rset.getString(4) %>" ><ins><%=rset.getString(4) %></ins> <del><%=rset.getString(5)%></del>
                            </div>                             
                        </div>
                        
                        <% } %>

                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                             <% 
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
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-subtotal">Total</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr class="cart_item">
                                            <td class="product-remove">
                                                <input class="Remove" type="submit" value="X">
                                            </td>

                                            <td class="product-thumbnail">
                                                <a href="single-product.jsp"><img width="145" height="145" alt="poster_1_up" class="shop_thumbnail" src="img/<%= list.getImage() %>"></a>
                                            </td>
                                            
                                            <td class="product-name">
                                                <span><%= list.getProduct_code() %></span> 
                                            </td>
                                            

                                            <td class="product-name">
                                                <a href="single-product.jsp"><%= list.getTitle() %></a> 
                                            </td>

                                            <td class="product-price">
                                                <span class="amount"><%= list.getPrice()%></span> 
                                            </td>

                                            <td class="product-quantity">
                                                <div class="quantity buttons_added">
                                                    <!--<input type="button" class="minus" value="-">-->
                                                    <input type="number" size="0" class="input-text qty text" title="Qty" value="1" min="0" step="1">
                                                    <!--<input type="button" class="plus" value="+">-->
                                                </div>
                                            </td>
                                            
                                            <% double totalPrice=+list.getPrice(); %>
                                            <td class="product-subtotal">
                                                <span class="amount"><% out.println(totalPrice); %></span> 
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="actions" colspan="6">
                                                <input type="submit" value="Update Cart" name="update_cart" class="button">
                                                <input type="submit" value="Proceed to Checkout" name="proceed" class="checkout-button button alt wc-forward">
                                            </td>
                                        </tr>
                                    </tbody>
                                </form>
                                </table>
                            <% } %>  

                            <div class="cart-collaterals">
                                
                                <div class="cart_totals">
                                <h2>Cart Totals</h2>

                                <table cellspacing="0">
                                    <tbody>
                                        <tr class="cart-subtotal">
                                            <th>Cart Subtotal</th>
                                            <td><span class="amount">£15.00</span></td>
                                        </tr>

                                        <tr class="shipping">
                                            <th>Delivery Details</th>
                                            <td>Free Shipping</td>
                                        </tr>

                                        <tr class="order-total">
                                            <th>Order Total</th>
                                            <td><strong><span class="amount">£15.00</span></strong> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>


                            <form method="post" action="#" class="shipping_calculator">
                                <h2><a class="shipping-calculator-button" data-toggle="collapse" href="#calcalute-shipping-wrap" aria-expanded="false" aria-controls="calcalute-shipping-wrap">Delivery Details</a></h2>

                                <section id="calcalute-shipping-wrap" class="shipping-calculator-form collapse">

                                <p class="form-row form-row-wide">
                                <select rel="calc_shipping_state" class="country_to_state" id="calc_shipping_country" name="calc_shipping_country">
                                      <option selected="selected" value="">Select your Province</option>
                                      <option value="CE">Central</option>
                                      <option value="EA">Eastern</option>
                                      <option value="NC">North Central</option>
                                      <option value="NO">Nothern</option>
                                      <option value="NW">North Western</option>
                                      <option value="SR">Sabaragamuwa</option>
                                      <option value="SO">Southern</option>
                                      <option value="UV">UVA</option>
                                      <option value="WS">Western</option>
                                </select>
                                </p>
                                
                               

                                </section>
                            </form>


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
  </body>
</html>
