package cn.halower.infrastructure.user.controllers;

import cn.halower.infrastructure.user.domain.User;
import cn.halower.infrastructure.user.dots.LoginOutputDto;
import cn.halower.infrastructure.user.dots.UserDto;
import cn.halower.infrastructure.user.service.UserService;
import cn.halower.scbp.core.dtos.EntityDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @PostMapping("/registry")
    public User postUser(@RequestBody UserDto user) {
        return userService.createUser(user.getUsername(),user.getPassword());
    }

    @PostMapping("/login")
    public EntityDto<LoginOutputDto> login(@RequestBody UserDto user) {
     return userService.login(user.getUsername(),user.getPassword());
    }
}
