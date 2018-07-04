package cn.halower.scbp.core.exception;

import cn.halower.scbp.core.consts.ErrorCode;
import lombok.Data;


@Data
public class BusinessException extends RuntimeException {
    private ErrorCode errorCode;

    public  BusinessException(ErrorCode code) {
        super(code.getMsg());
        this.errorCode = code;

    }

    public  BusinessException(ErrorCode code,String msg) {
        super(msg);
        this.errorCode = code;

    }

    public BusinessException(String msg) {
        super(msg);
        this.errorCode = ErrorCode.FAIL;
    }
}
