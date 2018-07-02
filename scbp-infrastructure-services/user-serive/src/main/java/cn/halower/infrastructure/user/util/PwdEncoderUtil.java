package cn.halower.infrastructure.user.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;


public class PwdEncoderUtil {

    private static final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    /**
     * 用BCryptPasswordEncoder
     * @param password
     * @return
     */
    public static String  BCryptPassword(String password){
        return encoder.encode(password);
    }

    /**
     *
     * @param rawPassword 原始密码
     * @param encodedPassword 加密后的密码
     * @return
     */
    public static boolean matches(CharSequence rawPassword, String encodedPassword){
        return encoder.matches(rawPassword,encodedPassword);
    }

}