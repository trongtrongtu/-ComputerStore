/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.ProductDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Product;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/Update_DeleteServlet"})
public class Update_DeleteServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8"); 
        ProductDAOImple productDAO = new ProductDAOImple();
        Product temp = productDAO.getProduct(Integer.parseInt(request.getParameter("ma_san_pham")));
        String message = "";
        String url = "";    
        if(request.getParameter("update") != null) {
            int gia_ban = Integer.parseInt(request.getParameter("gia_ban"));
            String ten_san_pham = request.getParameter("ten_san_pham");
            String mo_ta = request.getParameter("mo_ta");
            String chi_tiet_san_pham = request.getParameter("chi_tiet_san_pham");
            
            Product p = new Product(temp.getMa_san_pham(), temp.getMa_loai_san_pham(), ten_san_pham, temp.getHinh_anh_1(), temp.getHinh_anh_2(), temp.getHinh_anh_3(), gia_ban, chi_tiet_san_pham, mo_ta);        
            productDAO.editProduct(p);
            message += "Cập nhật thông tin sản phẩm thành công!";
            if(message.length() > 0){
                request.setAttribute("message", message);
            }
            url = "/productadmin.jsp?ma_san_pham=" + request.getParameter("ma_san_pham");
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
        
        else if(request.getParameter("delete") != null) {
            productDAO.removeProduct(Integer.parseInt(request.getParameter("ma_san_pham")));     
            message += "Xoá sản phẩm thành công!";
            if(message.length() > 0){
                request.setAttribute("message", message);
            }
            url = "/listproductadmin.jsp?ma_loai_san_pham=" + temp.getMa_loai_san_pham() + "&tuy_chon=0";
            RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

}
