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
public class BOUsersLoginReportDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
	Date date = new Date();
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	static final class BOUsersLoginReportTb
	{
		static String tableName= "back_office_user_login_report";
		static String id= "id";	
		static String user_id = "user_id";
		static String action = "action";
		static String client_ip_address = "client_ip_address";
		static String created_at = "created_at";
		static String time_zone = "time_zone";
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}


	public class UsersMapper implements RowMapper<BOUsersLoginReport> {
		public BOUsersLoginReport mapRow(ResultSet rs, int rowNum) throws SQLException {
			BOUsersLoginReport users = new BOUsersLoginReport();
//			System.out.println("maprow");
			users.setId(rs.getInt(BOUsersLoginReportTb.id));
			users.setUser_id(rs.getString(BOUsersLoginReportTb.user_id));
			users.setAction(rs.getInt(BOUsersLoginReportTb.action));
			users.setClient_ip_address(rs.getString(BOUsersLoginReportTb.client_ip_address));
			users.setCreated_at(rs.getTimestamp(BOUsersLoginReportTb.created_at));
			users.setTime_zone(rs.getString(BOUsersLoginReportTb.time_zone));
			System.out.println("cre="+rs.getTimestamp(BOUsersLoginReportTb.created_at));	
			
			return users;
		}
	}

	public boolean addLoginReport(BOUsersLoginReport bo){
		date = new Date();
		String SQL = "insert into "+BOUsersLoginReportTb.tableName+
				" ("+BOUsersLoginReportTb.user_id+","+BOUsersLoginReportTb.action+","+
				BOUsersLoginReportTb.client_ip_address+","+BOUsersLoginReportTb.created_at+
				","+BOUsersLoginReportTb.time_zone+")"
						+ " values ( ?, ?,?,?,?)";
		System.out.println("addFailedReport SQL="+SQL+bo.getUser_id()+","+
						bo.getClient_ip_address()+","+dateFormat.format(date) );
		jdbcTemplateObject.update(SQL, new Object[]{bo.getUser_id(),bo.getAction(),bo.getClient_ip_address(),
				dateFormat.format(date),bo.getTime_zone()});
		return true;
	}
	
	public boolean deleteAllFailedReport(int userId){

		String SQL = "DELETE FROM "+BOUsersLoginReportTb.tableName+" WHERE "+BOUsersLoginReportTb.user_id+"=?";
		System.out.println("deleteAllFailedReport SQL="+SQL+","+userId );
		jdbcTemplateObject.update(SQL, new Object[]{userId});
		return true;
	}
	
}
