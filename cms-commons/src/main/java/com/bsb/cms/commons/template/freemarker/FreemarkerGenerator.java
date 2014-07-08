/**
 * @(#)FreemarkerGenerator.java 2014-7-7
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
package com.bsb.cms.commons.template.freemarker;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Component;

import com.bsb.cms.commons.exceptions.TemplateRuntimeException;
import com.bsb.cms.commons.template.TemplateGenerator;
import com.bsb.cms.commons.template.freemarker.util.FreemarkerUtils;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @see #TemplateGenerator (和spring mvc使用的freemarker相互独立. 如果和spring
 *      mvc使用一样的环境，请使用
 * @author hongjian.liu
 * @version 1.0.0 2014-6-13
 * @since 1.0
 */
@Component("freemarkerGenerator")
public class FreemarkerGenerator implements TemplateGenerator {

    private static final Log log = LogFactory.getLog(FreemarkerGenerator.class);

    private static final String TEMPLATE_DIR = "/template";

    /**
     * 类变量
     * 
     * @see freemarker.template.Configuration
     */
    private static Configuration cfg = null;

    public FreemarkerGenerator() {
        init(TEMPLATE_DIR);
        FreemarkerUtils.myOut("FreemarkerGenerator() create");
    }

    /**
     * 初始化FreeMarker配置
     * 
     * @throws Exception (IOException)
     */
    private static void init(String templatePath) {
        if (cfg != null) {
            return;
        }
        FreemarkerUtils.myOut("FreemarkerGenerator.init() create");
        try {
            // 创建一个Configuration实例
            cfg = new Configuration();
            cfg.setDefaultEncoding("UTF-8");
            // 设置freeMark更新缓存的时间(秒) //0表示不用缓存 设置模板延迟时间，测试环境设置为0，正是环境可提高数值.
            if (!FreemarkerUtils.IS_DEV_MODE) {
                cfg.setTemplateUpdateDelay(3600);// (秒)
            }
            // 设置FreeMarker的模版文件位置
            cfg.setClassForTemplateLoading(FreemarkerGenerator.class, templatePath.startsWith("/") ? templatePath
                    : ("/" + templatePath));
            cfg.setObjectWrapper(new DefaultObjectWrapper());
            FreemarkerUtils.setTemplateEnv(cfg); // 设置全局环境

        } catch (Exception ex) {
            ex.printStackTrace();
            log.error(ex.getMessage());
            throw new TemplateRuntimeException(ex);
        }
    }

    private Template getTemplate(String ftlTemplate) throws IOException {
        Template temp = null;
        if (StringUtils.isEmpty(ftlTemplate)) {
            throw new IllegalArgumentException();
        }
        temp = cfg.getTemplate(ftlTemplate);

        return temp;
    }

    /**
     * 填充摸板后以字符串形式返回
     * 
     * @param ftlTemplate ftl模版文件
     * @param dataMap ftl要用到的动态内容
     * @throws IOException
     * @throws TemplateException
     */
    public String createString(String ftlTemplate, Map<String, Object> dataMap) throws TemplateRuntimeException {
        String strHtml = null;
        try {
            Template template = getTemplate(ftlTemplate);
            FreemarkerUtils.getMap(dataMap);// 设置环境中的，初始值，防止模板中调用出错。
            log.debug("template name:" + template.getName());
            strHtml = FreemarkerUtils.processTemplateIntoString(template, dataMap);
        } catch (IOException e) {
            log.error(e.getMessage());
            throw new TemplateRuntimeException(e.getMessage());
        } catch (TemplateException e) {
            log.error(e.getMessage());
            throw new TemplateRuntimeException(e.getMessage());
        }

        return strHtml;
    }

    /**
     * @return the cfg
     */
    public static Configuration getCfg() {
        if (cfg == null) {
            init(TEMPLATE_DIR);
        }
        return cfg;
    }

    /*
     * (non-Javadoc)
     * 
     * @see
     * com.uns.mall.commons.template.TemplateGenerator#create(java.lang.String,
     * java.util.Map, java.lang.String)
     */
    @Override
    public void createFile(String ftlTemplateFile, Map<String, Object> dataMap, String filePath)
            throws TemplateRuntimeException {
        Writer out = null;

        try {
            Template temp = getTemplate(ftlTemplateFile);

            FreemarkerUtils.getMap(dataMap);
            filePath = filePath.replace("\\", "/");
            String savePath = StringUtils.substringBeforeLast(filePath, "/");
            // String realPath = PublishUtils.getPublistHomeDir() + savePath;
            File file = new File(savePath);
            if (!file.exists()) {
                file.mkdirs();
            }
            out = new OutputStreamWriter(new FileOutputStream(filePath), "UTF-8");
            temp.process(dataMap, out); // Merge data model with template
        } catch (Exception e) {
            throw new TemplateRuntimeException(e.getMessage());
        } finally {
            if (out != null) {
                try {
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        log.debug(">>>>create file:" + filePath);
    }

}
