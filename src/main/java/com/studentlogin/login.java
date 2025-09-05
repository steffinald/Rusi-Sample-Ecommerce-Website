package com.studentlogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Random;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public login() {
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
		//doGet(request, response);
		String mobilenumber = request.getParameter("mobilenumber");
		String otp = String.valueOf(100000 + new Random().nextInt(900000));
		User user = new User(mobilenumber);
		
		LoginJDBC loginjd = new LoginJDBC();
		
        
		try {
			if(loginjd.exist(user)) {
				HttpSession session = request.getSession();
				session.setAttribute("mobilenumber", mobilenumber);
				session.setAttribute("otp", otp);
				response.sendRedirect("verifyotp.jsp");
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("mobilenumber", mobilenumber);
				session.setAttribute("otp", otp);
				response.sendRedirect("verifyotp.jsp");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
