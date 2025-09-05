package com.studentlogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class verifyotp
 */
@WebServlet("/verifyotp")
public class verifyotp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public verifyotp() {
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
		
		String userotp =  request.getParameter("userotp");
		
		HttpSession session = request.getSession(false);
		String orignalotp = (String) session.getAttribute("otp");
		String mobilenumber = (String) session.getAttribute("mobilenumber");
		
		User user = new User(mobilenumber);
		
		LoginJDBC loginjd = new LoginJDBC();
		
		if(userotp != null && userotp.equals(orignalotp)) {
			
			try {
				if(loginjd.exist(user)) {
					session.setAttribute("loggedin", true);
					session.setMaxInactiveInterval(-1);
					session.setAttribute("mobilenumber", mobilenumber);
					response.sendRedirect("profileload.jsp");
				}
				else if(loginjd.insert(user)){
					
					session.setAttribute("loggedin", true);
					session.setMaxInactiveInterval(-1);
					session.setAttribute("mobilenumber", mobilenumber);
					response.sendRedirect("profileload.jsp");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else{
			response.sendRedirect("verifyotp.jsp?message=Invalid OTP");
		}
		
	}

}
