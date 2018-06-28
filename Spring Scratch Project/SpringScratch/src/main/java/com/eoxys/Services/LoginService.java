package com.eoxys.Services;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.BOUsersDao;
import com.eoxys.Model.BOUsers;


@Repository
public class LoginService {
	@Autowired
	BOUsersDao usersDao;
	public BOUsers checkLogin(int empId, String pwd){
        BOUsers user = usersDao.checkLogin(empId,pwd);
        return user;
    }
	public BOUsers checkLogin(String userId){
        BOUsers user = usersDao.checkLogin(userId);
        return user;
    }
	
	public int isUserAvail(String email){
		return usersDao.isUserAvail(email);
	}
	
	public boolean changeActiveSt(int userId) {
		boolean ret = false;
		ret = usersDao.isAvailable(userId);
		if (ret) {
			BOUsers user = new BOUsers();
			user.setId(userId);
			user.setActivation_sts("0");
			usersDao.changeActiveSt(user);
		}
		return ret;
	}
	
	
//	public boolean TestcheckLogin(String user, String pwd,int role){
//		boolean ret=usersDao.TestcheckLogin(user,pwd,role);
//		return ret;
//	}
}
