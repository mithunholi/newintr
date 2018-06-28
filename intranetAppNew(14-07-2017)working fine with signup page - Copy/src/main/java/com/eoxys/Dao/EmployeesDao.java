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




import com.eoxys.Dao.UsersDao.UsersMapper;
import com.eoxys.Dao.UsersDao.UsersTb;
import com.eoxys.Model.Employees;


@Repository
public class EmployeesDao {
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;
	//SQL Table Details
	//---------Table
	static final class EmployeesTb{
		static final String tableName = "tbl_employee";

		//Table Column Names
		static final String id = "id";
		static final String tbl_user_id= "tbl_user_id";

		static final String first_name ="first_name";
		static final String last_name ="last_name";
		static final String middle_name ="middle_name";
		static final String dob="dob";
		static final String doj="doj";
		static final String employeeid_number="employeeid_number";
		static final String permanent_address="permanent_address";
		static final String local_address="local_address";
		static final String blood_group="blood_group";
		static final String email_id="email_id";
		static final String skype_mail="skype_mail";
		static final String eoxys_mail="eoxys_mail";
		static final String phone_number="phone_number";
		static final String passport_number="passport_number";
		static final String pancard_number="pancard_number";
		static final String education_qualification="education_qualification";
		static final String created_at="created_at";
		static final String updated_at="updated_at";


		//    static final String designationValue = "desig_value";
	}



	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public class EmployeesMapper implements RowMapper<Employees> {
		public Employees mapRow(ResultSet rs, int rowNum) throws SQLException {
			Employees employees = new Employees();
			System.out.println("employeesMapper");
			employees.setId(rs.getInt(EmployeesTb.id));
			employees.setTbl_user_id(rs.getString(EmployeesTb.tbl_user_id));
			employees.setFirst_name(rs.getString(EmployeesTb.first_name));
			employees.setLast_name(rs.getString(EmployeesTb.last_name));
			employees.setMiddle_name(rs.getString(EmployeesTb.middle_name));
			employees.setDob(rs.getTimestamp(EmployeesTb.dob));
			employees.setDoj(rs.getTimestamp(EmployeesTb.doj));
			employees.setEmployeeid_number(rs.getString(EmployeesTb.employeeid_number));
			employees.setPermanent_address(rs.getString(EmployeesTb.permanent_address));
			employees.setLocal_address(rs.getString(EmployeesTb.local_address));
			employees.setBlood_group(rs.getString(EmployeesTb.blood_group));
			employees.setEmail_id(rs.getString(EmployeesTb.email_id));
			employees.setSkype_mail(rs.getString(EmployeesTb.skype_mail));
			employees.setEoxys_mail(rs.getString(EmployeesTb.eoxys_mail));
			employees.setPhone_number(rs.getString(EmployeesTb.phone_number));
			employees.setPassport_number(rs.getString(EmployeesTb.passport_number));
			employees.setPancard_number(rs.getString(EmployeesTb.pancard_number));
			employees.setEducation_qualification(rs.getString(EmployeesTb.education_qualification));

			employees.setCreated_at(rs.getTimestamp(EmployeesTb.created_at));
			employees.setUpdated_at(rs.getTimestamp(EmployeesTb.updated_at));
			System.out.print("MNBBNNB");

			return employees;
		}
	}
	/*public int getNumRows(){
            String SQL = "select count(*) from "+EmployeesTb.tableName;
            System.out.println("SQL="+SQL);
            int rowCount = jdbcTemplateObject.queryForObject(SQL,Integer.class);
            System.out.println("ROWS="+rowCount);
            return rowCount;
    	}
    	public int getNumRows(String searchKey){
    		String likeQuery=EmployeesTb.name+" LIKE '%"+searchKey+"%' OR "+EmployeesTb.email+" LIKE '%"+searchKey+"%'";
        	System.out.println("Query="+likeQuery); 
            String SQL = "select count(*) from "+EmployeesTb.tableName+ " where "+likeQuery; 
            System.out.println("SQL="+SQL);
            int rowCount = jdbcTemplateObject.queryForObject(SQL,Integer.class);
            System.out.println("ROWS="+rowCount);
            return rowCount;
    	}
	 */


	/*public boolean isAvailable(int recid){
            String SQL = "select count(*) from "+EmployeesTb.tableName+
                         " where "+EmployeesTb.id+" = ?";
            System.out.println("SQL="+SQL);

            if(jdbcTemplateObject==null){
                System.out.println("NULL JDBC");
                this.jdbcTemplateObject = new JdbcTemplate(dataSource);
            }
            int rowCount = jdbcTemplateObject.queryForObject(SQL,new Object[]{recid},Integer.class);
            boolean ret = rowCount>0 ? true : false;
            	return ret;
    	}*/
	/*public boolean updateEmployee(Employees employee){
    		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    		Date date = new Date();
            String SQL = "update "+EmployeesTb.tableName+ " set "
//    		+EmployeesTb.user_uid+" = ? , "
//             +EmployeesTb.name+" = ? , "+EmployeesTb.city+" = ? , "+EmployeesTb.state+" = ? , "+EmployeesTb.country+" = ?, "+EmployeesTb.address_line1+" = ?, "+EmployeesTb.address_line2+" = ?, "+EmployeesTb.zip+" = ? , "+EmployeesTb.designation+" = ? , "+EmployeesTb.email+" = ? ,"+EmployeesTb.dob+"= ? ,"+EmployeesTb.age+"= ? ,"+EmployeesTb.sex+"= ? , "+EmployeesTb.phone+" = ? ,"+EmployeesTb.url+"=? ,"+EmployeesTb.updated_at+"= ? where "+EmployeesTb.id+" = ?";
            		+EmployeesTb.name+" = ? , "+EmployeesTb.city+" = ? , "+EmployeesTb.state+" = ? ,"+EmployeesTb.age+"=?, "+EmployeesTb.country+" = ?, "+EmployeesTb.address_line1+" = ?, "+EmployeesTb.address_line2+" = ?, "+EmployeesTb.zip+" = ? ,"+EmployeesTb.dob+"= ? ,"+EmployeesTb.gender+"= ? , "+EmployeesTb.email+" = ?, "+EmployeesTb.url+" =?,  where "+EmployeesTb.id+" = ?";
            		System.out.println("SQL="+SQL);
            jdbcTemplateObject.update(SQL, new Object[]{
//            		employee.getUser_uid(),
            		employee.getName(),employee.getCity(),employee.getState(),employee.getAge(),employee.getCountry(),employee.getAddress_line1(),employee.getAddress_line2(),employee.getZip(),employee.getDob(),employee.getGender(),employee.getEmail(),employee.getUrl(),employee.getId()});
            return true;
        }*/
	/*public boolean updateEmployeeWithoutEmail(Employees employee){
    		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    		Date date = new Date();
            String SQL = "update "+EmployeesTb.tableName+ " set "
//    		+EmployeesTb.user_uid+" = ? , "
//             +EmployeesTb.name+" = ? , "+EmployeesTb.city+" = ? , "+EmployeesTb.state+" = ? , "+EmployeesTb.country+" = ?, "+EmployeesTb.address_line1+" = ?, "+EmployeesTb.address_line2+" = ?, "+EmployeesTb.zip+" = ? , "+EmployeesTb.designation+" = ? , "+EmployeesTb.email+" = ? ,"+EmployeesTb.dob+"= ? ,"+EmployeesTb.age+"= ? ,"+EmployeesTb.sex+"= ? , "+EmployeesTb.phone+" = ? ,"+EmployeesTb.url+"=? ,"+EmployeesTb.updated_at+"= ? where "+EmployeesTb.id+" = ?";
            		+EmployeesTb.name+" = ? , "+EmployeesTb.city+" = ? , "+EmployeesTb.state+" = ? ,"+EmployeesTb.age+"=?, "+EmployeesTb.country+" = ?, "+EmployeesTb.address_line1+" = ?, "+EmployeesTb.address_line2+" = ?, "+EmployeesTb.zip+" = ? ,"+EmployeesTb.dob+"= ? ,"+EmployeesTb.age+"= ? ,"+EmployeesTb.gender+"= ? , "+EmployeesTb.url+" =? where "+EmployeesTb.id+" = ?";
            		System.out.println("SQL="+SQL);
            jdbcTemplateObject.update(SQL, new Object[]{
//            		employee.getUser_uid(),
            		employee.getName(),employee.getCity(),employee.getState(),employee.getAge(),employee.getCountry(),employee.getAddress_line1(),employee.getAddress_line2(),employee.getZip(),employee.getDob(),employee.getAge(),employee.getGender(),employee.getUrl(),employee.getId()});
            return true;
        }*/
	public boolean createEmployee(Employees employee){
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		Date date = new Date();
		System.out.println(dateFormat.format(date));
		System.out.println("Firstname:"+employee.getFirst_name());
		System.out.println("LastName:"+employee.getLast_name());
		System.out.println("Middle:"+employee.getMiddle_name());
		System.out.println("Dob:"+employee.getDob());
		System.out.println("Doj:"+employee.getDoj());
		System.out.println("Employeeid_number:"+employee.getEmployeeid_number());
		System.out.println("Blood_group:"+employee.getBlood_group());
		System.out.println("Email_id:"+employee.getEmail_id());
		System.out.println("Eoxysmail:"+employee.getEoxys_mail());
		System.out.println("Skypemail:"+employee.getSkype_mail());
		System.out.println("Parmanentaddress:"+employee.getPermanent_address());
		System.out.println("Localaddress:"+employee.getLocal_address());
		System.out.println("Pancardnumber:"+employee.getPancard_number());
		System.out.println("passportnumber:"+employee.getPassport_number());
		System.out.println("Phonenumber:"+employee.getPhone_number());
		System.out.println("EducationQualification:"+employee.getEducation_qualification());
		
		
		String SQL = " insert into "+EmployeesTb.tableName+
				" ("
				+EmployeesTb.tbl_user_id+","+EmployeesTb.first_name+", "+EmployeesTb.last_name+", "+EmployeesTb.middle_name+", "+EmployeesTb.dob+", "+EmployeesTb.doj+","+EmployeesTb.employeeid_number
				+ ","+EmployeesTb.permanent_address+", "+EmployeesTb.local_address+", "+EmployeesTb.blood_group+", "+EmployeesTb.email_id+", "+EmployeesTb.skype_mail+", "+EmployeesTb.eoxys_mail+", "+EmployeesTb.phone_number
				+", "+EmployeesTb.passport_number+", "+EmployeesTb.pancard_number+","+EmployeesTb.education_qualification+","+EmployeesTb.created_at+", "+EmployeesTb.updated_at+") values ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		jdbcTemplateObject.update(SQL, new Object[]{
				employee.getTbl_user_id(),employee.getFirst_name(),employee.getLast_name(),employee.getMiddle_name(),employee.getDob(),employee.getDoj(),employee.getEmployeeid_number(),
				employee.getPermanent_address(),employee.getLocal_address(),employee.getBlood_group(),employee.getEmail_id(),employee.getSkype_mail(),employee.getEoxys_mail(),employee.getPhone_number(),
				employee.getPassport_number(),employee.getPancard_number(),employee.getEducation_qualification(),dateFormat.format(date),dateFormat.format(date)});
		System.out.println("sql============"+SQL);
		return true;
	}
	public boolean delEmployee(int id){
		String SQL = "delete from "+EmployeesTb.tableName+
				" where "+EmployeesTb.id+" = ?";
		System.out.println("SQL="+SQL);
		jdbcTemplateObject.update(SQL, new Object[]{id});
		return true;
	}


	/* Login */
	public int getEmployeeId(String username){
		int employeeId=0;
		String SQL1 = "select count(*) from "+EmployeesTb.tableName+
				" where "+EmployeesTb.email_id+" = ?";
		int ret=jdbcTemplateObject.queryForObject(SQL1, new Object[]{username}, Integer.class);
		if(ret>0)
		{
			String SQL = "select "+EmployeesTb.id+" from "+EmployeesTb.tableName+
					" where "+EmployeesTb.email_id+" = ?";  
			System.out.println("SQL="+SQL +username);	
			employeeId = jdbcTemplateObject.queryForObject(SQL, new Object[]{username},Integer.class);
		}
		return employeeId;
	}


	/*public int getNumRows(int role){
    		String where = " Where "+EmployeesTb.designation+" = "+role; 
            String SQL = "select count(*) from "+EmployeesTb.tableName + where;
            System.out.println("SQL="+SQL);
            int rowCount = jdbcTemplateObject.queryForObject(SQL,Integer.class);
            System.out.println("ROWS="+rowCount);
            return rowCount;
    	}*/
	/*public int getNumRows(String searchKey,int role){
    		String likeQuery=EmployeesTb.name+" LIKE '%"+searchKey+"%' OR "+EmployeesTb.email+" LIKE '%"+searchKey+"%'";
    		String where = " Where "+EmployeesTb.designation+" = "+role; 
            String SQL = "select count(*) from "+EmployeesTb.tableName + where+" AND ("+likeQuery+")";
            System.out.println("SQL="+SQL);
            int rowCount = jdbcTemplateObject.queryForObject(SQL,Integer.class);
            System.out.println("ROWS="+rowCount);
            return rowCount;
    	}*/


}
