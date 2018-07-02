package cn.halower.scbp.core.utils;

import cn.halower.scbp.core.annotations.ScbpLogger;
import cn.halower.scbp.core.entities.SysLog;
import com.alibaba.fastjson.JSON;
import lombok.var;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.reflect.MethodSignature;

import java.util.Date;

public class SysLogUtil {
    /*
    * method: buildLog
    * function: 构建日志对象
    * */

    public static SysLog buildLogger(JoinPoint joinPoint) {
        var signature = (MethodSignature) joinPoint.getSignature();
        var method = signature.getMethod();
        SysLog sysLog = new SysLog();
        ScbpLogger sysLogger = method.getAnnotation(ScbpLogger.class);

        //get value
        if(sysLogger != null) sysLog.setOperation(sysLogger.value());

        //method
        var className = joinPoint.getTarget().getClass().getName();
        var methodName = signature.getName();
        sysLog.setMethod(className + "." + methodName + "()");

        // params
        var args = joinPoint.getArgs();
        var params="";
        for(Object o:args){
            params+=JSON.toJSONString(o);
        }
        if(!StringUtils.isEmpty(params))sysLog.setParams(params);

        sysLog.setCreateDate(new Date());
        return sysLog;
    }
}
