
package com.bsb.cms.moss.controller.log;

import javax.annotation.Resource;

import com.bsb.cms.commons.exceptions.BaseException;
import com.bsb.cms.model.enums.OperateTypeEnum;
import com.bsb.cms.model.enums.RelevanceTypeEnum;
import com.bsb.cms.model.po.log.SysLog;

/**
 * 方法添加日志
 * 
 * @author 包文斌
 * @version 1.0.0 2013-5-30
 * @since 1.0
 */
public abstract class LogController {

//    @Resource(name = "sysLogService")
//    protected SysLogService sysLogService;

    /**
     * 
     * 有关联对象的日志保存
     * 
     * @param operateType @see OperateTypeEnum
     * @param remark 备注
     * @param operatePage 操作页面
     * @param relevanceId 关联ID
     * @param relevanceType 关联类型
     * @throws MallException
     */
    protected void log(OperateTypeEnum operateType, String remark, String operatePage, Long relevanceId,
            RelevanceTypeEnum relevanceType) throws BaseException {
        SysLog sysLog = new SysLog(operateType, remark, operatePage, relevanceId, relevanceType);
        //sysLogService.create(sysLog);
    }

    /**
     * 
     * 无关联对象的日志保存
     * 
     * @param operateType @see OperateTypeEnum
     * @param remark 备注
     * @param operatePage 操作页面
     * @throws MallException
     */
    protected void log(OperateTypeEnum operateType, String remark, String operatePage) throws BaseException {
        SysLog sysLog = new SysLog(operateType, remark, operatePage);
        //sysLogService.create(sysLog);
    }
}
