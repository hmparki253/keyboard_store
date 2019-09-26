package com.phm.shopping.domain;

import java.util.Date;

public class CartVO {
    private int id;
    private String username;
    private int productId;
    private int quantity;
    private Date regDt;

    public CartVO() {
    }

    public CartVO(int id, String username, int productId, int quantity, Date regDt) {
        this.id = id;
        this.username = username;
        this.productId = productId;
        this.quantity = quantity;
        this.regDt = regDt;
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

    public void setId(int id) {
        this.id = id;
    }

    public void setUsername(String username) { this.username = username; }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setRegDt(Date regDt) {
        this.regDt = regDt;
    }

    @Override
    public String toString() {
        return "CartVO{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", productId=" + productId +
                ", quantity=" + quantity +
                ", regDt=" + regDt +
                '}';
    }
}
