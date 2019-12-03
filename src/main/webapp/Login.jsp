<%-- 
    Document   : Login
    Created on : Nov 19, 2019, 11:30:42 PM
    Author     : Tu Nguyen
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đăng nhập</title>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%
            String error = "";
            if (request.getAttribute("error") != null) {
                error = (String) request.getAttribute("error");
            }
        %>
        <%
            String messager = "";
            if (request.getAttribute("messager") != null) {
                messager = (String) request.getAttribute("messager");
            }
        %>
        <div id="login" class="section">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 center-block">
                        <form action="LoginServlet" method="post" class="billing-details">
                            <h3 class="section-title">ĐĂNG NHẬP</h3>

                            <div style="color: red"><%=error%></div>  
                            <div style="color: blue"><%=messager%></div>

                            <div class="form-group">                             
                                <input type="text" name="username" placeholder="Tên đăng nhập" class="input" />
                            </div>                 
                            <div class="form-group">                 
                                <input type="password" name="password" placeholder="Mật khẩu" class="input" />
                            </div>
                            <h5><a href="signup.jsp">Đăng kí?</a></h5>
                            <h5><a href="resetpassword.jsp">Quên mật khẩu?</a></h5>
                            <button type="submit" value="Submit" class="primary-btn order-submit">ĐĂNG NHẬP</button>
                        </form>

                    </div>

                </div>
            </div>
        </div>
    </body>
</html>
