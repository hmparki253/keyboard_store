package com.phm.shopping.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;

@Repository
public class OrderProductDaoImpl implements OrderProductDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    @Transactional
    public int insert(int orderId, int productId, int quantity) {
        HashMap<String, Integer> parameter = new HashMap<>();
        parameter.put("orderId", orderId);
        parameter.put("productId", productId);
        parameter.put("quantity", quantity);
        return sqlSession.insert("OrderProductMapper.insertOrderProduct", parameter);
    }
}
