package com.eoxys.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.eoxys.Model.User_role;



@Repository
public class User_role_Dao {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	static final class UserRoleTb{
		static final String tableName = "tbl_user_role";

		//Table Column Names
		static final String id = "id";
		static final String user_role= "user_role";
		static final String user_value= "user_value";
	}
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}
	public class User_roleMapper implements RowMapper<User_role> {
		public User_role mapRow(ResultSet rs, int rowNum) throws SQLException {
			User_role desig = new User_role();
			System.out.println("DesigRole");
			desig.setId(rs.getInt(UserRoleTb.id));
			desig.setUser_role(rs.getString(UserRoleTb.user_role));
			desig.setUser_value(rs.getString(UserRoleTb.user_value));
			return desig;
		}
	}
	public List<User_role> Usr_RoleDrop()
	{
		String SQL="select * from "+UserRoleTb.tableName+"" ;
		List<User_role> desig=jdbcTemplateObject.query(SQL, new User_roleMapper());
		return desig;
	}
	public String getRoleById(int id){
		String SQL = "select "+UserRoleTb.user_value+" from "+UserRoleTb.tableName+" where "+UserRoleTb.id+" = ?";
		String value = jdbcTemplateObject.queryForObject(SQL, new Object[]{id}, String.class);
		return value;
	}
	
	public  int getUsr_role_Id(String desig) {
		System.out.println("getDesigId");
		String SQL = "select "+UserRoleTb.id+" from "+UserRoleTb.tableName+" where "+UserRoleTb.user_role+" = ?";
		System.out.println("SQL "+SQL);
		int id = jdbcTemplateObject.queryForObject(SQL, new Object[]{desig}, Integer.class);
		return id;
	}
}
