package com.bsb.cms.tag;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.bsb.cms.commons.web.SpringContextUtil;
import com.bsb.cms.content.service.content.ContContentService;
import com.bsb.cms.content.service.content.ContTypeCacheService;
import com.bsb.cms.model.dto.content.ContContentDTO;
import com.bsb.cms.model.dto.content.ContTypeDTO;
import com.bsb.cms.model.vo.content.TagContentVO;

import freemarker.core.Environment;
import freemarker.template.ObjectWrapper;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateDirectiveModel;
import freemarker.template.TemplateException;
import freemarker.template.TemplateModel;

/**
 * 获取多条内容标签。 <@cms.clist type_id="1,2", sort="[{id,asc},{name,desc}]" sql=""
 * count=10 hasHot=1 hasLatest=0></@cms.clist>
 * 
 * @author liuhj
 * 
 */
@Component("contentListTag")
public class ContentListTag implements TemplateDirectiveModel {
	private static final Log log = LogFactory.getLog(ContentListTag.class);
	private ContContentService contContentService;
	private ContTypeCacheService contTypeCacheService;

	/**
	 * <@clist type_id="2" count=10 var="cts">
      <#if (cts?exists && cts?size >0)>
     <#list cts as c>
     ${c.title}
     </#list>
     </#if>
     </@clist>
	 */
	@Override
	public void execute(Environment env, Map params, TemplateModel[] loopVars,
			TemplateDirectiveBody body) throws TemplateException, IOException {
		Long typeId = null;
		ContTypeDTO contTypeDTO;
		List<ContContentDTO> contentList;
		String varName = "contents";
		try {
			if (body != null) {
				TagContentVO conditions;
				conditions = new TagContentVO();
				TemplateModel typeIdModel = (TemplateModel) params.get("type_id");
				TemplateModel countModel = (TemplateModel) params.get("count");
				TemplateModel varNameModel = (TemplateModel) params.get("var");
				TemplateModel hasHotModel = (TemplateModel) params.get("hasHot");
				TemplateModel hasLatestModel = (TemplateModel) params.get("hasLatest");
				
				if (varNameModel != null) {
					varName = varNameModel.toString();
				}
				if (countModel != null) {
					conditions.setCount((Integer.valueOf(countModel.toString())));
				}
				if (typeIdModel != null) {
					typeId = Long.valueOf(typeIdModel.toString());
					conditions.setType_id(typeId);
				}
				if (hasHotModel != null) {
					conditions.setHasHot(Short.valueOf(hasHotModel.toString()));
				}
				if (hasLatestModel != null) {
					conditions.setHasLatest(Short.valueOf(hasLatestModel.toString()));
				}
				
				contTypeDTO = getContTypeCacheService().getById(typeId);
				conditions.setLevel(contTypeDTO.getDepth());
				contentList = getContContentService().findListOfTag(conditions);

				setVariable(env, varName, contentList);
				body.render(env.getOut());
			} else {
				throw new TemplateException("clist标签解析错误", env);
			}
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}

	}

	private void setVariable(Environment env, String name, Object value)
			throws Exception {
		env.setVariable(name, ObjectWrapper.DEFAULT_WRAPPER.wrap(value));// 标签内有效
		// env.getConfiguration().setSharedVariable(key,
		// value);//全局有效。多个页面中的标签共享。数据串供了
	}

	/**
	 * get bean
	 * 
	 * @return
	 */
	private ContContentService getContContentService() {
		if (contContentService == null) {
			contContentService = SpringContextUtil
					.getApplicationContextInstance().getBean(
							"contContentService", ContContentService.class);
		}

		return contContentService;
	}

	private ContTypeCacheService getContTypeCacheService() {
		if (contTypeCacheService == null) {
			contTypeCacheService = SpringContextUtil
					.getApplicationContextInstance().getBean(
							"contTypeCacheService", ContTypeCacheService.class);
		}

		return contTypeCacheService;
	}
}
