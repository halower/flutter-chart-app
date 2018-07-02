package cn.halower.scbp.core.entities;

import lombok.Data;

import java.util.Date;

@Data
public class SysLog{
    private Long id;
    //用户名
    private String username;
    //用户操作
    private String operation;
    //请求方法
    private String method;
    //请求参数
    private String params;
    //创建时间
    private Date createDate;
}