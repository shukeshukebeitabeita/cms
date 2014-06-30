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
package com.bsb.cms.moss.service.impl.auth;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bsb.cms.mapper.SysModelMapper;
import com.bsb.cms.model.dto.auth.SysModelDTO;
import com.bsb.cms.moss.service.auth.SysModelService;

/**
 * @author hongjian.liu
 * @version 1.0.0 2014-6-18
 * @since 1.0
 */
@Service("sysModelService")
public class SysModelServiceImpl implements SysModelService {
    @Resource
    private SysModelMapper sysModelMapper;
    
	/* (non-Javadoc)
	 * @see com.bsb.cms.moss.service.auth.SysModelService#findByRoleId(java.lang.Long)
	 */
	@Override
	public List<SysModelDTO> findByRoleId(Long sysRoleId) {
		return sysModelMapper.findByRoleId(sysRoleId);
	}

	/* (non-Javadoc)
	 * @see com.bsb.cms.moss.service.auth.SysModelService#findModelByRoleId(java.lang.Long)
	 */
	@Override
	public List<SysModelDTO> findModelByRoleId(Long sysRoleId) {
		return sysModelMapper.findModelByRoleId(sysRoleId);
	}

}
