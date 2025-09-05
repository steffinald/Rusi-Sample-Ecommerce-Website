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
 * Servlet implementation class profile
 */
@WebServlet("/profile")
public class profile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public profile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		
		System.out.println("go it profile");
		HttpSession session = request.getSession();
		String mobilenumber = (String) session.getAttribute("mobilenumber");
		session.setAttribute("mobilenumber", mobilenumber);
		
		LoginJDBC loginjd = new LoginJDBC();
		try {
			Profileclass profile = loginjd.getprofilebymobile(mobilenumber);
			
			if(profile != null) {
				request.setAttribute("profile", profile);
				
			    request.getRequestDispatcher("profile.jsp").forward(request, response);
			} else {
			    response.sendRedirect("profile.jsp");
			}
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @param mobile 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		System.out.println("go it profile");
		HttpSession session = request.getSession();
		String mobilenumber = (String) session.getAttribute("mobilenumber");
		session.setAttribute("mobilenumber", mobilenumber);
		
		String name =  request.getParameter("name");
		String email =  request.getParameter("email");
		String address =  request.getParameter("address");
		
		LoginJDBC loginjd = new LoginJDBC();
		
		try {
			if(loginjd.updateprofile(name,email,address,mobilenumber)) {
				response.sendRedirect("profileload.jsp");
				} 
			else {
				response.sendRedirect("load.jsp");
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

}
