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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.bsb.cms.commons.exceptions.BaseRuntimeException;
import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.security.SecurityService;
import com.bsb.cms.mapper.SysUserMapper;
import com.bsb.cms.model.enums.DefaultStatus;
import com.bsb.cms.model.po.auth.SysUser;
import com.bsb.cms.moss.service.auth.SysUserService;

/**
 * @see #SysUserService
 * @author hongjian.liu
 * @version 1.0.0 2013-6-6
 * @since 1.0
 */
@Service("sysUserService")
public class SysUserServiceImpl implements SysUserService {

    @Resource(name = "securityService")
    private SecurityService securityService;
    @Autowired
    private SysUserMapper sysUserMapper;

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.bsb.cms.moss.service.auth.SysUserService#findByPage(com.bsb.cms.moss.service.impl.auth.SysUser)
     */
    @Override
    public List<SysUser> findByPage(SysUser conditions) {
        return sysUserMapper.findListPage(conditions);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.bsb.cms.moss.service.auth.SysUserService#deleteById(java.lang.Long)
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int deleteById(Long sysUserId) {
        return sysUserMapper.deleteById(sysUserId);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.bsb.cms.moss.service.auth.SysUserService#updatePwd(java.lang.Long,
     * java.lang.String)
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public int updatePwd(Long sysUserId, String password) {
        SysUser sysUser = new SysUser();
        sysUser.setSysUserId(sysUserId);
        sysUser.setPassword(password);
        
        return sysUserMapper.updatePwd(sysUser);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.bsb.cms.moss.service.auth.SysUserService#create(com.bsb.cms.moss.service.impl.auth.SysUser)
     */
    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public Long create(SysUser sysUser) throws RenameRuntimeException {
        if (isRename(sysUser.getName())) {
            throw new RenameRuntimeException("操作员姓名已存在！");
        }
        
        return sysUserMapper.insert(sysUser);
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.bsb.cms.moss.service.auth.SysUserService#isRename(java.lang.String)
     */
    @Override
    @Transactional(propagation = Propagation.SUPPORTS)
    public boolean isRename(String name) {
        Long count = sysUserMapper.hasRename(name);// 判断是否有使用。
        return (count != null && count > 0) ? true : false;
    }

    /*
     * (non-Javadoc)
     * 
     * @see com.bsb.cms.moss.service.auth.SysUserService#login(java.lang.String, java.lang.String)
     */
    @Override
    public SysUser login(String name, String password) throws BaseRuntimeException {
        SysUser sysUser = new SysUser();
        sysUser.setLoginName(name);
        sysUser.setPassword(securityService.encPassword(password));
        sysUser.setStatus(DefaultStatus.VALID.getCode());
        SysUser user = sysUserMapper.login(sysUser);
        
        return user;
    }

}
