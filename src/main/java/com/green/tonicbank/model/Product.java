package com.green.tonicbank.model;

public class Product {
	private String name;
	private String ingredient,efficacy;
	private int price;
	private String review;
	private int cost;
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getEfficacy() {
		return efficacy;
	}
	public void setEfficacy(String efficacy) {
		this.efficacy = efficacy;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReview() {
		return review;
	}
	public void setReview(String review) {
		this.review = review;
	}
	public Product(String name, String ingredient, String efficacy, int price) {
		super();
		this.name = name;
		this.ingredient = ingredient;
		this.efficacy = efficacy;
		this.price = price;
	}
	@Override
	public String toString() {
		return "Product [name=" + name + ", ingredient=" + ingredient + ", efficacy=" + efficacy + ", price=" + price
				+ ", review=" + review + "]";
	}
	
}
