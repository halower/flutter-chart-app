package cn.halower.scbp.demos.consumelog.services;

import cn.halower.scbp.core.dtos.SysLog;
import cn.halower.scbp.demos.consumelog.configs.RabbitMqConfig;
import com.alibaba.fastjson.JSON;
import org.springframework.amqp.core.AmqpTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoggerService {

    @Autowired
    private AmqpTemplate rabbitTemplate;

    public void log(SysLog sysLog){
        rabbitTemplate.convertAndSend(RabbitMqConfig.queueName, JSON.toJSONString(sysLog));
    }
}
