package com.eoxys.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.EmployeesDao;
import com.eoxys.Dao.User_role_Dao;
import com.eoxys.Dao.UsersDao;
import com.eoxys.Model.User_role;
import com.eoxys.Model.Users;

@Repository
public class UserRoleService {
	@Autowired
	User_role_Dao user_role_Dao;
	
	public int getUsr_role_Id( String desig){
        int  user_id = user_role_Dao.getUsr_role_Id(desig);
        return user_id;
    }
	
	
	

	/*public int getEmployeeIdUsingUsername(String username){
		int empId = usersDao.getEmployeeIdUsingUsername(username);
		return empId;
	}*/
}
