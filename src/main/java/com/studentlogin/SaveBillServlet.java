package com.studentlogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Statement;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Map;

/**
 * Servlet implementation class SaveBillServlet
 */
@WebServlet("/SaveBillServlet")
public class SaveBillServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveBillServlet() {
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
		
		
		HttpSession session = request.getSession();
	    Map<String, Product> cart = (Map<String, Product>) session.getAttribute("cart");
	    String customerMobile = request.getParameter("mobile");

	    if (cart == null || cart.isEmpty() || customerMobile == null || customerMobile.isEmpty()) {
	        response.sendRedirect("bill.jsp?error=Cart or Mobile missing");
	        return;
	    }

	    double grandTotal = 0.0;

	    try {
	        Connection con = DBUtil.getConnection();
	        con.setAutoCommit(false); // transaction start

	        // Insert into bill_master
	        String billInsert = "INSERT INTO bills (mobile, total_amount) VALUES (?, ?)";
	        PreparedStatement pstBill = con.prepareStatement(billInsert, Statement.RETURN_GENERATED_KEYS);

	        // Calculate grand total
	        for (Product p : cart.values()) {
	            grandTotal += p.getPrice() * p.getQuantity();
	        }

	        pstBill.setString(1, customerMobile);
	        pstBill.setDouble(2, grandTotal);
	        pstBill.executeUpdate();

	        // Get the generated bill_id
	        ResultSet rs = pstBill.getGeneratedKeys();
	        int billId = 0;
	        if (rs.next()) {
	            billId = rs.getInt(1);
	        }

	        // Insert into bill_items
	        String itemInsert = "INSERT INTO bill_items (bill_id, product_id, product_name, quantity, price,discount,points) VALUES (?, ?, ?, ?, ?, ? ,?)";
	        PreparedStatement pstItem = con.prepareStatement(itemInsert);

	        for (Product p : cart.values()) {
	            pstItem.setInt(1, billId);
	            pstItem.setString(2, p.getBarcode());
	            pstItem.setString(3, p.getName());
	            pstItem.setInt(4, p.getQuantity());
	            pstItem.setDouble(5,p.getPrice() * p.getQuantity());
	            pstItem.setDouble(6,p.getDiscount() * p.getQuantity());
	            pstItem.setDouble(7, p.getPoints() * p.getQuantity());
	            pstItem.addBatch();
	        }

	        pstItem.executeBatch();
	        con.commit(); // transaction end

	        session.removeAttribute("cart"); // clear cart after bill saved
	        response.sendRedirect("bill.jsp?billId=" + billId+ "&status=success");

	    } catch (Exception e) {
	        e.printStackTrace();
	       
	        response.sendRedirect("bill.jsp?status=error");
	    }
		
	}

}
