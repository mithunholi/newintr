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

import com.eoxys.Model.AtomicCounter;

@Repository
public class AtomicCounterDao {
	DateFormat dateFormat = new SimpleDateFormat("yyyyMM");
	Date date = new Date();
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	// SQL Table Details
	// ---------Table
	static final class AtomicCounterTb {
		static final String tableName = "atomic_counter";

		// Table Column Names
		static final String id = "id";
		static final String user_uid = "user_uid";
		static final String user_uid_dt = "user_uid_dt";
		static final String cuser_uid = "cuser_uid";
		static final String cuser_uid_dt = "cuser_uid_dt";

	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public class AtomicCounterMapper implements RowMapper<AtomicCounter> {
		public AtomicCounter mapRow(ResultSet rs, int rowNum)
				throws SQLException {
			AtomicCounter atomicCounter = new AtomicCounter();
			System.out.println("atomicCMapper");
			atomicCounter.setId(rs.getInt(AtomicCounterTb.id));
			atomicCounter.setUser_uid(rs.getInt(AtomicCounterTb.user_uid));
			atomicCounter.setCuser_uid(rs.getInt(AtomicCounterTb.cuser_uid));
//			System.out.println("Date "+rs.getDate(AtomicCounterTb.user_uid_dt));
			atomicCounter.setCuser_uid_dt(rs.getDate(AtomicCounterTb.cuser_uid_dt));
			atomicCounter.setUser_uid_dt(rs.getDate(AtomicCounterTb.user_uid_dt));

			return atomicCounter;
		}
	}

	public String incAndGetUserUid() {
		String SQL = "select * from " + AtomicCounterTb.tableName;
		List<AtomicCounter> atomicCounter = jdbcTemplateObject.query(SQL,
				new AtomicCounterMapper());
		int id = 0;// atomic.getId();
		int uId = 0;// atomic.getUser_uid();
		Date dt = new Date();// atomic.getUser_uid_dt();
		String uid = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String updatedDate = sdf.format(dt);
		String curentDate = dateFormat.format(date);
		if (atomicCounter.size() > 0) {
			AtomicCounter atomic = atomicCounter.get(0);
			id = atomic.getId();
			uId = atomic.getUser_uid();
			dt = atomic.getUser_uid_dt();
			updatedDate = sdf.format(dt);
			curentDate = dateFormat.format(date);
			System.out.println("id=" + uId + " date=" + updatedDate + " cDate="
					+ curentDate);
			if (updatedDate.equals(curentDate)) {
				uId = uId + 1;
				String SQL1 = "update " + AtomicCounterTb.tableName + " set "
						+ AtomicCounterTb.user_uid + " = ? where "
						+ AtomicCounterTb.id + " = ?";
				System.out.println("SQL=" + SQL1);
				jdbcTemplateObject.update(SQL1, new Object[] { uId, id });
			} else {
				uId = 1;
				DateFormat dateFormat = new SimpleDateFormat(
						"yyyy/MM/dd HH:mm:ss");
				Date date = new Date();
				String SQL1 = "update " + AtomicCounterTb.tableName + " set "
						+ AtomicCounterTb.user_uid + " = ? , "
						+ AtomicCounterTb.user_uid_dt + " = ? where "
						+ AtomicCounterTb.id + " = ?";
				System.out.println("SQL=" + SQL1);
				jdbcTemplateObject.update(SQL1,
						new Object[] { uId, dateFormat.format(date), id });
			}

		} else {
			uId = uId + 1;
			String SQL1 = "INSERT INTO  " + AtomicCounterTb.tableName + " ("
					+ AtomicCounterTb.user_uid + ","
					+ AtomicCounterTb.user_uid_dt + ")" + " VALUES(?,?)";
			System.out.println("SQL=" + SQL1);
			jdbcTemplateObject.update(SQL1, new Object[] { uId, new Date() });
		}
		System.out.println("Successfully updated UID=" + uId);
		String pattern = "0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
		String stringId = myFormatter.format(uId);
		System.out.println("output=" + stringId);
		uid = curentDate.concat(stringId);
		System.out.println("ID==" + uid);

		return uid;
	}

	/*
	 * public String incAndGetDeviceid() { String
	 * SQL="select * from "+AtomicCounterTb.tableName; List<AtomicCounter>
	 * atomicCounter=jdbcTemplateObject.query(SQL,new AtomicCounterMapper());
	 * AtomicCounter atomic=atomicCounter.get(0); int id= atomic.getId(); int
	 * uId= atomic.getDevice_id(); Date dt= atomic.getDevice_id_dt();
	 * SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM"); String
	 * updatedDate= sdf.format(dt); String curentDate= dateFormat.format(date);
	 * System.out.println("id="+uId+" date="+updatedDate+" cDate="+curentDate);
	 * if(updatedDate.equals(curentDate)) { uId = uId + 1; String SQL1=
	 * "update "+AtomicCounterTb.tableName+
	 * " set "+AtomicCounterTb.device_id+" = ? where "
	 * +AtomicCounterTb.id+" = ?"; System.out.println("SQL="+SQL1);
	 * jdbcTemplateObject.update(SQL1, new Object[]{uId,id}); }else{ uId = 1;
	 * DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss"); Date
	 * date = new Date(); String SQL1= "update "+AtomicCounterTb.tableName+
	 * " set "+AtomicCounterTb.device_id+" = ? , "+AtomicCounterTb.device_id_dt+
	 * " = ? where "+AtomicCounterTb.id+" = ?"; System.out.println("SQL="+SQL1);
	 * jdbcTemplateObject.update(SQL1, new
	 * Object[]{uId,dateFormat.format(date),id}); }
	 * System.out.println("Successfully updated UID="+uId); String
	 * pattern="0000"; DecimalFormat myFormatter = new DecimalFormat(pattern);
	 * String stringId = myFormatter.format(uId);
	 * System.out.println("output="+stringId); String
	 * uid=curentDate.concat(stringId); System.out.println("ID=="+uid); return
	 * uid; }
	 */

	public String incAndGetCUserUid() {
		String SQL = "select * from " + AtomicCounterTb.tableName;
		System.out.println("SQL "+SQL);
		List<AtomicCounter> atomicCounter = jdbcTemplateObject.query(SQL,
				new AtomicCounterMapper());
		AtomicCounter atomic = atomicCounter.get(0);
		int id = atomic.getId();
		int uId = atomic.getCuser_uid();
		Date dt = atomic.getCuser_uid_dt();
		System.out.println("atomic "+id+","+uId+","+dt);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMM");
		String updatedDate = sdf.format(dt);
		String curentDate = dateFormat.format(date);
		System.out.println("id=" + uId + " date=" + updatedDate + " cDate="
				+ curentDate);
		if (updatedDate.equals(curentDate)) {
			uId = uId + 1;
			String SQL1 = "update " + AtomicCounterTb.tableName + " set "
					+ AtomicCounterTb.cuser_uid + " = ? where "
					+ AtomicCounterTb.id + " = ?";
			System.out.println("SQL=" + SQL1);
			jdbcTemplateObject.update(SQL1, new Object[] { uId, id });
		} else {
			uId = 1;
			DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
			Date date = new Date();
			String SQL1 = "update " + AtomicCounterTb.tableName + " set "
					+ AtomicCounterTb.cuser_uid + " = ? , "
					+ AtomicCounterTb.cuser_uid_dt + " = ? where "
					+ AtomicCounterTb.id + " = ?";
			System.out.println("SQL=" + SQL1);
			jdbcTemplateObject.update(SQL1,
					new Object[] { uId, dateFormat.format(date), id });
		}
		System.out.println("Successfully updated UID=" + uId);
		String pattern = "0000";
		DecimalFormat myFormatter = new DecimalFormat(pattern);
		String stringId = myFormatter.format(uId);
		System.out.println("output=" + stringId);
		String uid = curentDate.concat(stringId);
		System.out.println("ID==" + uid);
		return uid;
	}

}
