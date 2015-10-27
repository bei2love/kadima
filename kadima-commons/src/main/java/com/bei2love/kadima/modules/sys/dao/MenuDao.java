
package com.bei2love.kadima.modules.sys.dao;

import com.bei2love.kadima.commons.persistence.CrudDao;
import com.bei2love.kadima.commons.persistence.annotation.MyBatisDao;
import com.bei2love.kadima.modules.sys.entity.Menu;

import java.util.List;

/**
 * 菜单DAO接口
 * @author ThinkGem
 * @version 2014-05-16
 */
@MyBatisDao
public interface MenuDao extends CrudDao<Menu> {

	public List<Menu> findByParentIdsLike(Menu menu);

	public List<Menu> findByUserId(Menu menu);
	
	public int updateParentIds(Menu menu);
	
	public int updateSort(Menu menu);
	
}
