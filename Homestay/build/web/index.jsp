<%-- 
    Document   : index
    Created on : Nov 22, 2019, 12:16:04 AM
    Author     : Gabriel Nguyen
--%>

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
        <c:if test="${sessionScope.ROLE == 'admin'}">
            <jsp:forward page="admin.jsp" />
        </c:if>
        <c:if test="${sessionScope.ROLE == 'staff'}">
            <jsp:forward page="staff.jsp" />
        </c:if>

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
            <div class="slider-item" style="background-image: url('images/bg1.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center justify-content-start">
                        <div class="col-md-6 col-sm-12 ftco-animate">
                            <h1 class="mb-4">Welcome to Là Nhà Homestay a paradise in the top of the mountain</h1>
                            <p><a href="images/dalat.mp4" class="btn btn-primary btn-outline-white px-4 py-3 popup-vimeo"><span class="ion-ios-play mr-2"></span> Watch Video</a></p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url('images/bg2.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center justify-content-start">
                        <div class="col-md-6 col-sm-12 ftco-animate">
                            <h1 class="mb-4">Book the perfect accomodations without breaking the bank</h1>
                            <p><a href="images/dalat.mp4" class="btn btn-primary btn-outline-white px-4 py-3 popup-vimeo"><span class="ion-ios-play mr-2"></span> Watch Video</a></p>            </div>
                    </div>
                </div>
            </div>

            <div class="slider-item" style="background-image: url('images/bg3.jpg');">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row slider-text align-items-center justify-content-start">
                        <div class="col-md-6 col-sm-12 ftco-animate">
                            <h1 class="mb-4">Lets go to discovering</h1>
                            <p><a href="images/dalat.mp4" class="btn btn-primary btn-outline-white px-4 py-3 popup-vimeo"><span class="ion-ios-play mr-2"></span> Watch Video</a></p>            </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- END slider -->

        <div class="ftco-section-reservation">
            <div class="container">
                <div class="row justify-content-end ftco-animate">
                    <div class="col-lg-4 col-md-5 reservation p-md-5">
                        <div class="block-17">
                            <form action="MainController" method="POST" class="d-block">
                                <div class="fields d-block">

                                    <div class="book-date one-third">
                                        <label for="check-in">Check in:</label>
                                        <input type="text" id="checkin_date" class="form-control" placeholder="M/D/YYYY" name="txtCheckIn">

                                    </div>

                                    <div class="book-date one-third">
                                        <label for="check-out">Check out:</label>
                                        <input type="text" id="checkout_date" class="form-control" placeholder="M/D/YYYY" name="txtCheckOut">
                                    </div>

                                    <div class="one-third">
                                        <label for="Guest">Guest:</label>
                                        <div class="select-wrap">
                                            <div class="icon"><span class="ion-ios-arrow-down"></span></div>
                                            <select name="cboPerson" id="" class="form-control">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="3">4+</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <%
                                    String role = (String) session.getAttribute("ROLE");
                                    if (session.getAttribute("USERNAME") != null && role.equals("user")) {
                                %>
                                <input type="submit" class="search-submit btn btn-primary" value="Book Now" name="action">  
                                <font color="red">${requestScope.INVALIDDATE}</font>
                                <%
                                } else {
                                %>
                                <input type="submit" class="search-submit btn btn-primary" value="Book" name="action">  
                                <%
                                    }
                                %>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <section class="services bg-light">
            <div class="container">
                <div class="row no-gutters">
                    <div class="col-md-4 ftco-animate py-5 nav-link-wrap aside-stretch">
                        <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                            <a class="nav-link px-4 active" id="v-pills-master-tab" data-toggle="pill" href="#v-pills-master" role="tab" aria-controls="v-pills-master" aria-selected="true"><span class="mr-3 flaticon-bed"></span> Là Nhà House</a>

                            <a class="nav-link px-4" id="v-pills-buffet-tab" data-toggle="pill" href="#v-pills-buffet" role="tab" aria-controls="v-pills-buffet" aria-selected="false"><span class="mr-3 flaticon-tray"></span> BBQ Ngoài Trời</a>

                            <a class="nav-link px-4" id="v-pills-fitness-tab" data-toggle="pill" href="#v-pills-fitness" role="tab" aria-controls="v-pills-fitness" aria-selected="false"><span class="mr-3 flaticon-woman"></span> Tập Luyện Thể Thao</a>

                            <a class="nav-link px-4" id="v-pills-reception-tab" data-toggle="pill" href="#v-pills-reception" role="tab" aria-controls="v-pills-reception" aria-selected="false"><span class="mr-3 flaticon-receptionist"></span> 24 Hour Reception</a>

                            <a class="nav-link px-4" id="v-pills-sea-tab" data-toggle="pill" href="#v-pills-sea" role="tab" aria-controls="v-pills-sea" aria-selected="false"><span class="mr-3 flaticon-deck-chair"></span> Không Gian Thư Giãn</a>

                            <a class="nav-link px-4" id="v-pills-spa-tab" data-toggle="pill" href="#v-pills-spa" role="tab" aria-controls="v-pills-spa" aria-selected="false"><span class="mr-3 flaticon-spa"></span> Góc Nhỏ Sống Ảo &amp; Khám Phá</a>

                            <a class="nav-link px-4" id="v-pills-wifi-tab" data-toggle="pill" href="#v-pills-wifi" role="tab" aria-controls="v-pills-wifi" aria-selected="false"><span class="mr-3 flaticon-wifi-router"></span> Free wifi</a>

                        </div>
                    </div>
                    <div class="col-md-8 ftco-animate p-4 p-md-5 d-flex align-items-center">

                        <div class="tab-content pl-md-5" id="v-pills-tabContent">

                            <div class="tab-pane fade show active" id="v-pills-master" role="tabpanel" aria-labelledby="v-pills-master-tab">
                                <span class="icon mb-3 d-block flaticon-bed"></span>
                                <h2 class="mb-4">Là Nhà House</h2>
                                <p class="lead">Một không gian ở dễ thương-chăm chút decor từng góc nhỏ để hướng đến cuộc sống thư giãn hưởng thụ gần gũi với thiên nhiên Đà Lạt mà chụp hình cũng đẹp nữa.</p>
                                <p><a href="#top" class="btn btn-primary">Book Now</a></p>
                            </div>

                            <div class="tab-pane fade" id="v-pills-buffet" role="tabpanel" aria-labelledby="v-pills-buffet-tab">
                                <span class="icon mb-3 d-block flaticon-tray"></span>
                                <h2 class="mb-4">BBQ Ngoài Trời</h2>
                                <p class="lead">Khoảng không gian sân vườn để mỗi tối party BBQ rồi đàn hát, quây quần bên nhau ... Sau ngần ấy năm thì chỉ ngày một lung linh hơn - tình cảm hơn mà thôi vì cỏ cây hoa lá ngày một sum xuê và đong đầy kỉ niệm với bao người.</p>
                                <p><a href="#top" class="btn btn-primary">Book Now</a></p>
                            </div>

                            <div class="tab-pane fade" id="v-pills-fitness" role="tabpanel" aria-labelledby="v-pills-fitness-tab">
                                <span class="icon mb-3 d-block flaticon-woman"></span>
                                <h2 class="mb-4">Tập Luyện Thể Thao</h2>
                                <p class="lead">Với 1 bể bơi rộng có tầm nhìn ra toàn cảnh của Đà Lạt </p>
                                <p><a href="#top" class="btn btn-primary">Book Now</a></p>
                            </div>

                            <div class="tab-pane fade" id="v-pills-reception" role="tabpanel" aria-labelledby="v-pills-reception-tab">
                                <span class="icon mb-3 d-block flaticon-receptionist"></span>
                                <h2 class="mb-4">24 Hours Reception</h2>
                                <p class="lead">Đội ngũ lễ tân chuyên nghiệp sẽ đáp ứng mọi nguyện vọng của bạn 24/7</p>
                                <p><a href="#top" class="btn btn-primary">Book Now</a></p>
                            </div>

                            <div class="tab-pane fade" id="v-pills-sea" role="tabpanel" aria-labelledby="v-pills-sea-tab">
                                <span class="icon mb-3 d-block flaticon-deck-chair"></span>
                                <h2 class="mb-4">Không gian thư giãn</h2>
                                <p class="lead">Với 1 không gian 4000m2 dủ để bạn có thể tổ chức party hay lễ đường hoành tráng trong ngày trọng đại.</p>
                                <p><a href="#top" class="btn btn-primary">Book Now</a></p>
                            </div>

                            <div class="tab-pane fade" id="v-pills-spa" role="tabpanel" aria-labelledby="v-pills-spa-tab">
                                <span class="icon mb-3 d-block flaticon-spa"></span>
                                <h2 class="mb-4">Góc sống ảo &amp; khám phá</h2>
                                <p class="lead">Qua mỗi bàn tay các nhiếp ảnh, góc của Là Nhà lại mỗi khác. Bạn có thể khám phá các góc lạ và đẹp</p>
                                <p><a href="#top" class="btn btn-primary">Book Now</a></p>
                            </div>
                            <div class="tab-pane fade" id="v-pills-wifi" role="tabpanel" aria-labelledby="v-pills-wifi-tab">
                                <span class="icon mb-3 d-block flaticon-wifi-router"></span>
                                <h2 class="mb-4">Free wifi </h2>
                                <p class="lead">Tốc độ wifi có thể gọi là nhanh nhất xứ Đà Lạt giúp bạn có thể thoải mái mà sử dụng.</p>
                                <p><a href="#top" class="btn btn-primary">Book Now</a></p>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </section>

        <section class="ftco-section room-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Our Rooms</span>
                        <h2>Explore our rooms</h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12 ftco-animate">
                        <div class="carousel-room owl-carousel">
                            <div class="item">
                                <div class="room-wrap">
                                    <a href="#" class="room-img" style="background-image: url(images/room1.jpg);"></a>
                                    <div class="text p-4">
                                        <div class="d-flex mb-1">
                                            <div class="one-third">
                                                <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                                <h3><a href="#">Phòng Đôi</a></h3>
                                            </div>
                                            <div class="one-forth text-center">
                                                <p class="price">$50 <br><span>/night</span></p>
                                            </div>
                                        </div>
                                        <p class="features">
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Thích hợp khi đi du lịch đôi</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Buffet buổi sáng</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Giường đôi</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Ghế ngồi cho bé</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Free wifi</span>
                                        </p>
                                        <p><a href="#top" class="btn btn-primary">Reserve a room</a></p>
                                    </div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="room-wrap">
                                    <a href="#" class="room-img" style="background-image: url(images/room2.jpg);"></a>
                                    <div class="text p-4">
                                        <div class="d-flex mb-1">
                                            <div class="one-third">
                                                <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                                <h3><a href="#">Phòng Gia Đình</a></h3>
                                            </div>
                                            <div class="one-forth text-center">
                                                <p class="price">$99 <br><span>/night</span></p>
                                            </div>
                                        </div>
                                        <p class="features">
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Thích hợp khi đi du lịch gia đình</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Buffet buổi sáng</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> 3 Giường đôi</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Ghế ngồi cho bé</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Free wifi</span>
                                        </p>
                                        <p><a href="#top" class="btn btn-primary">Reserve a room</a></p>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="item">
                                <div class="room-wrap">
                                    <a href="#" class="room-img" style="background-image: url(images/room4.jpg);"></a>
                                    <div class="text p-4">
                                        <div class="d-flex mb-1">
                                            <div class="one-third">
                                                <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                                <h3><a href="#">Phòng Đơn</a></h3>
                                            </div>
                                            <div class="one-forth text-center">
                                                <p class="price">$40 <br><span>/night</span></p>
                                            </div>
                                        </div>
                                        <p class="features">
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Thích hợp khi đi 1 mình</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Buffet buổi sáng</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Giường đơn</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> View đẹp</span>
                                            <span class="d-block mb-2"><i class="icon-check mr-2"></i> Free wifi</span>
                                        </p>
                                        <p><a href="#top" class="btn btn-primary">Reserve a room</a></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <section class="ftco-section-parallax">
            <div class="parallax-img d-flex align-items-md-center align-items-sm-end" style="background-image: url('images/bg4.jpg');" data-stellar-background-ratio="0.5">
                <div class="overlay"></div>
                <div class="container">
                    <div class="row desc d-flex justify-content-center">
                        <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
                            <span class="subheading">About us</span>
                            <h2 class="h1 font-weight-bold">Tại sao chọn Là Nhà ?</h2>
                            <p><a href="about.html" class="btn btn-primary btn-outline-white mt-3 py-3 px-4">View more details</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>



        <section class="ftco-section testimony-section">
            <div class="container">
                <div class="row justify-content-center mb-5 pb-5">
                    <div class="col-md-7 text-center heading-section ftco-animate">
                        <span class="subheading">Guests Says</span>
                        <h2>Our Satisfied Guests says</h2>
                    </div>
                </div>
                <div class="row ftco-animate">
                    <div class="col-md-12">
                        <div class="carousel owl-carousel ftco-owl">
                            <div class="item text-center">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(images/person1.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                        <p class="mb-5">Không gian siêu ảo, siêu đep nheeeeee</p>
                                        <p class="name">BB Trần</p>
                                        <span class="position">Celebritiy</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item text-center">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(images/person2.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                        <p class="mb-5">Buổi tối lên đèn khá lung linh. Mà homestay khá chất nên lúc nào book cũng full phòng hết không bao giờ dư phòng đâu, thời tiết lạnh như vậy mà mình thấy khá nhiều người thuê phòng ngủ lều nữa đó.</p>
                                        <p class="name">Bảo Trần</p>
                                        <span class="position">Thợ Nhiếp Ảnh</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item text-center">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(images/person3.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                        <p class="mb-5">Đúng như tên gọi Là Nhà. Homestay mang lại cảm giác ấm cúng, thân thiện lắm nha. Không gian rộng, được thiết kế ấn tượng, tha hồ mà chụp ảnh. Không khí trong lành cũng với thiên nhiên xung quanh làm mình thích lắm, chả muốn về. </p>
                                        <p class="name">Hằng Tô</p>
                                        <span class="position">Người Mẫu Ảnh</span>
                                    </div>
                                </div>
                            </div>
                            <div class="item text-center">
                                <div class="testimony-wrap p-4 pb-5">
                                    <div class="user-img mb-4" style="background-image: url(images/person4.jpg)">
                                        <span class="quote d-flex align-items-center justify-content-center">
                                            <i class="icon-quote-left"></i>
                                        </span>
                                    </div>
                                    <div class="text">
                                        <p class="star-rate"><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star"></span><span class="icon-star-half-full"></span></p>
                                        <p class="mb-5">Thanks for making our specials day</p>
                                        <p class="name">Điền Nguyễn</p>
                                        <span class="position">Khách đến từ TP.HCM</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
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