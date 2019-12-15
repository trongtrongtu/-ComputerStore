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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Product Detail</title>
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
                ten_ma_loai_san_pham = "Apple";
            }
            if (productDAO.getProduct(Integer.parseInt(ma_san_pham)).getMa_loai_san_pham() == 2) {
                ten_ma_loai_san_pham = "Hp";
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
                                    <img style="height: 458px; width: 458px" src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                             .getHinh_anh_1()%>" alt="">
                            </div>
                            <div class="product-preview">
                                <img style="height: 458px; width: 458px" src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                         .getHinh_anh_2()%>" alt="">
                            </div>
                            <div class="product-preview">
                                <img style="height: 458px; width: 458px" src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                         .getHinh_anh_3()%>" alt="">
                            </div>
                            

                        </div>   
                    </div>    
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                 <img style="height: 153px; width: 153px" src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_1()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img style="height: 153px; width: 153px" src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_2()%>" alt="">
                            </div>
                            <div class="product-preview">
                                 <img style="height: 153px; width: 153px" src="image/<%=ten_ma_loai_san_pham%>/<%=productDAO.getProduct(Integer.parseInt(ma_san_pham))
                                        .getHinh_anh_3()%>" alt="">
                            </div>
                            
                            
                        </div>
                    </div>


                    <div class="col-md-5">
                        
                        <div class="product-details">
                            <h2 class="product-name"><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getTen_san_pham()%></h2>
                            
                            <div>
                                <h3 class="product-price"><%=formatter.format(productDAO.getProduct(Integer.parseInt(ma_san_pham)).getGia_ban())%> VNĐ</h3>
                                
                            </div>          
                                <h5>Chọn số lượng:</h5>
                            <form  action="CartServlet" method="post">
                                <input type="hidden" value="<%=id%>" name="ma_nguoi_dung"/>
                                <input type="hidden" value="<%=ma_san_pham%>" name="ma_san_pham" />
                                <input type="hidden" value="<%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getTen_san_pham()%>" name="ten_san_pham" />
                                <div class="form-group">
                                    <input type="number" min="1" value="1" class="input" name="so_luong" />
                                </div>                            
                                <input type="hidden" value="<%=(int) productDAO.getProduct(Integer.parseInt(ma_san_pham)).getGia_ban()%>" name="gia_ban" />
                                <div class="form-group">
                                    <button style="background-color: #d10a00; border: solid; border-color:#d10a00; color: white" class="primary-btn order-submit">MUA NGAY</button>
                                    <button style="color: #d10a00; border: solid; border-color:#d10a00; background-color: white; border-width: 1px" class="primary-btn order-submit">THÊM VÀO GIỎ HÀNG</button>
                                </div>
                            </form>
                            
                            <ul class="product-links">
                                <li>Chia sẻ:</li>
                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                <li><a href="#"><i class="fa fa-envelope"></i></a></li>
                            </ul>
                        </div>
                        
                                                
                    </div>

                    <div class="col-md-12">
                        <div id="product-tab">
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Mô tả</a></li>
                                <li><a data-toggle="tab" href="#tab2">Chi tiết</a></li>
                            </ul>

                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12" style="width: 700px">
                                            <p><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getMo_ta()%></p>
                                        </div>
                                    </div>
                                </div>

                                <div id="tab2" class="tab-pane fade in">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p><%=productDAO.getProduct(Integer.parseInt(ma_san_pham)).getChi_tiet_san_pham()%></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>
