package cn.halower.infrastructure.uaa.log.repository;

import cn.halower.infrastructure.log.entitys.SysLog;
import org.springframework.data.jpa.repository.JpaRepository;

public interface LogRepository  extends JpaRepository<SysLog, Long> {
}
