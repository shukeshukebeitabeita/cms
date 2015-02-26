package com.bsb.cms.type;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bsb.cms.commons.page.PageContext;
import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.vo.content.TypeListSearchVO;

/**
 * 内容列表页面。即分页
 * 
 * @author liuhj
 * 
 */
@Controller
@RequestMapping("/t/")
public class TypeListController {
	@Resource(name="contContentService")
	private ContContentService contContentService;
	
	/**
	 * list
	 * @param typeId
	 * @param conditions
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/{typeId}/list.htm")
	public String list(@PathVariable String typeId, TypeListSearchVO conditions, ModelMap modelMap) {
		modelMap.put("typeId", typeId);
		conditions.setType_id(Long.valueOf(typeId));
		PageContext.initSort("UPDATE_DATE");
		List<ContContentDTO> contents = contContentService.findTypeListPage(conditions);
		modelMap.put("contents", contents);
		
		return "index";
	}
}
