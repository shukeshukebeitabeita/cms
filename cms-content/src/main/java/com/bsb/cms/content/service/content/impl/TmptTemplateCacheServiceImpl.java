/**
 * @(#)TmptTemplateCacheServiceImpl.java 2014-7-1
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
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import com.bsb.cms.content.service.content.TmptTemplateCacheService;
import com.bsb.cms.content.service.tmpt.TmptTemplateService;
import com.bsb.cms.model.dto.content.TmptTemplateDTO;
import com.bsb.cms.model.po.content.TmptTemplate;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-1
 * @since 1.0
 */
@Component("tmptTemplateCacheService")
public class TmptTemplateCacheServiceImpl implements TmptTemplateCacheService {
	private static Map<Long, TmptTemplateDTO> templates = new HashMap<Long, TmptTemplateDTO>();
	@Resource(name="tmptTemplateService")
	private TmptTemplateService tmptTemplateService;
	
	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.TmptTemplateCacheService#getById(java.lang.Long)
	 */
	@Override
	public TmptTemplateDTO getById(Long id) {
		TmptTemplateDTO tmpt = templates.get(id);
		if(tmpt == null) {
			tmpt = new TmptTemplateDTO();
			copy(tmptTemplateService.findById(id), tmpt);
			templates.put(id, tmpt);
		}
		
		return tmpt;
	}
	
	private void copy(TmptTemplate src, TmptTemplateDTO dist){
		if(src == null) {
			dist = null;
		} else {
			dist.setFile_dir(src.getFileDir());
			dist.setParent_id(src.getParentId());
			dist.setId(src.getId());
			dist.setName(src.getTemplateName());
			dist.setStatus(src.getStatus());
			dist.setType(src.getTemplateType());
		}
	}

}
