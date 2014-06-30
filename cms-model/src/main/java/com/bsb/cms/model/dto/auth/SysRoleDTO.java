/**
 * @(#)SysRoleDTO.java 2013-6-8
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
package com.bsb.cms.model.dto.auth;

import java.io.Serializable;


/**
 * 角色列表页显示用对象。
 * @author hongjian.liu
 * @version 1.0.0 2013-6-8
 * @since 1.0
 */
public class SysRoleDTO implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = -3682774482087784420L;
    private Integer sysRoleId;//角色id
    private String roleName;//角色名
    private String roleUser;//该角色下的用户。
    
    /**
     * @return the sysRoleId
     */
    public Integer getSysRoleId() {
        return sysRoleId;
    }
    
    /**
     * @param sysRoleId the sysRoleId to set
     */
    public void setSysRoleId(Integer sysRoleId) {
        this.sysRoleId = sysRoleId;
    }
    
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
     * @return the roleUser
     */
    public String getRoleUser() {
        return roleUser;
    }
    
    /**
     * @param roleUser the roleUser to set
     */
    public void setRoleUser(String roleUser) {
        this.roleUser = roleUser;
    }
    
    
}
