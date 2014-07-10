/**
 * @(#)TmptTemplateServiceImpl.java 2014-7-1
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
package com.bsb.cms.content.service.tmpt.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsb.cms.commons.exceptions.NotFoundDaoException;
import com.bsb.cms.content.service.tmpt.TmptTemplateService;
import com.bsb.cms.mapper.content.TmptTemplateBodyMapper;
import com.bsb.cms.mapper.content.TmptTemplateMapper;
import com.bsb.cms.model.po.content.TmptTemplate;
import com.bsb.cms.model.po.content.TmptTemplateBody;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-7-1
 * @since 1.0
 */
@Service("tmptTemplateService")
public class TmptTemplateServiceImpl implements TmptTemplateService {
	@Resource
	private TmptTemplateMapper tmptTemplateMapper;
	@Resource
	private TmptTemplateBodyMapper tmptTemplateBodyMapper;

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.tmpt.TmptTemplateService#findById(java.lang.Long)
	 */
	@Override
	public TmptTemplate findById(Long id) {
		return tmptTemplateMapper.selectByPrimaryKey(id);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.tmpt.TmptTemplateService#findChildrenById(java.lang.Long)
	 */
	@Override
	public List<TmptTemplate> findChildrenById(Long id) {
		return tmptTemplateMapper.findChildrenById(id);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.tmpt.TmptTemplateService#findBodyByTemplateId(long)
	 */
	@Override
	public TmptTemplateBody findBodyByTemplateId(long templateId) {
		return tmptTemplateBodyMapper.selectByTemplateId(templateId);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.tmpt.TmptTemplateService#create(com.bsb.cms.model.po.content.TmptTemplate, com.bsb.cms.model.po.content.TmptTemplateBody)
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public Long create(TmptTemplate template, TmptTemplateBody body) {
		int count = tmptTemplateMapper.insert(template);
		if(count <= 0) throw new NotFoundDaoException("成功条数为0");
		
		if(template.getHasLeaf().intValue() == 1) {
			body.setTemplateId(template.getId());
			count = tmptTemplateBodyMapper.insert(body);
			if(count <= 0) throw new NotFoundDaoException("成功条数为0");
		}
		
		return template.getId();
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.tmpt.TmptTemplateService#update(com.bsb.cms.model.po.content.TmptTemplate, com.bsb.cms.model.po.content.TmptTemplateBody)
	 */
	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public void update(TmptTemplate template, TmptTemplateBody body) {
		tmptTemplateMapper.updateByPrimaryKey(template);
		body.setTemplateId(template.getId());
		if(template.getHasLeaf().intValue() == 1) {
			tmptTemplateBodyMapper.updateByTemplateId(body);
		}
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.tmpt.TmptTemplateService#findTemplateAll()
	 */
	@Override
	public List<TmptTemplate> findTemplateAll() {
		return tmptTemplateMapper.findTemplateAll();
	}
	
}
