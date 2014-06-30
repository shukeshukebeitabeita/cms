package com.bsb.cms.mapper.content;

import java.util.List;

import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.vo.content.ContentSearchVO;

public interface ContContentMapper {
//    int countByExample(ContContentExample example);
//
//    int deleteByExample(ContContentExample example);
//
//    int deleteByPrimaryKey(Long id);
//
//    int insert(ContContent record);
//
//    int insertSelective(ContContent record);
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
//    int updateByPrimaryKey(ContContent record);
	
	List<ContContentDTO> findListPage(ContentSearchVO conditions);
}