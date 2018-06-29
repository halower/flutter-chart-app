package cn.halower.scbp.core.exceptions;

import cn.halower.scbp.core.consts.ErrorCode;
import lombok.Data;


@Data
public class ScbpException extends RuntimeException {
    private ErrorCode errorCode;

    public  ScbpException(ErrorCode code) {
        super(code.getMsg());
        this.errorCode = code;

    }

    public ScbpException(ErrorCode code, String msg) {
        super(msg);
        this.errorCode = code;
    }
}
