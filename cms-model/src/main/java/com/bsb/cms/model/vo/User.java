/**
 * @(#)User.java 2013-5-29
 *
 * Copyright (c) 2013-2014 UNS (China) Int'l Co., Ltd
 * 3855 shang nan Road. pu dong District.Shanghai 201302 China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of UNS (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with UNS (China).
 */
package com.bsb.cms.model.vo;

import java.io.Serializable;
import java.util.List;

import com.bsb.cms.model.dto.auth.SysModelDTO;
import com.bsb.cms.model.po.auth.SysUser;

/**
 * 用户登录后的用户信息放在此类里。
 * 
 * @author hongjian.liu
 * @version 1.0.0 2013-5-29
 * @since 1.0
 */
public class User implements Serializable {

    /**
     * 
     */
    private static final long serialVersionUID = 3360509018817640234L;
    private SysUser sysUser;// 用户信息，对应数据库用户信息表。
    private String roleName;// 角色名

    private List<SysModelDTO> menus;//权限信息

    /**
     * @return the roleName
     */
    public String getRoleName() {
        return roleName;
    }

    /**
     * @param roleName the roleName to set
     */
    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    /**
     * @return the sysUser
     */
    public SysUser getSysUser() {
        return sysUser;
    }

    /**
     * @param sysUser the sysUser to set
     */
    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    
    /**
     * @return the menus
     */
    public List<SysModelDTO> getMenus() {
        return menus;
    }

    
    /**
     * @param menus the menus to set
     */
    public void setMenus(List<SysModelDTO> menus) {
        this.menus = menus;
    }

}
