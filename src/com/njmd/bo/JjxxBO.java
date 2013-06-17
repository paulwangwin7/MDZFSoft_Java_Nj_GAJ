package com.njmd.bo;

import java.util.Map;

/**
 * 根据JJBH到警综平台中获取接警的相关信息。
 * @author sunqw
 * @since 2013.06.09
 */
public interface JjxxBO {
	
	/**
	 * 根据JJBH到警综平台获取接警的相关信息，
	 * 其返回值是Map格式的数据
	 * {status:true,message:'',exist:true,results:[{}]}
	 * @param jjbh
	 * @return
	 */
	public Map<String,Object> fetchJjxx(String jjbh);
	
}
