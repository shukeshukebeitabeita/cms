/**
 * @(#)TmptTemplateService.java 2014-7-1
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
package com.bsb.cms.content.service.tmpt;

import com.bsb.cms.model.po.content.TmptTemplate;

/**
 * 模板service
 * @author hongjian.liu
 * @version 1.0.0 2014-7-1
 * @since 1.0
 */
public interface TmptTemplateService {
	
	TmptTemplate findById(Long id);
}
