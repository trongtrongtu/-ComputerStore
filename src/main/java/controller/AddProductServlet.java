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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Product;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/AddProductServlet"})
@MultipartConfig
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request,
        HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");    
        String ten_san_pham = request.getParameter("ten_san_pham");
        String loai_san_pham = request.getParameter("loai_san_pham");
        String chi_tiet_san_pham = request.getParameter("chi_tiet_san_pham");
        String mo_ta = request.getParameter("mo_ta");
        Part[] part = new Part[3];
        part[0] = request.getPart("hinh_anh_1");
        part[1] = request.getPart("hinh_anh_2");
        part[2] = request.getPart("hinh_anh_3");
        String[] filename = new String[3];
        filename[0] = part[0].getSubmittedFileName();
        filename[1] = part[1].getSubmittedFileName();
        filename[2] = part[2].getSubmittedFileName();
        String error = "";
        String message = "";
        String url = "";
        if(ten_san_pham.equals("") 
                || loai_san_pham.equals("") 
                || request.getParameter("gia_ban").equals("")
                || filename[0].equals("")
                || filename[1].equals("")
                || filename[2].equals("")
            ){
            error += "Hãy nhập đầy đủ thông tin!";
        } 
        if(error.length() > 0){
            request.setAttribute("error", error);
        }
        else{
            int ma_loai_san_pham = 0;       
            switch (loai_san_pham) {
                case "Apple":
                    ma_loai_san_pham = 1;
                    break;
                case "Hp":
                    ma_loai_san_pham = 2;
                    break;
                case "Asus":
                    ma_loai_san_pham = 3;
                    break;
                case "Dell":
                    ma_loai_san_pham = 4;
                    break;
                case "Lenovo":
                    ma_loai_san_pham = 5;
                    break;
            }                 
                        
            Product p;
            p = new Product(ma_loai_san_pham, ten_san_pham, filename[0], filename[1], filename[2], Integer.parseInt(request.getParameter("gia_ban")), chi_tiet_san_pham, mo_ta);
            ProductDAOImple productDAO = new ProductDAOImple();
            productDAO.addProduct(p);
            message += "Thêm sản phẩm thành công!";
            if(message.length() > 0) {
                request.setAttribute("message", message);
            }         
        } 
        url = "/addproductadmin.jsp";
        RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
        rd.forward(request, response);
    }
}
