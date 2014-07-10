/**
 * @(#)InitTemplateService.java 2014-7-10
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
package com.bsb.cms.moss.controller.init;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.stereotype.Component;

import com.bsb.cms.content.service.tmpt.TmptTemplateService;
import com.bsb.cms.content.service.utils.PublishUtil;
import com.bsb.cms.model.po.content.TmptTemplate;
import com.bsb.cms.moss.controller.utils.TemplateFileManager;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-10
 * @since 1.0
 */
@Component
public class InitTemplateService implements InitializingBean {
	// log
	private static final Log log = LogFactory.getLog(InitTemplateService.class);
	@Resource(name = "tmptTemplateService")
	private TmptTemplateService tmptTemplateService;
	@Resource(name = "templateFileManager")
	private TemplateFileManager templateFileManager;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.beans.factory.InitializingBean#afterPropertiesSet()
	 */
	@Override
	public void afterPropertiesSet() throws Exception {

		List<TmptTemplate> templates = tmptTemplateService.findTemplateAll();
		if (CollectionUtils.isNotEmpty(templates)) {
			for (TmptTemplate template : templates) {
				try {
					templateFileManager.createFreemarkFile(
							PublishUtil.getCreateTemplateDir(
									template.getParentId(),
									template.getFileDir()),
							String.valueOf(template.getId()),
							template.getTemplateBody());
				} catch (Exception e) {
					e.printStackTrace();
				}
			}

			log.info("create template count:" + templates.size());
		}

	}
}
