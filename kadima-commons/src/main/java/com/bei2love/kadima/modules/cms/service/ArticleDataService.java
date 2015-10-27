/**
 * Copyright &copy; 2012-2014 <a href="https://github.com.bei2love.kadima">JeeSite</a> All rights reserved.
 */
package com.bei2love.kadima.modules.cms.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bei2love.kadima.commons.service.CrudService;
import com.bei2love.kadima.modules.cms.dao.ArticleDataDao;
import com.bei2love.kadima.modules.cms.entity.ArticleData;

/**
 * 站点Service
 * @author ThinkGem
 * @version 2013-01-15
 */
@Service
@Transactional(readOnly = true)
public class ArticleDataService extends CrudService<ArticleDataDao, ArticleData> {

}
