package com.eoxys.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.EmployeesDao;
import com.eoxys.Model.Employees;

@Repository
public class EmployeesService {
	@Autowired
	EmployeesDao employeesDao;
	
	 public boolean createEmployee(Employees employee){
		 boolean ret=false;
		 ret = employeesDao.createEmployee(employee);
		 return ret;
	 }
	
	 /*public int getNumNonUserEmployees(){
		 int totrecs = employeesDao.getNumNonUserEmployees();
		 return totrecs;
	 }
	 public int getNumNonUserEmployees(String searchKey){
		 int totrecs = employeesDao.getNumNonUserEmployees(searchKey);
		 return totrecs;
	 }
	public List<Employees> getNonUserEmployees(int start,int showRecsPerPage){
		 List<Employees> employeesList = employeesDao.getNonUserEmployees(start, showRecsPerPage);
		 return employeesList;
	 }*/
	/*public List<Employees> getNonUserEmployees(String searchKey,int start,int showRecsPerPage){
		 List<Employees> employeesList = employeesDao.getNonUserEmployees(searchKey,start,showRecsPerPage);
		 return employeesList;
	 }*/
	/*public List<Employees> getAllEmployees(){
		 List<Employees> employeesList = employeesDao.getAllEmployees();
		 return employeesList;
	 }
	 public List<Employees> getAllEmployees(int start,int showRecsPerPage){
		 List<Employees> employeesList = employeesDao.getAllEmployees(start, showRecsPerPage);
		 return employeesList;
	 }
	 public List<Employees> getAllEmployees(int start,int showRecsPerPage,int desigId){
		 List<Employees> employeesList = employeesDao.getAllEmployees(start, showRecsPerPage,desigId);
		 return employeesList;
	 }*/
	 	 
	/* public Employees getEmployee(int id){
		 Employees employee = employeesDao.getEmployee(id);
		return employee;
	 }*/
	/* public boolean updateEmployee(Employees employee){
		 boolean ret=false;
		 ret=employeesDao.isAvailable(employee.getId());
	     if(ret){
	    	 employeesDao.updateEmployee(employee);
	     }
	     return ret;
	 }*/
	 /*public boolean updateEmployeeWithoutEmail(Employees employee){
		 boolean ret=false;
		 ret=employeesDao.isAvailable(employee.getId());
	     if(ret){
	    	 employeesDao.updateEmployeeWithoutEmail(employee);
	     }
	     return ret;
	 }*/
	
	 
	/* public boolean delEmployee(int id){
		 boolean ret=false;
		 ret=employeesDao.isAvailable(id);
		 if(ret){
			 employeesDao.delEmployee(id);
		 }
	        return ret;
	 }
	 public int getNumRows(){
		 int totrecs = employeesDao.getNumRows();
		 return totrecs;
	 }*/
	 
	
	
	/* public int getNumRows(String searchKey){
		 int totrecs = employeesDao.getNumRows(searchKey);
		 return totrecs;
	 }*/
	 
	
	 
	
	
}
