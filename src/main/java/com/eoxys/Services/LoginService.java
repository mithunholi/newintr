package com.eoxys.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.UsersDao;
import com.eoxys.Model.Employees;
import com.eoxys.Model.Users;

@Repository
public class LoginService {
	@Autowired
	UsersDao usersDao;
	
	public List<Users> getAllUsers(){
		 List<Users> usersList = usersDao.getAllUsers();
		 return usersList;
	}
	
	public int numRecords(int role){
		 int totrecs = usersDao.numRecords(role);
		 return totrecs;
	 }
	
	public Users getUser(int id){
		 Users user = usersDao.getUser(id);
		return user;
	 }
	
	public Users getUser(String userUid){
		 Users user = usersDao.getUser( userUid);
		return user;
	 }
	public int getNumRows(int role){
		 int totrecs = usersDao.getNumRows(role);
		 return totrecs;
	 }
	public boolean updateUser(Users user){
		 boolean ret=false;
		 ret=usersDao.isAvailable(user.getId());
	     if(ret){
	    	 usersDao.updateUser(user);
	     }
	     return ret;
	 }
	 public boolean delUser(int id){
		 boolean ret=false;
		 ret=usersDao.isAvailable(id);
		 if(ret){
			 usersDao.delUser(id);
		 }
	        return ret;
	 }
	/* public boolean delUserWithEmpId(int empId){
		 boolean ret=false;
			 usersDao.delUserWithEmpId(empId);
	        return ret;
	 }*/
		public boolean changeUserPwdByAdmin(Users user){
			 boolean ret=false;
			 ret=usersDao.isAvailable(user.getId());
		     if(ret){
		    	 usersDao.changeUserPwdByAdmin(user);
		     }
		     return ret;
		 }
		public boolean changeActiveSt(Users user){
			 boolean ret=false;
			 ret=usersDao.isAvailable(user.getId());
		     if(ret){
		    	 usersDao.changeActiveSt(user);
		     }
		     return ret;
		 }
		public int getEmployeeIdUsingUsername(String username) {
			int empId= usersDao.getUsername(username);
			return empId;
		}
		public Users checkLogin(int empId, String encpwd) {
			Users user=usersDao.checkLogin(empId, encpwd);
			return user;
		}
		public Users checkLogin(String username, String encpwd) {
			Users user=usersDao.checkLogin(username, encpwd);
			return user;
		}
}
