package com.phm.shopping.dao;

import com.phm.shopping.domain.CartVO;
import com.phm.shopping.domain.CartWithProductInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDaoImpl implements CartDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    public List<CartWithProductInfoVO> getCartByUsername(String username) {
        Map<String, String> parameter = new HashMap<>();
        parameter.put("username", username);
        return sqlSession.selectList("ProductMapper.getCartByParameter", parameter);
    }

    @Override
    public CartWithProductInfoVO getCartById(int cartId) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("cartId", cartId);
        return sqlSession.selectOne("ProductMapper.getCartByParameter", parameter);
    }

    @Override
    public CartVO getCart(int cartId) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("cartId", cartId);
        return sqlSession.selectOne("ProductMapper.getCart", parameter);
    }

    @Override
    public int insertCart(CartVO cartVO) {
        return sqlSession.insert("ProductMapper.insertCart", cartVO);
    }

    @Override
    public int updateCart(CartVO cartVO) {
        return sqlSession.update("ProductMapper.updateCart", cartVO);
    }

    @Override
    public int updateCartOrderCheck(int cartId, int orderCheck) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("cartId", cartId);
        parameter.put("orderCheck", orderCheck);
        return sqlSession.update("ProductMapper.updateCartOrderCheck", parameter);
    }

    @Override
    public int deleteCart(CartVO cartVO) {
        return sqlSession.delete("ProductMapper.deleteCart", cartVO);
    }

    @Override
    @Transactional
    public int deleteCartById(int cartId) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("cartId", cartId);
        return sqlSession.delete("ProductMapper.deleteCartById", parameter);
    }
}
