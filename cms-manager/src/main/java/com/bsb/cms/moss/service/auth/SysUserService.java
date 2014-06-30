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

import com.bsb.cms.commons.exceptions.BaseRuntimeException;
import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.model.po.auth.SysUser;


/**
 * 系统用户管理
 * @author hongjian.liu
 * @version 1.0.0 2013-6-6
 * @since 1.0
 */
public interface SysUserService {
    /**
     * 查询列表。
     * 
     * @param conditions 查询条件。
     * @return 分页对象
     */
    List<SysUser> findByPage(SysUser conditions);
    
    /**
     * 根据sysUserId删除一条会员记录。逻辑删除。
     * @param sysUserId
     * @return
     */
    int deleteById(Long sysUserId);
    
    /**
     * 根据sysUserId修改一个用户的修改密码
     * @param sysUserId 操作员id
     * @param password 新密码
     * @return
     */
    int  updatePwd(Long sysUserId, String password);
    
    /**
     * 添加一条操作员。
     * @param sysUser
     * @return
     */
    Long create(SysUser sysUser) throws RenameRuntimeException;
    
    /**
     * 判断是否重名。
     * 
     * @param name
     * @return
     */
    boolean isRename(String name);
    
    /**
     * 登录操作。
     * @param name
     * @param password
     * @return
     */
    SysUser login(String name, String password) throws BaseRuntimeException;
}
