package com.eoxys.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.BOUsersLoginFailedReportDao;
import com.eoxys.Dao.BOUsersDao;
import com.eoxys.Model.BOUsersLoginFailedReport;



@Repository
public class BOUsersLoginFailedReportService {
	@Autowired
	BOUsersLoginFailedReportDao usersDao;

	public int getFailedAttemptCnt(int email) {
		return usersDao.getFailedAttemptCnt(email);
//		return 0;
//		List<Users> usersList = usersDao.getAllUsers();
//		return usersList;
	}
	public boolean addFailedReport(BOUsersLoginFailedReport bo){
		return usersDao.addFailedReport(bo);
		
		
	}
	public boolean deleteAllFailedReport(int  email){
		return usersDao.deleteAllFailedReport(email);
		
		
	}

	
}
