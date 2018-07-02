package cn.halower.scbp.demos.consumelog.aspects;

import cn.halower.scbp.core.dtos.SysLog;
import cn.halower.scbp.core.utils.SysLogUtil;
import cn.halower.scbp.demos.consumelog.services.LoggerService;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Aspect
@Component
public class SysLoggerAspect {

   @Autowired
   private LoggerService loggerService;
    @Pointcut("@annotation(cn.halower.scbp.core.annotations.ScbpLogger)")
    public void loggerPointCut() {
    }

    @Before("loggerPointCut()")
    public void sendSysLog(JoinPoint joinPoint) {
        SysLog log = SysLogUtil.buildLogger(joinPoint);
        log.setUsername("scbp");
        loggerService.log(log);
    }
}
