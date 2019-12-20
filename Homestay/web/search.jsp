<%@page import="java.util.List"%>
<%@page import="nguyen.models.RoomDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>  
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
    <head>
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
        <section class="home-slider owl-carousel">
            <div class="slider-item" style="background-image: url('images/bg3.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-end">
                        <div class="col-md-10 col-sm-12 ftco-animate mb-4">
                            <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>Book</span></p>
                            <h1 class="mb-3">Booking</h1>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%
            List<RoomDTO> result = (List<RoomDTO>) request.getAttribute("INFO");
            if (result != null) {
                if (result.size() > 0) {
        %>
        <section class="ftco-section room-section bg-light">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Our Rooms</span>
                        <h2>Explore our rooms</h2>
                    </div>
                </div>
                <%
                    for (RoomDTO dto : result) {
                %>
                <div class="row">
                    <div class="col-md-4 ftco-animate">
                        <div class="room-wrap">
                            <a href="#" class="room-img" style="background-image: url(<%= dto.getImage()%>);"></a>
                            <div class="text p-4">
                                <div class="d-flex mb-1">
                                    <div class="one-third">
                                        <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                        <h3> Mã <%= dto.getRoomID()%>.<%= dto.getRoomName()%></h3>

                                    </div>
                                    <div class="one-forth text-center">
                                        <p class="price">$<%= dto.getPrice()%><br><span>/night</span></p>
                                        
                                    </div>
                                </div>
                                <p class="features">
                                    <span class="d-block mb-2"><i class="icon-check mr-2"></i> Thích hợp khi đi du lịch </span>
                                    <span class="d-block mb-2"><i class="icon-check mr-2"></i> Buffet buổi sáng</span>
                                    <span class="d-block mb-2"><i class="icon-check mr-2"></i> Giường thoải mái</span>
                                    <span class="d-block mb-2"><i class="icon-check mr-2"></i> Ghế ngồi cho bé</span>
                                    <span class="d-block mb-2"><i class="icon-check mr-2"></i> Free wifi</span>
                                </p>
                                <p>
                                <form action="MainController">

                                    <input type="submit" value="Click to continue" name="action" class="btn btn-primary"/>
                                    <input type="hidden" name="txtRoomPrice" value="<%= dto.getPrice()%>" />
                                    <input type="hidden" name="txtRoomID" value="<%= dto.getRoomID()%>" />
                                    <input type="hidden" name="txtRoomName" value="<%= dto.getRoomName()%>" />
                                    <input type="hidden" name="roomQuantity" value="<%= request.getAttribute("ROOMQUANTITY")%>" />
                                    <input type="hidden" name="checkIn" value="<%= request.getAttribute("CHECKIN") %>" />
                                    <input type="hidden" name="checkOut" value="<%=request.getAttribute("CHECKOUT") %>" />
                                    <input type="hidden" name="image" value="<%= dto.getImage()%>" />
                                </form>   
                                </p>
                            </div>
                        </div>
                    </div>




                </div>
            </div>      




            <%
                        }
                    }
                }
            %>





        </section>  
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
