package com.bsb.cms.model.po.spider;

import com.bsb.cms.model.po.Entity;

public class SpiderConfig extends Entity {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7851255264243836463L;

	//基本信息
	/**id*/
	private Long id;
	/**采集节点名*/
	private String nodeName;
	/**采集节点父节点。采集节点也是数状。可以和栏目对应 暂时不支持。预留字段。*/
	private Long nodePerantId;
	/**采集列表页地址*/
	private String listUrl;
	/**内容根地址*/
	private String conternBaseUrl;
	/**图片地址前缀*/
	private String imgBaseUrl;
	/**入库栏目;逗号分割*/
	private String typeIds;
	/**备注*/
	private String remark;
	/**是否保存图片到本地*/
	private Short hasSaveImgToLocal = 0;
	/**信息来源*/
	private String contentSource;
	/**采集间隔时间。分钟*/
	private String jobTime;
	
	//过滤选项
	/**内容替换。源*/
	private String filterSource;
	/**内容替换。替换为*/
	private String filterTarger;
	/**广告过滤规则*/
	private String adFilter;
	/**获取内容简介。多少个字。内容页采集设置时，如果内容简介抓取项为空，则这里设置的有效，从文章中自动截取*/
	private String conterAbort;
	
	//列表页采集
	/**列表页内容链接区正则（jgroup）*/
	private String listLinksAreaRule;
	/**列表页内容链接正则（jgroup）*/
	private String listLinkRule;
	/**标题图片正则（jgroup）。如果标题图片在内容页，则不填。*/
	private String titleImgRule;
	
	//内容页采集设置
	/**内容标题正则（jgroup）*/
	private String titleRule;
	/**内容标题图片正则（jgroup）*/
	private String contentTitleImgRule;
	/**内容简介正则（jgroup）*/
	private String contentAbortRule;
	/**内容正则（jgroup）*/
	private String contentRule;
	
	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getNodeName() {
		return nodeName;
	}

	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}

	public Long getNodePerantId() {
		return nodePerantId;
	}

	public void setNodePerantId(Long nodePerantId) {
		this.nodePerantId = nodePerantId;
	}

	public String getListUrl() {
		return listUrl;
	}

	public void setListUrl(String listUrl) {
		this.listUrl = listUrl;
	}

	public String getConternBaseUrl() {
		return conternBaseUrl;
	}

	public void setConternBaseUrl(String conternBaseUrl) {
		this.conternBaseUrl = conternBaseUrl;
	}

	public String getImgBaseUrl() {
		return imgBaseUrl;
	}

	public void setImgBaseUrl(String imgBaseUrl) {
		this.imgBaseUrl = imgBaseUrl;
	}

	public String getTypeIds() {
		return typeIds;
	}

	public void setTypeIds(String typeIds) {
		this.typeIds = typeIds;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Short getHasSaveImgToLocal() {
		return hasSaveImgToLocal;
	}

	public void setHasSaveImgToLocal(Short hasSaveImgToLocal) {
		this.hasSaveImgToLocal = hasSaveImgToLocal;
	}

	public String getContentSource() {
		return contentSource;
	}

	public void setContentSource(String contentSource) {
		this.contentSource = contentSource;
	}

	public String getJobTime() {
		return jobTime;
	}

	public void setJobTime(String jobTime) {
		this.jobTime = jobTime;
	}

	public String getFilterSource() {
		return filterSource;
	}

	public void setFilterSource(String filterSource) {
		this.filterSource = filterSource;
	}

	public String getFilterTarger() {
		return filterTarger;
	}

	public void setFilterTarger(String filterTarger) {
		this.filterTarger = filterTarger;
	}

	public String getAdFilter() {
		return adFilter;
	}

	public void setAdFilter(String adFilter) {
		this.adFilter = adFilter;
	}

	public String getConterAbort() {
		return conterAbort;
	}

	public void setConterAbort(String conterAbort) {
		this.conterAbort = conterAbort;
	}

	public String getListLinksAreaRule() {
		return listLinksAreaRule;
	}

	public void setListLinksAreaRule(String listLinksAreaRule) {
		this.listLinksAreaRule = listLinksAreaRule;
	}

	public String getListLinkRule() {
		return listLinkRule;
	}

	public void setListLinkRule(String listLinkRule) {
		this.listLinkRule = listLinkRule;
	}

	public String getTitleImgRule() {
		return titleImgRule;
	}

	public void setTitleImgRule(String titleImgRule) {
		this.titleImgRule = titleImgRule;
	}

	public String getTitleRule() {
		return titleRule;
	}

	public void setTitleRule(String titleRule) {
		this.titleRule = titleRule;
	}

	public String getContentTitleImgRule() {
		return contentTitleImgRule;
	}

	public void setContentTitleImgRule(String contentTitleImgRule) {
		this.contentTitleImgRule = contentTitleImgRule;
	}

	public String getContentAbortRule() {
		return contentAbortRule;
	}

	public void setContentAbortRule(String contentAbortRule) {
		this.contentAbortRule = contentAbortRule;
	}

	public String getContentRule() {
		return contentRule;
	}

	public void setContentRule(String contentRule) {
		this.contentRule = contentRule;
	}
	
}
