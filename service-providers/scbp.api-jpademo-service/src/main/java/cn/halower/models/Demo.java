package cn.halower.models;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.*;

@AllArgsConstructor
@Data
@ApiModel("Demo类")
public class Demo {
    @ApiModelProperty("ID")
    @NonNull
    private Long id;
    @ApiModelProperty("名称")
    @NonNull
    private String name;
}
