package com.eoxys.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.BOUsersLoginFailedReportDao;
import com.eoxys.Dao.BOUsersLoginReportDao;
import com.eoxys.Dao.BOUsersDao;
import com.eoxys.Model.BOUsersLoginFailedReport;
import com.eoxys.Model.BOUsersLoginReport;



@Repository
public class BOUsersLoginReportService {
	@Autowired
	BOUsersLoginReportDao usersDao;

	
	public boolean addLoginReport(BOUsersLoginReport bo){
		return usersDao.addLoginReport(bo);
		
		
	}
	public boolean deleteAllFailedReport(int  email){
		return usersDao.deleteAllFailedReport(email);
		
		
	}

	
}
