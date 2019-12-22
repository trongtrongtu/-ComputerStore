<%-- 
    Document   : searchcart
    Created on : Dec 22, 2019, 4:13:08 PM
    Author     : Tu Nguyen
--%>

<%@page import="model.CartAdmin"%>
<%@page import="dao.CartDAOImple"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>Kết quả tìm kiếm đơn hàng</title>
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
            String keyword_cart = (String) session.getAttribute("keyword_cart");
        %>
        <jsp:include page="header.jsp"></jsp:include> 
            <div class="section">
                <div class="container" style="width: 100%">
                    <div class="row">
                        <div class="col-md-3">
                        <jsp:include page="taskadmin.jsp"></jsp:include>
                        </div>
                        <div class="col-md-9">                       
                            <div class="col-md-9" style="width: 100%">
                                <h3 class="section-title">KẾT QUẢ TÌM KIẾM CHO: <%=keyword_cart%></h3>
                            <div class="col-md-8">
                                <div class="header-search">
                                    <div class="header-search">
                                        <form action="SearchCartServlet" method="post">
                                            <input class="input" placeholder="Tên sản phẩm..." name="keyword_cart">
                                            <button class="search-btn">Tìm kiếm</button>
                                        </form>
                                    </div>
                                </div>                           
                            </div>
                            <table class="table">                               
                                <%
                                    CartDAOImple cartDAO = new CartDAOImple();
                                    List<CartAdmin> list = cartDAO.searchListCartAdmin(keyword_cart);
                                    if (list.size() == 0) {
                                %>
                                <br>
                                <br>
                                <div><h4>Không tìm thấy!</h4></div>
                                <%  } else { %>
                                <thead>
                                    <tr>
                                        <th class="text-center">STT</th>
                                        <th class="text-center">Tên sản phẩm</th>
                                        <th class="text-center">Số lượng</th>
                                        <th class="text-center">Tổng tiền</th>
                                        <th class="text-center">Ngày mua</th>
                                        <th class="text-center">Trạng thái</th>
                                    </tr>
                                </thead>
                                <%  }
                                    int count = 1;
                                    for (int i = 0; i < list.size(); i++) {
                                        CartAdmin c = list.get(i);
                                %>        
                                <tbody class="text-center">
                                    <tr>
                                        <td><%=count%></td>     
                                        <td><a href="cartadmin.jsp?ma_loai_san_pham=<%=c.getMa_loai_san_pham()%>&ma_san_pham=<%=c.getMa_san_pham()%>&id_order=<%=c.getId_order()%>"><%=c.getTen_san_pham()%></a></td>
                                        <td><%=c.getSo_luong()%></td> 
                                        <td><%=(int) c.getThanh_tien()%> VNĐ</td>
                                        <td><%=c.getNgay_mua()%></td>
                                        <td><%=c.getTrang_thai()%></td>
                                    </tr>
                                </tbody>
                                <%
                                        count++;
                                    }
                                %>                                                    
                            </table>
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

