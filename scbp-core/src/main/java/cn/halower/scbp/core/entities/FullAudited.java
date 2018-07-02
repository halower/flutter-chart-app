package cn.halower.scbp.core.entities;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Setter
@Getter
public abstract class FullAudited <T>{
    private Date creationTime;
    private T creatorUserId;
    private Date lastModificationTime;
    private T lastModifierUserId;
    private T  deleterUserId;
    Date deletionTime;
}
