<%-- 
    Document   : search
    Created on : Dec 21, 2019, 5:41:16 PM
    Author     : Tu Nguyen
--%>

<%@page import="java.util.List"%>
<%@page import="model.User"%>
<%@page import="dao.UserDAOImple"%>
<%@page import="model.Product"%>
<%@page import="dao.ProductDAOImple"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
         <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Tìm kiếm</title>
        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>
        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>
        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>
        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <!-- Custom stlylesheet -->
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
            UserDAOImple userDAO = new UserDAOImple();
            User u = userDAO.getUser(username);
            int id = u.getMa_nguoi_dung();
            String keyword = (String)session.getAttribute("keyword");
            String temp = (String)session.getAttribute("ma_loai_san_pham");
            int ma_loai_san_pham = Integer.parseInt(temp);
            String ten_loai_san_pham = "";

            if(ma_loai_san_pham == 0) ten_loai_san_pham = "Tất cả";
            else if(ma_loai_san_pham == 1) ten_loai_san_pham = "Apple";
            else if(ma_loai_san_pham == 2) ten_loai_san_pham = "Hp";
            else if(ma_loai_san_pham == 3) ten_loai_san_pham = "Asus";
            else if(ma_loai_san_pham == 4) ten_loai_san_pham = "Dell";
            else if(ma_loai_san_pham == 5) ten_loai_san_pham = "Lenovo";
            
        %>
        <jsp:include page="header.jsp"></jsp:include> 
        <div class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">                      
                        <div class="col-md-12">
                            <div class="section-title">
                                <h3 class="title">KẾT QUẢ TÌM KIẾM CHO: <%=ten_loai_san_pham%> - <%=keyword%></h3>                                
                            </div>
                            <div class="row">
                                <div class="products-tabs">
                                    <div id="tab1" class="tab-pane active">
                                        <%
                                            ProductDAOImple productDAO = new ProductDAOImple();   
                                            List<Product> list = productDAO.searchList(ma_loai_san_pham, keyword);
                                            if(list.size() == 0) { 
                                        %>
                                            <h4>Không tìm thấy!</h4>   
                                        <% } else { %>
                                        <div class="products-slick" data-nav="#slick-nav-1">
                                        <%
                                            for(int i=0; i < list.size(); i++) {
                                                Product p = list.get(i);
                                        %>
                                        
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="image/<%=p.getHinh_anh_1()%>" alt="" >
                                                </div>                                         
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="product_detail.jsp?ma_san_pham=<%=p.getMa_san_pham()%>"><%=p.getTen_san_pham()%></a></h3>
                                                    <h4 class="product-price"><%=(int)p.getGia_ban()%> VNĐ</h4>                                                 
                                                    <div class="row" style="display: inline-flex">
                                                        <form style="width: 60px" action="AddCart" method="post">
                                                            <input type="hidden" value="<%=id%>" name="ma_nguoi_dung"/>
                                                            <input type="hidden" value="<%=username%>" name="username"/>
                                                            <input type="hidden" value="<%=p.getMa_san_pham()%>" name="ma_san_pham" />
                                                            <input type="hidden" value="<%=p.getTen_san_pham()%>" name="ten_san_pham" />
                                                            <input type="hidden" value="1" name="so_luong" />                                   
                                                            <input type="hidden" value="<%=u.getSdt()%>" name="sdt" />
                                                            <input type="hidden" value="<%=u.getDia_chi()%>" name="dia_chi" />
                                                            <input type="hidden" value="<%=(int)p.getGia_ban()%>" name="gia_ban" />
                                                            <div class="product-btns">
                                                                <button class="add-to-wishlist"><i class="fa fa-shopping-cart"></i><span class="tooltipp">Thêm vào giỏ</span></button>                                                                                                           
                                                            </div>
                                                        </form> 
                                                        <form style="width: 60px">
                                                            <div class="product-btns">
                                                                <button class="add-to-compare" onclick="window.open('https://www.google.co.in/#q=<%=p.getTen_san_pham()%>', '_blank')"><i class="fa fa-exchange"></i><span class="tooltipp">So sánh</span></button>           
                                                            </div>
                                                        </form>
                                                    </div>                                           
                                                </div>                                                                                   
                                            </div>
                                            <%
                                                    }
                                                }
                                            %>                                           
                                        </div>
                                    </div>                                   
                                </div>                                  
                            </div> 
                            <div id="slick-nav-1" class="products-slick-nav"></div>                  
                        </div>                                          
                    </div>                                
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"></jsp:include>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
    </body>
</html>


