/**
 * @(#)URLUtils.java 2014-7-8
 *
 * Copyright (c) 2014-2015 BuShangBan (China) Int'l Co., Ltd
 * yongtai Road. pu dong District.Shanghai China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of BuShangBan (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with BuShangBan (China).
 */
package com.bsb.cms.commons.utils;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;

import org.springframework.core.io.DefaultResourceLoader;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

/**
 * 取得class path跟路徑.
 * @author hongjian.liu
 * @version 1.0.0 2013-5-15
 * @since 1.0
 */
public class URLUtils {
	private static ResourceLoader resourceLoader = new DefaultResourceLoader();
	
	/**
	 * 利用ResourceLoader取得excel路徑。
	 * @param fileName
	 * @return
	 */
	public static String getExcelFilePath(String fileName){
		Resource path = resourceLoader.getResource("classpath:report/" + fileName);//格式見getResource注释
		//Resource path = resourceLoader.getResource("/WEB-INF/classes/report/" + fileName);//也可
		try {
			return path.getURI().getPath();
		} catch (IOException e) {
			e.printStackTrace();
			return "";
		}
	}

	/**
	 * 取得class path跟路徑
	 * @return
	 */
	public static String getCLassPath(){
		String classpath = null;
		try {
			URL url = new Object(){}.getClass().getResource("/properties/log4j.properties");
			classpath = (new File(url.getFile())).getParentFile().getAbsolutePath();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return classpath;
	}
	
	
	/**
	 * 其中 Base64 类来自 org.apache.commons.codec 组件 一个40多k的jar 要比javamail里的那个简洁很多
	 * public static String encodeString(HttpServletRequest request, String cnStr)
            throws UnsupportedEncodingException {
    	  String agent = request.getHeader("USER-AGENT");
            if (null != agent && -1 != agent.indexOf("MSIE")) {
                return URLEncoder.encode(cnStr, "UTF8");
            } else if (null != agent && -1 != agent.indexOf("Mozilla")) {
                return "=?UTF-8?B?" + (new String(Base64.encodeBase64(cnStr.getBytes("UTF-8")))) + "?=";
            } else {
                return cnStr;
            }
         }
	 * @param request
	 * @param cnStr
	 * @return
	 * @throws UnsupportedEncodingException
	 */
    public static String encodeString(HttpServletRequest request, String cnStr)
            throws UnsupportedEncodingException {
        return URLEncoder.encode(cnStr, "UTF8");
    }
}

