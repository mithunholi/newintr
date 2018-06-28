package com.eoxys.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.EmployeesDao.EmployeesTb;
import com.eoxys.Model.AtomicCounter;


@Repository
public class AtomicCounterDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyyMM");
	Date date = new Date();
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	//SQL Table Details
	//---------Table
	static final class AtomicCounterTb{
		static final String tableName = "atomic_counter";

		//Table Column Names
		static final String id = "id";
		static final String user_uid= "user_uid";
		static final String user_uid_dt= "user_uid_dt";
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public class AtomicCounterMapper implements RowMapper<AtomicCounter> {
		public AtomicCounter mapRow(ResultSet rs, int rowNum) throws SQLException {
			AtomicCounter atomicCounter = new AtomicCounter();
			System.out.println("atomicCMapper");
			atomicCounter.setId(rs.getInt(AtomicCounterTb.id));
			atomicCounter.setUser_uid(rs.getInt(AtomicCounterTb.user_uid));
			atomicCounter.setUser_uid_dt(rs.getTimestamp(AtomicCounterTb.user_uid_dt));
			return atomicCounter;
		}
	}
	public String incAndGetUserUid()
	{
		String SQL="select * from "+AtomicCounterTb.tableName;
		List<AtomicCounter> atomicCounter=jdbcTemplateObject.query(SQL,new AtomicCounterMapper());
		AtomicCounter atomic=atomicCounter.get(0);
		int id= atomic.getId();
		int uId= atomic.getUser_uid();
		Date dt= atomic.getUser_uid_dt();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String updatedDate= sdf.format(dt);
		String curentDate= dateFormat.format(date);
		System.out.println("id="+uId+" date="+updatedDate+" cDate="+curentDate);
		if(updatedDate.equals(curentDate))
		{
			uId = uId + 1;
			String SQL1= "update "+AtomicCounterTb.tableName+
	                " set "+AtomicCounterTb.user_uid+" = ? where "+AtomicCounterTb.id+" = ?";
			System.out.println("SQL="+SQL1);
	        jdbcTemplateObject.update(SQL1, new Object[]{uId,id});
		}else{
			uId = 1;
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String SQL1= "update "+AtomicCounterTb.tableName+
	                " set "+AtomicCounterTb.user_uid+" = ? , "+AtomicCounterTb.user_uid_dt+" = ? where "+AtomicCounterTb.id+" = ?";
			System.out.println("SQL="+SQL1);
	        jdbcTemplateObject.update(SQL1, new Object[]{uId,dateFormat.format(date),id});
		}
        System.out.println("Successfully updated UID="+uId);
		String pattern="0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
		String stringId = myFormatter.format(uId);
		System.out.println("output="+stringId);
		String uid=curentDate.concat(stringId);
		System.out.println("ID=="+uid);
		return uid;
	}
	/*public String incAndGetDeviceid()
	{
		String SQL="select * from "+AtomicCounterTb.tableName;
		List<AtomicCounter> atomicCounter=jdbcTemplateObject.query(SQL,new AtomicCounterMapper());
		AtomicCounter atomic=atomicCounter.get(0);
		int id= atomic.getId();
		int uId= atomic.getDevice_id();
		Date dt= atomic.getDevice_id_dt();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String updatedDate= sdf.format(dt);
		String curentDate= dateFormat.format(date);
		System.out.println("id="+uId+" date="+updatedDate+" cDate="+curentDate);
		if(updatedDate.equals(curentDate))
		{
			uId = uId + 1;
			String SQL1= "update "+AtomicCounterTb.tableName+
	                " set "+AtomicCounterTb.device_id+" = ? where "+AtomicCounterTb.id+" = ?";
			System.out.println("SQL="+SQL1);
	        jdbcTemplateObject.update(SQL1, new Object[]{uId,id});
		}else{
			uId = 1;
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String SQL1= "update "+AtomicCounterTb.tableName+
	                " set "+AtomicCounterTb.device_id+" = ? , "+AtomicCounterTb.device_id_dt+" = ? where "+AtomicCounterTb.id+" = ?";
			System.out.println("SQL="+SQL1);
	        jdbcTemplateObject.update(SQL1, new Object[]{uId,dateFormat.format(date),id});
		}
        System.out.println("Successfully updated UID="+uId);
		String pattern="0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
		String stringId = myFormatter.format(uId);
		System.out.println("output="+stringId);
		String uid=curentDate.concat(stringId);
		System.out.println("ID=="+uid);
		return uid;
	}*/
	/*public String incAndGetCampaignid()
	{
		String SQL="select * from "+AtomicCounterTb.tableName;
		List<AtomicCounter> atomicCounter=jdbcTemplateObject.query(SQL,new AtomicCounterMapper());
		AtomicCounter atomic=atomicCounter.get(0);
		int id= atomic.getId();
		int uId= atomic.getCampaign_id();
		Date dt= atomic.getCampaign_id_dt();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String updatedDate= sdf.format(dt);
		String curentDate= dateFormat.format(date);
		System.out.println("id="+uId+" date="+updatedDate+" cDate="+curentDate);
		if(updatedDate.equals(curentDate))
		{
			uId = uId + 1;
			String SQL1= "update "+AtomicCounterTb.tableName+
	                " set "+AtomicCounterTb.campaign_id+" = ? where "+AtomicCounterTb.id+" = ?";
			System.out.println("SQL="+SQL1);
	        jdbcTemplateObject.update(SQL1, new Object[]{uId,id});
		}else{
			uId = 1;
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String SQL1= "update "+AtomicCounterTb.tableName+
	                " set "+AtomicCounterTb.campaign_id+" = ? , "+AtomicCounterTb.campaign_id_dt+" = ? where "+AtomicCounterTb.id+" = ?";
			System.out.println("SQL="+SQL1);
	        jdbcTemplateObject.update(SQL1, new Object[]{uId,dateFormat.format(date),id});
		}
        System.out.println("Successfully updated UID="+uId);
		String pattern="0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
		String stringId = myFormatter.format(uId);
		System.out.println("output="+stringId);
		String uid=curentDate.concat(stringId);
		System.out.println("ID=="+uid);
		return uid;
	}*/
}
