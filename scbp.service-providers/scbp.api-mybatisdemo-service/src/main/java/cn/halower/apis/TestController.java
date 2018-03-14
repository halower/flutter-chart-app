package cn.halower.apis;

import cn.halower.dao.UserMapper;
import cn.halower.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class TestController {
    @Autowired
    public UserMapper _userMappers;
    @GetMapping("/hello")
    public String Get() {
        User user =  _userMappers.selectByUserId(1);
        return user.getName();
    }
}
