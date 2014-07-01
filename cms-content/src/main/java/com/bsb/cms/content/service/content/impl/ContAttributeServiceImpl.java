/**
 * @(#)ContAttributeImpl.java 2014-7-1
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

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bsb.cms.content.service.content.ContAttributeService;
import com.bsb.cms.mapper.content.ContAttributeMapper;
import com.bsb.cms.model.po.content.ContAttribute;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-1
 * @since 1.0
 */
@Service("contAttributeService")
public class ContAttributeServiceImpl implements ContAttributeService {
	@Resource(name="contAttributeMapper")
	private ContAttributeMapper ContAttributeMapper;
	
	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#findById(java.lang.Long)
	 */
	@Override
	public ContAttribute findById(Long id) {
		return ContAttributeMapper.selectByPrimaryKey(id);
	}

}
