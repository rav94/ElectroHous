<%-- 
    Document   : index
    Created on : Apr 8, 2015, 4:05:15 PM
    Author     : Ravindu
--%>
<%@page import="java.sql.Statement"%>
<%@page import="controlClasses.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="cartControl.productShow"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  
    
    <!--Header Include -->
    <%@include file="CommonImports/header.jsp"%>
  
  
  <!--Body Start -->
  <body onload="startclock()">
   
    <!--Navigation Area-->
    <%@include file="CommonImports/navArea.jsp"%>
    
    <%
        Statement stmt= DbConnection.dbConn().createStatement();
        ResultSet rset = stmt.executeQuery("SELECT product_image_name, title, ProductCode, Price, old_price FROM product WHERE RAND() LIMIT 6");
    %>
    <div class="slider-area">
        <div class="zigzag-bottom"></div>
        <div id="slide-list" class="carousel carousel-fade slide" data-ride="carousel">
            
            <div class="slide-bulletz">
                <div class="container">
                    <div class="row">
                        <div class="col-md-12">
                            <ol class="carousel-indicators slide-indicators">
                                <li data-target="#slide-list" data-slide-to="0" class="active"></li>
                                <li data-target="#slide-list" data-slide-to="1"></li>
                                <li data-target="#slide-list" data-slide-to="2"></li>
                            </ol>                            
                        </div>
                    </div>
                </div>
            </div>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <div class="single-slide">
                        <div class="slide-bg slide-one"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>We are Team ElectroHouse</h2>
                                                <p>We provide you the excellent,quality & world class electrical appliances</p>
                                                <p>Come and visit us at one of our branches today !!</p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-two"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>Easy Payment Schemes</h2>
                                                <p>Easy and reliable payment schemes! With 0% interest</p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="item">
                    <div class="single-slide">
                        <div class="slide-bg slide-three"></div>
                        <div class="slide-text-wrapper">
                            <div class="slide-text">
                                <div class="container">
                                    <div class="row">
                                        <div class="col-md-6 col-md-offset-6">
                                            <div class="slide-content">
                                                <h2>Free Delivery</h2>
                                                <p>Free delivery throughout western province and with 0.2% charge within other provinces</p>
                                                <a href="" class="readmore">Learn more</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>        
    </div> <!-- End slider area -->
    
    <div class="promo-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-refresh"></i>
                        <p>30 Days Return</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-truck"></i>
                        <p>Free Delivery</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-lock"></i>
                        <p>Pay Securely</p>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="single-promo">
                        <i class="fa fa-gift"></i>
                        <p>Latest Products</p>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End promo area -->
    
    <div class="maincontent-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="latest-product">
                        <h2 class="section-title">Latest Products</h2>
                        <div class="product-carousel">
                        <%
                            while(rset.next()){ 
                        %>
                        <form action="cartAdd" method="post">
                            <div class="single-product">
                                <div class="product-f-image">
                                    <input type="text" name="image" hidden="true" value="<%=rset.getString(1) %>" ><img src="img/<%=rset.getString(1) %>" alt="">
                                    <div class="product-hover">
                                        <a class="add-to-cart-link"><i class="fa fa-shopping-cart"></i><input type="submit" value="Add to Cart"></a>
                                        <a href="single-product.jsp" class="view-details-link"><i class="fa fa-link"></i> See details</a>
                                    </div>
                                </div>
                                
                                <h2><input type="text" name="title" hidden="true" value="<%=rset.getString(2) %>" ><a href="single-product.jsp"><%=rset.getString(2)%></a></h2>
                                <h4><input type="text" name="product_id" hidden="true" value="<%=rset.getString(3) %>" ><%=rset.getString(3)%></h4>
                                <div class="product-carousel-price">
                                    <input type="text" name="price" hidden="true" value="<%=rset.getString(4) %>" ><ins><%=rset.getString(4) %></ins> <del><%=rset.getString(5)%></del>
                                </div> 
                            </div>
                        </form>
                               <% } %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End main content area -->
    
    <div class="brands-area">
        <div class="zigzag-bottom"></div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="brand-wrapper">
                        <h2 class="section-title">Brands</h2>
                        <div class="brand-list">
                            <img src="img/services_logo__1.jpg" alt="">
                            <img src="img/services_logo__2.jpg" alt="">
                            <img src="img/services_logo__3.jpg" alt="">
                            <img src="img/services_logo__4.jpg" alt="">
                            <img src="img/services_logo__1.jpg" alt="">
                            <img src="img/services_logo__2.jpg" alt="">
                            <img src="img/services_logo__3.jpg" alt="">
                            <img src="img/services_logo__4.jpg" alt="">                            
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> <!-- End brands area -->
    
    
    <!--Footer Included -->
    <%@include file="CommonImports/footer.jsp" %>
   
    <!-- Latest jQuery form server -->
    <script src="https://code.jquery.com/jquery.min.js"></script>
    
    <!-- Bootstrap JS form CDN -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    
    <!-- jQuery sticky menu -->
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/jquery.sticky.js"></script>
    
    <!-- jQuery easing -->
    <script src="js/jquery.easing.1.3.min.js"></script>
    
    <!-- Main Script -->
    <script src="js/main.js"></script>
  </body>
</html>
