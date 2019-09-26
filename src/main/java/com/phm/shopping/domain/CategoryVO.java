package com.phm.shopping.domain;

public class CategoryVO {
    private int categoryId;
    private int cnt;
    private String name;

    public CategoryVO() {
    }

    public CategoryVO(int categoryId, int cnt, String name) {
        this.categoryId = categoryId;
        this.cnt = cnt;
        this.name = name;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public int getCnt() {
        return cnt;
    }

    public void setCnt(int cnt) {
        this.cnt = cnt;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "CategoryVO{" +
                "categoryId=" + categoryId +
                ", cnt=" + cnt +
                ", name='" + name + '\'' +
                '}';
    }
}
