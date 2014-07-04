package com.bsb.cms.mapper.content;

import com.bsb.cms.model.po.content.TmptTemplateBody;


public interface TmptTemplateBodyMapper {

//    int deleteByExample(TmptTemplateBodyExample example);
//
//    int deleteByPrimaryKey(Long id);
//
    int updateByTemplateId(TmptTemplateBody record);
	
	TmptTemplateBody selectByPrimaryKey(Long id);
	
	TmptTemplateBody selectByTemplateId(Long templateId);
	
	int insert(TmptTemplateBody record);
}