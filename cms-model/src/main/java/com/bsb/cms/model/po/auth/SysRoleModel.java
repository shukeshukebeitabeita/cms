package com.bsb.cms.model.po.auth;

import com.bsb.cms.model.po.Entity;

public class SysRoleModel extends Entity {
    /**
	 * 
	 */
	private static final long serialVersionUID = -1782232935706837607L;

	private Long sysModelId;

    private Long sysRoleId;


    private String creator;

    /**
     * 
     */
    public SysRoleModel() {
        super();
    }

    /**
     * @param sysModelId
     * @param sysRoleId
     * @param creator
     */
    public SysRoleModel(Long sysModelId, Long sysRoleId, String creator) {
        super();
        this.sysModelId = sysModelId;
        this.sysRoleId = sysRoleId;
        this.creator = creator;
    }
    
    public Long getSysModelId() {
        return sysModelId;
    }

    public void setSysModelId(Long sysModelId) {
        this.sysModelId = sysModelId;
    }

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
}