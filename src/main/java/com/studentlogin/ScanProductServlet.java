package com.studentlogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

/**
 * Servlet implementation class ScanProductServlet
 */
@WebServlet("/ScanProductServlet")
public class ScanProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ScanProductServlet() {
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
		
		String barcode = request.getParameter("barcode");
        HttpSession session = request.getSession();
        
        LoginJDBC loginjd = new LoginJDBC();

        // Get product by barcode
        Product p = null;
		try {
			p = loginjd.getProductdetialbybarcode(barcode);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} // Your existing method
		  String status = "error";
        if (p != null) {
            // Get or create the scanned product map from session
            Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");
            if (cart == null) {
                cart = new HashMap<>();
            }
          

            if (cart.containsKey(barcode)) {
                // Already scanned, increase quantity
                Product existing = cart.get(barcode);
                existing.setQuantity(existing.getQuantity() + 1);
                status = "success";
            } else {
                // New product, set quantity = 1
                p.setQuantity(1);
                cart.put(barcode, p);
                status = "success";
            }
            
            session.setAttribute("cart", cart);
        }
       

        response.sendRedirect("bill.jsp?status2="+status); // Display page
        
    }

	

}
