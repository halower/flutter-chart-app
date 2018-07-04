package cn.halower.scbp.core.event;

import com.google.common.collect.Lists;
import lombok.var;

import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

public class EventBus {
    private static ConcurrentHashMap<Class<? extends EventData>, List<EventHandler<? extends EventData>>> handlerMap = new ConcurrentHashMap<>();

    public synchronized static <T extends EventData> void register(Class<T> domainEventClazz, EventHandler<T> handler) {
        var eventHandlers = handlerMap.get(domainEventClazz);
        if (eventHandlers == null) {
            eventHandlers = Lists.newArrayList();
        }
        eventHandlers.add(handler);
        handlerMap.put(domainEventClazz, eventHandlers);
    }

    @SuppressWarnings("unchecked")
    public static <T extends EventData> void trigger(final T domainEvent) {
        if (domainEvent == null) {
            throw new IllegalArgumentException("事件参数不能为空");
        }
        var handlers = handlerMap.get(domainEvent.getClass());
        if (handlers != null && !handlers.isEmpty()) {
            for (EventHandler handler : handlers) {
                handler.handle(domainEvent);
            }
        }
    }
}
