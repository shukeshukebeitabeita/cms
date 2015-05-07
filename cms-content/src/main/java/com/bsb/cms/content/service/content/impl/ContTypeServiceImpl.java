/**
 * @(#)ContTypeServiceImpl.java 2014-6-25
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

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bsb.cms.content.service.content.ContTypeService;
import com.bsb.cms.mapper.content.ContTypeMapper;
import com.bsb.cms.model.po.content.ContType;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
@Service("contTypeService")
public class ContTypeServiceImpl implements ContTypeService {
	@Resource
	private ContTypeMapper contTypeMapper;
	
	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContTypeService#fingByUser(java.lang.Long)
	 */
	@Override
	@Transactional(readOnly = true)
	public List<ContType> findByUser(Long sysUserId) {
		return contTypeMapper.findByUser(sysUserId);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContTypeService#findById(java.lang.Long)
	 */
	@Override
	public ContType findById(Long typeId) {
		return contTypeMapper.selectByPrimaryKey(typeId);
	}

	@Override
	public ContType findIdByEnglishName(String englishName) {
		return contTypeMapper.selectByEnglishName(englishName);
	}

}
