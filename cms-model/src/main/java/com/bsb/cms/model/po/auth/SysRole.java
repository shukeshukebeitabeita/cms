package com.bsb.cms.model.po.auth;

import com.bsb.cms.model.po.Entity;

public class SysRole extends Entity {
    /**
	 * 
	 */
	private static final long serialVersionUID = 5226016498599885723L;

	private Long sysRoleId;

    private String creator;

    private String roleName;

    public Long getSysRoleId() {
        return sysRoleId;
    }

    public void setSysRoleId(Long sysRoleId) {
        this.sysRoleId = sysRoleId;
    }

    public String getCreator() {
        return creator;
    }

    public void setCreator(String creator) {
        this.creator = creator == null ? null : creator.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

}