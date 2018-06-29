package cn.halower.scbp.core.event;

import java.io.Serializable;
import java.util.Date;

public interface DomainEvent extends Serializable {
    Date triggerTime();
}
