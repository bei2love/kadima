
package com.bei2love.kadima.modules.sys.dao;

import com.bei2love.kadima.commons.persistence.CrudDao;
import com.bei2love.kadima.commons.persistence.annotation.MyBatisDao;
import com.bei2love.kadima.modules.sys.entity.Dict;

import java.util.List;

/**
 * 字典DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface DictDao extends CrudDao<Dict> {

	public List<String> findTypeList(Dict dict);
	
}
