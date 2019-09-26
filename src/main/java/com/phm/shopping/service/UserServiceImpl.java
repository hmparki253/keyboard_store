package com.phm.shopping.service;

import com.phm.shopping.dao.AuthorityDao;
import com.phm.shopping.dao.UserDao;
import com.phm.shopping.domain.AuthorityVO;
import com.phm.shopping.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
public class UserServiceImpl implements  UserService{

    @Autowired
    private UserDao userDaoImpl;
    @Autowired
    private AuthorityDao authorityDaoImpl;

    public UserVO getUserByUsername(String username) {
        return userDaoImpl.getUserByUsername(username);
    }

    public UserVO getUserByEmail(String email) {
        return userDaoImpl.getUserByEmail(email);
    }

    @Transactional(propagation = Propagation.REQUIRED)
    public void insertUserAndAuthority(UserVO userVO, AuthorityVO authorityVO) {
        userDaoImpl.insertUser(userVO);
        authorityDaoImpl.insertAuthority(authorityVO);
    }
}
