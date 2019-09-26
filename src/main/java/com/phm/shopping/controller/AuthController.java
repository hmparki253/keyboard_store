package com.phm.shopping.controller;

import com.phm.shopping.domain.AuthorityVO;
import com.phm.shopping.domain.UserVO;
import com.phm.shopping.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import javax.servlet.http.HttpServletRequest;


@Controller
public class AuthController {

    private final Logger logger = LoggerFactory.getLogger(AuthController.class);

    @Autowired
    private PasswordEncoder passwordEncoder;
    @Autowired
    private UserService userServiceImpl;

    @GetMapping("/login")
    public String login(Model model, HttpServletRequest request) {
        // 리퍼러를 세션에 저장해두고 이전페이지를 저장해서 customeLoginSuccessHandler에서 꺼내 사용할 수 있게 하기
        String referer = request.getHeader("Referer");
        if(referer != null) {
            request.getSession().setAttribute("url_prior_login", referer);
        }
        return "login";
    }

    @GetMapping("/join")
    public String join(Model model) {
        UserVO userVO = new UserVO();
        model.addAttribute("user", userVO);
        return "join";
    }

    // POST : userRegistration
    @PostMapping("/userRegistration")
    public String userRegistration(@ModelAttribute("user") UserVO userVO) {
        AuthorityVO authorityVO = new AuthorityVO();
        userVO.setEnabled(1); // enabled 값 세팅
        userVO.setPassword(passwordEncoder.encode(userVO.getPassword())); // 비밀번호 암호화
        authorityVO.setUsername(userVO.getUsername());
        authorityVO.setAuthority("ROLE_USER");
        userServiceImpl.insertUserAndAuthority(userVO, authorityVO);
        // 오브젝트가 null이 아닌것은 확인됐다. 그렇다면 insert 구문에 문제가 있는 것은 아닐까?
        return "redirect:/";
    }

    // 아이디 생성 완료시 보여질 페이지도 필요하다.

    @GetMapping("/accessDenied")
    public String accessDenied(Model model) {
        return "accessDenied";
    }

    // 테스팅용으로 만들었던 부분
    @GetMapping("/userSuccess")
    public String userSuccess(Model model) {
        return "userSuccess";
    }


}
