/**
 * @(#)${file_name} ${date}
 *
 * Copyright (c) 2014-2015 BuShangBan (China) Int'l Co., Ltd
 * yongtai Road. pu dong District.Shanghai China
 * All rights reserved.
 *
 * This software is the confidential and proprietary information of BuShangBan (China)
 *  Int'l Co., Ltd ("Confidential Information").  You shall not
 * disclose such Confidential Information and shall use it only in
 * accordance with the terms of the license agreement you entered into
 * with BuShangBan (China).
 */
package com.bsb.cms.moss.controller.exception;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.bsb.cms.commons.web.JSONResultDTO;


/**
 * 统一处理后台异常。
 * @author hongjian.liu
 * @version 1.6.0 2014-6-11
 * @since 1.0
 */
@Controller
public class ExceptionController  implements HandlerExceptionResolver {

        private static Logger LOG = Logger.getLogger(ExceptionController.class);

        /*
         * (non-Javadoc)
         * 
         * @see
         * org.springframework.web.servlet.HandlerExceptionResolver#resolveException
         * (javax.servlet.http.HttpServletRequest,
         * javax.servlet.http.HttpServletResponse, java.lang.Object,
         * java.lang.Exception)
         */
        @Override
        public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
                Exception ex) {
            ModelAndView mav = new ModelAndView();

            LOG.error(ex.getMessage(), ex);
            
            String url = request.getRequestURI();
            if (StringUtils.isNotBlank(url)) {
                if (!(request.getHeader("accept").indexOf("application/json") > -1 || (request
                        .getHeader("X-Requested-With") != null && request.getHeader("X-Requested-With").indexOf(
                        "XMLHttpRequest") > -1))) {// 如果不是异步请求(同步)

                    
                    mav.setViewName("/page/common/error");
                } else {//如果是异步请求
                    JSONResultDTO result = new JSONResultDTO();
                    result.setMessage("出錯了，请稍候再试！");
                    result.setResult(JSONResultDTO.ERROR);
                    try {
                        response.getWriter().write(JSONObject.fromObject(result).toString());
                    } catch (IOException e) {
                        LOG.error("后台出现异常情况=====" + ex.getLocalizedMessage());
                    }
                    return new ModelAndView();
                }
            }

            return mav;
        }

    }

