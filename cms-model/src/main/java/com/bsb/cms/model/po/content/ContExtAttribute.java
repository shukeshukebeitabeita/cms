package com.bsb.cms.model.po.content;
/**
 * 动态属性/扩展属性对象
 * @author hongjian.liu
 * @version 1.0.0 2014-6-25
 * @since 1.0
 */
public class ContExtAttribute extends ContExtAttributeKey {
    /**
	 * 
	 */
	private static final long serialVersionUID = -2278456991312680582L;

	private String extAttrName;

    private Short extAttrType;

    private String extDefaultValue;

    private String extAttrDesc;

    private Short extSort;

    public String getExtAttrName() {
        return extAttrName;
    }

    public void setExtAttrName(String extAttrName) {
        this.extAttrName = extAttrName == null ? null : extAttrName.trim();
    }

    public Short getExtAttrType() {
        return extAttrType;
    }

    public void setExtAttrType(Short extAttrType) {
        this.extAttrType = extAttrType;
    }

    public String getExtDefaultValue() {
        return extDefaultValue;
    }

    public void setExtDefaultValue(String extDefaultValue) {
        this.extDefaultValue = extDefaultValue == null ? null : extDefaultValue.trim();
    }

    public String getExtAttrDesc() {
        return extAttrDesc;
    }

    public void setExtAttrDesc(String extAttrDesc) {
        this.extAttrDesc = extAttrDesc == null ? null : extAttrDesc.trim();
    }

    public Short getExtSort() {
        return extSort;
    }

    public void setExtSort(Short extSort) {
        this.extSort = extSort;
    }
}