package cn.halower.scbp.core.entities;

import java.util.Date;

public abstract class DeletionAudited<T> {
    private T  deleterUserId;
    Date deletionTime;
}
