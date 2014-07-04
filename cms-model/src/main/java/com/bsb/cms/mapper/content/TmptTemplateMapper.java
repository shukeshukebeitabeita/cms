package com.bsb.cms.mapper.content;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.bsb.cms.model.po.content.TmptTemplate;

/**
 * 模板 dao
 * @author hongjian.liu
 * @version 1.0.0 2014-7-1
 * @since 1.0
 */
@Repository
public interface TmptTemplateMapper {

//    int deleteByPrimaryKey(Long id);
	
	TmptTemplate selectByPrimaryKey(Long id);
	
	List<TmptTemplate> findChildrenById(Long parentId);
	
	int insert(TmptTemplate record);
	
	int updateByPrimaryKey(TmptTemplate record);
}