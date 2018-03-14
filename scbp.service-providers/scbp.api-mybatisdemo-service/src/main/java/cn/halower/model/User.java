package cn.halower.model;

import lombok.Data;


@Data
public class User {
	private Long id;

	private String name;

	@Override
	public String toString() {
		return getId() + "," + getName();
	}
	
}
