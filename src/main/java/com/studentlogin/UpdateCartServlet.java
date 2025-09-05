package com.studentlogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.Map;

/**
 * Servlet implementation class UpdateCartServlet
 */
@WebServlet("/UpdateCartServlet")
public class UpdateCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		HttpSession session = request.getSession();
        String code = request.getParameter("code");
        String action = request.getParameter("action");

        Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");

        String status = "error";
        if (cart != null && cart.containsKey(code)) {
            Product p = cart.get(code);
            if ("increase".equals(action)) {
                p.setQuantity(p.getQuantity() + 1);
                status = "success";
            } else if ("decrease".equals(action) && p.getQuantity() > 1) {
                p.setQuantity(p.getQuantity() - 1);
                status = "success";
            }
        }
        
        
        response.sendRedirect("bill.jsp?status1="+status);
    }
	}


