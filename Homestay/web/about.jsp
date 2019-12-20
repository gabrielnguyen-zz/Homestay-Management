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
    <!-- END nav -->
    
    <section class="home-slider owl-carousel">
      <div class="slider-item" style="background-image: url('images/bg1.jpg');" data-stellar-background-ratio="0.5">
        <div class="overlay"></div>
        <div class="container">
          <div class="row slider-text align-items-end">
            <div class="col-md-10 col-sm-12 ftco-animate mb-4">
              <p class="breadcrumbs"><span class="mr-2"><a href="index.html">Home</a></span> <span>About</span></p>
              <h1 class="mb-3">About Us</h1>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section-2">
      <div class="container d-flex">
        <div class="section-2-blocks-wrapper row d-flex">
          <div class="img col-sm-12 col-lg-6 order-last" style="background-image: url('images/about2.jpg');">
          </div>
          <div class="text col-lg-6 order-first ftco-animate">
            <div class="text-inner align-self-start">
              <span class="subheading">About là Nhà Homestay</span>
              <h3 class="heading">Welcome to our Homestay</h3>
              <p>Có nh?ng s?m mai th?c d?y trong c?n phòng nh? n?i Là Nhà Homestay, em ??a m?t nhìn qua khung c?a s? và ??m mình vào nh?ng m?ng tr?i xanh treo veo m?t màu. M?t vài s?i n?ng v??ng nh? bên thành c?a s?...em th?y m?t ngày th?t bình yên !</p>

              <p>Nh?ng ngày mùa ?ông, ?à L?t v?n mang h?i l?nh dù M?t Tr?i ?ã lên cao...?ôi khi, em ch?ng còn mu?n b??c ra ???ng, ch? mu?n làm "m?t chú mèo l??i" n?m ??n trên chi?c gi??ng thân yêu, cu?n tròn mình t?n h??ng h?i ?m mà chi?c ch?n nh? mang l?i...Th?t là m?t kì ngh? tuy?t v?i !!</p>
              <p>Là Nhà Homestay là v?y, luôn mang cho em c?m giác an yên ??n l? lùng...Còn v?i ng??i, Là Nhà trông nh? th? nào? Nói em nghe ?i !!</p>
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
                    <p class="mb-5">Không gian siêu ?o, siêu ?ep nheeeeee</p>
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
                    <p class="mb-5">Bu?i t?i lên ?èn khá lung linh. Mà homestay khá ch?t nên lúc nào book c?ng full phòng h?t không bao gi? d? phòng ?âu, th?i ti?t l?nh nh? v?y mà mình th?y khá nhi?u ng??i thuê phòng ng? l?u n?a ?ó.</p>
                    <p class="name">B?o Tr?n</p>
                    <span class="position">Th? Nhi?p ?nh</span>
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
                    <p class="mb-5">?úng nh? tên g?i Là Nhà. Homestay mang l?i c?m giác ?m cúng, thân thi?n l?m nha. Không gian r?ng, ???c thi?t k? ?n t??ng, tha h? mà ch?p ?nh. Không khí trong lành c?ng v?i thiên nhiên xung quanh làm mình thích l?m, ch? mu?n v?. </p>
                    <p class="name">H?ng Tô</p>
                    <span class="position">Ng??i M?u ?nh</span>
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
                    <p class="name">?i?n Nguy?n</p>
                    <span class="position">Khách ??n t? TP.HCM</span>
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
                <li><a href="#" class="py-2 d-block">102/6 V?n H?nh, P8, ?à L?t, Lâm ??ng, Vi?t Nam</a></li>
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