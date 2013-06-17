package com.btdx.ldcj.jjxx.ws.utils;

/**
 * 根据JJBH构建XML格式的请求参数
 * @author sunqw
 * @since 2013.06.09
 */
public class RequestBuilder {
	
	/**
	 * XML格式的请求参数
	 */
	public static String build(String JJBH){
		return "<?xml version=\"1.0\" encoding=\"UTF-8\"?><ROOT><JJBH>"+JJBH+"</JJBH></ROOT>";
	}
	
}
