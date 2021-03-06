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

    private Long typeId;//最后一级栏目id
    
    //该记录1到4级栏目id。只保留到四级。不建议栏目层级超过4级。本系统按最多4级做。
    private Long typeId1;
    private Long typeId2;
    private Long typeId3;
    private Long typeId4;

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
    
    private String contentUrl;
    
    //temp
    private String typeName;
    private String attributeName;

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

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getAttributeName() {
		return attributeName;
	}

	public void setAttributeName(String attributeName) {
		this.attributeName = attributeName;
	}

	public String getContentUrl() {
		return contentUrl;
	}

	public void setContentUrl(String contentUrl) {
		this.contentUrl = contentUrl;
	}

	public Long getTypeId1() {
		return typeId1;
	}

	public void setTypeId1(Long typeId1) {
		this.typeId1 = typeId1;
	}

	public Long getTypeId2() {
		return typeId2;
	}

	public void setTypeId2(Long typeId2) {
		this.typeId2 = typeId2;
	}

	public Long getTypeId3() {
		return typeId3;
	}

	public void setTypeId3(Long typeId3) {
		this.typeId3 = typeId3;
	}

	public Long getTypeId4() {
		return typeId4;
	}

	public void setTypeId4(Long typeId4) {
		this.typeId4 = typeId4;
	}

}