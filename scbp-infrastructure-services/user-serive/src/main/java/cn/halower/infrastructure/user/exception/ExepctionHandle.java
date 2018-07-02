package cn.halower.infrastructure.user.exception;

import cn.halower.scbp.core.dtos.EntityDto;
import cn.halower.scbp.core.exceptions.ScbpException;
import lombok.var;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExepctionHandle {
    @ExceptionHandler(ScbpException.class)
    public ResponseEntity<EntityDto> handleException(Exception e) {
        var res = new EntityDto();
        var ex = (ScbpException) e;
        res.setCode(ex.getErrorCode().getCode());
        res.setMsg(ex.getErrorCode().getMsg());
        return new ResponseEntity(res, HttpStatus.OK);
    }
}
