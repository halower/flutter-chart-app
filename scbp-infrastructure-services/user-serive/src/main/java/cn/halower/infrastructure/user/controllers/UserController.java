package cn.halower.infrastructure.user.controllers;

import cn.halower.infrastructure.user.domain.User;
import cn.halower.infrastructure.user.dots.LoginDto;
import cn.halower.infrastructure.user.service.UserService;
import cn.halower.scbp.core.dtos.EntityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public User postUser(@RequestBody User user) {
        return userService.createUser(user.getUsername(),user.getPassword());
    }

    @PostMapping("/login")
    public EntityDto<LoginDto> login(@RequestBody User user) {
     return userService.login(user.getUsername(),user.getPassword());
    }
}
