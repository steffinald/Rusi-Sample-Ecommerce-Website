package com.studentlogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

/**
 * Servlet implementation class authfilter
 */

@WebFilter("/*")  // This applies filter to all pages (you can customize)
public class authfilter implements Filter {

    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

        String uri = req.getRequestURI();
        HttpSession session = req.getSession(false);
        Boolean isLoggedIn = (session != null) && (session.getAttribute("loggedin") != null);

        // Pages that don't need authentication
        boolean isPublic = uri.endsWith("about.jsp") ||
                           uri.endsWith("admin.jsp") ||
                           uri.endsWith("adminlogin.jsp") ||
                           uri.endsWith("bill.jsp") ||
                           uri.endsWith("contact.jsp") ||
                           uri.endsWith("index.jsp") ||
                           uri.endsWith("load.jsp") ||
                           uri.endsWith("login.jsp") ||
                           uri.endsWith("offers.jsp") ||
                           uri.endsWith("productdetial.jsp") ||
                           uri.endsWith("products.jsp") ||
                           uri.endsWith("verifyotp.jsp") ||
                           uri.endsWith("admin") ||
                           uri.endsWith("adminlogin") ||
                           uri.endsWith("login") ||
                           uri.endsWith("LoginJDBC") ||
                           uri.endsWith("Product") ||
                           uri.endsWith("productDetials") ||
                           uri.endsWith("products") ||
                           uri.endsWith("product-list")||
                           uri.endsWith("product-detials")||
                           uri.endsWith("User") ||
                           uri.endsWith("RemoveFromCartServlet") ||
                           uri.endsWith("ScanProductServlet") ||
                           uri.endsWith("DButil") ||
                           uri.endsWith("UpdateCartServlet") ||
                           uri.endsWith("SaveBillServlet") ||
                           uri.endsWith("verifyotp") ||
                           uri.endsWith(".css") ||
                           uri.endsWith(".js") ||
                           uri.contains("images");

        if (isLoggedIn || isPublic) {
            chain.doFilter(request, response); // Continue
        } else {
            res.sendRedirect("login.jsp"); // Block and redirect
        }
    }

    public void init(FilterConfig fConfig) {}
    public void destroy() {}
}
