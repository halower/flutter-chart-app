package cn.halower.scbp.core.entities;

import cn.halower.scbp.core.event.EventBus;

public abstract class AggregateRoot {
    protected EventBus eventBus;
    public void setEventBus(EventBus eventBus) {
        if (this.eventBus != null)
            throw new IllegalStateException("事件总线已经设置了,有可能是代码逻辑错误");
        this.eventBus = eventBus;
    }
}
