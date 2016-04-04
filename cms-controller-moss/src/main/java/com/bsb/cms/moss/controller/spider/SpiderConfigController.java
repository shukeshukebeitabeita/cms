package com.bsb.cms.moss.controller.spider;

import javax.annotation.Resource;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bsb.cms.commons.exceptions.RenameRuntimeException;
import com.bsb.cms.commons.web.JSONResultDTO;
import com.bsb.cms.content.service.spider.SpiderConfigService;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.po.spider.SpiderConfig;
import com.bsb.cms.moss.controller.log.LogController;
import com.bsb.cms.moss.controller.utils.DataGridJsonData;
import com.bsb.cms.moss.controller.utils.EasyUiUtils;

/**
 * 爬虫配置。 配置要爬的网站
 * <br>
 * 采用jgroup与否。 暂时不支持正则表达式。
 * 咱不支持内容页还有分页的文章。
 * @author liuhj
 * 
 */
@Controller
@RequestMapping("/moss/spider/")
public class SpiderConfigController extends LogController {
	// log
	private static final Log log = LogFactory
			.getLog(SpiderConfigController.class);
	private static final String EDIT = "/page/spider/spider_edit";
	private static final String LIST = "/page/spider/spider_list";
	@Resource(name = "spiderConfigService")
	private SpiderConfigService spiderConfigService;

	/**
	 * 跳转到首页
	 * 
	 * @return
	 */
	@RequestMapping("index.htm")
	public String index(ModelMap modelMap) {

		return LIST;
	}

	/**
	 * 列表页面。
	 * 
	 * @param conditions
	 * @return
	 */
	@RequestMapping("list.htm")
	@ResponseBody
	public DataGridJsonData<SpiderConfig> list(SpiderConfig conditions) {

		return EasyUiUtils.getPageResult(spiderConfigService
				.findListPage(conditions));
	}

	/**
	 * 跳转到添加页面。
	 * 
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.GET)
	public String toCreate() {

		return EDIT;
	}

	/**
	 * to update page
	 * 
	 * @param id
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "update.htm", method = RequestMethod.GET)
	public String toUpdate(Long id, ModelMap modelMap) {
		modelMap.put("attribute", spiderConfigService.findById(id));

		return EDIT;
	}

	/**
	 * 添加。
	 * 
	 * @param attribute
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "create.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO create(SpiderConfig spiderConfig, ModelMap modelMap) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			try {
				Long id = spiderConfigService.create(spiderConfig);
				log(OperateTypeEnum.ATTRIBUTE_CREATE, "id:" + id, "新增类型");
			} catch (RenameRuntimeException e) {
				result.setMessage("标题名已经存在");
				result.setResult(JSONResultDTO.ERROR);
			}

		} catch (Exception e) {
			result.setMessage("创建失败.请重试或联系管理员。");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage(), e.getCause());
			e.printStackTrace();
		}

		return result;
	}

	/**
	 * update
	 * 
	 * @param attribute
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(value = "update.htm", method = RequestMethod.POST)
	@ResponseBody
	public JSONResultDTO update(SpiderConfig spiderConfig, ModelMap modelMap) {
		JSONResultDTO result = new JSONResultDTO();
		try {
			try {
				spiderConfigService.updateById(spiderConfig);
				log(OperateTypeEnum.ATTRIBUTE_UPDATE,
						"id:" + spiderConfig.getId(), "编辑类型");
			} catch (RenameRuntimeException e) {
				result.setMessage("标题名已经存在");
				result.setResult(JSONResultDTO.ERROR);
			}
		} catch (Exception e) {
			result.setMessage("编辑失败.请重试或联系管理员。");
			result.setResult(JSONResultDTO.ERROR);
			log.error(e.getMessage(), e.getCause());
			e.printStackTrace();
		}

		return result;
	}
}
