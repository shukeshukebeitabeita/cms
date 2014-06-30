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

import com.bsb.cms.model.dto.auth.SysModelDTO;
import com.bsb.cms.model.po.auth.SysModel;

@Repository
public interface SysModelMapper {

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
    
    /**
     * 查询所有有效资源权限信息
     * @return
     */
    List<SysModel> findAll();
}