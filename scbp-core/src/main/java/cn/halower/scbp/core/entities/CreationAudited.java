package cn.halower.scbp.core.entities;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public abstract class CreationAudited<T> {
    private Date creationTime;
    private T creatorUserId;
}
