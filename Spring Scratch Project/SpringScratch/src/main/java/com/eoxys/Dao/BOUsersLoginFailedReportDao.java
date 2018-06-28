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
public class BOUsersLoginFailedReportDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	static final class BOUsersLoginFailedReportTb
	{
		static String tableName= "back_office_user_failed_login_report";
		static String id= "id";	
		static String user_id = "user_id";
		static String client_ip_address = "client_ip_address";
		static String created_at = "created_at";
		static String time_zone = "time_zone";
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}


	public class UsersMapper implements RowMapper<BOUsersLoginFailedReport> {
		public BOUsersLoginFailedReport mapRow(ResultSet rs, int rowNum) throws SQLException {
			BOUsersLoginFailedReport users = new BOUsersLoginFailedReport();
//			System.out.println("maprow");
			users.setId(rs.getInt(BOUsersLoginFailedReportTb.id));
			users.setUser_id(rs.getString(BOUsersLoginFailedReportTb.user_id));
			users.setClient_ip_address(rs.getString(BOUsersLoginFailedReportTb.client_ip_address));
			users.setCreated_at(rs.getTimestamp(BOUsersLoginFailedReportTb.created_at));
			users.setTime_zone(rs.getString(BOUsersLoginFailedReportTb.time_zone));
			System.out.println("cre="+rs.getTimestamp(BOUsersLoginFailedReportTb.created_at));	
			
			return users;
		}
	}

	public int getFailedAttemptCnt(int userId){
		String SQL="select count(*) from "+BOUsersLoginFailedReportTb.tableName+" where "+BOUsersLoginFailedReportTb.user_id+"= ?";
		 System.out.println("getFailedAttemptCnt SQL="+SQL+",,,"+userId+",,,,");
	        int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{userId},Integer.class);
	        System.out.println("ROWS="+rowCount);
	        return rowCount;
	}
	
	public boolean addFailedReport(BOUsersLoginFailedReport bo){
		date = new Date();
		
//		String timeZone = date.getTimezoneOffset();
		String SQL = "insert into "+BOUsersLoginFailedReportTb.tableName+
				" ("+BOUsersLoginFailedReportTb.user_id+","+BOUsersLoginFailedReportTb.client_ip_address+","
				+BOUsersLoginFailedReportTb.created_at+","+BOUsersLoginFailedReportTb.time_zone+")"
						+ " values ( ?, ?,?,?)";
		System.out.println("addFailedReport SQL="+SQL+bo.getUser_id()+","+
						bo.getClient_ip_address()+","+dateFormat.format(date) );
		jdbcTemplateObject.update(SQL, new Object[]{bo.getUser_id(),bo.getClient_ip_address(),
				dateFormat.format(date),bo.getTime_zone()});
		return true;
	}
	
	public boolean deleteAllFailedReport(int userId){

		String SQL = "DELETE FROM "+BOUsersLoginFailedReportTb.tableName+" WHERE "+BOUsersLoginFailedReportTb.user_id+"=?";
		System.out.println("deleteAllFailedReport SQL="+SQL+","+userId );
		jdbcTemplateObject.update(SQL, new Object[]{userId});
		return true;
	}
	
}
