package com.eoxys.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.eoxys.Model.BOUserRole;

@Repository
public class BOUserRoleDao {
	// DateFormat dateFormat = new SimpleDateFormat("yyyyMM");
	Date date = new Date();
	@SuppressWarnings("unused")
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	// SQL Table Details
	// ---------Table
	static final class UserRoleTb {
		static final String tableName = "back_office_user_role";

		// Table Column Names
		static final String id = "id";
		static final String role_uid = "role_uid";
		static final String role_value = "role_value";
	}

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public class UserRoleMapper implements RowMapper<BOUserRole> {
		public BOUserRole mapRow(ResultSet rs, int rowNum) throws SQLException {
			BOUserRole userRole = new BOUserRole();
			System.out.println("UserRole");
			userRole.setId(rs.getInt(UserRoleTb.id));
			userRole.setRole_uid(rs.getString(UserRoleTb.role_uid));
			userRole.setRole_value(rs.getString(UserRoleTb.role_value));
			return userRole;
		}
	}

	public String getRoleUIdById(int role) {
		String SQL = "select * from " + UserRoleTb.tableName + " where "
				+ UserRoleTb.id + " = ? ";
		List<BOUserRole> userRole = jdbcTemplateObject.query(SQL,
				new Object[] { role }, new UserRoleMapper());
		BOUserRole user = userRole.get(0);
		String ret = user.getRole_uid();
		return ret;

	}

	public int getRoleId(String role) {
		String SQL = "select * from " + UserRoleTb.tableName + " where "
				+ UserRoleTb.role_uid + " = ? ";
		List<BOUserRole> userRole = jdbcTemplateObject.query(SQL,
				new Object[] { role }, new UserRoleMapper());
		BOUserRole user = userRole.get(0);
		int ret = user.getId();
		return ret;

	}

	public List<BOUserRole> roleListHtmlDropdown() {
		System.out.println("roleListHtmlDropdown DAO");
		String SQL = "select * from " + UserRoleTb.tableName;
		System.out.println("SQL " + SQL);
		List<BOUserRole> roleList = new ArrayList<BOUserRole>();
		roleList = jdbcTemplateObject.query(SQL, new UserRoleMapper());
		return roleList;
	}

	public boolean createRole(BOUserRole role) {
		String SQL = "INSERT INTO " + UserRoleTb.tableName + "("
				+ UserRoleTb.role_uid + "," + UserRoleTb.role_value
				+ ") VALUES(?,?)";
		System.out.println("CReate Role SQL " + SQL);
		int userRole = jdbcTemplateObject.update(SQL,
				new Object[] { role.getRole_uid(), role.getRole_value() });
		System.out.println("ret " + userRole);
		return true;

	}

	public boolean updateRole(BOUserRole role) {
		String SQL = "UPDATE " + UserRoleTb.tableName + " SET "
				+ UserRoleTb.role_uid + " = ?," + UserRoleTb.role_value
				+ " = ?" + " WHERE " + UserRoleTb.id + " = ?";
		System.out.println("Update Role SQL " + SQL);
		int userRole = jdbcTemplateObject.update(
				SQL,
				new Object[] { role.getRole_uid(), role.getRole_value(),
						role.getId() });
		System.out.println("ret " + userRole);
		return true;

	}

	public boolean deleteRole(int roleId) {
		String SQL = "DELETE FROM " + UserRoleTb.tableName + " WHERE "
				+ UserRoleTb.id + " = ?";
		System.out.println("Delete Role SQL " + SQL);
		int userRole = jdbcTemplateObject.update(SQL, new Object[] { roleId });
		System.out.println("ret " + userRole);
		return true;

	}

	public BOUserRole getRoleById(int role) {
		String SQL = "select * from " + UserRoleTb.tableName + " where "
				+ UserRoleTb.id + " = ? ";
		System.out.println("SQL " + SQL);
		List<BOUserRole> userRole = jdbcTemplateObject.query(SQL,
				new Object[] { role }, new UserRoleMapper());
		BOUserRole roleObj = new BOUserRole();
		System.out.println("Role = " + userRole);
		if (userRole.size() > 0) {
			System.out.println("userrole[0] " + userRole.get(0));
			roleObj = userRole.get(0);
		}

		System.out.println("roleObj " + roleObj);
		return roleObj;

	}
}
