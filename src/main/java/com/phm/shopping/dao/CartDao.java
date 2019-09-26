package com.phm.shopping.dao;

import com.phm.shopping.domain.CartVO;
import com.phm.shopping.domain.CartWithProductInfoVO;

import java.util.List;

public interface CartDao {
    List<CartWithProductInfoVO> getCartByUsername(String username);
    CartWithProductInfoVO getCartById(int cartId);
    CartVO getCart(int cartId);
    int insertCart(CartVO cartVO);
    int updateCart(CartVO cartVO);
    int updateCartOrderCheck(int cartId, int orderCheck);
    int deleteCart(CartVO cartVO);
    int deleteCartById(int cartId);
}
