package com.manager.pub.bean;

import com.google.gson.annotations.Expose;

public class UploadForm {
	@Expose
	private long uploadId;//上传id
	@Expose
	private long userId;//上传人id
	@Expose
	private String userName;//上传人姓名
	@Expose
	private long editId;//制作文件人id
	@Expose
	private String editName;//制作文件人姓名
	@Expose
	private String uploadName;//上传文件名
	@Expose
	private String playPath;//播放地址
	@Expose
	private String fileCreatetime;//文件创建时间
	@Expose
	private String showPath;//文件预览地址
	@Expose
	private String uploadTime;//上传时间
	@Expose
	private String fileState;//上传文件状态 A-有效；U-无效；F-过期
	@Expose
	private long tree1Id;//上传人上级部门id
	@Expose
	private long tree2Id;//上传人部门id
	@Expose
	private String treeName;//上传人部门名
	@Expose
	private String fileStats;//文件重要性
	@Expose
	private String fileRemark;//文件备注说明
	@Expose
	private String ipAddr;//上传人IP地址
	@Expose
	private String fileSavePath;//文件保存查看前缀地址
	@Expose
	private String flvPath;		//flv播放地址
	@Expose
	private String policeCode;	//接警编号
	@Expose
	private String policeDesc;	//接警描述
	@Expose
	private String takeTime;	//录制时间
	@Expose
	private String policeTime;	//接警时间
	@Expose
	private Long useTime;	//到达时间 = 接警时间 - 录制时间
	@Expose
	private Long policeType;//接警类型
	@Expose
	private String typeName;//接警类型

	public String getPoliceCode() {
		return policeCode;
	}

	public void setPoliceCode(String policeCode) {
		this.policeCode = policeCode;
	}

	public String getPoliceDesc() {
		return policeDesc;
	}

	public void setPoliceDesc(String policeDesc) {
		this.policeDesc = policeDesc;
	}

	public String getTakeTime() {
		return takeTime;
	}

	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}

	public String getPoliceTime() {
		return policeTime;
	}

	public void setPoliceTime(String policeTime) {
		this.policeTime = policeTime;
	}

	public UploadForm(){}

	public String getFlvPath() {
		return flvPath;
	}

	public void setFlvPath(String flvPath) {
		this.flvPath = flvPath;
	}

	public String getFileSavePath() {
		return fileSavePath;
	}

	public void setFileSavePath(String fileSavePath) {
		this.fileSavePath = fileSavePath;
	}

	public long getUploadId() {
		return uploadId;
	}
	public void setUploadId(long uploadId) {
		this.uploadId = uploadId;
	}
	public long getUserId() {
		return userId;
	}
	public void setUserId(long userId) {
		this.userId = userId;
	}
	public long getEditId() {
		return editId;
	}
	public void setEditId(long editId) {
		this.editId = editId;
	}
	public String getUploadName() {
		return uploadName;
	}
	public void setUploadName(String uploadName) {
		this.uploadName = uploadName;
	}
	public String getPlayPath() {
		return playPath;
	}
	public void setPlayPath(String playPath) {
		this.playPath = playPath;
	}
	public String getFileCreatetime() {
		return fileCreatetime;
	}
	public void setFileCreatetime(String fileCreatetime) {
		this.fileCreatetime = fileCreatetime;
	}
	public String getShowPath() {
		return showPath;
	}
	public void setShowPath(String showPath) {
		this.showPath = showPath;
	}
	public String getUploadTime() {
		return uploadTime;
	}
	public void setUploadTime(String uploadTime) {
		this.uploadTime = uploadTime;
	}
	public String getFileState() {
		return fileState;
	}
	public void setFileState(String fileState) {
		this.fileState = fileState;
	}
	public long getTree1Id() {
		return tree1Id;
	}
	public void setTree1Id(long tree1Id) {
		this.tree1Id = tree1Id;
	}
	public long getTree2Id() {
		return tree2Id;
	}
	public void setTree2Id(long tree2Id) {
		this.tree2Id = tree2Id;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEditName() {
		return editName;
	}

	public void setEditName(String editName) {
		this.editName = editName;
	}

	public String getTreeName() {
		return treeName;
	}

	public void setTreeName(String treeName) {
		this.treeName = treeName;
	}

	public String getFileStats() {
		return fileStats;
	}

	public void setFileStats(String fileStats) {
		this.fileStats = fileStats;
	}

	public String getFileRemark() {
		return fileRemark;
	}

	public void setFileRemark(String fileRemark) {
		this.fileRemark = fileRemark;
	}

	public String getIpAddr() {
		return ipAddr;
	}

	public void setIpAddr(String ipAddr) {
		this.ipAddr = ipAddr;
	}

	public Long getUseTime() {
		return useTime;
	}

	public void setUseTime(Long useTime) {
		this.useTime = useTime;
	}

	public Long getPoliceType() {
		return policeType;
	}

	public void setPoliceType(Long policeType) {
		this.policeType = policeType;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
}
