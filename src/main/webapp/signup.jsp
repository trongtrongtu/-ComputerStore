<%-- 
    Document   : signup
    Created on : Dec 3, 2019, 3:32:00 AM
    Author     : Tu Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng Ký</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }
	%>
        <div id="signup" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 center-block">
                        <form action="SignupServlet" method="post" class="billing-details" >
                            <h3 class="section-title">ĐĂNG KÝ</h3>
                            <div style="color: red"><%=error%></div> 
                            <div class="form-group">
                                <input class="input" type="text" name="username" placeholder="Tên đăng nhập">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" name="email" placeholder="Email">
                            </div>
                            <div class="form-group">
                                <input class="input" type="text" value=""
                                    placeholder="Giới tính"
                                    list="exampleList" onfocus="this.value = '';"                                    
                                    name="sex"> 
                                <datalist id="exampleList">
                                    <option value="Nam">
                                    <option value="Nữ">
                                </datalist>
                            </div>
                            <div class="form-group">
                                <input class="input" type="date" name="date" placeholder="Ngày sinh">
                            </div>
                            <div class="form-group">
                                    <input class="input" type="text" name="phone" placeholder="Số điện thoại">
                            </div>
                            <div class="form-group">
                                    <input class="input" type="text" name="address" placeholder="Địa chỉ">
                            </div>
                            <div class="form-group">
                                    <input class="input" type="password" name="password" placeholder="Mật khẩu">
                            </div>          
                            <div class="form-group">
                                    <input class="input" type="password" name="repassword" placeholder="Xác nhận mật khẩu">
                            </div>
                            <div class="form-group">
                                Đồng ý với các <a href="https://www.facebook.com">Chính sách và Điều khoản của chúng tôi!</a>
                            </div>
                            <div class="form-group">
                                <button type="submit" value="signin" class="primary-btn order-submit">Đăng kí</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
