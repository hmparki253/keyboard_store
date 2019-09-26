package com.phm.shopping.service;

import com.phm.shopping.domain.CartVO;
import com.phm.shopping.domain.CartWithProductInfoVO;
import com.phm.shopping.domain.ProductVO;

import java.util.List;

public interface CartService {
    List<CartWithProductInfoVO> getCartByUsername(String username);
    CartWithProductInfoVO getCartById(int cartId);
    int updateCartOrderCheck(int cartId, int orderCheck);
    int insert(CartVO cartVO);
    int insertCartAndMinusProduct(CartVO cartVO);
    int deleteCartAndAddProduct(CartVO cartVO);
}
