package com.phm.shopping.service;

import com.phm.shopping.dao.CartDao;
import com.phm.shopping.dao.ProductDao;
import com.phm.shopping.domain.CartVO;
import com.phm.shopping.domain.CartWithProductInfoVO;
import com.phm.shopping.domain.ProductVO;
import com.sun.xml.internal.ws.api.message.ExceptionHasMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartDao cartDaoImpl;

    @Autowired
    private ProductDao productDaoImpl;

    @Override
    public List<CartWithProductInfoVO> getCartByUsername(String username) {
        return cartDaoImpl.getCartByUsername(username);
    }

    @Override
    public CartWithProductInfoVO getCartById(int cartId) {
        return cartDaoImpl.getCartById(cartId);
    }

    @Transactional
    @Override
    public int updateCartOrderCheck(int cartId, int orderCheck) {
        return cartDaoImpl.updateCartOrderCheck(cartId, orderCheck);
    }

    @Transactional
    @Override
    public int insert(CartVO cartVO) {
        return cartDaoImpl.insertCart(cartVO);
    }

    @Transactional
    @Override
    public int insertCartAndMinusProduct(CartVO cartVO) {
        ProductVO productVO = productDaoImpl.getProductById(cartVO.getProductId());
        int subedQuantity = productVO.getInventory() - cartVO.getQuantity();
        if(subedQuantity > 0) {
            productVO.setInventory(subedQuantity);
        } else {
            Exception e = new Exception("재고와 수량이 일치하지 않습니다.");
            try {
                throw e;
            } catch (Exception e1) {
                e1.printStackTrace();
            }
        }
        productDaoImpl.updateProduct(productVO);
        return cartDaoImpl.insertCart(cartVO);
    }

    @Transactional
    @Override
    public int deleteCartAndAddProduct(CartVO cartVO) {
        ProductVO productVO = productDaoImpl.getProductById(cartVO.getProductId());
        productVO.setInventory(productVO.getInventory() + cartVO.getQuantity());
        productDaoImpl.updateProduct(productVO);
        return cartDaoImpl.deleteCart(cartVO);
    }
}
