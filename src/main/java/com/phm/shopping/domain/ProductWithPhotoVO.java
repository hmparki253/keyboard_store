package com.phm.shopping.domain;

import java.util.Date;

public class ProductWithPhotoVO {
    private int id;
    private String name;
    private String description;
    private int price;
    private int inventory;
    private Date regDate;
    private int categoryId;
    private int discount;
    private String randName;
    private int titleCk;
    private String originName;

    public ProductWithPhotoVO(int id, String name, String description, int price, int inventory, Date regDate, int categoryId, int discount, String randName, int titleCk, String originName) {
        this.id = id;
        this.name = name;
        this.description = description;
        this.price = price;
        this.inventory = inventory;
        this.regDate = regDate;
        this.categoryId = categoryId;
        this.discount = discount;
        this.randName = randName;
        this.titleCk = titleCk;
        this.originName = originName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

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

    public String getRandName() {
        return randName;
    }

    public void setRandName(String randName) {
        this.randName = randName;
    }

    public int getTitleCk() {
        return titleCk;
    }

    public void setTitleCk(int titleCk) {
        this.titleCk = titleCk;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName;
    }

    @Override
    public String toString() {
        return "ProductWithPhotoVO{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", description='" + description + '\'' +
                ", price=" + price +
                ", inventory=" + inventory +
                ", regDate=" + regDate +
                ", categoryId=" + categoryId +
                ", discount=" + discount +
                ", randName='" + randName + '\'' +
                ", titleCk=" + titleCk +
                ", originName='" + originName + '\'' +
                '}';
    }
}
