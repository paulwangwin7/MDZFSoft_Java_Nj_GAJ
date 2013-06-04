package com.njmd.dao;

import com.manager.pub.bean.Page;
import com.manager.pub.bean.PoliceTypeForm;
import com.manager.pub.bean.UploadForm;
import com.manager.pub.util.Constants;
import com.njmd.dao.BaseHibernateDAO;
import com.njmd.pojo.FramePoliceType;
import com.njmd.pojo.FrameTree;
import com.njmd.pojo.FrameUpload;
import com.njmd.pojo.FrameUser;

import java.util.ArrayList;
import java.util.List;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Example;

/**
 * A data access object (DAO) providing persistence and search support for
 * FrameUpload entities. Transaction control of the save(), update() and
 * delete() operations can directly support Spring container-managed
 * transactions or they can be augmented to handle user-managed Spring
 * transactions. Each of these methods provides additional information for how
 * to configure it for the desired type of transaction control.
 * 
 * @see com.njmd.pojo.FrameUpload
 * @author MyEclipse Persistence Tools
 */

public class FrameUploadDAO extends BaseHibernateDAO {
	private static final Log log = LogFactory.getLog(FrameUploadDAO.class);
	// property constants
	public static final String USER_ID = "userId";
	public static final String EDIT_ID = "editId";
	public static final String UPLOAD_NAME = "uploadName";
	public static final String PLAY_PATH = "playPath";
	public static final String FILE_CREATETIME = "fileCreatetime";
	public static final String SHOW_PATH = "showPath";
	public static final String UPLOAD_TIME = "uploadTime";
	public static final String FILE_STATE = "fileState";
	public static final String TREE2_ID = "tree2Id";
	public static final String TREE1_ID = "tree1Id";
	public static final String TREE_NAME = "treeName";
	public static final String FILE_STATS = "fileStats";
	public static final String FILE_REMARK = "fileRemark";
	public static final String IP_ADDR = "ipAddr";
	public static final String REAL_PATH = "realPath";
	public static final String FLV_PATH = "flvPath";
	public static final String USE_TIME = "useTime";
	public static final String POLICE_TYPE = "policeType";

	@SuppressWarnings("finally")
	public int save(FrameUpload transientInstance) {
		int saveResult = Constants.ACTION_FAILED;
		log.debug("saving FrameUpload instance");
		Session session = getSession();
		try {
			session.getTransaction().begin();
			session.save(transientInstance);
			session.getTransaction().commit();
			log.debug("save successful");
			saveResult = Constants.ACTION_SUCCESS;
		} catch (RuntimeException re) {
			log.error("save failed", re);
			session.getTransaction().rollback();
//			throw re;
		} finally {
			session.close();
			return saveResult;
		}
	}

	@SuppressWarnings("finally")
	public int delete(FrameUpload persistentInstance) {
		int deleteResult = Constants.ACTION_FAILED;
		log.debug("deleting FrameUpload instance");
		Session session = getSession();
		try {
			session.getTransaction().begin();
			session.delete(persistentInstance);
			session.getTransaction().commit();
			log.debug("delete successful");
			deleteResult = Constants.ACTION_SUCCESS;
		} catch (RuntimeException re) {
			log.error("delete failed", re);
			session.getTransaction().rollback();
//			throw re;
		} finally {
			session.close();
			return deleteResult;
		}
	}

	@SuppressWarnings("finally")
	public FrameUpload findById(java.lang.Long id) {
		FrameUpload instance = null;
		log.debug("getting FrameUpload instance with id: " + id);
		Session session = getSession();
		try {
			session.clear();
			instance = (FrameUpload) session.get("com.njmd.pojo.FrameUpload", id);
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
			session.close();
			return instance;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public List findByExample(FrameUpload instance) {
		List results = null;
		log.debug("finding FrameUpload instance by example");
		Session session = getSession();
		try {
			session.clear();
			results = session.createCriteria("com.njmd.pojo.FrameUpload").add(Example.create(instance)).list();
			log.debug("find by example successful, result size: " + results.size());
		} catch (RuntimeException re) {
			log.error("find by example failed", re);
//			throw re;
		} finally {
			session.close();
			return results;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public List findByProperty(String propertyName, Object value) {
		List results = null;
		log.debug("finding FrameUpload instance with property: " + propertyName + ", value: " + value);
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FrameUpload as model where model." + propertyName + "= ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, value);
			results = queryObject.list();
		} catch (RuntimeException re) {
			log.error("find by property name failed", re);
//			throw re;
		} finally {
			session.close();
			return results;
		}
	}

	@SuppressWarnings("unchecked")
	public List findByUserId(Object userId) {
		return findByProperty(USER_ID, userId);
	}

	@SuppressWarnings("unchecked")
	public List findByEditId(Object editId) {
		return findByProperty(EDIT_ID, editId);
	}

	@SuppressWarnings("unchecked")
	public List findByUploadName(Object uploadName) {
		return findByProperty(UPLOAD_NAME, uploadName);
	}

	@SuppressWarnings("unchecked")
	public List findByPlayPath(Object playPath) {
		return findByProperty(PLAY_PATH, playPath);
	}

	@SuppressWarnings("unchecked")
	public List findByFileCreatetime(Object fileCreatetime) {
		return findByProperty(FILE_CREATETIME, fileCreatetime);
	}

	@SuppressWarnings("unchecked")
	public List findByShowPath(Object showPath) {
		return findByProperty(SHOW_PATH, showPath);
	}

	@SuppressWarnings("unchecked")
	public List findByUploadTime(Object uploadTime) {
		return findByProperty(UPLOAD_TIME, uploadTime);
	}

	@SuppressWarnings("unchecked")
	public List findByFileState(Object fileState) {
		return findByProperty(FILE_STATE, fileState);
	}

	@SuppressWarnings("unchecked")
	public List findByTree2Id(Object tree2Id) {
		return findByProperty(TREE2_ID, tree2Id);
	}

	@SuppressWarnings("unchecked")
	public List findByTree1Id(Object tree1Id) {
		return findByProperty(TREE1_ID, tree1Id);
	}

	@SuppressWarnings("unchecked")
	public List findByTreeName(Object treeName) {
		return findByProperty(TREE_NAME, treeName);
	}

	@SuppressWarnings("unchecked")
	public List findByFileStats(Object fileStats) {
		return findByProperty(FILE_STATS, fileStats);
	}

	@SuppressWarnings("unchecked")
	public List findByFileRemark(Object fileRemark) {
		return findByProperty(FILE_REMARK, fileRemark);
	}

	@SuppressWarnings("unchecked")
	public List findByIpAddr(Object ipAddr) {
		return findByProperty(IP_ADDR, ipAddr);
	}

	@SuppressWarnings("unchecked")
	public List findByRealPath(Object realPath) {
		return findByProperty(REAL_PATH, realPath);
	}

	@SuppressWarnings("unchecked")
	public List findByFlvPath(Object flvPath) {
		return findByProperty(FLV_PATH, flvPath);
	}

	@SuppressWarnings("unchecked")
	public List findByUseTime(Object useTime) {
		return findByProperty(USE_TIME, useTime);
	}

	@SuppressWarnings("unchecked")
	public List findByPoliceType(Object policeType) {
		return findByProperty(POLICE_TYPE, policeType);
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public List findAll() {
		List results = null;
		log.debug("finding all FrameUpload instances");
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FrameUpload";
			Query queryObject = session.createQuery(queryString);
			results = queryObject.list();
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		} finally {
			session.close();
			return results;
		}
	}

	@SuppressWarnings("finally")
	public FrameUpload merge(FrameUpload detachedInstance) {
		FrameUpload result = null;
		log.debug("merging FrameUpload instance");
		Session session = getSession();
		try {
			session.getTransaction().begin();
			result = (FrameUpload) session.merge(detachedInstance);
			session.getTransaction().commit();
			log.debug("merge successful");
		} catch (RuntimeException re) {
			log.error("merge failed", re);
			session.getTransaction().rollback();
//			throw re;
		} finally {
			session.close();
			return result;
		}
	}

	@SuppressWarnings("finally")
	public int attachDirty(FrameUpload instance) {
		int attachResult = Constants.ACTION_FAILED;
		log.debug("attaching dirty FrameUpload instance");
		Session session = getSession();
		try {
			session.getTransaction().begin();
			session.saveOrUpdate(instance);
			session.getTransaction().commit();
			log.debug("attach successful");
			attachResult = Constants.ACTION_SUCCESS;
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			session.getTransaction().rollback();
//			throw re;
		} finally {
			session.close();
			return attachResult;
		}
	}

	public void attachClean(FrameUpload instance) {
		log.debug("attaching clean FrameUpload instance");
		Session session = getSession();
		try {
			session.getTransaction().begin();
			session.lock(instance, LockMode.NONE);
			session.getTransaction().commit();
			log.debug("attach successful");
		} catch (RuntimeException re) {
			log.error("attach failed", re);
			session.getTransaction().rollback();
//			throw re;
		} finally {
			session.close();
		}
	}

	@SuppressWarnings("finally")
	public UploadForm uploadDetail(java.lang.Long uploadId) {
		UploadForm uploadForm = null;
		Session session = getSession();
		try {
			session.clear();
			FrameUpload instance = (FrameUpload) session.get("com.njmd.pojo.FrameUpload", uploadId);
			if(instance!=null) {
				uploadForm = setUploadFormByFrameUpload(new UploadForm(), instance);
			}
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
			session.close();
			return uploadForm;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public Page uploadListByTree(String uploadName, String treeId, String parentTreeId,
			String beginTime, String endTime, String uploadUserId,
			String fileCreateUserId, String fileStats, String fileRemark,
			String takeTime_begin, String takeTime_end, String policeCode,
			String policeTime_begin, String policeTime_end, String policeDesc,
			String useTime_begin, String useTime_end, Long policeType, Page page,
			String showTree, String nullRemark, String nullPoliceCode, String nullPoliceDesc,
			String nullPoliceTime) {
		Session session = getSession();
		try {
			session.clear();
			StringBuffer queryString = new StringBuffer("from FrameUpload as model");
			queryString.append(" where model.fileState = 'A'");
			if(treeId.equals(parentTreeId)) {
				queryString.append(" and model.tree1Id = ?");
			} else {
				queryString.append(" and model.tree2Id = ?");
			}
			if(policeType!=null && policeType!=0) {
				if(policeType==-1) {
					queryString.append(" and model.policeType is null");
				} else {
					queryString.append(" and model.policeType = "+policeType);
				}
			}
			if(useTime_begin.equals("") || useTime_end.equals("")) {

			} else {
				queryString.append(" and model.useTime >='"+useTime_begin+"' and model.useTime <='"+useTime_end+"'");
			}
			if(takeTime_begin.equals("") || takeTime_end.equals("")) {

			} else {
				queryString.append(" and model.takeTime >='"+takeTime_begin+"' and model.takeTime <='"+takeTime_end+"'");
			}
			if(!policeCode.equals("") && nullPoliceCode.equals("")) {
				queryString.append(" and model.policeCode like '%"+policeCode+"%'");
			}
			if(!nullPoliceCode.equals("")) {
				queryString.append(" and model.policeCode is null");
			}
			if(nullPoliceTime.equals("")) {
				if(policeTime_begin.equals("") || policeTime_end.equals("")) {
	
				} else {
					queryString.append(" and model.policeTime >='"+policeTime_begin+"' and model.policeTime <='"+policeTime_end+"'");
				}
			} else {
				queryString.append(" and model.policeTime is null");
			}
			if(!policeDesc.equals("") && nullPoliceDesc.equals("")) {
				queryString.append(" and model.policeDesc like '%"+policeDesc+"%'");
			}
			if(!nullPoliceDesc.equals("")) {
				queryString.append(" and model.policeDesc is null");
			}
			if(beginTime.equals("") || endTime.equals("")) {

			} else {
				queryString.append(" and model.uploadTime >=? and model.uploadTime <=?");
			}
			if(!uploadUserId.equals("")) {
				queryString.append(" and model.userId = ?");
			}
			if(!fileCreateUserId.equals("")) {
				queryString.append(" and model.editId = ?");
			}
			if(!fileStats.equals("")) {
				queryString.append(" and model.fileStats = ?");
			}
			if(!fileRemark.equals("") && nullRemark.equals("")) {
				queryString.append(" and model.fileRemark like ?");
			}
			if(!nullRemark.equals("")) {
				queryString.append(" and model.fileRemark is null");
			}
			if(!uploadName.equals("")) {
				queryString.append(" and model.uploadName like ?");
			}
			if(!showTree.equals("")) {
				queryString.append(" and model.tree2Id = "+showTree);
			}
			queryString.append(" and (model.fileState!='F' or model.fileState!='U')");
			queryString.append(" order by model.uploadId desc");
			Query queryObject = session.createQuery(queryString.toString());
			int parameterIndex = 0;
			queryObject.setParameter(parameterIndex++, new Long(treeId));
			if(beginTime.equals("") || endTime.equals("")) {

			} else {
				queryObject.setParameter(parameterIndex++, beginTime);
				queryObject.setParameter(parameterIndex++, endTime);
			}
			if(!uploadUserId.equals("")) {
				queryObject.setParameter(parameterIndex++, new Long(uploadUserId));
			}
			if(!fileCreateUserId.equals("")) {
				queryObject.setParameter(parameterIndex++, new Long(fileCreateUserId));
			}
			if(!fileStats.equals("")) {
				queryObject.setParameter(parameterIndex++, fileStats);
			}
			if(!fileRemark.equals("") && nullRemark.equals("")) {
				queryObject.setParameter(parameterIndex++, "%"+fileRemark+"%");
			}
			if(!uploadName.equals("")) {
				queryObject.setParameter(parameterIndex++, "%"+uploadName+"%");
			}
			page.setTotal(queryObject.list().size());
			queryObject.setFirstResult((page.getPageCute()-1)*page.getDbLine());
			queryObject.setMaxResults(page.getDbLine());
			List<UploadForm> uploadList = null;
			List querylist = queryObject.list();
			if(querylist!=null && querylist.size()>0) {
				uploadList = new ArrayList<UploadForm>();
				for(Object obj: querylist) {
					uploadList.add(setUploadFormByFrameUpload(new UploadForm(), (FrameUpload)obj));
				}
			}
			page.setListObject(uploadList);
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
			session.close();
			return page;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public Page uploadListByAdmin(String uploadName, String treeId, String parentTreeId,
			String beginTime, String endTime, String uploadUserId,
			String fileCreateUserId, String fileStats, String fileRemark,
			String takeTime_begin, String takeTime_end, String policeCode,
			String policeTime_begin, String policeTime_end, String policeDesc,
			String useTime_begin, String useTime_end, Long policeType, Page page,
			String showTree, String nullRemark, String nullPoliceCode, String nullPoliceDesc,
			String nullPoliceTime) {
		Session session = getSession();
		try {
			session.clear();
			StringBuffer queryString = new StringBuffer("from FrameUpload as model");
			queryString.append(" where model.fileState = 'A'");
			if(policeType!=null && policeType!=0) {
				queryString.append(" and model.policeType = "+policeType);
			}
			if(beginTime.equals("") || beginTime.equals("")) {

			} else {
				queryString.append(" and model.uploadTime >=? and model.uploadTime <=?");
			}
			if(useTime_begin.equals("") || useTime_end.equals("")) {

			} else {
				queryString.append(" and model.useTime >='"+useTime_begin+"' and model.useTime <='"+useTime_end+"'");
			}
			if(takeTime_begin.equals("") || takeTime_end.equals("")) {

			} else {
				queryString.append(" and model.takeTime >='"+takeTime_begin+"' and model.takeTime <='"+takeTime_end+"'");
			}
			if(!policeCode.equals("") && nullPoliceCode.equals("")) {
				queryString.append(" and model.policeCode like '%"+policeCode+"%'");
			}
			if(!nullPoliceCode.equals("")) {
				queryString.append(" and model.policeCode is null");
			}
			if(nullPoliceTime.equals("")) {
				if(policeTime_begin.equals("") || policeTime_end.equals("")) {
	
				} else {
					queryString.append(" and model.policeTime >='"+policeTime_begin+"' and model.policeTime <='"+policeTime_end+"'");
				}
			} else {
				queryString.append(" and model.policeTime is null");
			}
			if(!policeDesc.equals("") && nullPoliceDesc.equals("")) {
				queryString.append(" and model.policeDesc like '%"+policeDesc+"%'");
			}
			if(!nullPoliceDesc.equals("")) {
				queryString.append(" and model.policeDesc is null");
			}
			if(!uploadUserId.equals("")) {
				queryString.append(" and model.userId = ?");
			}
			if(!fileCreateUserId.equals("")) {
				queryString.append(" and model.editId = ?");
			}
			if(!fileStats.equals("")) {
				queryString.append(" and model.fileStats = ?");
			}
			if(!fileRemark.equals("") && nullRemark.equals("")) {
				queryString.append(" and model.fileRemark like ?");
			}
			if(!nullRemark.equals("")) {
				queryString.append(" and model.fileRemark is null");
			}
			if(!uploadName.equals("")) {
				queryString.append(" and model.uploadName like ?");
			}
			if(!showTree.equals("")) {
				queryString.append(" and model.tree2Id = "+showTree);
			}
			queryString.append(" and (model.fileState!='F' or model.fileState!='U')");
			queryString.append(" order by model.uploadId desc");
			Query queryObject = session.createQuery(queryString.toString());
			int parameterIndex = 0;
			if(beginTime.equals("") || endTime.equals("")) {

			} else {
				queryObject.setParameter(parameterIndex++, beginTime);
				queryObject.setParameter(parameterIndex++, endTime);
			}
			if(!uploadUserId.equals("")) {
				queryObject.setParameter(parameterIndex++, new Long(uploadUserId));
			}
			if(!fileCreateUserId.equals("")) {
				queryObject.setParameter(parameterIndex++, new Long(fileCreateUserId));
			}
			if(!fileStats.equals("")) {
				queryObject.setParameter(parameterIndex++, fileStats);
			}
			if(!fileRemark.equals("")) {
				queryObject.setParameter(parameterIndex++, "%"+fileRemark+"%");
			}
			if(!uploadName.equals("")) {
				queryObject.setParameter(parameterIndex++, "%"+uploadName+"%");
			}
			page.setTotal(queryObject.list().size());
			queryObject.setFirstResult((page.getPageCute()-1)*page.getDbLine());
			queryObject.setMaxResults(page.getDbLine());
			List<UploadForm> uploadList = null;
			List querylist = queryObject.list();
			if(querylist!=null && querylist.size()>0) {
				uploadList = new ArrayList<UploadForm>();
				for(Object obj: querylist) {
					uploadList.add(setUploadFormByFrameUpload(new UploadForm(), (FrameUpload)obj));
				}
			}
			page.setListObject(uploadList);
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
			session.close();
			return page;
		}
	}

	public Page uploadListTable(String beginTime, String endTime, Long treeId, Page page) {
		Session session = getSession();
		try {
			session.clear();
			StringBuffer queryString = new StringBuffer("from FrameUpload as model");
			queryString.append(" where model.fileState = 'A'");
			if(treeId!=null && treeId!=0) {
				queryString.append(" and (model.tree1Id = ? or model.tree2Id = ?) ");
			}
			if(beginTime.equals("") || endTime.equals("")) {
				
			}
			else {
				queryString.append(" and (model.uploadTime >= ? and model.uploadTime <= ?) ");
			}
			queryString.append(" order by model.tree1Id, model.userId, model.uploadTime");
			Query queryObject = session.createQuery(queryString.toString());
			int parameterIndex = 0;
			if(treeId!=null && treeId!=0) {
				queryObject.setParameter(parameterIndex++, treeId);
				queryObject.setParameter(parameterIndex++, treeId);
			}
			if(beginTime.equals("") || endTime.equals("")) {
				
			}
			else {
				queryObject.setParameter(parameterIndex++, beginTime);
				queryObject.setParameter(parameterIndex++, endTime);
			}
			page.setTotal(queryObject.list().size());
			queryObject.setFirstResult((page.getPageCute()-1)*page.getDbLine());
			queryObject.setMaxResults(page.getDbLine());
			List<UploadForm> uploadList = null;
			List querylist = queryObject.list();
			if(querylist!=null && querylist.size()>0) {
				uploadList = new ArrayList<UploadForm>();
				for(Object obj: querylist) {
					uploadList.add(setUploadFormByFrameUpload(new UploadForm(), (FrameUpload)obj));
				}
			}
			page.setListObject(uploadList);
		} catch(RuntimeException re) {
			log.error("get failed", re);
		} finally {
			session.close();
			return page;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public Page mineUploadList(String beginTime,String endTime,String fileRemark,String policeCode,
			String policeDesc,String nullRemark,String nullPoliceCode,String nullPoliceDesc,
			String treeId, String parentTreeId, String uploadUserId, Page page) {
		Session session = getSession();
		try {
			session.clear();
			StringBuffer queryString = new StringBuffer("from FrameUpload as model");
			queryString.append(" where model.fileState = 'A'");
			if(treeId.equals(parentTreeId)) {
				queryString.append(" and model.tree1Id = ?");
			} else {
				queryString.append(" and model.tree2Id = ?");
			}
			if (!uploadUserId.equals("")) {
				queryString.append(" and (model.userId = ? or model.editId = ?)");
			}
			if(beginTime.equals("") || endTime.equals("")) {

			} else {
				queryString.append(" and model.uploadTime >=? and model.uploadTime <=?");
			}
			if(!fileRemark.equals("") && nullRemark.equals("")) {
				queryString.append(" and model.fileRemark like '%"+fileRemark+"%'");
			}
			if(!nullRemark.equals("")) {
				queryString.append(" and model.fileRemark is null");
			}
			if(!policeCode.equals("") && nullPoliceCode.equals("")) {
				queryString.append(" and model.policeCode like '%"+policeCode+"%'");
			}
			if(!nullPoliceCode.equals("")) {
				queryString.append(" and model.policeCode is null");
			}
			if(!policeDesc.equals("") && nullPoliceDesc.equals("")) {
				queryString.append(" and model.policeDesc like '%"+policeDesc+"%'");
			}
			if(!nullPoliceDesc.equals("")) {
				queryString.append(" and model.policeDesc is null");
			}
			queryString.append(" and (model.fileState!='F' or model.fileState!='U')");
			queryString.append(" order by model.uploadId desc");
			Query queryObject = session.createQuery(queryString.toString());
			int parameterIndex = 0;
			queryObject.setParameter(parameterIndex++, new Long(treeId));
			if (!uploadUserId.equals("")) {
				queryObject.setParameter(parameterIndex++, new Long(uploadUserId));
				queryObject.setParameter(parameterIndex++, new Long(uploadUserId));
			}
			if(beginTime.equals("") || endTime.equals("")) {

			} else {
				queryObject.setParameter(parameterIndex++, beginTime);
				queryObject.setParameter(parameterIndex++, endTime);
			}
			page.setTotal(queryObject.list().size());
			queryObject.setFirstResult((page.getPageCute()-1)*page.getDbLine());
			queryObject.setMaxResults(page.getDbLine());
			List<UploadForm> uploadList = null;
			List querylist = queryObject.list();
			if(querylist!=null && querylist.size()>0) {
				uploadList = new ArrayList<UploadForm>();
				for(Object obj: querylist) {
					uploadList.add(setUploadFormByFrameUpload(new UploadForm(), (FrameUpload)obj));
				}
			}
			page.setListObject(uploadList);
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
			session.close();
			return page;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public List<UploadForm> expiredSysDekList(int expiredDays) {
		List<UploadForm> uploadList = null;
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FrameUpload as model where model.fileStats = '0' and model.fileState != 'F' and to_number(substr(uploadTime,0,8))<=to_number(to_char(sysdate-"+expiredDays+",'yyyyMMdd'))";
			Query queryObject = session.createQuery(queryString);
			List list = queryObject.list();
			if(list!=null && list.size()>0) {
				uploadList = new ArrayList<UploadForm>();
				for(Object obj: list) {
					uploadList.add(setUploadFormByFrameUpload(new UploadForm(), (FrameUpload)obj));
				}
			}
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
//			session.close();
			return uploadList;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public List<UploadForm> expiredUploadAllList(String expired) {
		List<UploadForm> uploadList = null;
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FrameUpload as model where model.fileState = 'A' and substr(uploadTime,0,8)<=?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, expired);
			List list = queryObject.list();
			if(list!=null && list.size()>0) {
				uploadList = new ArrayList<UploadForm>();
				for(Object obj: list) {
					UploadForm uploadForm = new UploadForm();
					FrameUpload frameUpload = (FrameUpload)obj;
					uploadForm.setUploadId(frameUpload.getUploadId());
					uploadForm.setUserId(frameUpload.getUserId());
					uploadForm.setEditId(frameUpload.getEditId());
					uploadForm.setUploadName(frameUpload.getUploadName());
					uploadForm.setPlayPath(frameUpload.getPlayPath());
					uploadForm.setShowPath(frameUpload.getShowPath());
					uploadForm.setFileCreatetime(frameUpload.getFileCreatetime());
					uploadForm.setUploadTime(frameUpload.getUploadTime());
					uploadForm.setFileState(frameUpload.getFileState());
					uploadForm.setTree1Id(frameUpload.getTree1Id());
					uploadForm.setTree2Id(frameUpload.getTree2Id());
					uploadForm.setFileStats(frameUpload.getFileStats());
					uploadForm.setFileRemark(frameUpload.getFileRemark());
					uploadForm.setIpAddr(frameUpload.getIpAddr());
					uploadForm.setFileSavePath(frameUpload.getRealPath());
					uploadForm.setFlvPath(frameUpload.getFlvPath());
					uploadList.add(uploadForm);
				}
			}
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
//			session.close();
			return uploadList;
		}
	}

	private UploadForm setUploadFormByFrameUpload(UploadForm uploadForm, FrameUpload frameUpload) {
		uploadForm.setUploadId(frameUpload.getUploadId());
		uploadForm.setUserId(frameUpload.getUserId());
		uploadForm.setUserName(findByUserId(frameUpload.getUserId()).getUserName());
		uploadForm.setEditId(frameUpload.getEditId());
		uploadForm.setEditName(findByUserId(frameUpload.getEditId()).getUserName());
		
		//EditBy 孙强伟 ，增加上传人所属部门，由于findByTreeId和findByUserId返回的值为null，如果为null时，再调用其方法会报错。
		try {
			uploadForm.setTreeEditName(findByTreeId(findByUserId(frameUpload.getEditId()).getTreeId()).getTreeName());
		} catch (Exception e) {
		}
		uploadForm.setUploadName(frameUpload.getUploadName());
		uploadForm.setPlayPath(frameUpload.getPlayPath());
		uploadForm.setShowPath(frameUpload.getShowPath());
		uploadForm.setFileCreatetime(frameUpload.getFileCreatetime());
		uploadForm.setUploadTime(frameUpload.getUploadTime());
		uploadForm.setFileState(frameUpload.getFileState());
		uploadForm.setTree1Id(frameUpload.getTree1Id());
		uploadForm.setTree2Id(frameUpload.getTree2Id());
		//EditBy 孙强伟 ，增加上传人所属部门，由于findByTreeId和findByUserId返回的值为null，如果为null时，再调用其方法会报错。
		try {
			uploadForm.setTreeName(findByTreeId(frameUpload.getTree1Id()).getTreeName());//显示的是上传人的部门名称
		} catch (Exception e) {
		}
		uploadForm.setFileStats(frameUpload.getFileStats());
		uploadForm.setFileRemark(frameUpload.getFileRemark());
		uploadForm.setIpAddr(frameUpload.getIpAddr());
		uploadForm.setFileSavePath(frameUpload.getRealPath());
		uploadForm.setFlvPath(frameUpload.getFlvPath());
		uploadForm.setPoliceCode(frameUpload.getPoliceCode());
		uploadForm.setPoliceDesc(frameUpload.getPoliceDesc());
		uploadForm.setPoliceTime(frameUpload.getPoliceTime());
		uploadForm.setTakeTime(frameUpload.getTakeTime());
		uploadForm.setUseTime(frameUpload.getUseTime());
		uploadForm.setPoliceType(frameUpload.getPoliceType());
		return uploadForm;
	}

	@SuppressWarnings({ "finally", "unchecked" })
	private FrameTree findByTreeId(java.lang.Long treeId) {
		FrameTree frameTree = null;
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from com.njmd.pojo.FrameTree as model where model.treeId = ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, treeId);
			List list = queryObject.list();
			if(list!=null && list.size()>0) {
				frameTree = (FrameTree) list.get(0);
			}
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
//			session.close();
			return frameTree;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	private FrameUser findByUserId(java.lang.Long userId) {
		FrameUser frameUser = null;
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from com.njmd.pojo.FrameUser as model where model.userId = ?";
			Query queryObject = session.createQuery(queryString);
			queryObject.setParameter(0, userId);
			List list = queryObject.list();
			if(list!=null && list.size()>0) {
				frameUser = (FrameUser) list.get(0);
			}
		} catch (RuntimeException re) {
			log.error("get failed", re);
//			throw re;
		} finally {
//			session.close();
			return frameUser;
		}
	}

	@SuppressWarnings({ "finally", "unchecked" })
	public List<PoliceTypeForm> policeTypeAll() {
		List<PoliceTypeForm> results = null;
		log.debug("finding all FramePoliceType instances");
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FramePoliceType";
			Query queryObject = session.createQuery(queryString);
			List list = queryObject.list();
			if(list!=null && list.size()>0) {
				results = new ArrayList<PoliceTypeForm>();
				for(Object obj: list) {
					FramePoliceType frameForm = (FramePoliceType)obj;
					PoliceTypeForm form = new PoliceTypeForm();
					form.setTypeId(frameForm.getTypeId());
					form.setTypeName(frameForm.getTypeName());
					results.add(form);
				}
			}
		} catch (RuntimeException re) {
			log.error("find all failed", re);
			throw re;
		} finally {
			session.close();
			return results;
		}
	}

	@SuppressWarnings("finally")
	public List<UploadForm> statistic(Long treeId, String beginTime, String endTime, String useTimeBegin, String useTimeEnd,
			String policeTimeBegin, String policeTimeEnd) {
		List<UploadForm> results = null;
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FrameUpload as model";
			String whereOrAnd = " where";
			if(treeId!=null && treeId>0) {
				queryString += " where (model.tree2Id = "+treeId+" or model.tree1Id = "+treeId+")";
				whereOrAnd = " and";
			}
			if(!beginTime.equals("") && !endTime.equals("")) {
				queryString += whereOrAnd+" model.uploadTime >= ? and model.uploadTime <= ?";
				whereOrAnd = " and";
			}
			if(!useTimeBegin.equals("") && !useTimeEnd.equals("")) {
				queryString += whereOrAnd+" model.useTime >= ? and model.useTime <= ?";
			}
			if(!policeTimeBegin.equals("") && !policeTimeEnd.equals("")) {
				queryString += whereOrAnd+" model.policeTime >= ? and model.policeTime <= ?";
			}
			Query queryObject = session.createQuery(queryString);
			int paramIndex = 0;
			if(!beginTime.equals("") && !endTime.equals("")) {
				queryObject.setParameter(paramIndex, beginTime);paramIndex++;
				queryObject.setParameter(paramIndex, endTime);paramIndex++;
			}
			if(!useTimeBegin.equals("") && !useTimeEnd.equals("")) {
				queryObject.setParameter(paramIndex, new Long(useTimeBegin));paramIndex++;
				queryObject.setParameter(paramIndex, new Long(useTimeEnd));paramIndex++;
			}
			if(!policeTimeBegin.equals("") && !policeTimeEnd.equals("")) {
				queryObject.setParameter(paramIndex, policeTimeBegin);paramIndex++;
				queryObject.setParameter(paramIndex, policeTimeEnd);
			}
			List querylist = queryObject.list();
			if(querylist!=null && querylist.size()>0) {
				results = new ArrayList<UploadForm>();
				for(Object obj: querylist) {
					UploadForm uploadForm = new UploadForm();
					FrameUpload frameUpload = (FrameUpload)obj;
					uploadForm.setTree2Id(frameUpload.getTree2Id());//部门id
					uploadForm.setPoliceType(frameUpload.getPoliceType());//接警类型
					uploadForm.setPoliceCode(frameUpload.getPoliceCode());//接警编号
					results.add(uploadForm);
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			session.close();
			return results;
		}
	}

	@SuppressWarnings("finally")
	public Page statisticDetail(Long treeId, Long typeId, String beginTime, String endTime, String useTimeBegin, String useTimeEnd,
			String policeTimeBegin, String policeTimeEnd, Page page) {
		List<UploadForm> results = null;
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FrameUpload as model";
			String whereOrAnd = " where";
			if(treeId!=null && treeId>0) {
				queryString += " where model.tree2Id = "+treeId;
				whereOrAnd = " and";
			}
			if(typeId==0 || typeId.equals("0")) {
				queryString += whereOrAnd+" model.policeType is null";
				whereOrAnd = " and";
			}
			if(typeId!=null && typeId>0) {
				queryString += whereOrAnd+" model.policeType = ?";
				whereOrAnd = " and";
			}
			if(!beginTime.equals("") && !endTime.equals("")) {
				queryString += whereOrAnd+" model.uploadTime >= ? and model.uploadTime <= ?";
				whereOrAnd = " and";
			}
			if(!useTimeBegin.equals("") && !useTimeEnd.equals("")) {
				queryString += whereOrAnd+" model.useTime >= ? and model.useTime <= ?";
			}
			if(!policeTimeBegin.equals("") && !policeTimeEnd.equals("")) {
				queryString += whereOrAnd+" model.policeTime >= ? and model.policeTime <= ?";
				whereOrAnd = " and";
			}
			Query queryObject = session.createQuery(queryString);
			int paramIndex = 0;
			if(typeId!=null && typeId>0) {
				queryObject.setParameter(paramIndex, typeId);paramIndex++;
			}
			if(!beginTime.equals("") && !endTime.equals("")) {
				queryObject.setParameter(paramIndex, beginTime);paramIndex++;
				queryObject.setParameter(paramIndex, endTime);paramIndex++;
			}
			if(!useTimeBegin.equals("") && !useTimeEnd.equals("")) {
				queryObject.setParameter(paramIndex, new Long(useTimeBegin));paramIndex++;
				queryObject.setParameter(paramIndex, new Long(useTimeEnd));paramIndex++;
			}
			if(!policeTimeBegin.equals("") && !policeTimeEnd.equals("")) {
				queryObject.setParameter(paramIndex, policeTimeBegin);paramIndex++;
				queryObject.setParameter(paramIndex, policeTimeEnd);
			}
			page.setTotal(queryObject.list().size());
			queryObject.setFirstResult((page.getPageCute()-1)*page.getDbLine());
			queryObject.setMaxResults(page.getDbLine());
			List querylist = queryObject.list();
			if(querylist!=null && querylist.size()>0) {
				results = new ArrayList<UploadForm>();
				for(Object obj: querylist) {
					results.add(setUploadFormByFrameUpload(new UploadForm(), (FrameUpload)obj));
				}
			}
			page.setListObject(results);
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			session.close();
			return page;
		}
	}

	@SuppressWarnings("finally")
	public List<UploadForm> contrast(String uploadTimeBegin, String uploadTimeEnd, String policeTimeBegin, String policeTimeEnd, Long treeId, Long policeType) {
		List<UploadForm> results = null;
		Session session = getSession();
		try {
			session.clear();
			String queryString = "from FrameUpload as model where (model.tree2Id = "+treeId+" or model.tree1Id = "+treeId+")";
			if(!uploadTimeBegin.equals("") && !uploadTimeEnd.equals("")) {
				queryString += " and substr(model.uploadTime,0,8) >= ? and substr(model.uploadTime,0,8) <= ?";
			}
			if(!policeTimeBegin.equals("") && !policeTimeEnd.equals("")) {
				queryString += " and substr(model.policeTime,0,8) >= ? and substr(model.policeTime,0,8) <= ?";
			}
			queryString += " and model.policeType = ?";
			Query queryObject = session.createQuery(queryString);
			int paramIndex = 0;
			if(!uploadTimeBegin.equals("") && !uploadTimeEnd.equals("")) {
				queryObject.setParameter(paramIndex, uploadTimeBegin);paramIndex++;
				queryObject.setParameter(paramIndex, uploadTimeEnd);paramIndex++;
			}
			if(!policeTimeBegin.equals("") && !policeTimeEnd.equals("")) {
				queryObject.setParameter(paramIndex, policeTimeBegin);paramIndex++;
				queryObject.setParameter(paramIndex, policeTimeEnd);paramIndex++;
			}
			queryObject.setParameter(paramIndex, policeType);
			List querylist = queryObject.list();
			if(querylist!=null && querylist.size()>0) {
				results = new ArrayList<UploadForm>();
				for(Object obj: querylist) {
					UploadForm uploadForm = new UploadForm();
					FrameUpload frameUpload = (FrameUpload)obj;
					uploadForm.setTree2Id(frameUpload.getTree2Id());//部门id
					uploadForm.setPoliceType(frameUpload.getPoliceType());//接警类型
					uploadForm.setPoliceCode(frameUpload.getPoliceCode());//接警编号
					uploadForm.setUploadTime(frameUpload.getUploadTime());//文件上传时间
					uploadForm.setTakeTime(frameUpload.getTakeTime());//录制时间
					results.add(uploadForm);
				}
			}
		} catch(Exception ex) {
			ex.printStackTrace();
		} finally {
			session.close();
			return results;
		}
	}

	public static void main(String[] args) {
//		UploadForm uploadForm = new FrameUploadDAO().uploadDetail(new Long(87));
//		System.out.println(uploadForm.getUserId());
//		System.out.println(uploadForm.getEditId());
//		System.out.println(uploadForm.getUploadName());
//		System.out.println(uploadForm.getPlayPath());
//		System.out.println(uploadForm.getShowPath());
//		System.out.println(uploadForm.getFileCreatetime());
//		System.out.println(DateUtils.getChar14());
//		System.out.println(uploadForm.getFileState());
//		System.out.println(uploadForm.getTree2Id());
//		System.out.println(uploadForm.getTree1Id());
//		System.out.println(uploadForm.getFileRemark());
//		System.out.println(uploadForm.getIpAddr());
//		System.out.println(uploadForm.getFileSavePath());
//		System.out.println(uploadForm.getFlvPath());
//		System.out.println(uploadForm.getTreeName());
//		System.out.println(uploadForm.getUserName());
//		System.out.println(uploadForm.getEditName());
		new FrameUploadDAO().policeTypeAll();
	}
}