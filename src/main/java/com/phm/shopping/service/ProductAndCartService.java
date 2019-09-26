package com.phm.shopping.service;

import com.phm.shopping.domain.CartVO;
import com.phm.shopping.domain.ProductVO;

public interface ProductAndCartService {
    boolean updateProductAndCart(int cartId, boolean flag);
    boolean checkProductQuantity(ProductVO productVO);
    void insertCartAndRemoveInven(CartVO cartVO);
}
