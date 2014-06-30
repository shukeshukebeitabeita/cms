/**
 * @(#)${file_name} ${date}
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
package com.bsb.cms.mapper;

import org.springframework.stereotype.Repository;

import com.bsb.cms.model.po.auth.SysRoleModel;

@Repository
public interface SysRoleModelMapper {
	
	int deleteByRoleId(Long sysRoleId);
	
	Long insert(SysRoleModel sysRoleModel);
}