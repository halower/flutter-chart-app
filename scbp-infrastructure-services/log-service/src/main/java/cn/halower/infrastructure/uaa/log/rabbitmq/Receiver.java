package cn.halower.infrastructure.uaa.log.rabbitmq;

import cn.halower.infrastructure.log.entitys.SysLog;
import cn.halower.infrastructure.log.services.LogService;
import cn.halower.infrastructure.uaa.log.services.LogService;
import com.alibaba.fastjson.JSON;
import lombok.var;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.concurrent.CountDownLatch;

@Component
public class Receiver {
    private CountDownLatch latch = new CountDownLatch(1);

    @Autowired
    LogService logService;

    public void receiveMessage(String message) {
        var sysLog=  JSON.parseObject(message,SysLog.class);
        logService.saveLogger(sysLog);
        latch.countDown();
    }
}
