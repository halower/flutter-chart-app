package cn.halower.scbp.core.entities;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public abstract class Audited<T> {
    private Date creationTime;
    private T creatorUserId;
    private Date lastModificationTime;
    private T lastModifierUserId;
}
