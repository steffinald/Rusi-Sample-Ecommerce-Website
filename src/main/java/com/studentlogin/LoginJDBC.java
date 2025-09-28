package com.studentlogin;

import java.net.Authenticator.RequestorType;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import jakarta.security.auth.message.callback.SecretKeyCallback.Request;
import jakarta.servlet.http.HttpSession;

public class LoginJDBC {
	
	
	
	public boolean exist(User user) throws SQLException, ClassNotFoundException {
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "Select * from customers where mobilenumber=?";
	    	 
	    	
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, user.getMobileNumber());
	    	ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	            result = true; // User exists
	        }

	        // Close resources (optional but recommended)
	        rs.close();
	        pst.close();
	        con.close();

	    return result;
	}
	
	public boolean insert(User user) throws SQLException, ClassNotFoundException {
		
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query1 = "Insert into customers (mobilenumber) values (?)";
	    	String query2 = "Insert into customer_details (mobilenumber) values (?)";
	    	PreparedStatement pst2 = null;
	    	PreparedStatement pst1 = con.prepareStatement(query1);
	    	pst1.setString(1, user.getMobileNumber());
	    	
	    	int rowsInserted = pst1.executeUpdate();
            result = (rowsInserted > 0);
            
            if(result == true) {
            	 pst2 = con.prepareStatement(query2);
    	    	pst2.setString(1, user.getMobileNumber());
    	    	
    	    	int rows1Inserted = pst2.executeUpdate();
                result = (rows1Inserted > 0);
            }
            
            
	    	
		return result;
	}
	
public String read(User user) throws SQLException, ClassNotFoundException {
		
		boolean result=false;
		String mob=null;
		Connection con = DBUtil.getConnection();

		
	    	String query ="select * from customers where mobilenumber=?";
	    	
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, user.getMobileNumber());
	    	ResultSet rs =pst.executeQuery();
	    	if(rs.next()) { 
	    		 mob = rs.getString(2);
	    		}
	    	con.close();
	    	
		return mob;
	}

public boolean productinsert(String barcode,String productname,int price,int discount,int point,String category,String fileName,String description) throws SQLException, ClassNotFoundException {

	boolean result=false;
	
	Connection con = DBUtil.getConnection();

    	String query = "Insert into products (barcode,name,product_price,discount_price,points,product_category,image,product_description) values (?,?,?,?,?,?,?,?)";
 
    	
    	PreparedStatement pst = con.prepareStatement(query);
    	pst.setString(1, barcode );
    	pst.setString(2, productname );
    	pst.setInt(3, price );
    	pst.setInt(4, discount );
    	pst.setInt(5, point );
    	pst.setString(6, category );
    	pst.setString(7,  fileName );
    	pst.setString(8, description );
    	
    	int rowsInserted = pst.executeUpdate();
    	if (rowsInserted > 0) {
            result = true;
        }
    	
	return result;
	}

	public  List<Product> getAllProducts()throws SQLException, ClassNotFoundException {
		

		List<Product> products = new ArrayList<>();
		System.out.println("Fetching products from DB...");
		Connection con = DBUtil.getConnection();

		String query = "SELECT * FROM products;";
    	
    	 Statement stmt = con.createStatement();
         ResultSet rs = stmt.executeQuery(query);

         try {
			while (rs.next()) {
				
			     Product p = new Product(
			    	rs.getString("barcode"),
			         rs.getString("name"),
			         rs.getInt("product_price"),
			         rs.getInt("discount_price"),
			         rs.getInt("points"),
			         rs.getString("product_category"),
			         rs.getString("image"),
			         rs.getString("product_description")
			     );
			     
			     products.add(p);
			     System.out.println(p.getName());
			 }
			System.out.println(products);

			 rs.close();
			 stmt.close();
			 con.close();

		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return products;
	}
	public boolean existbarcode(Product product) throws SQLException, ClassNotFoundException {
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "Select * from products where barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, product.getBarcode());
	    	ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	            result = true; // User exists
	        }

	        // Close resources (optional but recommended)
	        rs.close();
	        pst.close();
	        con.close();

	    return result;
	}
	
	public boolean existname(Product product) throws SQLException, ClassNotFoundException {
		boolean result=false;
		Connection con = DBUtil.getConnection();

	    	String query = "Select * from products where name=?";
	    	
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, product.getBarcode());
	    	ResultSet rs = pst.executeQuery();

	        if (rs.next()) {
	            result = true; // User exists
	        }

	        // Close resources (optional but recommended)
	        rs.close();
	        pst.close();
	        con.close();

	    return result;
	}
	
	public boolean deleteproduct(String productname) throws SQLException, ClassNotFoundException {
		boolean result=false;
		Connection con = DBUtil.getConnection();

		
	    	String query = "DELETE FROM products WHERE name=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, productname);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Deleted Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
	public boolean changename(String productname, String barcode) throws SQLException, ClassNotFoundException{
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "UPDATE products SET name=? WHERE barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, productname);
	    	pst.setString(2, barcode);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Changed Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
	
	public boolean changeprice(int price, String barcode) throws SQLException, ClassNotFoundException{
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "UPDATE products SET product_price=? WHERE barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setInt(1, price);
	    	pst.setString(2, barcode);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Changed Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
	
	public boolean changediscountprice(int discount, String barcode) throws SQLException, ClassNotFoundException{
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "UPDATE products SET discount_price=? WHERE barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setInt(1, discount);
	    	pst.setString(2, barcode);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Changed Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
	
	public boolean changepoint(int point, String barcode) throws SQLException, ClassNotFoundException{
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "UPDATE products SET points=? WHERE barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setInt(1, point);
	    	pst.setString(2, barcode);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Changed Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
	
	public boolean changecategory(String category, String barcode) throws SQLException, ClassNotFoundException{
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "UPDATE products SET product_category=? WHERE barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, category);
	    	pst.setString(2, barcode);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Changed Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
	
	public boolean changeimage(String fileName, String barcode) throws SQLException, ClassNotFoundException{
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "UPDATE products SET image=? WHERE barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, fileName);
	    	pst.setString(2, barcode);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Changed Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
	
	public boolean changedescription(String description, String barcode) throws SQLException, ClassNotFoundException{
		boolean result=false;
		
		Connection con = DBUtil.getConnection();

	    	String query = "UPDATE products SET product_description=? WHERE barcode=?";
	    	PreparedStatement pst = con.prepareStatement(query);
	    	pst.setString(1, description);
	    	pst.setString(2, barcode);
	    	int rowsInserted = pst.executeUpdate();
	    	if (rowsInserted > 0) {
	    		System.out.println("Changed Sucessfully");
	            result = true;
	        }
	    	
		return result;
	}
public  Product getProductdetialbybarcode(String barcode)throws SQLException, ClassNotFoundException {
		
	Connection con = DBUtil.getConnection();

		System.out.println("Fetching products from DB...");
    	PreparedStatement pst = con.prepareStatement("SELECT * FROM products WHERE barcode=?");
        pst.setString(1, barcode);
        ResultSet rs = pst.executeQuery();

         try {
			while (rs.next()) {
				
			     return new Product(
			    	rs.getString("barcode"),
			         rs.getString("name"),
			         rs.getInt("product_price"),
			         rs.getInt("discount_price"),
			         rs.getInt("points"),
			         rs.getString("product_category"),
			         rs.getString("image"),
			         rs.getString("product_description")
			     );
			     
			 }

			 rs.close();
			 pst.close();
			 con.close();

		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return null;
	}

public  Profileclass getprofilebymobile(String mobile)throws SQLException, ClassNotFoundException {
	

	System.out.println("Fetching products from DB...");
	System.out.println(mobile);
	Connection con = DBUtil.getConnection();

	PreparedStatement pst = con.prepareStatement("SELECT * FROM customer_details WHERE mobilenumber=?");
    pst.setString(1, mobile);
    ResultSet rs = pst.executeQuery();
    System.out.println("it is required");
     try {
		while (rs.next()) {
			
		     return new Profileclass(
		    		 rs.getString("mobilenumber"),
		    	rs.getString("name"),
		         rs.getString("email"),
		         rs.getString("address")
		     );
		     
		 }
		
		 rs.close();
		 pst.close();
		 con.close();

	
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	 return null;
}
public boolean updateprofile(String name, String email, String address,String mobile) throws SQLException, ClassNotFoundException{
	boolean result=false;
	
	Connection con = DBUtil.getConnection();

    	String query = "UPDATE customer_details SET name=? , email=? , address=?  WHERE mobilenumber=?";
    	PreparedStatement pst = con.prepareStatement(query);
    	pst.setString(1, name);
    	pst.setString(2, email);
    	pst.setString(3, address);
    	pst.setString(4, mobile);
    	int rowsInserted = pst.executeUpdate();
    	if (rowsInserted > 0) {
    		System.out.println("Changed Sucessfully");
            result = true;
        }
    	
	return result;
}
}
