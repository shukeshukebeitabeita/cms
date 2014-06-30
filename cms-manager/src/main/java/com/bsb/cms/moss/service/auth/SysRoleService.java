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

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.model.dto.auth.SysRoleDTO;
import com.bsb.cms.model.po.auth.SysRole;
import com.bsb.cms.model.vo.ComboboxJsonVO;


/**
 * 角色管理服务层。
 * <ul>
 * <li>查询角色列表</li>
 * <li>添加角色</li>
 * <li>修改角色</li>
 * </ul>
 * @author hongjian.liu
 * @version 1.0.0 2013-6-8
 * @since 1.0
 */
public interface SysRoleService {

    /**
     * 取得所有角色，返回easyui的combobox使用的对象类型。
     * @return
     */
    List<ComboboxJsonVO> getRoles();
    
    /**
     * 查询列表。
     * 
     * @param conditions 查询条件。
     * @return 分页对象
     */
    List<SysRoleDTO> findByPage(SysRoleDTO conditions);
    
    /**
     * 删除主键为sysRoleId角色。
     * @param sysRoleId
     * @return
     */
    int deleteById(Long sysRoleId);
    
    /**
     * 
     * @param sysRole
     * @param sysModelIds
     * @return 创建后的对象id
     */
    Long create(SysRole sysRole, String[] sysModelIds) throws RenameRuntimeException;
    
    /**
     * 判断是否重名。
     * 
     * @param name
     * @param sysRoleId
     * @return
     */
    boolean isRename(String name, Long sysRoleId);
    
    /**
     * 修改一个角色。
     * @param sysRole 要修改的角色
     * @param sysModelIds 角色所拥有的权限模块id
     * @throws RenameRuntimeException
     */
    void update(SysRole sysRole, String[] sysModelIds) throws RenameRuntimeException;
    
    /**
     * 根据角色id查询角色。
     * @param sysRoleId
     * @return
     */
    SysRole getById(Long sysRoleId);
    

}
