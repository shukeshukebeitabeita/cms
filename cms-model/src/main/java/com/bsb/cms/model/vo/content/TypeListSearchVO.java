package com.bsb.cms.model.vo.content;

import com.bsb.cms.model.enums.ContentEnum;

/**
 * 前台-栏目列表查询条件
 * @author liuhj
 *
 */
public class TypeListSearchVO {
	private Long type_id;
	private Integer status = ContentEnum.DEPLOY.getCode();

	public Long getType_id() {
		return type_id;
	}

	public void setType_id(Long type_id) {
		this.type_id = type_id;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}
	

}
