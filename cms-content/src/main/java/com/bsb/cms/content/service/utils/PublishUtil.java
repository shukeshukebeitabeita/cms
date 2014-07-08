/**
 * @(#)PublishUtil.java 2014-7-8
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
package com.bsb.cms.content.service.utils;

import org.springframework.beans.factory.annotation.Value;

import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.dto.content.TmptTemplateDTO;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-8
 * @since 1.0
 */
public class PublishUtil {
	@Value("${cms.html.publish.root.dir}")
	public String rootPath;
	/**
	 * 返回模板相对路径.
	 * @param template
	 * @return
	 */
	public static String getTemplatePath(TmptTemplateDTO template){
		String templatePath;
		templatePath = template.getType() + template.getParent_id() + "/";
		
		return templatePath;
	}
	
	public static String getPublishDir(ContTypeDTO type){
		PublishUtil pu = new PublishUtil();
		
		return pu.rootPath + type.getFile_dir() + "/";
	}
}
