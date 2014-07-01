/**
 * @(#)ContContentService.java 2014-6-27
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
package com.bsb.cms.content.service.content;

import java.util.List;

import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.po.content.ContContent;
import com.bsb.cms.model.po.content.ContContentBody;
import com.bsb.cms.model.vo.content.ContentSearchVO;

/**
 * 内容服务
 * @author hongjian.liu
 * @version 1.0.0 2014-6-27
 * @since 1.0
 */
public interface ContContentService {
	/**
	 * 列表页面搜索
	 * @param conditions
	 * @return
	 */
	List<ContContentDTO> findListPage(ContentSearchVO conditions);
	
	/**
	 * 创建内容
	 * @param content
	 * @param body
	 * @return
	 */
	long create(ContContent content, ContContentBody body);
}
