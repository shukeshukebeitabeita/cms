/**
 * @(#)ContContentPublisherService.java 2014-7-8
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
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.vo.PublishResult;

/**
 * 内容发布
 * @author hongjian.liu
 * @version 1.0.0 2014-7-8
 * @since 1.0
 */
public interface ContContentPublisherService {

	/**
	 * 发布栏目首页和栏目下内容页
	 * @param type
	 * @return
	 */
	public PublishResult publishType(ContTypeDTO type);
	//public PublishResult publishType(String typeId);
	
	/**
	 * 全站发布
	 * @return
	 */
	public PublishResult publishAll();
	
	/**
	 * 发布一条内容.
	 * @param content
	 * @return
	 */
	public PublishResult publishContent(ContContentDTO content);
	
	/**
	 * 发布多条内容
	 * @param contentIds
	 * @return
	 */
	public PublishResult publishContent(List<String> contentIds);
	
	/**
	 * 仅发布栏目首页(不包括栏目下内容页)
	 * @param type 栏目， 可为空，空时发布所有栏目
	 * @return
	 */
	public PublishResult publishTypeIndex(ContTypeDTO type);
}
