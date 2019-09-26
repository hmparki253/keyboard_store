package com.phm.shopping.controller;

import com.phm.shopping.domain.UserVO;
import com.phm.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
public class UserRestController {

    @Autowired
    private UserService userServiceImpl;

    @GetMapping("/getUserInfo")
    public UserVO userInfo(Principal principal) {
        String username = principal.getName();
        return userServiceImpl.getUserByUsername(username);
    }
}
