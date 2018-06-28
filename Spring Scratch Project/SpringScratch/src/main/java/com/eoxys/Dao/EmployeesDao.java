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
import org.springframework.stereotype.Repository;
import org.springframework.jdbc.core.RowMapper;

//import com.eoxys.Dao.DesigDao.DesigRoleTb;
import com.eoxys.Dao.BOUsersDao.UsersMapper;
import com.eoxys.Dao.BOUsersDao.UsersTb;
import com.eoxys.Model.Employees;

@Repository
public class EmployeesDao {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
private String superUserCont=EmployeesTb.id+" != 0 ";
	// SQL Table Details
	// ---------Table
	static final class EmployeesTb {
		static final String tableName = "employees";

		// Table Column Names
		static final String id = "id";
		// static final String user_uid= "user_uid";

		static final String name = "name";
		static final String desig = "desig";
		static final String city = "city";
		static final String state = "state";
		static final String country = "country";
		static final String address_line1 = "address_line1";
		static final String address_line2 = "address_line2";
		static final String zip = "zip";

		// static final String designation = "desig_id";
		static final String email = "email";
		static final String phone = "phone";
		static final String age = "age";
		static final String dob = "dob";
		static final String sex = "sex";
		static final String url = "url";
		static final String thumb_url = "thumb_url";
		static final String created_at = "created_at";
		static final String updated_at = "updated_at";

		// static final String designationValue = "desig_value";
	}
	
	

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public class EmployeesMapper implements RowMapper<Employees> {
		public Employees mapRow(ResultSet rs, int rowNum) throws SQLException {
			Employees employees = null;//new Employees();
			System.out.println("employeesMapper");
//			if (rs.getInt(EmployeesTb.id) != 0) {
				employees=new Employees();
				employees.setId(rs.getInt(EmployeesTb.id));

				// employees.setUser_uid(rs.getString(EmployeesTb.user_uid));

				employees.setName(rs.getString(EmployeesTb.name));
				employees.setDesig(rs.getString(EmployeesTb.desig));
				employees.setCity(rs.getString(EmployeesTb.city));
				employees.setState(rs.getString(EmployeesTb.state));
				employees.setCountry(rs.getString(EmployeesTb.country));
				employees.setAddress_line1(rs
						.getString(EmployeesTb.address_line1));
				employees.setAddress_line2(rs
						.getString(EmployeesTb.address_line2));
				employees.setZip(rs.getString(EmployeesTb.zip));
				// employees.setDesignation(rs.getString(EmployeesTb.designation));
				employees.setEmail(rs.getString(EmployeesTb.email));
				employees.setPhone(rs.getString(EmployeesTb.phone));
				employees.setSex(rs.getString(EmployeesTb.sex));
				employees.setAge(rs.getInt(EmployeesTb.age));
				employees.setDob(rs.getTimestamp(EmployeesTb.dob));
				employees.setUrl(rs.getString(EmployeesTb.url));
				employees.setThumb_url(rs.getString(EmployeesTb.thumb_url));
				employees
						.setCreated_at(rs.getTimestamp(EmployeesTb.created_at));
				employees
						.setUpdated_at(rs.getTimestamp(EmployeesTb.updated_at));
//			}

			System.out.print("MNBBNNB");
			// System.out.print(rs.getString(com.eoxys.Dao.DesigDao.DesigRoleTb.desig_value));
			// employees.setDesignationValue(rs.getString(com.eoxys.Dao.DesigDao.DesigRoleTb.desig_value));
			return employees;
		}
	}

	public int getNumRows() {
		String SQL = "select count(*) from " + EmployeesTb.tableName;
		System.out.println("SQL=" + SQL);
		int rowCount = jdbcTemplateObject.queryForObject(SQL, Integer.class);
		System.out.println("ROWS=" + rowCount);
		return rowCount;
	}

	public int getNumRows(String searchKey) {
		String likeQuery = EmployeesTb.name + " LIKE '%" + searchKey + "%' OR "
				+ EmployeesTb.email + " LIKE '%" + searchKey + "%'";
		System.out.println("Query=" + likeQuery);
		String SQL = "select count(*) from " + EmployeesTb.tableName
				+ " where " + likeQuery;
		System.out.println("SQL=" + SQL);
		int rowCount = jdbcTemplateObject.queryForObject(SQL, Integer.class);
		System.out.println("ROWS=" + rowCount);
		return rowCount;
	}

	public List<Employees> getAllEmployees() {
		getNumRows();
		String SQL = "select * " + " from " + EmployeesTb.tableName+" WHERE "+superUserCont;
		// String SQL = "select * from "+EmployeesTb.tableName;
		System.out.println("SQL=" + SQL);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new EmployeesMapper());
		System.out.println("emp=" + employeesList);
		return employeesList;
	}

	// public List<Employees> getAllEmployees(){
	// getNumRows();
	// String SQL =
	// "select e.*,d."+com.eoxys.Dao.DesigDao.DesigRoleTb.desig_value
	// +" from "+EmployeesTb.tableName+" as e join "+com.eoxys.Dao.DesigDao.DesigRoleTb.tableName+
	// " on "+com.eoxys.Dao.DesigDao.DesigRoleTb.id+" = "+EmployeesTb.designation;
	// System.out.println("SQL="+SQL);
	// List<Employees> employeesList = jdbcTemplateObject.query(SQL,new
	// EmployeesMapper());
	// System.out.println("emp="+employeesList);
	// return employeesList;
	// }
	public List<Employees> getAllEmployees(int start, int showRecsPerPage) {
		getNumRows();
		String SQL = "select *" + " from " + EmployeesTb.tableName + " WHERE "+superUserCont+" LIMIT "
				+ showRecsPerPage + " OFFSET " + start;
		// String SQL = "select * from "+EmployeesTb.tableName+ " limit "
		// +showRecsPerPage +" OFFSET "+start;
		System.out.println("SQL=" + SQL);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new EmployeesMapper());
		System.out.println("emp=" + employeesList);
		return employeesList;
	}

	public List<Employees> getAllEmployees(int start, int showRecsPerPage,
			int desigId) {
		getNumRows();
		String SQL = "select *" + " from " + EmployeesTb.tableName + " WHERE "+superUserCont+" LIMIT "
				+ showRecsPerPage + " OFFSET " + start;
		// String SQL = "select * from "+EmployeesTb.tableName+ " limit "
		// +showRecsPerPage +" OFFSET "+start;
		System.out.println("SQL=" + SQL);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new EmployeesMapper());
		System.out.println("emp=" + employeesList);
		return employeesList;
	}

	public int getNumNonUserEmployees() {
		String SQL = "select count(*) from " + EmployeesTb.tableName
				+ " where "+superUserCont+" AND " + EmployeesTb.id + " not in (select "
				+ UsersTb.employeeId + " from " + UsersTb.tableName + ")";
		System.out.println("SQL=" + SQL);
		int rowCount = jdbcTemplateObject.queryForObject(SQL, Integer.class);
		System.out.println("ROWS=" + rowCount);
		return rowCount;
	}

	public int getNumNonUserEmployees(String searchKey) {
		String likeQuery = EmployeesTb.name + " LIKE '%" + searchKey + "%' OR "
				+ EmployeesTb.email + " LIKE '%" + searchKey + "%'";
		String SQL = "select count(*) from " + EmployeesTb.tableName
				+ " where (" + likeQuery + ") AND "+superUserCont+" AND " + EmployeesTb.id
				+ " not in (select " + UsersTb.employeeId + " from "
				+ UsersTb.tableName + ")";
		System.out.println("SQL=" + SQL);
		int rowCount = jdbcTemplateObject.queryForObject(SQL, Integer.class);
		System.out.println("ROWS=" + rowCount);
		return rowCount;
	}

	public List<Employees> getNonUserEmployees(int start, int showRecsPerPage) {
		String SQL = "select * " + " from " + EmployeesTb.tableName + " where "
				+ EmployeesTb.id + " not in (select " + UsersTb.employeeId
				+ " from " + UsersTb.tableName + ") AND "+superUserCont+" limit " + showRecsPerPage
				+ " OFFSET " + start;
		;
		// String SQL = "select * from "+EmployeesTb.tableName+ " limit "
		// +showRecsPerPage +" OFFSET "+start;
		System.out.println("SQL=" + SQL);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new EmployeesMapper());
		System.out.println("emp=" + employeesList);
		return employeesList;
	}

	public List<Employees> getNonUserEmployees(String searchKey, int start,
			int showRecsPerPage) {
		String likeQuery = EmployeesTb.name + " LIKE '%" + searchKey + "%' OR "
				+ EmployeesTb.email + " LIKE '%" + searchKey + "%'";
		String SQL = "select *" + " from " + EmployeesTb.tableName + " where ("
				+ likeQuery + ") AND "+superUserCont+" AND " + EmployeesTb.id + " not in (select "
				+ UsersTb.employeeId + " from " + UsersTb.tableName + ")";
		// String SQL = "select * from "+EmployeesTb.tableName+ " limit "
		// +showRecsPerPage +" OFFSET "+start;
		System.out.println("SQL=" + SQL);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new EmployeesMapper());
		System.out.println("emp=" + employeesList);
		return employeesList;
	}

	/*
	 * public List<Employees> getAllEmployees(int start,int showRecsPerPage,int
	 * role){ getNumRows(); String SQL = "select * from "+UsersTb.tableName+
	 * " where "+UsersTb.user_role_uid+"= ?"+
	 * " LIMIT "+showRecsPerPage+" OFFSET "+start;
	 * System.out.println("SQL="+SQL); List<Employees> employeesList =
	 * jdbcTemplateObject.query(SQL,new EmployeesMapper());
	 * System.out.println("emp="+employeesList); return employeesList; }
	 */

	public Employees getEmployee(int id) {
		String SQL = "select * from " + EmployeesTb.tableName + " where "
				+ EmployeesTb.id + " = ? AND "+superUserCont;
		// String SQL = "select * from "+EmployeesTb.tableName+
		// " where "+EmployeesTb.id+" = ?";
		System.out.println("SQL=" + SQL + id);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new Object[] { id }, new EmployeesMapper());
		if (employeesList.size() == 0) {
			return null;
		} else {
			return employeesList.get(0);
		}
	}

	public List<Employees> getEmployeesByIds(String ids) {
		String SQL = "select *" + " from " + EmployeesTb.tableName + " where "
				+ EmployeesTb.id + " in (" + ids + ")";
		// String SQL = "select * from "+EmployeesTb.tableName+
		// " where "+EmployeesTb.id+" = ?";
		System.out.println("SQL=" + SQL);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new Object[] {}, new EmployeesMapper());
		// if(employeesList.size()==0){
		// return null;
		// }else{
		return employeesList;
		// }
	}

	// public Employees getEmployee(int id){
	// String SQL = "select * from "+EmployeesTb.tableName+
	// " where "+EmployeesTb.id+" = ?";
	// System.out.println("SQL="+SQL);
	// List<Employees> employeesList= jdbcTemplateObject.query(SQL,new
	// Object[]{id},
	// new EmployeesMapper());
	// return employeesList.get(0);
	// }
	public boolean isAvailable(int recid) {
		String SQL = "select count(*) from " + EmployeesTb.tableName
				+ " where " + EmployeesTb.id + " = ?";
		System.out.println("SQL=" + SQL);

		if (jdbcTemplateObject == null) {
			System.out.println("NULL JDBC");
			this.jdbcTemplateObject = new JdbcTemplate(dataSource);
		}
		int rowCount = jdbcTemplateObject.queryForObject(SQL,
				new Object[] { recid }, Integer.class);
		boolean ret = rowCount > 0 ? true : false;
		return ret;
	}

	public boolean updateEmployee(Employees employee) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String SQL = "update "
				+ EmployeesTb.tableName
				+ " set "
				// +EmployeesTb.user_uid+" = ? , "
				// +EmployeesTb.name+" = ? , "+EmployeesTb.city+" = ? , "+EmployeesTb.state+" = ? , "+EmployeesTb.country+" = ?, "+EmployeesTb.address_line1+" = ?, "+EmployeesTb.address_line2+" = ?, "+EmployeesTb.zip+" = ? , "+EmployeesTb.designation+" = ? , "+EmployeesTb.email+" = ? ,"+EmployeesTb.dob+"= ? ,"+EmployeesTb.age+"= ? ,"+EmployeesTb.sex+"= ? , "+EmployeesTb.phone+" = ? ,"+EmployeesTb.url+"=? ,"+EmployeesTb.updated_at+"= ? where "+EmployeesTb.id+" = ?";
				+ EmployeesTb.name + " = ? , " + EmployeesTb.desig + " = ? , "
				+ EmployeesTb.city + " = ? , " + EmployeesTb.state + " = ? ,"
				+ EmployeesTb.age + "=?, " + EmployeesTb.country + " = ?, "
				+ EmployeesTb.address_line1 + " = ?, "
				+ EmployeesTb.address_line2 + " = ?, " + EmployeesTb.zip
				+ " = ? ," + EmployeesTb.dob + "= ? ," + EmployeesTb.age
				+ "= ? ," + EmployeesTb.sex + "= ? , " + EmployeesTb.phone
				+ " = ?, " + EmployeesTb.email + " = ?, " + EmployeesTb.url
				+ " =?, " + EmployeesTb.thumb_url + " =? where "
				+ EmployeesTb.id + " = ?";
		System.out.println("SQL=" + SQL);
		jdbcTemplateObject.update(SQL, new Object[] {
				// employee.getUser_uid(),
				employee.getName(), employee.getDesig(), employee.getCity(),
				employee.getState(), employee.getAge(), employee.getCountry(),
				employee.getAddress_line1(), employee.getAddress_line2(),
				employee.getZip(), employee.getDob(), employee.getAge(),
				employee.getSex(), employee.getPhone(), employee.getEmail(),
				employee.getUrl(), employee.getThumb_url(), employee.getId() });
		return true;
	}

	public boolean updateEmployeeWithoutEmail(Employees employee) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		String SQL = "update "
				+ EmployeesTb.tableName
				+ " set "
				// +EmployeesTb.user_uid+" = ? , "
				// +EmployeesTb.name+" = ? , "+EmployeesTb.city+" = ? , "+EmployeesTb.state+" = ? , "+EmployeesTb.country+" = ?, "+EmployeesTb.address_line1+" = ?, "+EmployeesTb.address_line2+" = ?, "+EmployeesTb.zip+" = ? , "+EmployeesTb.designation+" = ? , "+EmployeesTb.email+" = ? ,"+EmployeesTb.dob+"= ? ,"+EmployeesTb.age+"= ? ,"+EmployeesTb.sex+"= ? , "+EmployeesTb.phone+" = ? ,"+EmployeesTb.url+"=? ,"+EmployeesTb.updated_at+"= ? where "+EmployeesTb.id+" = ?";
				+ EmployeesTb.name + " = ? , " + EmployeesTb.city + " = ? , "
				+ EmployeesTb.state + " = ? ," + EmployeesTb.age + "=?, "
				+ EmployeesTb.country + " = ?, " + EmployeesTb.address_line1
				+ " = ?, " + EmployeesTb.address_line2 + " = ?, "
				+ EmployeesTb.zip + " = ? ," + EmployeesTb.dob + "= ? ,"
				+ EmployeesTb.age + "= ? ," + EmployeesTb.sex + "= ? , "
				+ EmployeesTb.phone + " = ?, " + EmployeesTb.url + " =?, "
				+ EmployeesTb.thumb_url + " =? where " + EmployeesTb.id
				+ " = ?";
		System.out.println("SQL=" + SQL);
		jdbcTemplateObject.update(
				SQL,
				new Object[] {
						// employee.getUser_uid(),
						employee.getName(), employee.getCity(),
						employee.getState(), employee.getAge(),
						employee.getCountry(), employee.getAddress_line1(),
						employee.getAddress_line2(), employee.getZip(),
						employee.getDob(), employee.getAge(),
						employee.getSex(), employee.getPhone(),
						employee.getUrl(), employee.getThumb_url(),
						employee.getId() });
		return true;
	}

	public boolean createEmployee(Employees employee) {
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		System.out.println(dateFormat.format(date));

		String SQL = "insert into "
				+ EmployeesTb.tableName
				+ " ("
				// +EmployeesTb.user_uid+","
				+ EmployeesTb.name
				+ ", "
				+ EmployeesTb.desig
				+ ", "
				+ EmployeesTb.city
				+ ", "
				+ EmployeesTb.state
				+ ", "
				+ EmployeesTb.country
				+ ", "
				+ ""
				+ EmployeesTb.address_line1
				+ ", "
				+ EmployeesTb.address_line2
				+ ", "
				+ EmployeesTb.zip
				+ ", "
				// + EmployeesTb.designation
				// + ", "
				+ EmployeesTb.email
				+ ", "
				+ EmployeesTb.dob
				+ ", "
				+ EmployeesTb.age
				+ ", "
				+ EmployeesTb.sex
				+ ", "
				+ EmployeesTb.phone
				+ ", "
				+ EmployeesTb.url
				+ ", "
				+ EmployeesTb.thumb_url
				+ ", "
				+ EmployeesTb.created_at
				+ ", "
				+ EmployeesTb.updated_at
				+ ") values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		System.out.println("SQL=" + SQL + employee.getDesignation());
		jdbcTemplateObject.update(
				SQL,
				new Object[] {
						// employee.getUser_uid(),
						employee.getName(), employee.getDesig(),
						employee.getCity(), employee.getState(),
						employee.getCountry(), employee.getAddress_line1(),
						employee.getAddress_line2(), employee.getZip(),
						employee.getEmail(), employee.getDob(),
						employee.getAge(), employee.getSex(),
						employee.getPhone(), employee.getUrl(),
						employee.getThumb_url(), dateFormat.format(date),
						dateFormat.format(date) });

		return true;
	}

	public boolean delEmployee(int id) {
		String SQL = "delete from " + EmployeesTb.tableName + " where "
				+ EmployeesTb.id + " = ? AND "+superUserCont;
		System.out.println("SQL=" + SQL);
		jdbcTemplateObject.update(SQL, new Object[] { id });
		return true;
	}

	public List<Employees> getSearchEmployees(String searchKey, int start,
			int showRecsPerPage) {
		String likeQuery = EmployeesTb.name + " LIKE '%" + searchKey + "%' OR "
				+ EmployeesTb.email + " LIKE '%" + searchKey + "%'";
		System.out.println("Query=" + likeQuery);
		String SQL = "select *" + " from " + EmployeesTb.tableName + " where "
				+ likeQuery + " AND "+superUserCont+" LIMIT " + showRecsPerPage + " OFFSET " + start;
		System.out.println("SQL=" + SQL);
		List<Employees> empList = jdbcTemplateObject.query(SQL,
				new EmployeesMapper());
		System.out.println("emp=" + empList);
		return empList;
	}

	// public List<Employees> getSearchEmployees(String searchKey, int start,
	// int showRecsPerPage, int desigId) {
	// String likeQuery = EmployeesTb.name + " LIKE '%" + searchKey + "%' OR "
	// + EmployeesTb.email + " LIKE '%" + searchKey + "%'";
	// System.out.println("Query=" + likeQuery);
	// String SQL = "select *" + " from  where (" + likeQuery + ") AND "
	// + EmployeesTb.designation + "= ? LIMIT " + showRecsPerPage
	// + " OFFSET " + start;
	// System.out.println("SQL=" + SQL);
	// List<Employees> empList = jdbcTemplateObject.query(SQL,
	// new Object[] { desigId }, new EmployeesMapper());
	// System.out.println("emp=" + empList);
	// return empList;
	// }

	/*
	 * public List<Employees> getSearchEmployees(String searchKey,int start,int
	 * showRecsPerPage){ String
	 * likeQuery=EmployeesTb.name+" LIKE '%"+searchKey+"%' OR "
	 * +EmployeesTb.email+" LIKE '%"+searchKey+"%'";
	 * System.out.println("Query="+likeQuery); String SQL =
	 * "select * from "+EmployeesTb.tableName+
	 * " where "+likeQuery+" limit "+start+", "+showRecsPerPage;
	 * System.out.println("SQL="+SQL); List<Employees> empList =
	 * jdbcTemplateObject.query(SQL,new EmployeesMapper());
	 * System.out.println("emp="+empList); return empList; }
	 */

	// public List<Employees> getSearchNonUserEmployees(String searchKey,int
	// start,int showRecsPerPage, int userRoleId){
	// String cont = " Where "EmployeesTb.;
	// String
	// likeQuery=EmployeesTb.name+" LIKE '%"+searchKey+"%' OR "+EmployeesTb.email+" LIKE '%"+searchKey+"%'";
	// System.out.println("Query="+likeQuery);
	// String SQL = "select * from "+EmployeesTb.tableName+
	// " where "+likeQuery+" limit "+start+", "+showRecsPerPage;
	// System.out.println("SQL="+SQL);
	// List<Employees> empList = jdbcTemplateObject.query(SQL,new
	// EmployeesMapper());
	// System.out.println("emp="+empList);
	// return empList;
	// }

	/* Login */
	public int getEmployeeId(String username) {
		int employeeId = 0;
		String SQL1 = "select count(*) from " + EmployeesTb.tableName
				+ " where " + EmployeesTb.email + " = ?";
		int ret = jdbcTemplateObject.queryForObject(SQL1,
				new Object[] { username }, Integer.class);
		if (ret > 0) {
			String SQL = "select " + EmployeesTb.id + " from "
					+ EmployeesTb.tableName + " where " + EmployeesTb.email
					+ " = ?";
			System.out.println("SQL=" + SQL + username);
			employeeId = jdbcTemplateObject.queryForObject(SQL,
					new Object[] { username }, Integer.class);
		}
		return employeeId;
	}

	/* getAllDoctors */
	// public List<Employees> getAllDoctors(int start, int showRecsPerPage,
	// int desig) {
	// getNumRows();
	// String where = " where " + EmployeesTb.designation + " = " + desig;
	// String SQL = "select *" + " from " + where + " limit "
	// + showRecsPerPage + " OFFSET " + start;
	// // String SQL = "select * from "+EmployeesTb.tableName+ " limit "
	// // +showRecsPerPage +" OFFSET "+start;
	// System.out.println("SQL=" + SQL);
	// List<Employees> employeesList = jdbcTemplateObject.query(SQL,
	// new EmployeesMapper());
	// System.out.println("emp=" + employeesList);
	// return employeesList;
	// }

	// public List<Employees> getAllDoctors(String searchKey, int start,
	// int showRecsPerPage, int desig) {
	// String likeQuery = EmployeesTb.name + " LIKE '%" + searchKey + "%' OR "
	// + EmployeesTb.email + " LIKE '%" + searchKey + "%'";
	// String where = " where " + EmployeesTb.designation + " = " + desig;
	// String SQL = "select *" + " from " + where + " AND (" + likeQuery
	// + ") limit " + showRecsPerPage + " OFFSET " + start;
	// // String SQL = "select * from "+EmployeesTb.tableName+ " limit "
	// // +showRecsPerPage +" OFFSET "+start;
	// System.out.println("SQL=" + SQL);
	// List<Employees> employeesList = jdbcTemplateObject.query(SQL,
	// new EmployeesMapper());
	// System.out.println("emp=" + employeesList);
	// return employeesList;
	// }

	// public int getNumRows(int role) {
	// String where = " Where " + EmployeesTb.designation + " = " + role;
	// String SQL = "select count(*) from " + EmployeesTb.tableName + where;
	// System.out.println("SQL=" + SQL);
	// int rowCount = jdbcTemplateObject.queryForObject(SQL, Integer.class);
	// System.out.println("ROWS=" + rowCount);
	// return rowCount;
	// }

	// public int getNumRows(String searchKey, int role) {
	// String likeQuery = EmployeesTb.name + " LIKE '%" + searchKey + "%' OR "
	// + EmployeesTb.email + " LIKE '%" + searchKey + "%'";
	// String where = " Where " + EmployeesTb.designation + " = " + role;
	// String SQL = "select count(*) from " + EmployeesTb.tableName + where
	// + " AND (" + likeQuery + ")";
	// System.out.println("SQL=" + SQL);
	// int rowCount = jdbcTemplateObject.queryForObject(SQL, Integer.class);
	// System.out.println("ROWS=" + rowCount);
	// return rowCount;
	// }

	public Employees getEmployeeUsingUsrName(String username) {
		Employees emp = null;
		String SQL = "select * from " + EmployeesTb.tableName + " where "
				+ EmployeesTb.email + " = ?";
		System.out.println("SQL=" + SQL);
		List<Employees> employeesList = jdbcTemplateObject.query(SQL,
				new Object[] { username }, new EmployeesMapper());
		if (employeesList.size() > 0) {
			emp = employeesList.get(0);
		}

		return emp;
	}

}
