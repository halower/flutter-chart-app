package cn.halower.models;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@Data
@ApiModel("Demo类")
public class Demo {
    @ApiModelProperty("ID")
    @NonNull
    private int id;
    @ApiModelProperty("名称")
    @NonNull
    private String name;

    public Demo(int id, String name) {
        this.id =id;
        this.name= name;
    }
}
