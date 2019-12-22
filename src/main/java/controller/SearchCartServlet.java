/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/SearchCartServlet"})
public class SearchCartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;     
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("utf-8");
        String keyword_cart = request.getParameter("keyword_cart");
        HttpSession session = request.getSession();
        session.setAttribute("keyword_cart", keyword_cart);
        response.sendRedirect("searchcart.jsp");
    }

}
