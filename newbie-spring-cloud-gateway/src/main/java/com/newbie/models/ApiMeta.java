package com.newbie.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Entity;
import javax.persistence.Id;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class ApiMeta {
    /**
     * 服务名
     */
    @Id
  private String serviceName;
    /**
     * 服务接口说明
     */
  private String description;
    /**
     * 服务元数据地址
     */
  private String docJsonUrl;
    /**
     * 是否私有
     */
  private Boolean isPrivate;
}
