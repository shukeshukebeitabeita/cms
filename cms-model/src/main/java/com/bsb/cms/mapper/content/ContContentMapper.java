package com.bsb.cms.mapper.content;

import java.util.List;

import com.bsb.cms.model.dto.content.ContContentAllDTO;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.po.content.ContContent;
import com.bsb.cms.model.vo.content.ContentSearchVO;
import com.bsb.cms.model.vo.content.TagContentVO;
import com.bsb.cms.model.vo.content.TypeListSearchVO;

public interface ContContentMapper {
//    int countByExample(ContContentExample example);
//
//    int deleteByExample(ContContentExample example);
//
//    int deleteByPrimaryKey(Long id);
//
//    List<ContContent> selectByExample(ContContentExample example);
//
//    ContContent selectByPrimaryKey(Long id);
//
//    int updateByExampleSelective(@Param("record") ContContent record, @Param("example") ContContentExample example);
//
//    int updateByExample(@Param("record") ContContent record, @Param("example") ContContentExample example);
//
//    int updateByPrimaryKeySelective(ContContent record);
//
	
	/**
	 * moss-列表页面搜索
	 * @param conditions
	 * @return
	 */
	List<ContContent> findListPage(ContentSearchVO conditions);
	/**
	 * create
	 * @param content,包含返回的id
	 * @return insert count
	 */
	long insert(ContContent record);
	
	int insertSelective(ContContent record);
	
	ContContentAllDTO findContentById(Long id);
	
	int updateByPrimaryKey(ContContent record);

	/**
	 * 前台栏目列表页面
	 * @param conditions
	 * @return
	 */
	List<ContContentDTO> findTypeListPage(TypeListSearchVO conditions);
	/**
	 * clist内容查询标签对应的sql。
	 * @param conditions
	 * @return
	 */
	List<ContContentDTO> findListOfTag(TagContentVO conditions);
	
	/**
	 * 
	 * @param typeId
	 * @return
	 */
	List<ContContentDTO> findByTypeId(Long typeId);
}