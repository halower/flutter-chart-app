package cn.halower.infrastructure.user.dots;

import cn.halower.infrastructure.user.domain.User;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginDto {
    private User user;
    private String token;

}