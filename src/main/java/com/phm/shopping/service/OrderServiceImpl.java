package com.phm.shopping.service;

import com.phm.shopping.dao.CartDao;
import com.phm.shopping.dao.OrderDao;
import com.phm.shopping.dao.OrderProductDao;
import com.phm.shopping.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private CartDao cartDaoImpl;

    @Autowired
    private OrderDao orderDaoImpl;

    @Autowired
    private OrderProductDao orderProductDaoImpl;


    @Override
    @Transactional
    public int placeOrder(OrderVO orderVO, List<CartWithProductInfoVO> cartVOS) {
        // 기본 주문정보 insert
        orderDaoImpl.insert(orderVO);

        for(CartWithProductInfoVO cart : cartVOS) {
            // 주문정보에서 나온 orderId를 이용하여
            // productIds와 함께 order_product 테이블에 데이터 넣어주기
            orderProductDaoImpl.insert(orderVO.getId(), cart.getProductId(), cart.getQuantity());
            // 완료시 해당 cartId row들 삭제해주기
            cartDaoImpl.deleteCartById(cart.getId());
        }

        return orderVO.getId();
    }

    @Override
    @Transactional
    public void orderUpdate(OrderVO orderVO) {
        orderDaoImpl.update(orderVO);
    }

    @Override
    public OrderVO getOrderById(int orderId) {
        return orderDaoImpl.getOrderById(orderId);
    }

    @Override
    public List<TotalOrderInfoVO> getTotalOrderInfoByUsername(String username, int curPage, int pageSize) {
        return orderDaoImpl.getTotalOrderInfoByUsername(username, curPage, pageSize);
    }

    @Override
    public List<OrderWithCountVO> getOrderWithCountPerPage(int curPage, int pageSize) {
        return orderDaoImpl.getOrderWithCountPerPage(curPage, pageSize);
    }

    @Override
    public int getTotalOrderCount() {
        return orderDaoImpl.getTotalOrderCount();
    }

    @Override
    public int getTotalOrderCountByUsername(String username) {
        return orderDaoImpl.getTotalOrderCountByUsername(username);
    }
}
