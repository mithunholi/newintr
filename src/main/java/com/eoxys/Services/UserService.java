package com.eoxys.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.EmployeesDao;
import com.eoxys.Dao.UsersDao;
import com.eoxys.Model.Users;

@Repository
public class UserService {
	@Autowired
	UsersDao usersDao;
	
	public Users checkLogin(int Id, String pwd){
        Users user = usersDao.checkLogin(Id,pwd);
        return user;
    }
	public boolean AddUser(String username, String password,int role_id,String uid){
		boolean user = usersDao.AddUser(username,password,role_id,uid);
        return user;
    }
	
}