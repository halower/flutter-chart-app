package cn.halower.infrastructure.uaa.log.services;

import cn.halower.infrastructure.log.entitys.SysLog;
import cn.halower.infrastructure.log.repository.LogRepository;
import cn.halower.infrastructure.uaa.log.repository.LogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LogService {

    @Autowired
    private LogRepository logRepository;

    public void saveLogger(SysLog sysLog){
      logRepository.save(sysLog);
    }
}

