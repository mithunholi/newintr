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
public class BOUsersDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	static final class UsersTb
	{
		static String tableName= "back_office_users";
		static String id= "id";	
		
//		static String username = "username";
		static String password = "password";
		static String user_role_uid = "user_role_uid";
		static String user_uid = "user_uid";
		static String validation_sts = "validation_sts";
		static String activation_sts = "activation_sts";
		static String registration_sts = "registration_sts";
		static String created_at = "created_at";
		static String updated_at = "updated_at";
		
		static String employeeId= "employee_id";	
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}


	public class UsersMapper implements RowMapper<BOUsers> {
		public BOUsers mapRow(ResultSet rs, int rowNum) throws SQLException {
			BOUsers users = new BOUsers();
//			System.out.println("maprow");
			users.setId(rs.getInt(UsersTb.id));
			users.setEmployee_id(rs.getString(UsersTb.employeeId));
//			users.setUsername(rs.getString(UsersTb.username));
			users.setPassword(rs.getString(UsersTb.password));
			users.setUser_role_uid(rs.getString(UsersTb.user_role_uid));
			users.setUser_uid(rs.getString(UsersTb.user_uid));
			users.setUser_role_uid(rs.getString(UsersTb.user_role_uid));
			users.setUser_uid(rs.getString(UsersTb.user_uid));
//			users.setValidation_sts(rs.getString(UsersTb.validation_sts));
			users.setActivation_sts(rs.getString(UsersTb.activation_sts));
//			users.setRegistration_sts(rs.getString(UsersTb.registration_sts));
			users.setCreated_at(rs.getTimestamp(UsersTb.created_at));
			System.out.println("cre="+rs.getTimestamp(UsersTb.created_at));	
			users.setUpdated_at(rs.getTimestamp(UsersTb.updated_at));
//			if(rs.getString(EmployeesTb.email)!=null)
//				users.setUserName(rs.getString(EmployeesTb.email));
			System.out.println("upd="+rs.getTimestamp(UsersTb.updated_at));	
			return users;
		}
	}
	public class UsersEmpMapper extends UsersMapper implements RowMapper<BOUsers> {
		public BOUsers mapRow(ResultSet rs, int rowNum) throws SQLException {
			BOUsers users =super.mapRow(rs, rowNum);// new Users();
//			System.out.println("UsersEmpMapper");
//			super.mapRow(rs, rowNum);
				users.setUserName(rs.getString(EmployeesTb.email));
				users.setUrl(rs.getString(EmployeesTb.url));
//				System.out.println("mnb");
			System.out.println(users.getUserName());	
			return users;
		}
	}
	public int restCheck(String recId,String userId,String auth){
		String SQL="select count(*) from "+UsersTb.tableName+" where "+UsersTb.user_uid+"= ? AND "+UsersTb.employeeId+"= ? AND "+UsersTb.activation_sts+"=1 AND "+UsersTb.user_role_uid+"= ?";
		 System.out.println("SQL="+SQL+",,,"+recId+",,,,"+userId);
	        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{userId,recId,auth},Integer.class);
	        System.out.println("ROWS="+rowCount);
	        return rowCount;
	}
	public int getNumRows(int role){
        String SQL = "select count(*) from "+UsersTb.tableName+ " where "+UsersTb.user_role_uid+"= ?";
        System.out.println("SQL="+SQL);
        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{role},Integer.class);
        System.out.println("ROWS="+rowCount);
        return rowCount;
	}
	public int getNumRow(int role){
        String SQL = "select count(*) from "+UsersTb.tableName+ " where "+UsersTb.user_role_uid+"= ?";
        System.out.println("SQL="+SQL);
        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{role},Integer.class);
        System.out.println("ROWS="+rowCount);
        return rowCount;
	}
	public int getRows(int role){
        String SQL = "select count(*) from "+UsersTb.tableName+ " where "+UsersTb.user_role_uid+"= ?";
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
		String cont = " where "+UsersTb.user_role_uid+" = "+role+"";		
		String SQL = "select count(*) from "+UsersTb.tableName+cont;
		int numr=jdbcTemplateObject.queryForObject(SQL, Integer.class);
		System.out.println("numr="+numr);
		return numr;

	}
	public int numRecords(String searchKey,int role){
		String likeQuery="e."+EmployeesTb.email+" LIKE '%"+searchKey+"%' ";
		String cont = " where "+UsersTb.user_role_uid+" = "+role+" AND "+likeQuery;		
		String SQL = "select count(*) from "+UsersTb.tableName+" as u Join "+EmployeesTb.tableName+" as e "+" on e."+EmployeesTb.id+" = u."+UsersTb.employeeId+cont;
		int numr=jdbcTemplateObject.queryForObject(SQL, Integer.class);
		System.out.println("numr="+numr);
		return numr;

	}
	/*login*/
	
	
	public BOUsers checkLogin(int empId, String pwd){
		List<BOUsers> usersList=null;
		BOUsers user=null;
		String SQL1 = "select count(*) from "+UsersTb.tableName+
				" where "+UsersTb.employeeId+" = ? and "+UsersTb.password+" = ?";
		int ret=jdbcTemplateObject.queryForObject(SQL1, new Object[]{empId,pwd}, Integer.class);
		if(ret>0)
		{
			String SQL = "select * from "+UsersTb.tableName+
					" where "+UsersTb.employeeId+" = ? and "+UsersTb.password+" = ?";  
			System.out.println("SQL="+SQL +empId +pwd);	
			usersList = jdbcTemplateObject.query(SQL, new Object[]{empId,pwd}, new UsersMapper());
			user=usersList.get(0);
			usersList=null;
		}

		return user;
	}
	public BOUsers checkLogin(String userId){
		List<BOUsers> usersList=null;
		BOUsers user=null;
		String SQL1 = "select count(*) from "+UsersTb.tableName+
				" where "+UsersTb.user_uid+" = ?";
		int ret=jdbcTemplateObject.queryForObject(SQL1, new Object[]{userId}, Integer.class);
		if(ret>0)
		{
			String SQL = "select * from "+UsersTb.tableName+
					" where "+UsersTb.user_uid+" = ?";  
			System.out.println("SQL="+SQL +userId);	
			usersList = jdbcTemplateObject.query(SQL, new Object[]{userId}, new UsersMapper());
			user=usersList.get(0);
			usersList=null;
		}

		return user;

	}
	public List<BOUsers> getAllUsers(int start,int showRecsPerPage,int role){
		String cont = " where "+UsersTb.user_role_uid+" = "+role+"";
		String SQL = "select u.*,e."+EmployeesTb.email+", "+EmployeesTb.url+" from "+UsersTb.tableName+" as u Join "+EmployeesTb.tableName+" as e "
		+" on e."+EmployeesTb.id+" = u."+UsersTb.employeeId+cont+ " limit " +showRecsPerPage +" OFFSET "+start;  
		System.out.println("SQL="+SQL);
		List<BOUsers> usersList = jdbcTemplateObject.query(SQL,new UsersEmpMapper()); 
		System.out.println("emp="+usersList);
		return usersList;
	}
	public List<BOUsers> getAllUsers(String searchKey,int start,int showRecsPerPage,int role){
		String likeQuery="e."+EmployeesTb.email+" LIKE '%"+searchKey+"%' ";
		String cont = " where "+UsersTb.user_role_uid+" = "+role+" AND "+likeQuery;	
		String SQL = "select u.*,e."+EmployeesTb.email+", "+EmployeesTb.url+" from "+UsersTb.tableName+" as u Join "+EmployeesTb.tableName+" as e "
		+" on e."+EmployeesTb.id+" = u."+UsersTb.employeeId+cont+ " limit " +showRecsPerPage +" OFFSET "+start;  
		System.out.println("SQL="+SQL);
		List<BOUsers> usersList = jdbcTemplateObject.query(SQL,new UsersEmpMapper()); 
		System.out.println("emp="+usersList);
		return usersList;
	}
	public List<BOUsers> getAllUsers(){
		numRecords();
		String SQL = "select * from "+UsersTb.tableName;  
		System.out.println("SQL="+SQL);
		List<BOUsers> usersList = jdbcTemplateObject.query(SQL,new UsersMapper()); 
		System.out.println("emp="+usersList);
		return usersList;
	}
	public int getEmpUserId(String userUid){
		int userId=0;
		String SQL1 = "select count(*) from "+UsersTb.tableName+
				" where "+UsersTb.user_uid+" = ?";
		int ret=jdbcTemplateObject.queryForObject(SQL1, new Object[]{userUid}, Integer.class);
		if(ret>0)
		{
			String SQL = "select "+UsersTb.employeeId+" from "+UsersTb.tableName+
					" where "+UsersTb.user_uid+" = ?";  
			System.out.println("SQL="+SQL +userUid);	
			userId = jdbcTemplateObject.queryForObject(SQL, new Object[]{userUid},Integer.class);
		}
		return userId;
	}
	
//	public List<Users> getAllUsers(int start,int showRecsPerPage,int role){
//		numRecords();
//		String SQL = "select * from "+UsersTb.tableName+ " where "+UsersTb.user_role_uid+"= ?"+ " limit " +showRecsPerPage +" OFFSET "+start  ;  
//		System.out.println("SQL="+SQL);
//		List<Users> usersList = jdbcTemplateObject.query(SQL,new Object[]{role},new UsersMapper()); 
//		System.out.println("emp="+usersList);
//		return usersList;
//	}
	
//	public List<Users> getAllUsers(int start,int showRecsPerPage,int role){
//		numRecords();
//		String SQL = "select * from "+UsersTb.tableName+ " where "+UsersTb.user_role_uid+"= ?"+ " limit " +showRecsPerPage +" OFFSET "+start  ;  
//		System.out.println("SQL="+SQL);
//		List<Users> usersList = jdbcTemplateObject.query(SQL,new Object[]{role},new UsersMapper()); 
//		System.out.println("emp="+usersList);
//		return usersList;
//	}
	/*doctors*/
	public List<BOUsers> getAllDoctors(){
		numRecords();
		String SQL = "select * from "+UsersTb.tableName;  
		System.out.println("SQL="+SQL);
		List<BOUsers> doctorsList = jdbcTemplateObject.query(SQL,new UsersMapper()); 
		System.out.println("emp="+doctorsList);
		return doctorsList;
	}  
	public List<BOUsers> getAllDoctors(int start,int showRecsPerPage,int role){
		numRecords();
		String cont = " where "+UsersTb.user_role_uid+" = "+role+"";
		String SQL = "select u.*,e."+EmployeesTb.email+" from "+UsersTb.tableName+" as u Join "+EmployeesTb.tableName+" as e "
		+" on e."+EmployeesTb.id+" = u."+UsersTb.employeeId+cont+ " limit " +showRecsPerPage +" OFFSET "+start;
//		String SQL = "select * from "+UsersTb.tableName+" where "+UsersTb.user_role_uid+"= ?"+ " limit " +start +", "+showRecsPerPage ; 
		System.out.println("SQL="+SQL);
		List<BOUsers> doctorsList = jdbcTemplateObject.query(SQL,new Object[]{},new UsersMapper()); 
		System.out.println("emp="+doctorsList);
		return doctorsList;
	}
/*	patients*/
	public List<BOUsers> getAllPatients(){
		numRecords();
		String SQL = "select * from "+UsersTb.tableName;  
		System.out.println("SQL="+SQL);
		List<BOUsers> patientsList = jdbcTemplateObject.query(SQL,new UsersMapper()); 
		System.out.println("emp="+patientsList);
		return patientsList;
	}  
	public List<BOUsers> getAllPatients(int start,int showRecsPerPage,int role){
		numRecords();
		
		String SQL = "select * from "+UsersTb.tableName+" where "+UsersTb.user_role_uid+"= ?"+ " limit " +start +", "+showRecsPerPage ;/* limit "+start+", "+end*/ 
		System.out.println("SQL="+SQL);
		List<BOUsers> patientsList = jdbcTemplateObject.query(SQL,new Object[]{role},new UsersMapper()); 
		System.out.println("emp="+patientsList);
		return patientsList;
	}
	/*users*/
	public boolean AddEmpUser(int empId,String userId,int userRole){

		String SQL = "insert into "+UsersTb.tableName+
				" ("+UsersTb.employeeId+","+UsersTb.user_uid+","+UsersTb.user_role_uid+","+UsersTb.created_at+","+UsersTb.updated_at+")"
						+ " values ( ?, ?, ?, ?, ?)";
		System.out.println("SQL="+SQL );
		jdbcTemplateObject.update(SQL, new Object[]{empId,userId,userRole,dateFormat.format(date),dateFormat.format(date)});
		return true;
	}
	public BOUsers getUser(int id){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        List<BOUsers> userList= jdbcTemplateObject.query(SQL,new Object[]{id},
                                new UsersMapper());
        	return userList.get(0);
    } 
	public BOUsers getUser(String userUid){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.user_uid +" = ?";
        System.out.println("SQL="+SQL);
        List<BOUsers> userList= jdbcTemplateObject.query(SQL,new Object[]{userUid},
                                new UsersMapper());
        	return userList.get(0);
    }  
	public BOUsers getUser1(String employee_id){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb. employeeId +" = ?";
        System.out.println("SQL="+SQL);
        List<BOUsers> userList= jdbcTemplateObject.query(SQL,new Object[]{employee_id},
                                new UsersMapper());
        	return userList.get(0);
    }  
	public BOUsers getDoctor(int id){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        List<BOUsers> doctorList= jdbcTemplateObject.query(SQL,new Object[]{id},
                                new UsersMapper());
        	return doctorList.get(0);
    }
	public BOUsers getPatient(int id){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        List<BOUsers> patientList= jdbcTemplateObject.query(SQL,new Object[]{id},
                                new UsersMapper());
        	return patientList.get(0);
    }
	public BOUsers get(int id){
        String SQL = "select * from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        List<BOUsers> userList= jdbcTemplateObject.query(SQL,new Object[]{id},
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
	public boolean updateUser(BOUsers user){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		
		System.out.println("user_uid="+user.getUser_uid());
        String SQL = "update "+UsersTb.tableName+
                    " set "+UsersTb.password+" = ? , "+UsersTb.user_role_uid+" = ? , "+UsersTb.user_uid+" = ?,"+UsersTb.activation_sts+" = ?,"+UsersTb.updated_at+"= ? where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{user.getPassword(),user.getUser_role_uid(),user.getUser_uid(),user.getActivation_sts(),dateFormat.format(date),user.getId()});
        return true;
    }
	public boolean delUser(int id){
        String SQL = "delete from "+UsersTb.tableName+
                    " where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{id});
        return true;
    }
	public boolean delUserWithEmpId(int empId){
        String SQL = "delete from "+UsersTb.tableName+
                    " where "+UsersTb.employeeId+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{empId});
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
	public boolean changeUserPwdByAdmin(BOUsers user){
		System.out.println("user_uid="+user.getUser_uid());
        String SQL = "update "+UsersTb.tableName+
                    " set "+UsersTb.password+" = ? , "+UsersTb.activation_sts+"=? where "+UsersTb.id+" = ?";
        System.out.println("SQL="+SQL);
        jdbcTemplateObject.update(SQL, new Object[]{user.getPassword(),1,user.getId()});
        return true;
    }
	public boolean changeActiveSt(BOUsers user){
		System.out.println("user_uid="+user.getUser_uid());
        String SQL = "update "+UsersTb.tableName+
                    " set "+UsersTb.activation_sts+" = ? where "+UsersTb.id+" = ?";
        System.out.println("changeActiveSt SQL="+SQL+","+user.getId()+","+user.getActivation_sts());
        jdbcTemplateObject.update(SQL, new Object[]{user.getActivation_sts(),user.getId()});
        return true;
    }
	
	public int isUserAvail(String email){
        String SQL = "select * from "+UsersTb.tableName+" as u JOIN "+EmployeesTb.tableName+" as e"
        		+ " ON e."+EmployeesTb.id+" = u."+UsersTb.employeeId
        		+" where "+EmployeesTb.email+" = ?";
        System.out.println(" isUserAvail SQL="+SQL);
        List<BOUsers> rowCount = jdbcTemplateObject.query(SQL,new Object[]{email},new UsersEmpMapper() );
        System.out.println("rowCnt = "+rowCount);
//        boolean ret = rowCount.size()>0 ? true : false;
        int ret =0;
        if(rowCount.size()>0){
        	ret = rowCount.get(0).getId();
        }
        System.out.println("id-> "+ret);
        	return ret;
	}
//	public boolean isUserAvail(String email){
//        String SQL = "select count(*) from "+UsersTb.tableName+" as u JOIN "+EmployeesTb.tableName+" as e"
//        		+ " ON e."+EmployeesTb.id+" = u."+UsersTb.employeeId
//        		+" where "+EmployeesTb.email+" = ?";
//        System.out.println(" isUserAvail SQL="+SQL);
//        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{email},Integer.class);
//        boolean ret = rowCount>0 ? true : false;
//        	return ret;
//	}
	
}
