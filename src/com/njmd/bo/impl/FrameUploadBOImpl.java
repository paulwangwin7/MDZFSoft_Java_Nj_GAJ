package com.njmd.bo.impl;

import java.util.ArrayList;
import java.util.List;

import com.manager.pub.bean.Page;
import com.manager.pub.bean.PoliceTypeForm;
import com.manager.pub.bean.SystemConfig;
import com.manager.pub.bean.UploadForm;
import com.manager.pub.util.DateUtils;
import com.manager.pub.util.FileUtils;
import com.njmd.bo.FrameUploadBO;
import com.njmd.dao.FrameUploadDAO;
import com.njmd.pojo.FrameUpload;

public class FrameUploadBOImpl implements FrameUploadBO {
	private FrameUploadDAO frameUploadDAO;

	public Page mineUploadList(String beginTime,String endTime,String fileRemark,String policeCode,
			String policeDesc,String nullRemark,String nullPoliceCode,String nullPoliceDesc,
			String treeId, String parentTreeId, String uploadUserId, Page page) {
		// TODO Auto-generated method stub
		return frameUploadDAO.mineUploadList(beginTime,endTime,fileRemark,policeCode,policeDesc,nullRemark,nullPoliceCode,nullPoliceDesc,
				treeId, parentTreeId, uploadUserId, page);
	}

	public int uploadDel(List<UploadForm> uploadList, boolean deleteStats) {
		// TODO Auto-generated method stub
		for(UploadForm uploadForm: uploadList) {
			FrameUpload frameUpload = frameUploadDAO.findById(uploadForm.getUploadId());
			frameUpload.setFileState("F");//删除过期
			new FileUtils().deleteFile(SystemConfig.getSystemConfig().getFileRoot()+uploadForm.getPlayPath());
			frameUploadDAO.attachDirty(frameUpload);
		}
		return 0;
	}

	public UploadForm uploadDetail(Long uploadId) {
		// TODO Auto-generated method stub
		return frameUploadDAO.uploadDetail(uploadId);
	}

	public List<PoliceTypeForm> policeTypeAll() {
		// TODO Auto-generated method stub
		return frameUploadDAO.policeTypeAll();
	}

	public Page uploadListByTree(String uploadName, String treeId,
			String parentTreeId, String beginTime, String endTime,
			String uploadUserId, String fileCreateUserId, String fileStats,
			String fileRemark, String takeTime_begin, String takeTime_end,
			String policeCode, String policeTime_begin, String policeTime_end, String policeDesc,
			String useTime_begin, String useTime_end, Long policeType, Page page,
			String showTree, String nullRemark, String nullPoliceCode, String nullPoliceDesc) {
		// TODO Auto-generated method stub
		return frameUploadDAO.uploadListByTree(uploadName, treeId, parentTreeId, beginTime, endTime, uploadUserId, fileCreateUserId, fileStats, fileRemark,
				takeTime_begin, takeTime_end, policeCode, policeTime_begin, policeTime_end, policeDesc, useTime_begin, useTime_end, policeType, page,
				showTree, nullRemark, nullPoliceCode, nullPoliceDesc);
	}

	public Page uploadListByAdmin(String uploadName, String treeId,
			String parentTreeId, String beginTime, String endTime,
			String uploadUserId, String fileCreateUserId, String fileStats,
			String fileRemark, String takeTime_begin, String takeTime_end,
			String policeCode, String policeTime_begin, String policeTime_end, String policeDesc,
			String useTime_begin, String useTime_end, Long policeType, Page page,
			String showTree, String nullRemark, String nullPoliceCode, String nullPoliceDesc) {
		// TODO Auto-generated method stub
		return frameUploadDAO.uploadListByAdmin(uploadName, treeId, parentTreeId, beginTime, endTime, uploadUserId, fileCreateUserId, fileStats, fileRemark,
				takeTime_begin, takeTime_end, policeCode, policeTime_begin, policeTime_end, policeDesc, useTime_begin, useTime_end, policeType, page, showTree, nullRemark, nullPoliceCode, nullPoliceDesc);
	}

	@Override
	public Page uploadListTable(String beginTime, String endTime, Long treeId,
			Page page) {
		// TODO Auto-generated method stub
		return frameUploadDAO.uploadListTable(beginTime, endTime, treeId, page);
	}

	public int uploadRemark(Long uploadId, String remark, String policeCode, String policeTime, String policeDesc, String takeTime, Long useTime, Long policeType) {
		// TODO Auto-generated method stub
		FrameUpload frameUpload = frameUploadDAO.findById(uploadId);
		frameUpload.setFileRemark(remark);
		frameUpload.setPoliceCode(policeCode);
		frameUpload.setPoliceDesc(policeDesc);
		frameUpload.setPoliceTime(policeTime);
		frameUpload.setTakeTime(takeTime);
		frameUpload.setUseTime(useTime);
		frameUpload.setPoliceType(policeType);
		return frameUploadDAO.attachDirty(frameUpload);
	}

	public int uploadSave(UploadForm uploadForm) {
		int saveResult;//
		// TODO Auto-generated method stub
		FrameUpload frameUpload = new FrameUpload();
		frameUpload.setUserId(uploadForm.getUserId());
		frameUpload.setEditId(uploadForm.getEditId());
		frameUpload.setUploadName(uploadForm.getUploadName());
		frameUpload.setPlayPath(uploadForm.getPlayPath());
		frameUpload.setShowPath(uploadForm.getShowPath());
		frameUpload.setFileCreatetime(uploadForm.getFileCreatetime());
		frameUpload.setFileStats("0");
		frameUpload.setUploadTime(DateUtils.getChar14());
		frameUpload.setFileState(uploadForm.getFileState());
		frameUpload.setTree2Id(uploadForm.getTree2Id());
		frameUpload.setTree1Id(uploadForm.getTree1Id());
		frameUpload.setFileRemark(uploadForm.getFileRemark());
		frameUpload.setIpAddr(uploadForm.getIpAddr());
		frameUpload.setRealPath(uploadForm.getFileSavePath());
		frameUpload.setFlvPath(uploadForm.getFlvPath());
		frameUpload.setTakeTime(uploadForm.getTakeTime());
		saveResult = frameUploadDAO.save(frameUpload);
		return saveResult;
	}

	public int uploadStats(Long uploadId, String fileStats) {
		// TODO Auto-generated method stub
		FrameUpload frameUpload = frameUploadDAO.findById(uploadId);
		frameUpload.setFileStats(fileStats);
		return frameUploadDAO.attachDirty(frameUpload);
	}

	@SuppressWarnings("unchecked")
	public List uploadStatsList(String[] uploadIdArr) {
		// TODO Auto-generated method stub
		List list = null;//list.get(0)-重要性文件list； list.get(1)-非重要性文件list；
		List<UploadForm> statsList = null;
		List<UploadForm> unStatsList = null;
		for(String uploadId: uploadIdArr) {
			UploadForm uploadForm = frameUploadDAO.uploadDetail(new Long(uploadId));
			if (uploadForm.getFileStats().equals("1")) {//数据库中该字段 文件上传重要性 0-普通；1-重要
				if(statsList==null) {
					statsList = new ArrayList<UploadForm>();
				}
				statsList.add(uploadForm);
			} else {
				if(unStatsList==null) {
					unStatsList = new ArrayList<UploadForm>();
				}
				unStatsList.add(uploadForm);
			}
		}
		list = new ArrayList();
		list.add(statsList);
		list.add(unStatsList);
		return list;
	}

	@Override
	public List<UploadForm> statistic(Long treeId, String beginTime, String endTime, String useTimeBegin, String useTimeEnd) {
		// TODO Auto-generated method stub
		return frameUploadDAO.statistic(treeId, beginTime, endTime, useTimeBegin, useTimeEnd);
	}

	@Override
	public Page statisticDetail(Long treeId, Long typeId, String beginTime, String endTime, String useTimeBegin, String useTimeEnd, Page page) {
		// TODO Auto-generated method stub
//		return frameUploadDAO.statistic(treeId, beginTime, endTime, useTimeBegin, useTimeEnd);
		return frameUploadDAO.statisticDetail(treeId, typeId, beginTime, endTime, useTimeBegin, useTimeEnd, page);
	}

	@Override
	public List<UploadForm> contrast(String uploadTimeBegin, String uploadTimeEnd, Long treeId, Long policeType) {
		// TODO Auto-generated method stub
		return frameUploadDAO.contrast(uploadTimeBegin, uploadTimeEnd, treeId, policeType);
	}

	public List<UploadForm> expiredSysDekList(int expiredDays) {
		// TODO Auto-generated method stub
		return frameUploadDAO.expiredSysDekList(expiredDays);
	}

	public List<UploadForm> expiredUploadAllList(String expired) {
		// TODO Auto-generated method stub
		return frameUploadDAO.expiredUploadAllList(expired);
	}

	public void setFrameUploadDAO(FrameUploadDAO frameUploadDAO) {
		this.frameUploadDAO = frameUploadDAO;
	}
}
