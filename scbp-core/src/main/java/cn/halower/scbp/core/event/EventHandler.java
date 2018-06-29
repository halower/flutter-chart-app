package cn.halower.scbp.core.event;

public interface EventHandler<T extends DomainEvent> {
     void handle(T evnet);
}
