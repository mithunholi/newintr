package com.eoxys.Services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.BOUserRoleDao;
import com.eoxys.Model.BOUserRole;

@Repository
public class BOUserRoleService {
	@Autowired
	BOUserRoleDao roleDao;
	
	public String getRoleUIdById(int role)
	{
		String ret=roleDao.getRoleUIdById(role);
		return ret;
	}
	public int getRoleId(String role)
	{
		int ret=roleDao.getRoleId(role);
		return ret;
	}
	public List<BOUserRole> roleListHtmlDropdown()
	{
		System.out.println("roleListHtmlDropdown Ser v");
		List<BOUserRole> roleList = roleDao.roleListHtmlDropdown();
		return roleList;
	}
	
	
	
	public boolean deleteRole(int role)
	{
		boolean ret=roleDao.deleteRole(role);
		return ret;
	}
	public boolean updateRole(BOUserRole role)
	{
		boolean ret=roleDao.updateRole(role);
		return ret;
	}
	public boolean createRole(BOUserRole role)
	{
		boolean ret=roleDao.createRole(role);
		return ret;
	}
	public BOUserRole getRoleById(int role)
	{
		BOUserRole ret=roleDao.getRoleById(role);
		return ret;
	}
}
