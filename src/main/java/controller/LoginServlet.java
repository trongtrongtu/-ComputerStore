/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAOImple;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Tu Nguyen
 */
@WebServlet(urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private final UserDAOImple userDAO = new UserDAOImple();

    public LoginServlet() {
        super();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher dispatcher //
                = this.getServletContext().getRequestDispatcher("/login.jsp");

        dispatcher.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String error = "";
        if (username.equals("") || password.equals("")) {
            error += "Email/Password is required!";
        } else {
            if (userDAO.loginUser(username, password) == false) {
                error += "Email/Password is wrong!";
            }
        }

        if (error.length() > 0) {
            request.setAttribute("error", error);
        }

        String url = "/login.jsp";
        try {
            if (username.equals("tu") && password.equals("trongtu")) {
                Cookie loginCookie = new Cookie("username", username);
                //setting cookie to expiry in 60 mins
                loginCookie.setMaxAge(60 * 60);
                response.addCookie(loginCookie);
                response.sendRedirect(request.getContextPath() + "/admin.jsp");
            } else if (error.length() == 0) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                if (userDAO.loginUser(username, password)) {
                    Cookie loginCookie = new Cookie("username", username);
                    //setting cookie to expiry in 60 mins
                    loginCookie.setMaxAge(60 * 60);
                    response.addCookie(loginCookie);
                    response.sendRedirect(request.getContextPath() + "/index.jsp");
                }
            } else {
                url = "/login.jsp";
                RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
                rd.forward(request, response);
            }
        } catch (IOException | ServletException e) {
            response.sendRedirect("/login.jsp");
        }
    }

}
