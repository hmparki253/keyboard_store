package com.phm.shopping.domain;

public class ProductPhotoVO {
    private int id;
    private String randName;
    private int titleCk;
    private int productId;
    private String originName;

    public ProductPhotoVO() {
    }

    public ProductPhotoVO(String randName, int titleCk, String originName) {
        this.randName = randName;
        this.titleCk = titleCk;
        this.originName = originName;
    }

    public ProductPhotoVO(String randName, int titleCk, int productId, String originName) {
        this.randName = randName;
        this.titleCk = titleCk;
        this.productId = productId;
        this.originName = originName;
    }

    public ProductPhotoVO(int id, String randName, int titleCk, int productId, String originName) {
        this.id = id;
        this.randName = randName;
        this.titleCk = titleCk;
        this.productId = productId;
        this.originName = originName;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
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

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getOriginName() {
        return originName;
    }

    public void setOriginName(String originName) {
        this.originName = originName;
    }

    @Override
    public String toString() {
        return "ProductPhotoVO{" +
                "id=" + id +
                ", randName='" + randName + '\'' +
                ", titleCk=" + titleCk +
                ", productId=" + productId +
                ", originName='" + originName + '\'' +
                '}';
    }
}
