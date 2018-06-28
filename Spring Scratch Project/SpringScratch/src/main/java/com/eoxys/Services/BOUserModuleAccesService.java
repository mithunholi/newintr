package com.eoxys.Services;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.BOUserModuleAccessDao;
import com.eoxys.Model.BOUserModuleAccess;



@Repository
public class BOUserModuleAccesService {
	@Autowired
	BOUserModuleAccessDao usersDao;
	public boolean createAccess(BOUserModuleAccess bo){
		return usersDao.createAccess(bo);
	}
	public boolean updateAccess(BOUserModuleAccess bo){
		return usersDao.updateAccess(bo);
	}
	public List<BOUserModuleAccess> getAccessByRoleId(int roleId){
		return usersDao.getAccessByRoleId(roleId);
	}
	public BOUserModuleAccess getAccessByRoleModId(int roleId,int moduleId){
		return usersDao.getAccessByRoleModId(roleId,moduleId);
	}
}
