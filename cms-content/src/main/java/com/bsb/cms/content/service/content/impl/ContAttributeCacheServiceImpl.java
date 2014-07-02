/**
 * @(#)ContAttributeCacheServiceImpl.java 2014-7-2
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

import com.bsb.cms.content.service.content.ContAttributeCacheService;
import com.bsb.cms.content.service.content.ContAttributeService;
import com.bsb.cms.model.dto.content.ContAttributeDTO;
import com.bsb.cms.model.po.content.ContAttribute;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-2
 * @since 1.0
 */
public class ContAttributeCacheServiceImpl implements ContAttributeCacheService {
	private static Map<Long, ContAttributeDTO> attrs = new HashMap<Long, ContAttributeDTO>();
	@Resource(name="contAttributeService")
	private ContAttributeService contAttributeService;
	
	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeCacheService#getById(java.lang.Long)
	 */
	@Override
	public ContAttributeDTO getById(Long id) {
		ContAttributeDTO attr = attrs.get(id);
		if(attr == null) {
			attr = new ContAttributeDTO();
			copy(contAttributeService.findById(id), attr);
			attrs.put(id, attr);
		}
		
		return attr;
	}
	
	private void copy(ContAttribute src, ContAttributeDTO dist){
		if(src == null) {
			dist = null;
		} else {
			dist.setHas_about(src.getHasAbout());
			dist.setHas_detail(src.getHasDetail());
			dist.setHas_ext_attribute(src.getHasExtAttribute());
			dist.setHas_image(src.getHasImg());
			dist.setHas_keyword(src.getHasKeyword());
			dist.setHas_seo(src.getHasSEO());
			dist.setHas_orderopt(src.getHasOrderOpt());
			dist.setHas_link(src.getHasOutLink());
			dist.setHas_showtime(src.getHasShowTime());
			dist.setHas_source(src.getHasSource());
			dist.setHas_tag(src.getHasTag());
			dist.setHas_vedio(src.getHasVedio());
			dist.setHas_author(src.getHasAuthor());
		}
	}

}
