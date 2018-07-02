package cn.halower.scbp.core.entities;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public abstract class Entity<T> {
    private T id;
}
