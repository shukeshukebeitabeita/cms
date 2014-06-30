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

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bsb.cms.model.po.auth.SysUser;

@Repository
public interface SysUserMapper {
	
	/**
	 * login
	 * @param sysUser
	 * @return
	 */
	 SysUser login(SysUser sysUser);
	 
	 /**
	  * 分页查询
	  * @param conditions
	  * @return
	  */
	 List<SysUser> findListPage(SysUser conditions);
	 
	 /**
	  * delete user by id
	  * @param sysUser
	  * @return
	  */
	 int deleteById(Long id);
	 
	 /**
	  *  update password
	  * @param sysUser
	  * @return
	  */
	 int updatePwd(SysUser sysUser);
	
	 /**
	  * add a new user.
	  * @param record
	  * @return
	  */
	 Long insert(SysUser record);
	 
	 Long hasRename(String name);
}