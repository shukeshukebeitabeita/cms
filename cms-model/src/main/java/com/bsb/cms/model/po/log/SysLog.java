package com.bsb.cms.model.po.log;

import java.io.Serializable;
import java.util.Date;

import org.apache.commons.lang.time.DateFormatUtils;

import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.enums.RelevanceTypeEnum;

public class SysLog implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7217689280339331686L;
	private Long id; // 主键
	private String operator; // 操作员
	private OperateTypeEnum operateType; // 操作类型
	private String remark; // 备注说明
	private Date createTime;// 日志时间
	private String operatePage;// 操作页面
	private Long relevanceId;// 关联ID
	private RelevanceTypeEnum relevanceType; // 关联类型

	// 页面显示
	private String operateDescription;

	private String operateTime;

	/**
     * 
     */
	public SysLog() {
	}

	public String getOperateDescription() {
		operateDescription = operateType.getDescription();
		return operateDescription;
	}

	public void setOperateDescription(String operateDescription) {
		this.operateDescription = operateDescription;
	}

	public String getOperateTime() {
		operateTime = DateFormatUtils.format(createTime, "yyyy-MM-dd hh:mm:ss");
		return operateTime;
	}

	public void setOperateTime(String operateTime) {
		this.operateTime = operateTime;
	}

	/**
	 * 
	 * 有关联对象的构造函数
	 * 
	 * @param operateType
	 *            @see OperateTypeEnum
	 * @param remark
	 *            备注
	 * @param operatePage
	 *            操作页面
	 * @param relevanceId
	 *            关联ID
	 * @param relevanceType
	 *            关联类型
	 */
	public SysLog(OperateTypeEnum operateType, String remark,
			String operatePage, Long relevanceId,
			RelevanceTypeEnum relevanceType) {
		this.operateType = operateType;
		this.remark = remark;
		this.operatePage = operatePage;
		this.relevanceId = relevanceId;
		this.relevanceType = relevanceType;
	}

	/**
	 * 无关联对象的构造函数
	 * 
	 * @param operateType
	 *            @see OperateTypeEnum
	 * @param remark
	 *            备注
	 * @param operatePage
	 *            操作页面
	 */
	public SysLog(OperateTypeEnum operateType, String remark, String operatePage) {
		this.operateType = operateType;
		this.remark = remark;
		this.operatePage = operatePage;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public OperateTypeEnum getOperateType() {
		return operateType;
	}

	public void setOperateType(OperateTypeEnum operateType) {
		this.operateType = operateType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getOperatePage() {
		return operatePage;
	}

	public void setOperatePage(String operatePage) {
		this.operatePage = operatePage;
	}

	public Long getRelevanceId() {
		return relevanceId;
	}

	public void setRelevanceId(Long relevanceId) {
		this.relevanceId = relevanceId;
	}

	public RelevanceTypeEnum getRelevanceType() {
		return relevanceType;
	}

	public void setRelevanceType(RelevanceTypeEnum relevanceType) {
		this.relevanceType = relevanceType;
	}

}