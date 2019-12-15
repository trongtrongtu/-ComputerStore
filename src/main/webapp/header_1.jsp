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
            if(cookies !=null){
                for(Cookie cookie : cookies){
                    if(cookie.getName().equals("username")) 
                        username = cookie.getValue();
                }
            }
            if(username == null) {
        %>
        <header>
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a><i class="fa fa-phone"></i> 0986.866.866</a></li>
                        <li><a>|&nbsp;<i class="fa fa-envelope-o"></i>ducpb07101999@gmail.com</a></li>
                        <li><a>|&nbsp;<i class="fa fa-map-marker"></i>Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội</a></li>
                        <li><a href="feedback.jsp">|&nbsp;<i class="fa fa-comments-o"></i>Phản hồi</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="signup.jsp"><i class="fa fa-user-plus"></i>Đăng kí</a></li>
                        <li><a href="signin.jsp">|&nbsp;<i class="fa fa-user-o"></i>Đăng nhập</a></li>
                    </ul>
                </div>
            </div>
            
            <div id="header"> 
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="index.jsp" class="logo">
                                    <img src="./img/duc.png" alt="">
                                </a>                                
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="header-search">
                                <div class="header-search">
                                    <form action="SearchServlet" method="post">
                                        <select class="input-select" name="ma_loai_san_pham">
                                            <option value="0">Tất cả</option>
                                            <option value="1">Điện thoại</option>
                                            <option value="2">TV</option>
                                            <option value="3">Máy tính</option>
                                            <option value="4">Máy ảnh</option>
                                            <option value="5">Máy tính bảng</option>
                                        </select>
                                        <input class="input" placeholder="Tên sản phẩm..." name="keyword">
                                        <button class="search-btn">Tìm kiếm</button>
                                    </form>
                                </div>
                            </div>
                        </div>
            
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <div>
                                    <a href="signin.jsp">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Yêu thích</span>
                                    </a>
                                </div>
                                
                                <div class="dropdown">
                                    <a href="signin.jsp">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                    </a>                                
                                </div>                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <nav id="navigation">
                <div class="container">
                    <div id="responsive-nav">
                        <ul class="main-nav nav navbar-nav">
                            <li><a href="index.jsp">TRANG CHỦ</a></li>
                            <li><a href="smartphone.jsp">ĐIỆN THOẠI</a></li>
                            <li><a href="tv.jsp">TV</a></li>
                            <li><a href="laptop.jsp">MÁY TÍNH</a></li>
                            <li><a href="camera.jsp">MÁY ẢNH</a></li>
                            <li><a href="tablet.jsp">MÁY TÍNH BẢNG</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
            } else {
        %>
        <header>
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a><i class="fa fa-phone"></i> 0986.866.866</a></li>
                        <li><a>|&nbsp;<i class="fa fa-envelope-o"></i> ducpb07101999@gmail.com</a></li>
                        <li><a>|&nbsp;<i class="fa fa-map-marker"></i> Số 1, Đại Cồ Việt, Hai Bà Trưng, Hà Nội</a></li>
                        <li><a href="feedback.jsp">|&nbsp;<i class="fa fa-comments-o"></i>Phản hồi</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <li><a href="myaccount.jsp"><i class="fa fa-user-o"></i> <%=username%></a></li>
                        <li><a href="SignoutServlet">|&nbsp;<i class="fa fa-sign-out"></i> Đăng xuất</a></li>
                    </ul>
                </div>
            </div>
            
            <div id="header"> 
                <div class="container">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="header-logo">
                                <a href="index.jsp" class="logo">
                                    <img src="./img/duc.png" alt="">
                                </a>                                  
                            </div>
                        </div>
                        
                        <div class="col-md-6">
                            <div class="header-search">
                                <form action="SearchServlet" method="post">
                                    <select class="input-select" name="ma_loai_san_pham">
                                        <option value="0">Tất cả</option>
                                        <option value="1">Điện thoại</option>
                                        <option value="2">TV</option>
                                        <option value="3">Máy tính</option>
                                        <option value="4">Máy ảnh</option>
                                        <option value="5">Máy tính bảng</option>
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
                                    <a href="yourwishlist.jsp">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Yêu thích</span>
                                        
                                    </a>
                                </div>
                                <div class="dropdown">
                                    <a href="yourcart.jsp">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ hàng</span>
                                        
                                    </a>                                
                                </div>                                                             
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            
            <nav id="navigation">
                <div class="container">
                    <div id="responsive-nav">
                        <ul class="main-nav nav navbar-nav">
                            <li><a href="index.jsp">TRANG CHỦ</a></li>
                            <li><a href="smartphone.jsp">ĐIỆN THOẠI</a></li>
                            <li><a href="tv.jsp">TV</a></li>
                            <li><a href="laptop.jsp">MÁY TÍNH</a></li>
                            <li><a href="camera.jsp">MÁY ẢNH</a></li>
                            <li><a href="tablet.jsp">MÁY TÍNH BẢNG</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>
        <%
            }
        %>
        
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>

