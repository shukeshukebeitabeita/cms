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

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.mapper.SysRoleMapper;
import com.bsb.cms.mapper.SysRoleModelMapper;
import com.bsb.cms.model.dto.auth.SysRoleDTO;
import com.bsb.cms.model.po.auth.SysRole;
import com.bsb.cms.model.po.auth.SysRoleModel;
import com.bsb.cms.model.vo.ComboboxJsonVO;
import com.bsb.cms.moss.service.auth.SysRoleService;

/**
 * @see #SysRoleService
 * @author hongjian.liu
 * @version 1.0.0 2013-6-8
 * @since 1.0
 */
@Service("sysRoleService")
public class SysRoleServiceImpl implements SysRoleService {

	@Resource
	private SysRoleMapper sysRoleMapper;
	@Resource
	private SysRoleModelMapper sysRoleModelMapper;

	@Override
	public List<ComboboxJsonVO> getRoles() {
		return sysRoleMapper.getRoles();
	}

	@Override
	public List<SysRoleDTO> findByPage(SysRoleDTO conditions) {
		return sysRoleMapper.findListPage(conditions);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public int deleteById(Long sysRoleId) {
		// longDAO.delete("SYS_ROLE.deleteByPrimaryKey", sysRoleId);
		// return longDAO.delete("SYS_ROLE_MODEL.deleteByRoleId", sysRoleId);
		return 1;// TODO
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor=Exception.class)
	public Long create(SysRole sysRole, String[] sysModelIds)
			throws RenameRuntimeException {
		if (isRename(sysRole.getRoleName(), null)) {
			throw new RenameRuntimeException("角色名已存在！");
		}
		Long roleId = sysRoleMapper.insert(sysRole);
		insertRoleModel(roleId, sysModelIds, sysRole.getCreator());// 插入角色模块对应关系

		return roleId;
	}

	@Override
	@Transactional(propagation = Propagation.SUPPORTS)
	public boolean isRename(String name, Long sysRoleId) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("roleName", name);
		map.put("sysRoleId", sysRoleId);
		Long count = sysRoleMapper.hasRename(map);// 判断是否有使用。
		return (count != null && count > 0) ? true : false;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED)
	public void update(SysRole sysRole, String[] sysModelIds)
			throws RenameRuntimeException {
		if (isRename(sysRole.getRoleName(), sysRole.getSysRoleId())) {
			throw new RenameRuntimeException("角色名已存在！");
		}
		sysRoleModelMapper.deleteByRoleId(sysRole.getSysRoleId());// 删除角色模块对应关系
		insertRoleModel(new Long(sysRole.getSysRoleId()), sysModelIds,
				sysRole.getCreator());// 插入角色模块对应关系
		sysRoleMapper.update(sysRole);
	}

	/**
	 * 插入角色模块对应关系
	 * 
	 * @param roleId
	 * @param sysModelIds
	 * @param creator
	 */
	@Transactional(propagation = Propagation.SUPPORTS)
	private void insertRoleModel(Long roleId, String[] sysModelIds,
			String creator) {
		SysRoleModel sysRoleModel;
		for (String sysModelId : sysModelIds) {
			sysRoleModel = new SysRoleModel(Long.valueOf(sysModelId), roleId,
					creator);
			sysRoleModelMapper.insert(sysRoleModel);
		}
	}

	@Override
	public SysRole getById(Long sysRoleId) {
		return sysRoleMapper.getById(sysRoleId);
	}

}
