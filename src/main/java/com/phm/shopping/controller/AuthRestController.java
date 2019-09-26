package com.phm.shopping.controller;

import com.phm.shopping.domain.UserVO;
import com.phm.shopping.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
public class AuthRestController {

    @Autowired
    private UserService userServiceImpl;

    // 아이디 중복 체크, 포스트맨으로 확인 완료
    @GetMapping("/usernameDup")
    public Map<String, Object> usernameDup(@RequestParam(value = "username",
                                            required = true,
                                            defaultValue = "err") String username) {
        UserVO userVO = new UserVO();
        boolean usernameFlag = false;
        Map<String, Object> map = new HashMap<String, Object>();
        userVO = userServiceImpl.getUserByUsername(username);
        if(userVO != null) {
            usernameFlag = true;
        }
        map.put("usernameFlag", usernameFlag);
        return map;
    }

    @GetMapping("/emailDup")
    public Map<String, Object> emailDup(@RequestParam(value = "email",
                                        required = true,
                                        defaultValue = "err") String email) {
        UserVO userVO = new UserVO();
        boolean emailFlag = false;
        Map<String, Object> map = new HashMap<String, Object>();
        userVO = userServiceImpl.getUserByEmail(email);
        if(userVO != null) {
            emailFlag = true;
        }
        map.put("emailFlag", emailFlag);
        return map;
    }
}
