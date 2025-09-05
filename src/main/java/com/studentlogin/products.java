package com.studentlogin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

/**
 * Servlet implementation class productservlet
 * @param <Product>
 */
@WebServlet("/product-list")
public class products extends HttpServlet {
	private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public products() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
System.out.println("doGet() called...");
		
		String section = request.getParameter("section");
	    System.out.println("Section received: " + section);
		
		System.out.println("getAllProducts() called");
				
				LoginJDBC loginjd = new LoginJDBC();
						try {
					List<Product> products =  loginjd.getAllProducts();
					
					if (products == null || products.isEmpty()) {
						System.out.println("hello");
			            request.setAttribute("message", "No products found.");
			          
			            return;
			        }else {
					System.out.println(products);
					request.setAttribute("section", section);
					request.setAttribute("propro",products);
					request.getRequestDispatcher("products.jsp").forward(request, response);
     }
				} catch (ClassNotFoundException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
    	doGet(request, response);
		
						
		
	}
    }

