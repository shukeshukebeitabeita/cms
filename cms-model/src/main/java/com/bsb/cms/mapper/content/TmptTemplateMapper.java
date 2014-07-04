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
//    int countByExample(TmptTemplateExample example);
//
//    int deleteByExample(TmptTemplateExample example);
//
//    int deleteByPrimaryKey(Long id);
//
//    int insert(TmptTemplate record);
//
//    int insertSelective(TmptTemplate record);
//
//    List<TmptTemplate> selectByExample(TmptTemplateExample example);
//
//    int updateByExampleSelective(@Param("record") TmptTemplate record, @Param("example") TmptTemplateExample example);
//
//    int updateByExample(@Param("record") TmptTemplate record, @Param("example") TmptTemplateExample example);
//
//    int updateByPrimaryKeySelective(TmptTemplate record);
//
//    int updateByPrimaryKey(TmptTemplate record);
	
	TmptTemplate selectByPrimaryKey(Long id);
	
	List<TmptTemplate> findChildrenById(Long parentId);
}