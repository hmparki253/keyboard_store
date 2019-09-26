package com.phm.shopping.domain;

import java.util.Date;

public class OrderVO {

    private int id;
    private String username;
    private String orderer;
    private String phone;
    private String addr1;
    private String addr2;
    private String postalCode;
    private String requirements; // nullable
    private int totalPrice;
    private int paymentMethod;
    private int paymentStatus;
    private int shippingStatus;
    private String shippingNo; // nullable
    private Date regDate;
    private Date paymentDate; // nullable
    private Date shippingDate; // nullable

    public OrderVO() {}

    public OrderVO(int id, int paymentStatus, int shippingStatus, String shippingNo) {
        this.id = id;
        this.paymentStatus = paymentStatus;
        this.shippingStatus = shippingStatus;
        this.shippingNo = shippingNo;
    }

    public OrderVO(String username, String orderer, String phone, String addr1, String addr2, String postalCode, String requirements, int totalPrice, int paymentMethod, int paymentStatus, int shippingStatus, Date regDate) {
        this.username = username;
        this.orderer = orderer;
        this.phone = phone;
        this.addr1 = addr1;
        this.addr2 = addr2;
        this.postalCode = postalCode;
        this.requirements = requirements;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.shippingStatus = shippingStatus;
        this.regDate = regDate;
    }

    public OrderVO(int id, String username, String orderer, String phone, String addr1, String addr2, String postalCode, String requirements, int totalPrice, int paymentMethod, int paymentStatus, int shippingStatus, String shippingNo, Date regDate, Date paymentDate, Date shippingDate) {
        this.id = id;
        this.username = username;
        this.orderer = orderer;
        this.phone = phone;
        this.addr1 = addr1;
        this.addr2 = addr2;
        this.postalCode = postalCode;
        this.requirements = requirements;
        this.totalPrice = totalPrice;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.shippingStatus = shippingStatus;
        this.shippingNo = shippingNo;
        this.regDate = regDate;
        this.paymentDate = paymentDate;
        this.shippingDate = shippingDate;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }

    public String getOrderer() {
        return orderer;
    }

    public void setOrderer(String orderer) {
        this.orderer = orderer;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddr1() {
        return addr1;
    }

    public void setAddr1(String addr1) {
        this.addr1 = addr1;
    }

    public String getAddr2() {
        return addr2;
    }

    public void setAddr2(String addr2) {
        this.addr2 = addr2;
    }

    public String getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(String postalCode) {
        this.postalCode = postalCode;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public int getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(int paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public int getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(int paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public int getShippingStatus() {
        return shippingStatus;
    }

    public void setShippingStatus(int shippingStatus) {
        this.shippingStatus = shippingStatus;
    }

    public String getShippingNo() {
        return shippingNo;
    }

    public void setShippingNo(String shippingNo) {
        this.shippingNo = shippingNo;
    }

    public Date getRegDate() {
        return regDate;
    }

    public void setRegDate(Date regDate) {
        this.regDate = regDate;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public Date getShippingDate() {
        return shippingDate;
    }

    public void setShippingDate(Date shippingDate) {
        this.shippingDate = shippingDate;
    }

    @Override
    public String toString() {
        return "OrderVO{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", orderer='" + orderer + '\'' +
                ", phone='" + phone + '\'' +
                ", addr1='" + addr1 + '\'' +
                ", addr2='" + addr2 + '\'' +
                ", postalCode='" + postalCode + '\'' +
                ", requirements='" + requirements + '\'' +
                ", totalPrice=" + totalPrice +
                ", paymentMethod=" + paymentMethod +
                ", paymentStatus=" + paymentStatus +
                ", shippingStatus=" + shippingStatus +
                ", shippingNo=" + shippingNo +
                ", regDate=" + regDate +
                ", paymentDate=" + paymentDate +
                ", shippingDate=" + shippingDate +
                '}';
    }
}
