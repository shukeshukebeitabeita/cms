package com.bsb.cms.model.vo.content;

import com.bsb.cms.model.enums.ContentEnum;

/**
 * 查询栏目下内容标签的条件对象。
 * <cms:clist type_id="1,2", sort="[{id,asc},{name,desc}]" sql="" count=10></cms:clist>
 * @author liuhj
 *
 */
public class TagContentVO {
//	private Long content_id;//取得一条内容；暂时不实现；以后需要单独建一个cms:c标签
	private Long type_id;
	private int level;//depth
	private Integer status = ContentEnum.DEPLOY.getCode();
	private String sort;//json array eg: [{id,asc},{name,desc}]
	private String sql;//次参赛有值时，其他参数无效。
	private String count;//取得条数
	
	public Long getType_id() {
		return type_id;
	}
	public void setType_id(Long type_id) {
		this.type_id = type_id;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getSql() {
		return sql;
	}
	public void setSql(String sql) {
		this.sql = sql;
	}
	public String getCount() {
		return count;
	}
	public void setCount(String count) {
		this.count = count;
	}
	
	
}
