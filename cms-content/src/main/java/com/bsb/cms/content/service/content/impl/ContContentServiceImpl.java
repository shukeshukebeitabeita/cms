/**
 * @(#)ContContentServiceImpl.java 2014-6-27
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

import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.mapper.content.ContContentBodyMapper;
import com.bsb.cms.mapper.content.ContContentMapper;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.po.content.ContContent;
import com.bsb.cms.model.po.content.ContContentBody;
import com.bsb.cms.model.vo.content.ContentSearchVO;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-6-27
 * @since 1.0
 */
@Service("contContentService")
public class ContContentServiceImpl implements ContContentService {
	@Resource(name="contContentMapper")
	private ContContentMapper contContentMapper;
	@Resource(name="contContentBodyMapper")
	private ContContentBodyMapper contContentBodyMapper;

	/* (non-Javadoc)
	 * @see com.bsb.cms.content.service.content.ContContentService#findListPage(com.bsb.cms.model.vo.content.ContentSearchVO)
	 */
	@Override
	public List<ContContentDTO> findListPage(ContentSearchVO conditions) {
		return contContentMapper.findListPage(conditions);
	}

	@Override
	@Transactional(propagation=Propagation.REQUIRED)
	public long create(ContContent content, ContContentBody body) {
		long contentId = contContentMapper.insert(content);
		if(body != null && contentId > 0) {
			body.setContentId(contentId);
			contContentBodyMapper.insert(body);
		}
		
		return contentId;
	}

}
