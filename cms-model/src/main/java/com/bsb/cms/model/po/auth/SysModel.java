package com.bsb.cms.model.po.auth;

import com.bsb.cms.model.po.Entity;

public class SysModel extends Entity {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5494702697254054225L;

	private Long sysModelId;

	private String modelName;

	private Integer status;

	private String url;

	private String modelCode;

	private Integer type;

	private String urlExt1;

	private String urlExt2;

	private String urlExt3;

	private Long sort;

	private Long parentId;

	public Long getSysModelId() {
		return sysModelId;
	}

	public void setSysModelId(Long sysModelId) {
		this.sysModelId = sysModelId;
	}

	public String getModelName() {
		return modelName;
	}

	public void setModelName(String modelName) {
		this.modelName = modelName == null ? null : modelName.trim();
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url == null ? null : url.trim();
	}

	public String getModelCode() {
		return modelCode;
	}

	public void setModelCode(String modelCode) {
		this.modelCode = modelCode == null ? null : modelCode.trim();
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getUrlExt1() {
		return urlExt1;
	}

	public void setUrlExt1(String urlExt1) {
		this.urlExt1 = urlExt1 == null ? null : urlExt1.trim();
	}

	public String getUrlExt2() {
		return urlExt2;
	}

	public void setUrlExt2(String urlExt2) {
		this.urlExt2 = urlExt2 == null ? null : urlExt2.trim();
	}

	public String getUrlExt3() {
		return urlExt3;
	}

	public void setUrlExt3(String urlExt3) {
		this.urlExt3 = urlExt3 == null ? null : urlExt3.trim();
	}

	public Long getSort() {
		return sort;
	}

	public void setSort(Long sort) {
		this.sort = sort;
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
}