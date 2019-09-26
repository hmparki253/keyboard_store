package com.phm.shopping.domain;

import java.util.Date;

public class ProductVO {
    private int id;
    private String name;
    private String description;
    private int price;
    private int inventory;
    private Date regDate;
    private int categoryId;
    private int discount;

    public ProductVO() { }

    public ProductVO(String name, String description, int price, int inventory, Date regDate, int categoryId, int discount) {
        this.name = name;
        this.description = description;
        this.price = price;
        this.inventory = inventory;
        this.regDate = regDate;
        this.categoryId = categoryId;
        this.discount = discount;
    }

    public ProductVO(int id, String name, String description, int price, int inventory, Date regDate, int categoryId, int discount) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.inventory = inventory;
        this.regDate = regDate;
        this.categoryId = categoryId;
        this.discount = discount;
    }

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getInventory() {
        return inventory;
    }

    public void setInventory(int inventory) {
        this.inventory = inventory;
    }

    public Date getRegDate() { return regDate; }

    public void setRegDate(Date regDate) { this.regDate = regDate; }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    @Override
    public String toString() {
        return "ProductVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", inventory=" + inventory +
                ", regDate=" + regDate +
                ", categoryId=" + categoryId +
                ", discount=" + discount +
                '}';
    }
}