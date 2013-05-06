package com.njmd.pojo;

/**
 * FrameLog entity.
 * 
 * @author MyEclipse Persistence Tools
 */

public class FramePoliceType implements java.io.Serializable {
	// Fields
	private Long typeId;
	private String typeName;

	// Constructors

	/** default constructor */
	public FramePoliceType() {
	}

	/** minimal constructor */
	public FramePoliceType(Long typeId) {
		this.typeId = typeId;
	}

	/** full constructor */
	public FramePoliceType(Long typeId, String typeName) {
		this.typeId = typeId;
		this.typeName = typeName;
	}

	// Property accessors

	public Long getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}

	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}