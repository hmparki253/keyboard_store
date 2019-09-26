package com.phm.shopping.domain;

import java.util.Date;

public class TotalOrderInfoVO {
    private String name;
    private int price;
    private int id;
    private String username;
    private String orderer;
    private String phone;
    private String addr1;
    private String addr2;
    private int postalCode;
    private String requirements;
    private int totalPrice;
    private int paymentMethod;
    private int paymentStatus;
    private int shippingStatus;
    private String shippingNo;
    private Date regDate;
    private Date paymentDate;
    private Date shippingDate;
    private int quantity;
    private String randName;
    private String originName;

    public TotalOrderInfoVO() {
    }

    public TotalOrderInfoVO(String name, int price, int id, String username, String orderer, String phone, String addr1, String addr2, int postalCode, String requirements, int totalPrice, int paymentMethod, int paymentStatus, int shippingStatus, String shippingNo, Date regDate, Date paymentDate, Date shippingDate, int quantity, String randName, String originName) {
        this.name = name;
        this.price = price;
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
        this.quantity = quantity;
        this.randName = randName;
        this.originName = originName;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

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

    public int getPostalCode() {
        return postalCode;
    }

    public void setPostalCode(int postalCode) {
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getRandName() {
        return randName;
    }

    public void setRandName(String randName) {
        this.randName = randName;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName;
    }

    @Override
    public String toString() {
        return "TotalOrderInfoVO{" +
                "name='" + name + '\'' +
                ", price=" + price +
                ", id=" + id +
                ", username='" + username + '\'' +
                ", orderer='" + orderer + '\'' +
                ", phone='" + phone + '\'' +
                ", addr1='" + addr1 + '\'' +
                ", addr2='" + addr2 + '\'' +
                ", postalCode=" + postalCode +
                ", requirements='" + requirements + '\'' +
                ", totalPrice=" + totalPrice +
                ", paymentMethod=" + paymentMethod +
                ", paymentStatus=" + paymentStatus +
                ", shippingStatus=" + shippingStatus +
                ", shippingNo='" + shippingNo + '\'' +
                ", regDate=" + regDate +
                ", paymentDate=" + paymentDate +
                ", shippingDate=" + shippingDate +
                ", quantity=" + quantity +
                ", randName='" + randName + '\'' +
                ", originName='" + originName + '\'' +
                '}';
    }
}
