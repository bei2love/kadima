
package com.bei2love.kadima.modules.act.dao;

import com.bei2love.kadima.commons.persistence.CrudDao;
import com.bei2love.kadima.commons.persistence.annotation.MyBatisDao;
import com.bei2love.kadima.modules.act.entity.Act;

/**
 * 审批DAO接口
 * @author thinkgem
 * @version 2014-05-16
 */
//@MyBatisDao
public interface ActDao extends CrudDao<Act> {

	public int updateProcInsIdByBusinessId(Act act);
	
}
