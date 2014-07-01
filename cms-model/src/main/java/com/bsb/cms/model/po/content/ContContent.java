package com.bsb.cms.model.po.content;

import java.math.BigDecimal;

import com.bsb.cms.model.po.Entity;
/**
 * 内容对象
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class ContContent extends Entity {
    /**
	 * 
	 */
	private static final long serialVersionUID = -8833812466315256791L;

	private Long id;

    private String title;

    private String about;

    private String defaultImg;

    private String vedio;

    private String audio;

    private String link;

    private Long typeId;

    private Long attrId;

    private Long templateId;

    private String author;

    private String publishTime;

    private Short hasHot = 0;

    private Short hasLatest = 0;

    private Short hasTop = 0;

    private String metaTitle;

    private String metaKeywords;

    private String metaDescription;

    private String cTag;

    private String keyword;

    private Integer sort;

    private String source;

    private BigDecimal price;

    private BigDecimal salePrice;

    private Integer stock;

    private BigDecimal discount;

    private String brand;

    private String goodsUrl;

    private Integer status;

    private String titleStyle;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about == null ? null : about.trim();
    }

    public String getDefaultImg() {
        return defaultImg;
    }

    public void setDefaultImg(String defaultImg) {
        this.defaultImg = defaultImg == null ? null : defaultImg.trim();
    }

    public String getVedio() {
        return vedio;
    }

    public void setVedio(String vedio) {
        this.vedio = vedio == null ? null : vedio.trim();
    }

    public String getAudio() {
        return audio;
    }

    public void setAudio(String audio) {
        this.audio = audio == null ? null : audio.trim();
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    public Long getTypeId() {
        return typeId;
    }

    public void setTypeId(Long typeId) {
        this.typeId = typeId;
    }

    public Long getAttrId() {
        return attrId;
    }

    public void setAttrId(Long attrId) {
        this.attrId = attrId;
    }

    public Long getTemplateId() {
        return templateId;
    }

    public void setTemplateId(Long templateId) {
        this.templateId = templateId;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public String getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    public Short getHasHot() {
        return hasHot;
    }

    public void setHasHot(Short hasHot) {
        this.hasHot = hasHot;
    }

    public Short getHasLatest() {
        return hasLatest;
    }

    public void setHasLatest(Short hasLatest) {
        this.hasLatest = hasLatest;
    }

    public Short getHasTop() {
        return hasTop;
    }

    public void setHasTop(Short hasTop) {
        this.hasTop = hasTop;
    }

    public String getMetaTitle() {
        return metaTitle;
    }

    public void setMetaTitle(String metaTitle) {
        this.metaTitle = metaTitle == null ? null : metaTitle.trim();
    }

    public String getMetaKeywords() {
        return metaKeywords;
    }

    public void setMetaKeywords(String metaKeywords) {
        this.metaKeywords = metaKeywords == null ? null : metaKeywords.trim();
    }

    public String getMetaDescription() {
        return metaDescription;
    }

    public void setMetaDescription(String metaDescription) {
        this.metaDescription = metaDescription == null ? null : metaDescription.trim();
    }

    public String getcTag() {
        return cTag;
    }

    public void setcTag(String cTag) {
        this.cTag = cTag == null ? null : cTag.trim();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword == null ? null : keyword.trim();
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source == null ? null : source.trim();
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public BigDecimal getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(BigDecimal salePrice) {
        this.salePrice = salePrice;
    }

    public Integer getStock() {
        return stock;
    }

    public void setStock(Integer stock) {
        this.stock = stock;
    }

    public BigDecimal getDiscount() {
        return discount;
    }

    public void setDiscount(BigDecimal discount) {
        this.discount = discount;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand == null ? null : brand.trim();
    }

    public String getGoodsUrl() {
        return goodsUrl;
    }

    public void setGoodsUrl(String goodsUrl) {
        this.goodsUrl = goodsUrl == null ? null : goodsUrl.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getTitleStyle() {
        return titleStyle;
    }

    public void setTitleStyle(String titleStyle) {
        this.titleStyle = titleStyle == null ? null : titleStyle.trim();
    }

}