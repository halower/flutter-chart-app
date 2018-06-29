package cn.halower.scbp.core.event;

public interface EventHandler<T extends EventData> {
     void handle(T evnet);
}
