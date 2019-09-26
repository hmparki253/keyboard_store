package com.phm.shopping.dao;

public interface OrderProductDao {
    int insert(int orderId, int productId, int quantity);
}
