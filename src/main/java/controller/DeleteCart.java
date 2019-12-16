/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.CartDAOImple;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/DeleteCart"})
public class DeleteCart extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        int ma_san_pham = Integer.parseInt(request.getParameter("ma_san_pham"));
        CartDAOImple cartDAO = new CartDAOImple();
        cartDAO.removeCart(ma_san_pham);
        response.sendRedirect("mycart.jsp");
    }
}
