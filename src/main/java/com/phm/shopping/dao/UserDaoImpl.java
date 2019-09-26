package com.phm.shopping.dao;

import com.phm.shopping.domain.UserVO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.Map;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private SqlSession sqlSession;

    public UserVO getUserByUsername(String username) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("username", username);
        return sqlSession.selectOne("UserMapper.getUserByUsername", parameter);
    }

    public UserVO getUserByEmail(String email) {
        Map<String, Object> parameter = new HashMap<String, Object>();
        parameter.put("email", email);
        return sqlSession.selectOne("UserMapper.getUserByEmail", parameter);
    }

    public void insertUser(UserVO userVO) {
        sqlSession.insert("UserMapper.insertUser", userVO);
    }
}
