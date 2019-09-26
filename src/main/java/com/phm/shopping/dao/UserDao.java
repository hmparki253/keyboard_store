package com.phm.shopping.dao;

import com.phm.shopping.domain.*;

import java.util.List;

public interface UserDao {
    UserVO getUserByUsername(String username);
    UserVO getUserByEmail(String email);
    void insertUser(UserVO userVO);
}
