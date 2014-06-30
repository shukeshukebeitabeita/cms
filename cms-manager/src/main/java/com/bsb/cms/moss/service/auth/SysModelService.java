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
package com.bsb.cms.moss.service.auth;

import java.util.List;

import com.bsb.cms.model.dto.auth.SysModelDTO;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-6-18
 * @since 1.0
 */
public interface SysModelService {
	 /**
     * 根据角色id查询模块。以模块表为主表进行连接查询。
     * @param sysRoleId
     * @return
     */
    List<SysModelDTO> findByRoleId(Long sysRoleId);
    
    /**
     * 查询该角色id下的模块权限。
     * @param sysRoleId
     * @return
     */
    List<SysModelDTO> findModelByRoleId(Long sysRoleId);
}
