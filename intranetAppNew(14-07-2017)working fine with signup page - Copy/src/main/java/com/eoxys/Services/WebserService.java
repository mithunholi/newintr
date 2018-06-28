package com.eoxys.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.UsersDao;
import com.eoxys.Model.Employees;
import com.eoxys.Model.Users;

@Repository
public class WebserService {
	@Autowired
	UsersDao usersDao;
	
	public List<Users> getAllUsers(){
		 List<Users> usersList = usersDao.getAllUsers();
		 return usersList;
	}
	/*public List<Users> getAllUsers(int start,int showRecsPerPage,int role){
		 List<Users> usersList = usersDao.getAllUsers(start,showRecsPerPage,role);
		 return usersList;
	}
	public List<Users> getAllUsers(String searchKey,int start,int showRecsPerPage,int role){
		 List<Users> usersList = usersDao.getAllUsers(searchKey,start,showRecsPerPage,role);
		 return usersList;
	}
	public int numRecords(){
		 int totrecs = usersDao.numRecords();
		 return totrecs;
	 }*/
	public int numRecords(int role){
		 int totrecs = usersDao.numRecords(role);
		 return totrecs;
	 }
	/*public int numRecords(String searchKey,int role){
		 int totrecs = usersDao.numRecords(searchKey,role);
		 return totrecs;
	 }*/
	/*public  int getEmpUserId(String userUid ){
		int userId =  usersDao.getEmpUserId(userUid);
		return userId;
	}
	public boolean AddEmpUser(String username,int userId,int userRole){
		 boolean ret=false;
		 ret=usersDao.AddEmpUser(username,userId,userRole);
		 return ret;
	 }*/
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
