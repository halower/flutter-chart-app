package cn.halower.scbp.core.entities;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
public abstract class ModificationAudited<T> {
    private Date lastModificationTime;
    private T lastModifierUserId;
}
