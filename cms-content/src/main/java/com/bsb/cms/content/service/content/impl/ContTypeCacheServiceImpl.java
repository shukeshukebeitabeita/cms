/**
 * @(#)ContTypeCacheServiceImpl.java 2014-7-1
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

import com.bsb.cms.content.service.content.ContTypeCacheService;
import com.bsb.cms.content.service.content.ContTypeService;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.po.content.ContType;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-1
 * @since 1.0
 */
@Component("contTypeCacheService")
public class ContTypeCacheServiceImpl implements ContTypeCacheService {
	private static Map<Long, ContTypeDTO> types = new HashMap<Long, ContTypeDTO>();
	@Resource(name="contTypeService")
	private ContTypeService contTypeService;

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContTypeCacheService#getById(java.lang.Long)
	 */
	@Override
	public ContTypeDTO getById(Long typeId) {
		ContTypeDTO type = types.get(typeId);
		if(type == null) {
			type = new ContTypeDTO();
			copy(contTypeService.findById(typeId), type);
			types.put(typeId, type);
		}
		
		return type;
	}
	
	private void copy(ContType src, ContTypeDTO dist){
		if(src == null) {
			dist = null;
		} else {
			dist.setAbout(src.getAbout());
			dist.setContent_template_id(src.getContentTemplate());
			dist.setFile_dir(src.getFileDir());
			dist.setFile_name(src.getFileName());
			dist.setHidden_name(src.getTypeName());
			dist.setId(src.getId());
			dist.setImage(src.getTypeImg());
			dist.setParent_id(src.getParentId());
			dist.setStatus(src.getStatus());
			dist.setTitle(src.getShowName());
			dist.setType_template_id(src.getTypeTemplate());
			dist.setAttr_id(src.getAttrId());
			dist.setDepth(src.getDepth());
		}
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContTypeCacheService#set(com.bsb.cms.model.po.content.ContType)
	 */
	@Override
	public void set(ContType contType) {
		ContTypeDTO type = new ContTypeDTO();
		copy(contType, type);
		types.put(contType.getId(), type);
	}
	
	

}
