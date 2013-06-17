package com.btdx.ldcj.jjxx.ws.utils;

import java.io.ByteArrayInputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import org.w3c.dom.DOMException;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;

import com.google.gson.JsonArray;

/**
 * 对WS返回的XML结果进行分析
 * @author sunqw
 * @since 2013.06.09
 */
public class QueryResultParser {

	private Document doc=null;
	private XPath xpath=null;
	private boolean status=false;
	private String failMessage="";
	
	private String JJSJ=null;
	
	public QueryResultParser(String response) throws Exception{
		//将XML格式的字符串转换成DOM
		DocumentBuilderFactory dbFactory = DocumentBuilderFactory.newInstance();
		dbFactory.setNamespaceAware(true); 
        DocumentBuilder builder = dbFactory.newDocumentBuilder();
        this.doc = builder.parse(new ByteArrayInputStream(response.getBytes("UTF-8")));
        
        //结构XPath相关的方法
        XPathFactory xpFactory=XPathFactory.newInstance();
        this.xpath=xpFactory.newXPath();
         
        String flag=parserResultItem("//ROOT/HEAD/FLAG/text()");
		if(null!=flag && flag.equals("OK")){
			status=true;
		}else{
			parserFailMessage();
		}
	}
	
	public Map<String,Object> getJsonString(){
		Map<String,Object> results=new HashMap<String,Object>();
		results.put("status", getStatus());
		results.put("failmessage", getFailMessage());
		results.put("exist", isExist());
		if(!isExist()){
			results.put("notexistmessage", "您请求查询的接警编号["+getJJBH()+"]不存在!");
		}else{
			results.put("notexistmessage", "");
		}
		Map<String,Object> items=new HashMap<String, Object>();
		if(getStatus() && isExist()){
			items.put("JJSJ", getJJSJ());
			items.put("JJBH", getJJBH());
			items.put("BJR", getBJR());
			items.put("BJDH", getBJDH());
			items.put("JJRXM", getJJRXM());
			items.put("CJLB", getCJLB());
			items.put("CLJGNR", getCLJGNR());
			items.put("CJR", getCJR());
		}
		results.put("results", items);
		
		return results;
	}
	
	/**
	 * 如果WS执行失败，分析WS返回的错误信息
	 */
	private void parserFailMessage(){
		 failMessage=parserResultItem("//ROOT/RESULT/text()");
	}
	
	/**
	 * 根据WS返回的内容，判断是否执行成功。
	 */
	public boolean getStatus(){
		return status;
	}
	
	/**
	 * 如果WS执行失败，返回WS返回的错误信息
	 */
	public String getFailMessage(){
		return failMessage;
	}
	
	/**
	 * 如果WS执行成功，判断是否存在所需要查询的记录
	 */
	public boolean isExist(){
		if(!status)
			return false;
		if(null==JJSJ){
			JJSJ=getJJSJ();
		}
		return ("".equals(JJSJ)?false:true);
	}
	
	/**
	 * @return 接警时间
	 */
	public String getJJSJ(){
		if(!status)
			return failMessage;
		return parserResultItem("//ROOT/RESULT/JJSJ/text()");
	}
	
	/**
	 * @return 接警编号
	 */
	public String getJJBH(){
		if(!status)
			return failMessage;
		return parserResultItem("//ROOT/RESULT/JJBH/text()");
	}
	
	/**
	 * @return 报警人
	 */
	public String getBJR(){
		if(!status)
			return failMessage;
		return parserResultItem("//ROOT/RESULT/BJR/text()");
	}
	
	/**
	 * @return 报警电话
	 */
	public String getBJDH(){
		if(!status)
			return failMessage;
		return parserResultItem("//ROOT/RESULT/BJDH/text()");
	}
	
	/**
	 * @return 接警人姓名
	 */
	public String getJJRXM(){
		if(!status)
			return failMessage;
		return parserResultItem("//ROOT/RESULT/JJRXM/text()");
	}
	
	/**
	 * @return 处警类别
	 */
	public String getCJLB(){
		if(!status)
			return failMessage;
		return parserResultItem("//ROOT/RESULT/CJLB/text()");
	}
	
	/**
	 * @return 处警人
	 */
	public List<String> getCJR(){
		if(!status)
			return new ArrayList<String>();
		String cjr=parserResultItem("//ROOT/RESULT/CJR/text()");
		if(null==cjr || "".equals(cjr))
			return new ArrayList<String>();
		
		return Arrays.asList(cjr.split(","));
	}
	
	/**
	 * @return 处警内容
	 */
	public String getCLJGNR(){
		if(!status)
			return failMessage;
		return parserResultItem("//ROOT/RESULT/CLJGNR/text()");
	}
	
	private String parserResultItem(String path){
		try {
			XPathExpression expr = xpath.compile(path);
			Object result = expr.evaluate(doc, XPathConstants.NODESET);
			NodeList nodes = (NodeList) result;
			if(nodes.getLength()>0){
				return nodes.item(0).getNodeValue();
			}
			return "";
		} catch (XPathExpressionException e) {
			e.printStackTrace();
		} catch (DOMException e) {
			e.printStackTrace();
		}
		return "";
	}
}
