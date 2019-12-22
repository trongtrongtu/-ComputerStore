/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAOImple;
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
@WebServlet(urlPatterns = {"/CartAdminServlet"})
public class CartAdminServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8"); 
        String message = "";
        String url = "";
        int id_order = Integer.parseInt(request.getParameter("id_order"));
        CartDAOImple cartDAO = new CartDAOImple();     
        int ma_san_pham = Integer.parseInt(request.getParameter("ma_san_pham"));
        int ma_loai_san_pham = Integer.parseInt(request.getParameter("ma_loai_san_pham"));     
        String trang_thai = request.getParameter("trang_thai"); 
        if(request.getParameter("update") != null) {                                          
            cartDAO.editCartAdmin(id_order, trang_thai);  
            message += "Cập nhật thông tin đơn hàng thành công!";
            if(message.length() > 0){
                request.setAttribute("message", message);
            }
            url = "/cartadmin.jsp?ma_loai_san_pham=" + ma_loai_san_pham + "&ma_san_pham=" + ma_san_pham + "&id_order=" + id_order;
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);          
        } 
    }

}
