<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
      <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>eElectroHouse</title>
	<!-- BOOTSTRAP STYLES-->
    <link href="assets/css/bootstrap.css" rel="stylesheet" />
     <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/responsive.css">
    <link rel="stylesheet" href="assets/css/style - Copy.css">
     <!-- FONTAWESOME STYLES-->
    <link href="assets/css/font-awesome.css" rel="stylesheet" />
        <!-- CUSTOM STYLES-->
    <link href="assets/css/custom.css" rel="stylesheet" />
     <!-- GOOGLE FONTS-->
   <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
</head>
<body>
    <div id="wrapper">
        <nav class="navbar navbar-default navbar-cls-top " role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Binary admin</a> 
            </div>
  <div style="color: white;
padding: 15px 50px 5px 50px;
float: right;
font-size: 16px;"> Last access : 30 May 2014 &nbsp; <a href="#" class="btn btn-danger square-btn-adjust">Logout</a> </div>
        </nav>   
           <!-- /. NAV TOP  -->
                <nav class="navbar-default navbar-side" role="navigation">
            <div class="sidebar-collapse">
                <ul class="nav" id="main-menu">
				<li class="text-center">
                    <img src="assets/img/find_user.png" class="user-image img-responsive"/>	</li>
				
					
                    <li>
                        <a  href="index.html"><i class=""></i> Edit</a></li>
                      <li>
                        <a  href="ui.html"><i class=""></i> Product</a></li>
                    <li>
                        <a  href="tab-panel.html"><i class=""></i> User</a></li>
						   <li  >
                        <a  href="chart.html"><i class=""></i> Report</a></li>	
                      <li  >
                        <a  href="table.html"><i class=""></i>Order</a></li>
                            <li>
                            </li>
                        </ul>
                  </li>  
                </ul>
               
            </div>
            
        </nav>  
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
          <div id="page-inner">
                <div class="row">
                    <ul class="nav" id="main-menu2">
                      <li  ></li>
                  </ul>
                    <div class="col-md-12">
                     <h2>User Login</h2>   
                        <h5>Welcome </h5>
                       
                  </div>
              </div>
           <!-- /. ROW  -->
 <h5>Enter User Details </h5>
 <% int button; %>
 <div style="background-color: #BDBDBD; margin-left: 50px; width: 330px; height: 200px;"> 
     <br>
                 <div style="font-size: 16px; margin-left: 30px;">
                     <form action="servletUser" method="POST">
                         <table>
                             <tr>
                                 <td>User Id</td>
                                 <td><input type="text" name="UserId"></td>
                             </tr>
                             <tr>
                                 <td>User Name</td>
                                 <td><input type="text" name="UserName"></td>
                             </tr>
                             <tr>
                                 <td>Password</td>
                                 <td><input type="text" name="password"></td>
                             </tr>
                             <tr>
                                 <td>Contact No</td>
                                 <td><input type="text" name="contact"></td>
                             </tr>
                             <tr>
                                 <td>User Type</td>
                                 <td><input type="text" name="type"></td>
                             </tr>
                             <tr>
                                 <td><input type="submit"></td>
                             </tr>
                         </table>
                         <input type="hidden" name="button" value="1" disabled="disabled" />
                     </form>
                 </div>
            </div>
 
 <div style="background-color: #BDBDBD; margin-left: 50px; margin-top: 20px; width: 330px; height: 200px;">
     <br>
         <div style="font-size: 16px; margin-left: 30px;">
             <form action="" method="POST">
                         User Id
                         <input type="text" name="UId" value="" size="15" />
                         <input type="hidden" name="button" value="2" disabled="disabled" />
                         <input type="submit" value="Search" name="search" />
                         
             </form>
             <% 
 
               
             %>
            User Name Is : 
         </div>
 </div>
               
    </div>
             <!-- /. PAGE INNER  -->
</div>
         <!-- /. PAGE WRAPPER  -->
        </div>
<!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="assets/js/jquery-1.10.2.js"></script>
      <!-- BOOTSTRAP SCRIPTS -->
    <script src="assets/js/bootstrap.min.js"></script>
    <!-- METISMENU SCRIPTS -->
    <script src="assets/js/jquery.metisMenu.js"></script>
      <!-- CUSTOM SCRIPTS -->
    <script src="assets/js/custom.js"></script>
</body>
</html>
