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

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsb.cms.commons.exceptions.NotFoundDaoException;
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
	private ContAttributeMapper contAttributeMapper;
	
	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#findById(java.lang.Long)
	 */
	@Override
	public ContAttribute findById(Long id) {
		return contAttributeMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#findListPage(com.bsb.cms.model.po.content.ContAttribute)
	 */
	@Override
	public List<ContAttribute> findListPage(ContAttribute conditions) {
		return contAttributeMapper.findListPage(conditions);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#create(com.bsb.cms.model.po.content.ContAttribute)
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public Long create(ContAttribute record) {
		contAttributeMapper.insert(record);
		return record.getId();
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContAttributeService#updateById(com.bsb.cms.model.po.content.ContAttribute)
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void updateById(ContAttribute record) {
		int count = contAttributeMapper.updateByPrimaryKey(record);
		if(count <= 0) throw new NotFoundDaoException("成功条数为0");
	}



}
