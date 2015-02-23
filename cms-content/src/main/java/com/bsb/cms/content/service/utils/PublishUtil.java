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

import org.apache.commons.lang.StringUtils;

import com.bsb.cms.commons.utils.ConfigUtils;
import com.bsb.cms.commons.utils.URLUtils;
import com.bsb.cms.commons.web.SpringContextUtil;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.dto.content.TmptTemplateDTO;
import com.bsb.cms.model.po.content.ContContent;
import com.bsb.cms.model.po.content.ContContentBody;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-8
 * @since 1.0
 */
public class PublishUtil {
	/**
	 * 生成内容时取模板用. 返回模板相对路径.
	 * 
	 * @param template
	 * @return
	 */
	public static String getTemplatePath(TmptTemplateDTO template) {
		String templatePath;
		templatePath = template.getParent_id() + "/" + template.getId()
				+ ".ftl";

		return templatePath;
	}

	/**
	 * 生成模板时用
	 * 
	 * @param template
	 */
	public static String getCreateTemplateDir(Long parentId, String fileDir) {
		return "E:/opt/template/" + parentId + "/";//TODO
		//return URLUtils.getTemplatePath() + parentId + "/";
	}

	public static String getPublishDir(ContTypeDTO type) {
		String dir;
		if (StringUtils.isBlank(type.getFile_dir())) {
			dir = String.valueOf(type.getId());
		} else {
			dir = type.getFile_dir();
		}
		ConfigUtils config = (ConfigUtils) SpringContextUtil
				.getApplicationContextInstance().getBean("configUtils",
						ConfigUtils.class);
		return config.getRootPath() + dir + "/";
	}

	public static ContContentDTO translateContent(ContContent content,
			ContContentBody contContentBody) {
		ContContentDTO c = new ContContentDTO();
		c.setAbout(content.getAbout());
		c.setAttr_id(content.getAttrId());
		if(contContentBody != null){
			c.setContent_body(contContentBody.getContentBody());
		}
		c.setContent_id(content.getId());
		c.setDefault_img(content.getDefaultImg());
		c.setDiscount(content.getDiscount());
		c.setBrand(content.getBrand());
	   if(contContentBody != null){
		   c.setExt_attr(contContentBody.getExtAttrBody());
		}
		c.setGoods_url(content.getGoodsUrl());
		c.setHas_hot(content.getHasHot());
		c.setHas_latest(content.getHasLatest());
		c.setHas_top(content.getHasTop());
		c.setKeyword(content.getKeyword());
		c.setLink(content.getLink());
		c.setMeta_description(content.getMetaDescription());
		c.setMeta_keywords(content.getMetaKeywords());
		c.setMeta_title(content.getMetaTitle());
		c.setPrice(content.getPrice());
		c.setPublish_time(content.getPublishTime());
		c.setSalePrice(content.getSalePrice());
		c.setSource(content.getSource());
		c.setStock(content.getStock());
		c.setTemplate_id(content.getTemplateId());
		c.setTitle(content.getTitle());
		c.setTitle_style(content.getTitleStyle());
		c.setType_id(content.getTypeId());

		return c;
	}

}
