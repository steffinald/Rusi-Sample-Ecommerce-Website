package com.studentlogin;

public class Product {
	private String barcode;
	private String name;
	private int price;
	private int discount;
	private int points;
	private String category;
	private String image;
	private String description;
	public Product(int quantity) {
		super();
		this.quantity = quantity;
	}
	private int quantity;
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Product(String barcode, String name, int price, int discount, int points, String category, String image,
			String description) {
		super();
		this.barcode = barcode;
		this.name = name;
		this.price = price;
		this.discount = discount;
		this.points = points;
		this.category = category;
		this.image = image;
		this.description = description;
	}
	public Product(String barcode) {
		super();
		this.barcode = barcode;
	}
	public String getBarcode() {
		return barcode;
	}
	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
