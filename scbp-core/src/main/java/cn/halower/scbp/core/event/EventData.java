package cn.halower.scbp.core.event;

import java.io.Serializable;
import java.util.Date;

public interface EventData extends Serializable {
    default Date eventTime () {
        return new Date();
    };
}
