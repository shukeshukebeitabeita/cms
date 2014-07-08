/**
 * @(#)TemplateGenerator.java 2014-7-7
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
package com.bsb.cms.commons.template;

import java.io.IOException;
import java.util.Map;

import com.bsb.cms.commons.exceptions.TemplateRuntimeException;

import freemarker.template.TemplateException;

/**
 * 模板接口
 * @author hongjian.liu
 * @version 1.0.0 2014-7-7
 * @since 1.0
 */
public interface TemplateGenerator {

	 /**  
	    * 以字符串形式返回经填充过的模版
	    * @param templatePath ftl模版文件   
	    * @param dataMap   数据 
	    * @throws IOException   
	    * @throws TemplateException   
	    */   
	   public String createString(String templatePath, Map<String, Object> dataMap) throws TemplateRuntimeException;   
	    
	   /**   
	    * 生成静态文件   
	    * @param ftlTemplateFile ftl模版文件 
	    * @param simpleHash    模板要填充的数据
	    * @param filePath    文件生成路径   
	    * @throws IOException   
	    * @throws BaseTemplateRuntimeException   
	    */   
	   public void createFile(String ftlTemplateFile, Map<String, Object> dataMap, String filePath) throws  TemplateRuntimeException;
	}
