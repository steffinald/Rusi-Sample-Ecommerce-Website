package com.studentlogin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.SQLException;

/**
 * Servlet implementation class admin
 */
@WebServlet("/admin")
@MultipartConfig
public class admin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public admin() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		
		String userId = request.getParameter("userId");
		int hiddenvalue = 0;
		if (userId != null && !userId.isEmpty()) {
			hiddenvalue = Integer.parseInt(userId);
		} else {
		    // Default or error handling
		    System.out.println("Parameter 'sprice' is missing or empty");
		}
		
		switch (hiddenvalue) {
		case 1: {
			String barcode = request.getParameter("barcode");
			String productname = request.getParameter("productname");
			String sprice = request.getParameter("price");
			int price = 0;
			if (sprice != null && !sprice.isEmpty()) {
				price = Integer.parseInt(sprice);
			} else {
			    // Default or error handling
			    System.out.println("Parameter 'sprice' is missing or empty");
			}
			String sdiscount = request.getParameter("discount");
			int discount = 0;
			if (sdiscount != null && !sdiscount.isEmpty()) {
				discount = Integer.parseInt(sdiscount);
			} else {
			    // Default or error handling
			    System.out.println("Parameter 'sdiscount' is missing or empty");
			}
			String spoint = request.getParameter("point");
			int point = 0;
			if (spoint != null && !spoint.isEmpty()) {
				point = Integer.parseInt(spoint);
			} else {
			    // Default or error handling
			    System.out.println("Parameter 'spoint' is missing or empty");
			}
			String category = request.getParameter("Category");
			String description = request.getParameter("description");

			Part filePart = request.getPart("file");
			if (filePart == null) {
				System.out.println("File part is null");
				return;
			}
			String fileName = filePart.getSubmittedFileName();
			Product product = new Product(barcode);

			LoginJDBC loginjd = new LoginJDBC();

			try {
				if (loginjd.existbarcode(product)) {
					response.sendRedirect("admin.jsp?message=Already Exist");
				} else {
					
					if (loginjd.productinsert(barcode, productname, price, discount, point, category, fileName,
							description)) {
						response.sendRedirect("admin.jsp?message=Product Inserted Sucessfully");
					}
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
			break;
		}
		case 2: {
			String productname = request.getParameter("productname");
			Product product = new Product(productname);
			LoginJDBC loginjd = new LoginJDBC();

			
			try {
				if (loginjd.existname(product)) {
					if(loginjd.deleteproduct(productname)) {
						response.sendRedirect("admin.jsp?message=Product Deleted Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		case 3: {
			String barcode = request.getParameter("barcode");
			String productname = request.getParameter("productname");
			LoginJDBC loginjd = new LoginJDBC();
			Product product = new Product(barcode);
			
			try {
				if(loginjd.existbarcode(product)) {
					if(loginjd.changename(productname,barcode)) {
						response.sendRedirect("admin.jsp?message=Name Changed Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		case 4: {
			String barcode = request.getParameter("barcode");
			String sprice = request.getParameter("price");
			int price = 0;
			if (sprice != null && !sprice.isEmpty()) {
				price = Integer.parseInt(sprice);
			} else {
			    // Default or error handling
			    System.out.println("Parameter 'sprice' is missing or empty");
			}
			LoginJDBC loginjd = new LoginJDBC();
			Product product = new Product(barcode);
			
			try {
				if(loginjd.existbarcode(product)) {
					if(loginjd.changeprice(price,barcode)) {
						response.sendRedirect("admin.jsp?message=Price Changed Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		case 5: {
			String barcode = request.getParameter("barcode");
			String sdiscount = request.getParameter("discount");
			int discount = 0;
			if (sdiscount != null && !sdiscount.isEmpty()) {
				discount = Integer.parseInt(sdiscount);
			} else {
			    // Default or error handling
			    System.out.println("Parameter 'sdiscount' is missing or empty");
			}
			LoginJDBC loginjd = new LoginJDBC();
			Product product = new Product(barcode);
			
			try {
				if(loginjd.existbarcode(product)) {
					if(loginjd.changediscountprice(discount,barcode)) {
						response.sendRedirect("admin.jsp?message=Discount Price Changed Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		case 6: {
			String barcode = request.getParameter("barcode");
			String spoint = request.getParameter("point");
			int point = 0;
			if (spoint != null && !spoint.isEmpty()) {
				point = Integer.parseInt(spoint);
			} else {
			    // Default or error handling
			    System.out.println("Parameter 'spoint' is missing or empty");
			}
			LoginJDBC loginjd = new LoginJDBC();
			Product product = new Product(barcode);
			
			try {
				if(loginjd.existbarcode(product)) {
					if(loginjd.changepoint(point,barcode)) {
						response.sendRedirect("admin.jsp?message=Point Changed Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		case 7: {
			String barcode = request.getParameter("barcode");
			String category = request.getParameter("Category");
			LoginJDBC loginjd = new LoginJDBC();
			Product product = new Product(barcode);
			
			try {
				if(loginjd.existbarcode(product)) {
					if(loginjd.changecategory(category,barcode)) {
						response.sendRedirect("admin.jsp?message=Category Changed Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		case 8: {
			String barcode = request.getParameter("barcode");
			Part filePart = request.getPart("file");
			if (filePart == null) {
				System.out.println("File part is null");
				return;
			}
			String fileName = filePart.getSubmittedFileName();
			LoginJDBC loginjd = new LoginJDBC();
			Product product = new Product(barcode);
			
			try {
				if(loginjd.existbarcode(product)) {
					if(loginjd.changeimage(fileName,barcode)) {
						response.sendRedirect("admin.jsp?message=Image Changed Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		case 9: {
			String barcode = request.getParameter("barcode");
			String description = request.getParameter("description");
			LoginJDBC loginjd = new LoginJDBC();
			Product product = new Product(barcode);
			
			try {
				if(loginjd.existbarcode(product)) {
					if(loginjd.changeimage(description,barcode)) {
						response.sendRedirect("admin.jsp?message=Description Changed Sucessfully");
					}
					else {
						response.sendRedirect("admin.jsp?message=Error Occured");
					}
				}
				else {
					response.sendRedirect("admin.jsp?message=No product Available");
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
			break;
		}
		default:
			throw new IllegalArgumentException("Unexpected value: " + hiddenvalue);
		}
		
	}

}
