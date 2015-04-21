<%-- 
    Document   : checkout
    Created on : Apr 5, 2015, 11:33:12 AM
    Author     : Ravindu
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="cartControl.product"%>
<%@page import="java.sql.Statement"%>
<%@page import="controlClasses.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="cartControl.productShow"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                        <h2>Checkout Process</h2>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
    <div class="single-product-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    
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
                                <input type="text" name="price" hidden="true" value="<%=rset.getString(4) %>" ><ins>Rs.<%=rset.getString(4) %></ins> <del>Rs.<%=rset.getString(5)%></del>
                            </div>                                                       
                        </div>
                        
                        <% } %>
                        
                    </div>
                    
                    <div class="single-sidebar">
                        <h2 class="sidebar-title">Recent Posts</h2>
                        <ul>
                            <li><a href="#">Forum Article Link 1</a></li>
                            <li><a href="#">Forum Article Link 2</a></li>
                            <li><a href="#">Forum Article Link 3</a></li>
                            <li><a href="#">Forum Article Link 4</a></li>
                            <li><a href="#">Forum Article Link 5</a></li>
                        </ul>
                    </div>
                </div>
                
                <div class="col-md-8">
                    <div class="product-content-right">
                        <div class="woocommerce">
                            <div class="woocommerce-info">Returning customer? <a class="showlogin" data-toggle="collapse" href="#login-form-wrap" aria-expanded="false" aria-controls="login-form-wrap">Click here to login</a>
                                <a href=""></a>
                            </div>

                            <form id="login-form-wrap" class="login collapse" method="post" action="login">


                                <p>If you have shopped on this site before, please enter your details in the boxes below. If you are a new customer please proceed to the Billing &amp; Delivery Section.</p>

                                <p class="form-row form-row-first">
                                    <label for="username">Username or email <span class="required">*</span>
                                    </label>
                                    <input type="text" id="username" name="username" class="input-text">
                                </p>
                                <p class="form-row form-row-last">
                                    <label for="password">Password <span class="required">*</span>
                                    </label>
                                    <input type="password" id="password" name="password" class="input-text">
                                </p>
                                <div class="clear"></div>


                                <p class="form-row">
                                    <input type="submit" value="Login" name="login" class="button">
                                    <label class="inline" for="remember"><input type="checkbox" value="forever" id="rememberme" name="rememberme"> Remember me </label>
                                </p>
                                
                                <div class="clear"></div>
                            </form>

                                                        
                            
                            <form enctype="multipart/form-data" action="" class="checkout" method="post" name="checkout">

                                <div id="customer_details" class="col2-set">
                                    <div class="col-1">
                                        <div class="woocommerce-billing-fields">
                                            <h3>Billing Details</h3>
                                            <p id="billing_country_field" class="form-row form-row-wide address-field update_totals_on_change validate-required woocommerce-validated">
                                                <label class="" for="billing_country">Country <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <select class="country_to_state country_select" id="billing_country" name="billing_country">
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

                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">First Name <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_first_name" name="billing_first_name" class="input-text ">
                                            </p>

                                            <p id="billing_last_name_field" class="form-row form-row-last validate-required">
                                                <label class="" for="billing_last_name">Last Name <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_last_name" name="billing_last_name" class="input-text ">
                                            </p>
                                            <div class="clear"></div>

                                            

                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">Address <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="Street Number" id="billing_address_1" name="billing_address_1" class="input-text ">
                                            </p>

                                            <p id="billing_address_2_field" class="form-row form-row-wide address-field">
                                                <input type="text" value="" placeholder="Street Name" id="billing_address_2" name="billing_address_2" class="input-text ">
                                            </p>

                                            <p id="billing_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_city">Town / City <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="Town / City" id="billing_city" name="billing_city" class="input-text ">
                                            </p>

                                            
                                            <div class="clear"></div>

                                            <p id="billing_email_field" class="form-row form-row-first validate-required validate-email">
                                                <label class="" for="billing_email">Email Address <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_email" name="billing_email" class="input-text ">
                                            </p>

                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">Phone <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="" placeholder="" id="billing_phone" name="billing_phone" class="input-text ">
                                            </p>
                                            <div class="clear"></div>


                                            <div class="create-account">
                                                <p>Create an account by entering a password below. If you are a returning customer please login at the top of the page.</p>
                                                <p id="account_password_field" class="form-row validate-required">
                                                    <label class="" for="account_password">Account password <abbr title="required" class="required">*</abbr>
                                                    </label>
                                                    <input type="password" value="" placeholder="Password" id="account_password" name="account_password" class="input-text">
                                                </p>
                                                <div class="clear"></div>
                                            </div>

                                        </div>
                                    </div>

                                 
                                </div>

                                

                                <div id="order_review" style="position: relative;">
                                    


                                    <div id="payment">
                                        <ul class="payment_methods methods">
                                            <li class="payment_method_bacs">
                                                <input type="radio" data-order_button_text="" checked="checked" value="bacs" name="payment_method" class="input-radio" id="payment_method_bacs">
                                                <label for="payment_method_bacs">Direct Payment</label>
                                                <div class="payment_box payment_method_bacs">
                                                    <p>Make your payment after our delivery team deliver your order right at your door steps. (Additional Taxes Inclusive)</p>
                                                </div>
                                            </li>
                                            <li class="payment_method_cheque">
                                                <input type="radio" data-order_button_text="" value="cheque" name="payment_method" class="input-radio" id="payment_method_cheque">
                                                <label for="payment_method_cheque">Cheque Payment </label>
                                                <div style="display:none;" class="payment_box payment_method_cheque">
                                                    <p>Please send your cheque to our delivery agents entitled to ElectrHouse Pvt. Ltd. </p>
                                                </div>
                                            </li>
                                            
                                        </ul>

                                        <div class="form-row place-order">

                                            <input type="submit" data-value="Place order" value="Place order" id="place_order" name="woocommerce_checkout_place_order" class="button alt">


                                        </div>

                                        <div class="clear"></div>

                                    </div>
                                </div>
                            </form>

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