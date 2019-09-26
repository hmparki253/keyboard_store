package com.phm.shopping.service;

import com.phm.shopping.domain.AuthorityVO;
import com.phm.shopping.domain.UserVO;

public interface UserService {
    UserVO getUserByUsername(String username);
    UserVO getUserByEmail(String email);
    void insertUserAndAuthority(UserVO userVO, AuthorityVO authorityVO);
}
