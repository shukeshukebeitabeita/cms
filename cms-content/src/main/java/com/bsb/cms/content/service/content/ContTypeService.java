/**
 * @(#)ContTypeService.java 2014-6-25
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

import com.bsb.cms.model.po.content.ContType;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public interface ContTypeService {
	/**
	 * 查询用户有权看到的栏目。显示在左侧
	 * @param sysUserId
	 * @return
	 */
	List<ContType> findByUser(Long sysUserId);
	
	/**
	 * find type by id
	 * @param typeId
	 * @return
	 */
	ContType findById(Long typeId);
	
	ContType findIdByEnglishName(String englishName);
}
