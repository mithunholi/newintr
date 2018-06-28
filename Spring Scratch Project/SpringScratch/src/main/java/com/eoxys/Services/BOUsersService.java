package com.eoxys.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.BOUsersDao;
import com.eoxys.Model.Employees;
import com.eoxys.Model.BOUsers;

@Repository
public class BOUsersService {
	@Autowired
	BOUsersDao usersDao;

	public List<BOUsers> getAllUsers() {
		List<BOUsers> usersList = usersDao.getAllUsers();
		return usersList;
	}

	public List<BOUsers> getAllUsers(int start, int showRecsPerPage, int role) {
		List<BOUsers> usersList = usersDao.getAllUsers(start, showRecsPerPage,
				role);
		return usersList;
	}

	public List<BOUsers> getAllUsers(String searchKey, int start,
			int showRecsPerPage, int role) {
		List<BOUsers> usersList = usersDao.getAllUsers(searchKey, start,
				showRecsPerPage, role);
		return usersList;
	}

	public int numRecords() {
		int totrecs = usersDao.numRecords();
		return totrecs;
	}

	public int numRecords(int role) {
		int totrecs = usersDao.numRecords(role);
		return totrecs;
	}

	public int numRecords(String searchKey, int role) {
		int totrecs = usersDao.numRecords(searchKey, role);
		return totrecs;
	}

	public int getEmpUserId(String userUid) {
		int userId = usersDao.getEmpUserId(userUid);
		return userId;
	}

	public boolean AddEmpUser(int username, String userId, int userRole) {
		boolean ret = false;
		ret = usersDao.AddEmpUser(username, userId, userRole);
		return ret;
	}

	public BOUsers getUser(int id) {
		BOUsers user = usersDao.getUser(id);
		return user;
	}

	public BOUsers getUser1(String employee_id) {
		BOUsers user = usersDao.getUser1(employee_id);
		return user;
	}

	public BOUsers getUser(String userUid) {
		BOUsers user = usersDao.getUser(userUid);
		return user;
	}

	public int getNumRows(int role) {
		int totrecs = usersDao.getNumRows(role);
		return totrecs;
	}

	public boolean updateUser(BOUsers user) {
		boolean ret = false;
		ret = usersDao.isAvailable(user.getId());
		if (ret) {
			usersDao.updateUser(user);
		}
		return ret;
	}

	public boolean delUser(int id) {
		boolean ret = false;
		ret = usersDao.isAvailable(id);
		if (ret) {
			usersDao.delUser(id);
		}
		return ret;
	}

	public boolean delUserWithEmpId(int empId) {
		boolean ret = false;
		usersDao.delUserWithEmpId(empId);
		return ret;
	}

	public boolean changeUserPwdByAdmin(BOUsers user) {
		boolean ret = false;
		ret = usersDao.isAvailable(user.getId());
		if (ret) {
			usersDao.changeUserPwdByAdmin(user);
		}
		return ret;
	}

	public boolean changeActiveSt(BOUsers user) {
		boolean ret = false;
		ret = usersDao.isAvailable(user.getId());
		if (ret) {
			usersDao.changeActiveSt(user);
		}
		return ret;
	}
	
	
	
	
}
