package com.bsb.cms;

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
 * home page
 * @author liuhj
 *
 */
@Controller
public class IndexController {
	
	@Resource(name="contContentService")
	private ContContentService contContentService;
	
	/**
	 * home page.
	 * @param conditions
	 * @param modelMap
	 * @return
	 */
	@RequestMapping("/")
	//@RequestMapping("/index.htm")
	public String index(TypeListSearchVO conditions, ModelMap modelMap) {
		PageContext.initSort("UPDATE_DATE");
		List<ContContentDTO> contents = contContentService.findTypeListPage(conditions);
		modelMap.put("contents", contents);
		
		return "index";
	}
}
