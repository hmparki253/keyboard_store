package com.phm.shopping.domain;

import java.util.Date;

public class CartWithProductInfoVO {

    private int id;
    private String username;
    private int productId;
    private int quantity;
    private Date regDt;
    private String randName;
    private String name;
    private int price;
    private int discount;

    public CartWithProductInfoVO() {
    }

    public int getId() {
        return id;
    }

    public String getUsername() {
        return username;
    }

    public int getProductId() {
        return productId;
    }

    public int getQuantity() {
        return quantity;
    }

    public Date getRegDt() {
        return regDt;
    }

    public String getRandName() {
        return randName;
    }

    public String getName() {
        return name;
    }

    public int getPrice() {
        return price;
    }

    public int getDiscount() {
        return discount;
    }

    @Override
    public String toString() {
        return "CartWithProductInfoVO{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", regDt=" + regDt +
                ", randName='" + randName + '\'' +
                ", name='" + name + '\'' +
                ", price=" + price +
                ", discount=" + discount +
                '}';
    }
}
