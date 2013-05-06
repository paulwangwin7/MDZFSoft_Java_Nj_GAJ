package com.manager.pub.bean;

import com.google.gson.annotations.Expose;

public class PoliceTypeForm {
	@Expose
	private long typeId;
	@Expose
	private String typeName;

	public long getTypeId() {
		return typeId;
	}
	public void setTypeId(long typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
