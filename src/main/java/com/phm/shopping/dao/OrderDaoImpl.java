package com.phm.shopping.dao;

import com.phm.shopping.domain.OrderVO;
import com.phm.shopping.domain.OrderWithCountVO;
import com.phm.shopping.domain.TotalOrderInfoVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class OrderDaoImpl implements OrderDao {

    @Autowired
    private SqlSession sqlSession;

    @Override
    @Transactional
    public int insert(OrderVO orderVO) {
        return sqlSession.insert("OrderMapper.insertOrder", orderVO);
    }

    @Override
    public void update(OrderVO orderVO) {
        sqlSession.update("OrderMapper.updateOrder", orderVO);
    }

    @Override
    public OrderVO getOrderById(int orderId) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("orderId", orderId);
        return sqlSession.selectOne("OrderMapper.getOrderById", parameter);
    }

    @Override
    public List<TotalOrderInfoVO> getTotalOrderInfoByUsername(String username, int curPage, int pageSize) {
        Map<String, Object> parameter = new HashMap<>();
        parameter.put("username", username);
        parameter.put("start", (curPage - 1) * pageSize);
        parameter.put("pageSize", pageSize);
        return sqlSession.selectList("OrderMapper.getTotalOrderInfoByUsername", parameter);
    }

    @Override
    public List<OrderWithCountVO> getOrderWithCountPerPage(int curPage, int pageSize) {
        Map<String, Integer> parameter = new HashMap<>();
        parameter.put("start", (curPage - 1) * pageSize);
        parameter.put("pageSize", pageSize);
        return sqlSession.selectList("OrderMapper.getOrderWithCountPerPage", parameter);
    }

    @Override
    public int getTotalOrderCount() {
        return sqlSession.selectOne("OrderMapper.getTotalOrderCount");
    }

    @Override
    public int getTotalOrderCountByUsername(String username) {
        Map<String, String> parameter = new HashMap<>();
        parameter.put("username", username);
        return sqlSession.selectOne("OrderMapper.getTotalOrderCountByUsername", parameter);
    }
}
