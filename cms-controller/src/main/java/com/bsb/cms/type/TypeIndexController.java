package com.bsb.cms.type;

import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bsb.cms.commons.page.PageContext;
import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.content.service.content.ContTypeCacheService;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.vo.content.TypeListSearchVO;

/**
 * 栏目页面。即分页
 * 
 * @author liuhj
 * 
 */
@Controller
//@RequestMapping("/t/")
public class TypeIndexController {
	// log
	private static final Log log = LogFactory.getLog(TypeIndexController.class);
	@Resource(name="contContentService")
	private ContContentService contContentService;
	@Resource(name="contTypeCacheService")
	private ContTypeCacheService contTypeCacheService;
	
	/**
	 * list
	 * @param typeId
	 * @param conditions
	 * @param modelMap
	 * @return
	 */
	//@RequestMapping("/{typeId}/list.htm")
	@RequestMapping("/{englishName}")
	public String list(@PathVariable String englishName, TypeListSearchVO conditions,
			ModelMap modelMap) {
		Long typeId;
		PageContext pc = PageContext.getContext();//调试或者收到修改/设置一些参数用
		log.debug(pc.getCurrentPage());
		
		ContTypeDTO type = contTypeCacheService.getIdByName(englishName);
		modelMap.put("type", type);
		typeId = type.getId();
		
		modelMap.put("typeId", typeId);
		conditions.setType_id(typeId);
		PageContext.initSort("UPDATE_DATE");
		List<ContContentDTO> contents = contContentService.findTypeListPage(conditions);
		modelMap.put("contents", contents);
		
		//调试
		log.debug(pc.getTotalPages());
		
		
		//如果是pc端页面的话。 可以在页面上用page属性取得PageContext对象，
		//然后取出分页对象。（因为在PageFilter中设置了request.setAttribute("page", page);）
		
		//估计你是手机端用，那么你可以
		//PageContext pc=PageContext.getContext();//调试或者收到修改/设置一些参数用
		//然后取出一些需要的参数和其他数据包装成json返回即可。
		log.debug(pc.getCurrentPage());
		
		return type.getType_template();
	}
}
