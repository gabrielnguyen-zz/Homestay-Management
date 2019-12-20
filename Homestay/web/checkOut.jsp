<%-- 
    Document   : login
    Created on : Nov 26, 2019, 7:19:35 AM
    Author     : Gabriel Nguyen
--%>

<%@page import="java.util.Map.Entry"%>
<%@page import="nguyen.models.InvoiceDTO"%>
<%@page import="nguyen.models.Cart"%>


<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="en">
    <head>
        <script>
            window.history.forward();
        </script>
        <title>Là Nhà Homestay</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
    <link re<head>
        <title>Là Nhà Homestay</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <link href="https://fonts.googleapis.com/css?family=Muli:300,400,600,700" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700" rel="stylesheet">

        <link rel="stylesheet" href="css/open-iconic-bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.css">

        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">

        <link rel="stylesheet" href="css/aos.css">

        <link rel="stylesheet" href="css/ionicons.min.css">

        <link rel="stylesheet" href="css/bootstrap-datepicker.css">
        <link rel="stylesheet" href="css/jquery.timepicker.css">


        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/icomoon.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
            <div class="container">
                <a class="navbar-brand" href="index.jsp">LÀ NHÀ</a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="oi oi-menu"></span> Menu
                </button>

                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item"><a href="index.jsp" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="about.jsp" class="nav-link">About</a></li>
                        <li class="nav-item dropdown">

                        </li>

                        <%
                            if (session.getAttribute("USERNAME") != null) {
                        %>           
                        <li class="nav-item"><a href="HistoryController" class="nav-link">History Order</a></li>
                        <li class="nav-item"><a href="LogoutController" class="nav-link"><%= session.getAttribute("USERNAME")%>, Logout</a></li>
                            <%
                            } else {
                            %>
                        <li class="nav-item"><a href="login.jsp" class="nav-link">Booking</a></li>
                        <li class="nav-item"><a href="register.jsp" class="nav-link">Register</a></li>
                            <%
                                }
                            %>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- END nav -->

        <section class="home-slider owl-carousel">
            <div class="slider-item" style="background-image: url('images/bg1.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-end">
                        <div class="col-md-10 col-sm-12 ftco-animate mb-4">
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Check Out</span></p>
                            <h1 class="mb-3">Check Out</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- ================ end banner area ================= -->
        <section class="ftco-section contact-section">
            <div class="container bg-light">
                <div class="row d-flex mb-5 contact-info">
                    <div class="col-md-12 mb-4">
                        <h2>Check your order and Finish</h2>
                    </div>
                </div>
        </section>
        <section class="cart_area">
            <div class="container">
                <div class="cart_inner">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <%
                                    Cart shoppingCart = (Cart) session.getAttribute("CART");
                                    int quantity = (int) session.getAttribute("ROOMQUANTITY");
                                %> 
                                <tr>
                                    <th>No.</th>
                                    <th>Room Name</th>
                                    <th>Room Price</th>
                                    <th>Check In</th>
                                    <th>Check Out</th>
                                    <th>Service Name</th>
                                    <th>Service Price</th>
                                    <th>Service Quantity</th>
                                    <th>Total</th>
                                    <th>Delete</th>
                                    <th>Complete</th>
                                </tr>

                            </thead>
                            <tbody>
                                <%
                                    int count = 0;
                                    for (Map.Entry<String, InvoiceDTO> entry : shoppingCart.getCart().entrySet()) {
                                        count++;
                                        InvoiceDTO dto = entry.getValue();
                                %>
                            <form action="MainController" method="POST">
                                <tr>
                                    <td><%= count%></td>
                                    <td>
                                        <%= dto.getRoomName()%>

                                    </td>
                                    <td>
                                        $<%= dto.getRoomPrice()%>

                                    </td>
                                    <td>
                                        <%= session.getAttribute("CHECKIN")%>
                                    </td>
                                    <td>
                                        <%= session.getAttribute("CHECKOUT")%>
                                    </td>
                                    <td>
                                        <% if (dto.getServiceName() == null) {
                                        %>
                                        Thuê xe máy
                                        <%
                                        } else {%>
                                        <%= dto.getServiceName()%>
                                        <% }%>
                                    </td>
                                    <td>
                                        $<%= dto.getServicePrice()%>
                                    </td>
                                    <td>
                                        <%= dto.getServiceQuantity()%>
                                    </td>
                                    <td>
                                        $<%=(dto.getRoomPrice() * quantity) + (dto.getServicePrice() * dto.getServiceQuantity())%>
                                        <input type="hidden" name="txtTotal" value="<%=(dto.getRoomPrice() * quantity) + (dto.getServicePrice() * dto.getServiceQuantity())%>" />
                                    </td>
                                    <td>
                                        <form action="MainController" method="POST">
                                            <input type="submit" value="Delete Order" name="action" class="btn btn-primary"/>
                                            <input type="hidden" name="txtRoomID" value="<%= dto.getRoomID()%>" />
                                        </form>
                                    </td>

                                    <td>
                                        <form action="MainController" method="POST">
                                            <input type="submit" value="Order" name="action" class="btn btn-primary"/>
                                            <input type="hidden" name="txtRoomID" value="<%= dto.getRoomID()%>" />
                                            <input type="hidden" name="txtTotal" value="<%=(dto.getRoomPrice() * quantity) + (dto.getServicePrice() * dto.getServiceQuantity())%>" />
                                            <input type="hidden" name="txtRoomPrice" value="<%= dto.getRoomPrice()%>" />
                                            <input type="hidden" name="txtRoomQuantity" value="<%= quantity %>" />
                                            <input type="hidden" name="txtServiceID" value="<%= dto.getServiceID()%>" />
                                            <input type="hidden" name="txtServicePrice" value="<%= dto.getServicePrice()%>" />
                                            <input type="hidden" name="txtServiceQuantity" value="<%= dto.getServiceQuantity()%>" />
                                            
                                        </form>

                                    </td>

                                </tr>
                            </form>

                            <%            }
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!--================ Start footer Area  =================-->	
        <section class="instagram">
            <div class="container-fluid">
                <div class="row no-gutters justify-content-center pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <h2><span class="icon-instagram"></span> Instagram</h2>
                    </div>
                </div>
                <div class="row no-gutters">
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="images/insta1.jpg" class="insta-img image-popup" style="background-image: url(images/insta1.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="images/insta2.jpg" class="insta-img image-popup" style="background-image: url(images/insta2.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="images/insta3.jpg" class="insta-img image-popup" style="background-image: url(images/insta3.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="images/insta4.jpg" class="insta-img image-popup" style="background-image: url(images/insta4.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                    <div class="col-sm-12 col-md ftco-animate">
                        <a href="images/insta5.jpg" class="insta-img image-popup" style="background-image: url(images/insta5.jpg);">
                            <div class="icon d-flex justify-content-center">
                                <span class="icon-instagram align-self-center"></span>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </section>

        <footer class="ftco-footer ftco-bg-dark ftco-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Là Nhà Homestay</h2>
                            <ul class="ftco-footer-social list-unstyled float-md-left float-lft">
                                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Opening Hours</h2>
                            <ul class="list-unstyled">

                                <li><a href="#" class="py-2 d-block">Monday - Sunday: <span>08:00 - 22:00</span></a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-md">
                        <div class="ftco-footer-widget mb-4">
                            <h2 class="ftco-heading-2">Contact Information</h2>
                            <ul class="list-unstyled">
                                <li><a href="#" class="py-2 d-block">102/6 Vạn Hạnh, P8, Đà Lạt, Lâm Đồng, Việt Nam</a></li>
                                <li><a href="#" class="py-2 d-block">+ 090 365 03 77</a></li>
                                <li><a href="#" class="py-2 d-block">lanhahomestay@gmail.com</a></li>

                            </ul>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-12 text-center">

                        <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This web is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Nguyên </a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
                    </div>
                </div>
            </div>
        </footer>



        <!-- loader -->
        <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


        <script src="js/jquery.min.js"></script>
        <script src="js/jquery-migrate-3.0.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/jquery.easing.1.3.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.stellar.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/bootstrap-datepicker.js"></script>
        <script src="js/jquery.timepicker.min.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
        <script src="js/google-map.js"></script>
        <script src="js/main.js"></script>

    </body>
</html>