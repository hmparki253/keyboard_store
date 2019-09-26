package com.phm.shopping.service;

import com.phm.shopping.dao.CartDao;
import com.phm.shopping.dao.ProductDao;
import com.phm.shopping.domain.CartVO;
import com.phm.shopping.domain.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ProductAndCartServiceImpl implements ProductAndCartService{

    @Autowired
    private ProductDao productDaoImpl;
    @Autowired
    private CartDao cartDaoImpl;

    @Override
    @Transactional
    public boolean updateProductAndCart(int cartId, boolean flag) {
        boolean state = false;
        CartVO cartVO = cartDaoImpl.getCart(cartId);
        ProductVO productVO = productDaoImpl.getProductById(cartVO.getProductId());
        if(flag) {
            if(checkProductQuantity(productVO)) {
                productVO.setInventory(productVO.getInventory() - 1);
                cartVO.setQuantity(cartVO.getQuantity() + 1);
                productDaoImpl.updateProduct(productVO);
                cartDaoImpl.updateCart(cartVO);
                state = true;
            }
        } else {
            productVO.setInventory(productVO.getInventory() + 1);
            cartVO.setQuantity(cartVO.getQuantity() - 1);
            productDaoImpl.updateProduct(productVO);
            cartDaoImpl.updateCart(cartVO);
            state = true;
        }
        return state;
    }

    @Override
    public boolean checkProductQuantity(ProductVO productVO) {
        boolean quantityFlag = false;
        if(productVO.getInventory() > 0) {
            quantityFlag = true;
        }
        return quantityFlag;
    }

    @Transactional
    @Override
    public void insertCartAndRemoveInven(CartVO cartVO) {

    }
}
