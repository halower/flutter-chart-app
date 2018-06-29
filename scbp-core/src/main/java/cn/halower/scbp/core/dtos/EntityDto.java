package cn.halower.scbp.core.dtos;

import lombok.Data;

import java.io.Serializable;


@Data
public class EntityDto<T> implements Serializable {
  private int code = 0;
  private String msg = "";
  private T data;

   public static EntityDto onSuccess (Object data) {
       EntityDto res  = new EntityDto();
       res.data = data;
       return res;
   }

    @Override
    public String toString() {
        return "EntityDto {" +
                "code=" + code +
                ", msg='" + msg + '\'' +
                ", data=" + data +
                '}';

    }
}
