package com.eoxys.Dao;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.EmployeesDao.EmployeesMapper;
import com.eoxys.Dao.EmployeesDao.EmployeesTb;
import com.eoxys.Model.*;
@Repository
public class BOUserModuleAccessDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	static final class BOUserModuleAccessTb
	{
		static String tableName= "back_office_user_module_access";
		static String id= "id";	
		static String module_id="module_id";
		static String bo_user_role_id="bo_user_role_id";
		static String access="access";
		static String created_at="created_at";
		
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}


	public class BOUserModuleAccessMapper implements RowMapper<BOUserModuleAccess> {
		public BOUserModuleAccess mapRow(ResultSet rs, int rowNum) throws SQLException {
			BOUserModuleAccess users = new BOUserModuleAccess();
//			System.out.println("maprow");
			users.setId(rs.getInt(BOUserModuleAccessTb.id));
			users.setModule_id(rs.getInt(BOUserModuleAccessTb.module_id));
			users.setAccess(rs.getString(BOUserModuleAccessTb.access));
			users.setBo_user_role_id(rs.getInt(BOUserModuleAccessTb.bo_user_role_id));
			users.setCreated_at(rs.getDate(BOUserModuleAccessTb.created_at));
			
			
			return users;
		}
	}
//	public class UsersEmpMapper extends UsersMapper implements RowMapper<BOUsers> {
//		public BOUsers mapRow(ResultSet rs, int rowNum) throws SQLException {
//			BOUsers users =super.mapRow(rs, rowNum);// new Users();
////			System.out.println("UsersEmpMapper");
////			super.mapRow(rs, rowNum);
//				users.setUserName(rs.getString(EmployeesTb.email));
//				users.setUrl(rs.getString(EmployeesTb.url));
////				System.out.println("mnb");
//			System.out.println(users.getUserName());	
//			return users;
//		}
//	}
	
	public boolean createAccess(BOUserModuleAccess bo){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		date = new Date();
		
		String SQL = "INSERT INTO "+BOUserModuleAccessTb.tableName+" ("+BOUserModuleAccessTb.module_id+","+
	BOUserModuleAccessTb.bo_user_role_id+","+BOUserModuleAccessTb.access+","
				+BOUserModuleAccessTb.created_at+") VALUES(?,?,?,?)";
		System.out.println("Create Access SQL "+bo.getModule_id());
		int ret = jdbcTemplateObject.update(SQL, new Object[]{bo.getModule_id(),bo.getBo_user_role_id(),
				bo.getAccess(),dateFormat.format(date)});
		
		return ret>0 ? true:false;
		
	}
	public boolean updateAccess(BOUserModuleAccess bo){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		date = new Date();
		
		String SQL = "UPDATE "+BOUserModuleAccessTb.tableName+" SET "+BOUserModuleAccessTb.module_id+" = ?,"
		+BOUserModuleAccessTb.bo_user_role_id+"=?,"+BOUserModuleAccessTb.access+"=?,"+BOUserModuleAccessTb.created_at+"=?"
		+" WHERE "+BOUserModuleAccessTb.module_id+" = ? AND "+BOUserModuleAccessTb.bo_user_role_id+"=?";
		System.out.println("Update Access SQL "+SQL+","+bo.getModule_id());
		int ret = jdbcTemplateObject.update(SQL, new Object[]{bo.getModule_id(),bo.getBo_user_role_id(),
				bo.getAccess(),dateFormat.format(date),bo.getModule_id(),bo.getBo_user_role_id()});
		
		return ret>0 ? true:false;
		
	}
	public List<BOUserModuleAccess> getAccessByRoleId(int roleId){
		
		String SQL = "SELECT * FROM "+BOUserModuleAccessTb.tableName+" WHERE "+BOUserModuleAccessTb.bo_user_role_id+"=?";
		System.out.println("get Access SQL "+SQL+","+roleId);
		List<BOUserModuleAccess> ret = jdbcTemplateObject.query(SQL, new Object[]{roleId},new BOUserModuleAccessMapper());
		
		return ret;
		
	}
	public BOUserModuleAccess getAccessByRoleModId(int roleId,int moduleId){
		String SQL = "SELECT * FROM "+BOUserModuleAccessTb.tableName+" WHERE "+BOUserModuleAccessTb.bo_user_role_id+"=? AND "
				+BOUserModuleAccessTb.module_id+" = ?";
		System.out.println("get Access SQL "+SQL+","+roleId+","+moduleId);
		List<BOUserModuleAccess> ret = jdbcTemplateObject.query(SQL, new Object[]{roleId,moduleId},new BOUserModuleAccessMapper());
		BOUserModuleAccess bo = null;
		if(ret.size()>0){
			bo=ret.get(0);
		}
		
		
		return bo;
	}
	
}
