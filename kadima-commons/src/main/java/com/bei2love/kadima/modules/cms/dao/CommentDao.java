/**
 * Copyright &copy; 2012-2014 <a href="https://github.com.bei2love.kadima">JeeSite</a> All rights reserved.
 */
package com.bei2love.kadima.modules.cms.dao;

import com.bei2love.kadima.commons.persistence.CrudDao;
import com.bei2love.kadima.commons.persistence.annotation.MyBatisDao;
import com.bei2love.kadima.modules.cms.entity.Comment;

/**
 * 评论DAO接口
 * @author ThinkGem
 * @version 2013-8-23
 */
@MyBatisDao
public interface CommentDao extends CrudDao<Comment> {

}
