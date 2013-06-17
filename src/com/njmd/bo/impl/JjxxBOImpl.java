package com.njmd.bo.impl;

import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.xml.namespace.QName;

import com.btdx.ldcj.jjxx.ws.Query;
import com.btdx.ldcj.jjxx.ws.QueryPortType;
import com.btdx.ldcj.jjxx.ws.utils.QueryResultParser;
import com.btdx.ldcj.jjxx.ws.utils.RequestBuilder;
import com.njmd.bo.JjxxBO;

/**
 * 根据JJBH到警综平台中获取接警的相关信息。
 * @author sunqw
 * @since 2013.06.09
 */
public class JjxxBOImpl implements JjxxBO {
	private String url="http://10.33.250.137:8090/JJXXWS/services/Query?wsdl";
	private String namespaceURI="http://ws.jjxx.ldcj.btdx.com";
	private String localPort="Query";
	
	
	/** 
	 * 根据JJBH到警综平台获取接警的相关信息，
	 * 其返回值是Map格式的数据
	 * {status:true,failmessage:'',exist:true,notexistmessage:'',results:[{JJSJ:'',JJBH:'',BJR:'',BJDH:'',JJRXM:'',CJLB:'',CLJGNR:'',CJR:['','']}]}
	 * @param jjbh
	 * @return
	 */
	@Override
	public Map<String,Object> fetchJjxx(String jjbh) {
		QueryResultParser qrp;
		try {
			URL wsdl=new URL(url);
			QName qName=new QName(namespaceURI,localPort);
			Query query=new Query(wsdl,qName);
			QueryPortType qpt=query.getQueryHttpPort();
			String result=qpt.queryJQXXZFJLY(RequestBuilder.build(jjbh));
//			String result="<?xml version=\"1.0\" encoding=\"UTF-8\"?><ROOT><HEAD><FLAG>OK</FLAG></HEAD><RESULT><JJSJ>20130530163840</JJSJ><JJBH>J3201053313053000181</JJBH><BJR>刘兴峰</BJR><BJDH>13814018691</BJDH><JJRXM>陶宝伟</JJRXM><CJLB>盗窃电动自行车</CJLB><CJR>张宇,杨莉</CJR><CLJGNR>盗窃电动自行车</CLJGNR></RESULT></ROOT>";
//			String result="<?xml version=\"1.0\" encoding=\"UTF-8\"?><ROOT><HEAD><FLAG>ERROR</FLAG></HEAD><RESULT>错误测试!</RESULT></ROOT>";
			qrp = new QueryResultParser(result);
			return qrp.getJsonString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		Map<String,Object> results=new HashMap<String,Object>();
		results.put("status", false);
		results.put("failmessage", "到警综平台获取接警信息出错,请稍后再试...");
		results.put("exist", false);
		results.put("notexistmessage","到警综平台获取接警信息出错,请稍后再试..." );
		results.put("results", new HashMap<String,Object>());
		
		return results;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public void setNamespaceURI(String namespaceURI) {
		this.namespaceURI = namespaceURI;
	}

	public void setLocalPort(String localPort) {
		this.localPort = localPort;
	}
	
}
