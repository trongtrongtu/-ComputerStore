<%@page import="dao.UserDAOImple"%>
<%@page import="dao.CartDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
    </head>

    <body>
        <%
            String username = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        username = cookie.getValue();
                    }
                }
            }
            if (username == null) {
        %>
        <header>
            <div id="top-header" style="background-color: #1f2c34">
                <div class="container" >
                    <ul class="header-links pull-left">
                        <li><a><i class="fa fa-phone"></i> 0365.391.481</a></li>
                        <li><a>&nbsp;<i class="fa fa-envelope-o"></i> tu.nt173432@sis.hust.edu.vn</a></li>
                        <li><a>&nbsp;<i class="fa fa-map-marker"></i> Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội</a></li>

                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="signup.jsp"><i class="fa fa-user-plus"></i> Đăng kí</a></li>
                        <li><a href="login.jsp">&nbsp;<i class="fa fa-user-o"></i> Đăng nhập</a></li>
                    </ul>
                </div>
            </div>

            <div id="header" style="background-color: #1f2c34"> 
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="index.jsp" class="logo">
                                    <img style="height: 150px" src="./img/logo1.jpg" alt="">
                                </a>                                
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="header-search">
                                <div class="header-search">
                                    <form action="SearchServlet" method="post">
                                        <select class="input-select" name="ma_loai_san_pham">
                                            <option value="0">Tất cả</option>
                                            <option value="1">Apple</option>
                                            <option value="2">Hp</option>
                                            <option value="3">Asus</option>
                                            <option value="4">Dell</option>
                                            <option value="5">Lenovo</option>
                                        </select>
                                        <input class="input" placeholder="Tên sản phẩm..." name="keyword">
                                        <button class="search-btn">Tìm kiếm</button>
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3 clearfix">
                            <div class="header-ctn"> 

                                <div class="dropdown">
                                    <a href="mycart.jsp">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                    </a>                                
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <nav id="navigation" style="background-color: #5d3a3a">
                <div class="container">
                    <div id="responsive-nav">
                        <ul class="main-nav nav navbar-nav">
                            <li><a style="color: white" href="index.jsp">TRANG CHỦ</a></li>
                            <li><a style="color: white" href="apple.jsp">APPLE</a></li>
                            <li><a style="color: white" href="hp.jsp">HP</a></li>
                            <li><a style="color: white" href="asus.jsp">ASUS</a></li>
                            <li><a style="color: white" href="dell.jsp">DELL</a></li>
                            <li><a style="color: white" href="lenovo.jsp">LENOVO</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
        } else {
        %>
        <header>
            <div id="top-header" style="background-color: #1f2c34">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a><i class="fa fa-phone"></i> 0365.391.481</a></li>
                        <li><a>|&nbsp;<i class="fa fa-envelope-o"></i> trongtrongtu169@gmail.com</a></li>
                        <li><a>|&nbsp;<i class="fa fa-map-marker"></i> Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="myaccount.jsp"><i class="fa fa-user-o"></i> <%=username%></a></li>
                        <li><a href="SignoutServlet">&nbsp;<i class="fa fa-sign-out"></i> Đăng xuất</a></li>
                    </ul>
                </div>
            </div>

            <div id="header" style="background-color: #1f2c34"> 
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="index.jsp" class="logo">
                                    <img style="height: 130px" src="./img/logo1.jpg" alt="">
                                </a>                                  
                            </div>
                        </div>

                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="SearchServlet" method="post">
                                    <select class="input-select" name="ma_loai_san_pham">
                                        <option value="0">Tất cả</option>
                                        <option value="1">Apple</option>
                                        <option value="2">Hp</option>
                                        <option value="3">Asus</option>
                                        <option value="4">Dell</option>
                                        <option value="5">Lenovo</option>
                                    </select>
                                    <input class="input" placeholder="Tên sản phẩm..." name="keyword">
                                    <button class="search-btn">Tìm kiếm</button>
                                </form>
                            </div>
                        </div>

                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <%

                                    CartDAOImple cartDAO = new CartDAOImple();
                                    UserDAOImple userDAO1 = new UserDAOImple();

                                    int id = userDAO1.getUser(username).getMa_nguoi_dung();


                                %>
                                <div>
                                    <a href="orderhistory.jsp">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Lịch sử mua hàng</span>

                                    </a>
                                </div>
                                <div class="dropdown">
                                    <a href="mycart.jsp">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>

                                    </a>                                
                                </div>                                                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <nav id="navigation" style="background-color: #5d3a3a">
                <div class="container">
                    <div id="responsive-nav">
                        <ul class="main-nav nav navbar-nav">
                            <li><a style="color: white" href="index.jsp">TRANG CHỦ</a></li>
                            <li><a style="color: white" href="apple.jsp">APPLE</a></li>
                            <li><a style="color: white" href="hp.jsp">HP</a></li>
                            <li><a style="color: white" href="asus.jsp">ASUS</a></li>
                            <li><a style="color: white" href="dell.jsp">DELL</a></li>
                            <li><a style="color: white" href="lenovo.jsp">LENOVO</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%            }
        %>

        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

