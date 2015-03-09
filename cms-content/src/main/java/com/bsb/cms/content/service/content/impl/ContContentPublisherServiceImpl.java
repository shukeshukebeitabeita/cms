/**
 * @(#)ContContentPublisherServiceImpl.java 2014-7-8
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
package com.bsb.cms.content.service.content.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.util.Assert;

import com.bsb.cms.commons.template.TemplateGenerator;
import com.bsb.cms.content.service.content.ContContentPublisherService;
import com.bsb.cms.content.service.content.ContTypeCacheService;
import com.bsb.cms.content.service.content.TmptTemplateCacheService;
import com.bsb.cms.content.service.utils.PublishUtil;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.dto.content.TmptTemplateDTO;
import com.bsb.cms.model.vo.PublishResult;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-8
 * @since 1.0
 */
@Service("contContentPublisherService")
public class ContContentPublisherServiceImpl implements ContContentPublisherService {
	@Resource(name="springFreemarkerGenerator")
	private TemplateGenerator templateGenerator;
	@Resource(name = "tmptTemplateCacheService")
	private TmptTemplateCacheService tmptTemplateCacheService;
	@Resource(name = "contTypeCacheService")
	private ContTypeCacheService contTypeCacheService;

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContContentPublisherService#publishAll()
	 */
	@Override
	public PublishResult publishAll() {
		// TODO Auto-generated method stub
		return null;
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContContentPublisherService#publishContent(com.bsb.cms.model.dto.content.ContContentDTO)
	 */
	@Override
	public PublishResult publishContent(ContContentDTO content) {
		Assert.notNull(content, "content is null");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("c", content);
		TmptTemplateDTO template = tmptTemplateCacheService.getById(content.getTemplate_id());
		//ContTypeDTO type = contTypeCacheService.getById(content.getType_id());
		templateGenerator.createFile(PublishUtil.getTemplatePath(template), dataMap, PublishUtil.getCtPublishPath(content.getUrl()));
		
		return null;
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContContentPublisherService#publishContent(java.util.List)
	 */
	@Override
	public PublishResult publishContent(List<String> contentIds) {
		// TODO Auto-generated method stub
		Assert.notEmpty(contentIds, "contentIds is empty");
		
		return null;
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContContentPublisherService#publishType(com.bsb.cms.model.dto.content.ContTypeDTO)
	 */
	@Override
	public PublishResult publishType(ContTypeDTO type) {
		//TODO 先一次查询出来,以后数据量大,分批查询生成. 另外列表页面不实现分页静态化,采用动态化
		Assert.notNull(type, "type is null");
		//生成栏目页
		publishTypeIndex(type);
		//生存内容页
		
		return null;
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContContentPublisherService#publishTypeIndex(com.bsb.cms.model.dto.content.ContTypeDTO)
	 */
	@Override
	public PublishResult publishTypeIndex(ContTypeDTO type) {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("t", type);
		TmptTemplateDTO template = tmptTemplateCacheService.getById(type.getType_template_id());
		templateGenerator.createFile(PublishUtil.getTemplatePath(template), dataMap, PublishUtil.getPublishDir(type) + "index.html");
		
		return null;
	}



}
