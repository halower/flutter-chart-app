package cn.halower.infrastructure.user.service;

import cn.halower.infrastructure.user.repository.UserRepository;
import cn.halower.infrastructure.user.clients.AuthServiceClient;
import cn.halower.infrastructure.user.domain.JWT;
import cn.halower.infrastructure.user.domain.User;
import cn.halower.infrastructure.user.dots.LoginOutputDto;
import cn.halower.infrastructure.user.util.PwdEncoderUtil;
import cn.halower.scbp.core.consts.ErrorCode;
import cn.halower.scbp.core.dtos.EntityDto;
import cn.halower.scbp.core.exceptions.ScbpException;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AuthServiceClient clinet;

    public User createUser(String username, String password) {
        var user = new User();
        user.setUsername(username);
        user.setPassword(PwdEncoderUtil.BCryptPassword(password));
        return userRepository.save(user);
    }

    public EntityDto<LoginOutputDto> login(String username, String password) {
        var user = userRepository.findUserByUsername(username);
        if (null == user) {
            throw new ScbpException(ErrorCode.FAIL, "未找到该用户");
        }
        if (!PwdEncoderUtil.matches(password, user.getPassword())){
            throw new ScbpException(ErrorCode.FAIL, "密码错误");
        }

        JWT jwt = clinet.getToken("Basic dXNlci1zZXJ2aWNlOjEyMzQ1Ng==", "password", username, password);
        // 获得用户菜单
        if(jwt==null){
            throw new ScbpException(ErrorCode.GET_TOKEN_FAIL);
        }
        var loginDTO=new LoginOutputDto();
        loginDTO.setUser(user);
        loginDTO.setToken(jwt.getAccess_token());
        return EntityDto.onSuccess(loginDTO);
    }
}
