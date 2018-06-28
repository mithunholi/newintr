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

import com.eoxys.Dao.EmployeesDao.EmployeesTb;
import com.eoxys.Model.Users;

@Repository
public class UsersDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	static final class UsersTb
	{
		static String tableName= "tbl_user";
		static String id= "id";	
		
		static String username = "username";
		static String password = "password";
		static String user_role_id = "user_role_id";
		static String user_uid = "user_uid";
	    static String activation_sts = "activation_sts";
	/*	static String registration_sts = "registration_sts";*/
		static String created_at = "created_at";
		static String updated_at = "updated_at";
		
		
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}


	public class UsersMapper implements RowMapper<Users> {
		public Users mapRow(ResultSet rs, int rowNum) throws SQLException {
			Users users = new Users();
			System.out.println("maprow");
			users.setId(rs.getInt(UsersTb.id));
	
			users.setUsername(rs.getString(UsersTb.username));
			users.setPassword(rs.getString(UsersTb.password));
			users.setUser_role_id(rs.getInt(UsersTb.user_role_id));
			users.setUser_uid(rs.getString(UsersTb.user_uid));
		
			users.setActivation_sts(rs.getString(UsersTb.activation_sts));
	
			users.setCreated_at(rs.getTimestamp(UsersTb.created_at));
			System.out.println("cre="+rs.getTimestamp(UsersTb.created_at));	
			users.setUpdated_at(rs.getTimestamp(UsersTb.updated_at));
//			if(rs.getString(EmployeesTb.email)!=null)
//				users.setUserName(rs.getString(EmployeesTb.email));
			System.out.println("upd="+rs.getTimestamp(UsersTb.updated_at));	
			return users;
		}
	}
	
	
	public int getNumRows(int role){
        String SQL = "select count(*) from "+UsersTb.tableName+ " where "+UsersTb.user_role_id+"= ?";
        System.out.println("SQL="+SQL);
        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{role},Integer.class);
        System.out.println("ROWS="+rowCount);
        return rowCount;
	}
	public int getNumRow(int role){
        String SQL = "select count(*) from "+UsersTb.tableName+ " where "+UsersTb.user_role_id+"= ?";
        System.out.println("SQL="+SQL);
        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{role},Integer.class);
        System.out.println("ROWS="+rowCount);
        return rowCount;
	}
	public int getRows(int role){
        String SQL = "select count(*) from "+UsersTb.tableName+ " where "+UsersTb.user_role_id+"= ?";
        System.out.println("SQL="+SQL);
        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{role},Integer.class);
        System.out.println("ROWS="+rowCount);
        return rowCount;
	}

	public int getNumRows(String searchKey){
		String likeQuery=UsersTb.user_uid+" LIKE '%"+searchKey+"%' ";
    	System.out.println("Query="+likeQuery); 
        String SQL = "select count(*) from "+EmployeesTb.tableName+ " where "+likeQuery; 
        System.out.println("SQL="+SQL);
        int rowCount = jdbcTemplateObject.queryForObject(SQL,Integer.class);
        System.out.println("ROWS="+rowCount);
        return rowCount;
	}

	public int numRecords(){
		String SQL = "select count(*) from "+UsersTb.tableName;
		int numr=jdbcTemplateObject.queryForObject(SQL, Integer.class);
		return numr;

	}
	public int numRecords(int role){
		String cont = " where "+UsersTb.user_role_id+" = "+role+"";		
		String SQL = "select count(*) from "+UsersTb.tableName+cont;
		int numr=jdbcTemplateObject.queryForObject(SQL, Integer.class);
		System.out.println("numr="+numr);
		return numr;

	}
	
	
	
	public Users checkLogin(int empId, String pwd){
		List<Users> usersList=null;
		Users user=null;
		String SQL1 = "select count(*) from "+UsersTb.tableName+
				" where "+UsersTb.username+" = ? and "+UsersTb.password+" = ?";
		int ret=jdbcTemplateObject.queryForObject(SQL1, new Object[]{empId,pwd}, Integer.class);
		if(ret>0)
		{
			String SQL = "select * from "+UsersTb.tableName+
					" where "+UsersTb.username+" = ? and "+UsersTb.password+" = ?";  
			System.out.println("SQL="+SQL +empId +pwd);	
			usersList = jdbcTemplateObject.query(SQL, new Object[]{empId,pwd}, new UsersMapper());
			user=usersList.get(0);
			usersList=null;
		}

		return user;
	}
	
	public Users checkLogin(String username,String password){
		List<Users> usersList=null;
		Users user=null;
		String SQL1 = "select count(*) from "+UsersTb.tableName+
				" where "+UsersTb.username+" = ? and "+UsersTb.password+"=?";
		int ret=jdbcTemplateObject.queryForObject(SQL1, new Object[]{username,password}, Integer.class);
		if(ret>0)
		{
			String SQL = "select * from "+UsersTb.tableName+
					" where "+UsersTb.username+" = ? and "+UsersTb.password+"=?"; 
			System.out.println("SQL="+SQL +username);	
			System.out.println("SQL="+SQL +password);	
			usersList = jdbcTemplateObject.query(SQL, new Object[]{username,password}, new UsersMapper());
			user=usersList.get(0);
			usersList=null;
		}

		return user;

	}
	public Users checkLoginNew(String username,String password){
	
			String SQL = "select * from "+UsersTb.tableName+
					" where "+UsersTb.username+" = ? and "+UsersTb.password+"=?"; 
			System.out.println("SQL="+SQL +username);	
			System.out.println("SQL="+SQL +password);	
			Users user = jdbcTemplateObject.queryForObject(SQL, new Object[]{username,password}, new UsersMapper());
			return user;
	}
	
	public List<Users> getAllUsers(){
		numRecords();
		String SQL = "select * from "+UsersTb.tableName;  
		System.out.println("SQL="+SQL);
		List<Users> usersList = jdbcTemplateObject.query(SQL,new UsersMapper()); 
		System.out.println("emp="+usersList);
		return usersList;
	}
	
	public Users getUser(int id){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        List<Users> userList= jdbcTemplateObject.query(SQL,new Object[]{id},
                                new UsersMapper());
        	return userList.get(0);
    } 
	public Users getUser(String userUid){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.user_uid +" = ?";
        System.out.println("SQL="+SQL);
        List<Users> userList= jdbcTemplateObject.query(SQL,new Object[]{userUid},
                                new UsersMapper());
        	return userList.get(0);
    }  
	
	
	
	public Users get(int id){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        List<Users> userList= jdbcTemplateObject.query(SQL,new Object[]{id},
                                new UsersMapper());
        	return userList.get(0);
    }  
	public boolean isAvailable(int recid){
        String SQL = "select count(*) from "+UsersTb.tableName+
                     " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{recid},Integer.class);
        boolean ret = rowCount>0 ? true : false;
        	return ret;
	}
	public boolean updateUser(Users user){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		System.out.println("user_uid="+user.getUser_uid());
        String SQL = "update "+UsersTb.tableName+
                    " set "+UsersTb.password+" = ? , "+UsersTb.user_role_id+" = ? , "+UsersTb.user_uid+" = ?,"+UsersTb.activation_sts+" = ?,"+UsersTb.updated_at+"= ? where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{user.getPassword(),user.getUser_role_id(),user.getUser_uid(),user.getActivation_sts(),dateFormat.format(date),user.getId()});
        return true;
    }
	public boolean delUser(int id){
        String SQL = "delete from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{id});
        return true;
    }
	
	/*register*/
	public boolean basicRegister(String username,String password)
	{
		String SQL="insert into "+UsersTb.tableName+
				" ("+UsersTb.password+","+UsersTb.created_at+","+UsersTb.updated_at+") values ( ?, ?, ?, ?)";
		System.out.println("SQL="+SQL);
		jdbcTemplateObject.update(SQL, new Object[]{password,dateFormat.format(date),dateFormat.format(date)});
		return true;
	}
	public boolean changeUserPwdByAdmin(Users user){
		System.out.println("user_uid="+user.getUser_uid());
        String SQL = "update "+UsersTb.tableName+
                    " set "+UsersTb.password+" = ? , "+UsersTb.activation_sts+"=? where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{user.getPassword(),1,user.getId()});
        return true;
    }
	public boolean changeActiveSt(Users user){
		System.out.println("user_uid="+user.getUser_uid());
        String SQL = "update "+UsersTb.tableName+
                    " set "+UsersTb.activation_sts+" = ? where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{user.getActivation_sts(),user.getId()});
        return true;
    }
	public int getUsername(String username) {
		String SQL = "select * from "+UsersTb.tableName+" where "+UsersTb.username+" = ?";
		Users user = jdbcTemplateObject.queryForObject(SQL,new Object[]{username}, new UsersMapper(){});
		return user.getId();
	}
	public boolean AddUser(String username, String password, int user_role_id,String User_uid) {
		// TODO Auto-generated method stub
		String SQL="insert into "+UsersTb.tableName+
				" ("+UsersTb.username+","+UsersTb.password+","+UsersTb.user_role_id+","+UsersTb.user_uid+","+UsersTb.activation_sts+","+UsersTb.created_at+","+UsersTb.updated_at+") values ( ?, ?, ?, ?, ?, ?, ?)";
		System.out.println("SQL="+SQL);
		jdbcTemplateObject.update(SQL, new Object[]{username,password,user_role_id,User_uid,1,dateFormat.format(date),dateFormat.format(date)});
		return true;
		//return null;
	}
	
}
