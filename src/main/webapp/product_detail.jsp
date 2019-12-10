<%-- 
    Document   : product_detail
    Created on : Dec 9, 2019, 12:59:25 AM
    Author     : Tu Nguyen
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="dao.UserDAOImple"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="dao.ProductDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String ma_san_pham = "";
            String ten_ma_loai_san_pham = "";
            String username = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("username")) {
                        username = cookie.getValue();
                    }
                }
            }
            UserDAOImple userDAO = new UserDAOImple();
            int id = userDAO.getUser(username).getMa_nguoi_dung();

            if (request.getParameter("ma_san_pham") != null) {
                ma_san_pham = request.getParameter("ma_san_pham");
            }
            ProductDAOImple productDAO = new ProductDAOImple();
            NumberFormat nf = NumberFormat.getInstance();
            nf.setMinimumFractionDigits(0);
            if (productDAO.getProduct(Integer.parseInt(ma_san_pham)).getMa_loai_san_pham() == 1) {
                ten_ma_loai_san_pham = "MacBook";
            }
            if (productDAO.getProduct(Integer.parseInt(ma_san_pham)).getMa_loai_san_pham() == 2) {
                ten_ma_loai_san_pham = "HP";
            }
            if (productDAO.getProduct(Integer.parseInt(ma_san_pham)).getMa_loai_san_pham() == 3) {
                ten_ma_loai_san_pham = "Asus";
            }
            if (productDAO.getProduct(Integer.parseInt(ma_san_pham)).getMa_loai_san_pham() == 4) {
                ten_ma_loai_san_pham = "Dell";
            }
            if (productDAO.getProduct(Integer.parseInt(ma_san_pham)).getMa_loai_san_pham() == 5) {
                ten_ma_loai_san_pham = "Lenovo";
            }
            DecimalFormat formatter = new DecimalFormat("###,###,###");
        %>

        <jsp:include page="header.jsp"></jsp:include>
            <div class="section">
                <div class="container">
                    <div class="row">
                        <div class="col-md-5 col-md-push-2">
                            <div id="product-main-img">
                                <div class="product-preview">
                                     <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_1()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_2()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_3()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_4()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_5()%>" alt="">
                            </div>
                        </div>   
                    </div>                    
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_1()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_2()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_3()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_4()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_5()%>" alt="">
                            </div>
                        </div>
                    </div>

                    <div class="col-md-5">
                        <% if (username != null) {%>
                        <div class="product-details">
                            <h2 class="product-name"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getTen_san_pham()%></h2>
                            <div>      
                                <div class="product-rating">
                                    <p>Đánh giá: </p>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star"></i>
                                    <i class="fa fa-star-o"></i>
                                </div>
                            </div>
                            <div>
                                <h3 class="product-price"><%=formatter.format(productDAO.getProduct(Integer.parseInt(ma_san_pham)).getGia_ban())%> VNĐ</h3>
                                <p>Số lượng sản phẩm trong kho: 1000</p>
                            </div>                          
                            <form  action="CartServlet" method="post">
                                <input type="hidden" value="<%=id%>" name="ma_nguoi_dung"/>
                                <input type="hidden" value="<%=ma_san_pham%>" name="ma_san_pham" />
                                <input type="hidden" value="<%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getTen_san_pham()%>" name="ten_san_pham" />
                                <div class="form-group">
                                    <input type="number" min="1" value="1" class="input" name="so_luong" />
                                </div>                            
                                <input type="hidden" value="<%=(int) productDAO.getProduct(Integer.parseInt(ma_san_pham)).getGia_ban()%>" name="gia_ban" />
                                <div class="form-group">
                                    <button class="primary-btn order-submit">ĐẶT HÀNG</button>
                                </div>
                            </form>
                            <ul class="product-btns">
                                <li><a href="#"><i class="fa fa-heart-o"></i> Yêu thích</a></li>
                            </ul>
                            <ul class="product-links">
                                <li>Chia sẻ:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                        <%
                        } else { %>
                        <div class="alert alert-info">Vui lòng <a href="signin.jsp">đăng nhập</a> để tiếp tục...</div>
                        <% }%>                        
                    </div>

                    <div class="col-md-12">
                        <div id="product-tab">
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Mô tả</a></li>
                                <li><a data-toggle="tab" href="#tab2">Chi tiết</a></li>
                                <li><a data-toggle="tab" href="#tab3">Đánh giá</a></li>
                            </ul>

                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </div>
                                    </div>
                                </div>

                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>
                                        </div>
                                    </div>
                                </div>

                                <div id="tab3" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div id="rating">
                                                <div class="rating-avg">
                                                    <span>4.5</span>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                </div>
                                                <ul class="rating">
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 80%;"></div>
                                                        </div>
                                                        <span class="sum">3</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div style="width: 60%;"></div>
                                                        </div>
                                                        <span class="sum">2</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                    <li>
                                                        <div class="rating-stars">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                            <i class="fa fa-star-o"></i>
                                                        </div>
                                                        <div class="rating-progress">
                                                            <div></div>
                                                        </div>
                                                        <span class="sum">0</span>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="col-md-6">
                                            <div id="reviews">
                                                <ul class="reviews">
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                    <li>
                                                        <div class="review-heading">
                                                            <h5 class="name">John</h5>
                                                            <p class="date">27 DEC 2018, 8:0 PM</p>
                                                            <div class="review-rating">
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star"></i>
                                                                <i class="fa fa-star-o empty"></i>
                                                            </div>
                                                        </div>
                                                        <div class="review-body">
                                                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                        </div>
                                                    </li>
                                                </ul>
                                                <ul class="reviews-pagination">
                                                    <li class="active">1</li>
                                                    <li><a href="#">2</a></li>
                                                    <li><a href="#">3</a></li>
                                                    <li><a href="#">4</a></li>
                                                    <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                                </ul>
                                            </div>
                                        </div>

                                        <div class="col-md-3">
                                            <div id="review-form">
                                                <form class="review-form" action="ReviewServlet" method="post">
                                                    <input class="input" type="text" placeholder="Your Name" name="name">
                                                    <input class="input" type="email" placeholder="Your Email" name="email">
                                                    <textarea class="input" placeholder="Your Review" name="reviewtext"></textarea>
                                                    <div class="input-rating">
                                                        <span>Your Rating: </span>
                                                        <div class="stars">
                                                            <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                            <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                            <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                            <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                            <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                        </div>
                                                    </div>
                                                    <button class="primary-btn">Submit</button>
                                                </form>
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
    </body>
</html>
