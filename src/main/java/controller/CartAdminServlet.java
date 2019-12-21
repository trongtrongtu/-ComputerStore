/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAOImple;
import dao.ProductDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(name = "CartAdminServlet", urlPatterns = {"/CartAdminServlet"})
public class CartAdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8"); 
        String message = "";
        String url = "";
        int id_cart = Integer.parseInt(request.getParameter("id_cart"));
        CartDAOImple cartDAO = new CartDAOImple();     
        ProductDAOImple productDAO = new ProductDAOImple();
        int ma_loai_san_pham = productDAO.getProduct(cartDAO.getCart(id_cart).getMa_san_pham()).getMa_loai_san_pham();     
        String trang_thai = request.getParameter("trang_thai"); 
        if(request.getParameter("update") != null) {                                          
            cartDAO.editCartAdmin(id_cart, trang_thai);  
            message += "Cập nhật thông tin đơn hàng thành công!";
            if(message.length() > 0){
                request.setAttribute("message", message);
            }
            url = "/cartadmin.jsp?ma_loai_san_pham=" + ma_loai_san_pham + "&ma_san_pham=" + request.getParameter("ma_san_pham");
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);           
        } 
        if(request.getParameter("delete") != null) {             
            cartDAO.removeCart(id_cart);
            response.sendRedirect("listcartadmin.jsp?ma_loai_san_pham=12345&tuy_chon=0");
        }
    }

}
