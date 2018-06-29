package cn.halower.scbp.core.consts;

public enum ErrorCode {
    OK(0, ""),
    FAIL(-1, "操作失败"),
    RPC_ERROR(-2,"远程调度失败"),
    USER_NOT_FOUND(1000,"用户不存在"),
    USER_PASSWORD_ERROR(1001,"密码错误"),
    GET_TOKEN_FAIL(1002,"token缺失或者无效");

    private int code;
    private String msg;


    ErrorCode(int code, String msg) {
        this.code = code;
        this.msg = msg;
    }

    public static ErrorCode codeOf(int code) {
        for (ErrorCode state : values()) {
            if (state.getCode() == code) {
                return state;
            }
        }
        return null;
    }


    public int getCode() {
        return code;
    }

    public String getMsg() {
        return msg;
    }
}
