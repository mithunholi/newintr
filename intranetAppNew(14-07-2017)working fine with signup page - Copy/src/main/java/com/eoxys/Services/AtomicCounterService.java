package com.eoxys.Services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.eoxys.Dao.AtomicCounterDao;

@Repository
public class AtomicCounterService {
	@Autowired
	AtomicCounterDao atomicCounterDao;
	
	public String incAndGetUserUid()
	{
		String ret=atomicCounterDao.incAndGetUserUid();
		return ret;
	}
	public String getUserUid(String role)
	{
		String id=incAndGetUserUid();
		//String digit = String.format("%04d", id);
		String ret=role+id;
		return ret;
	}
	public String getAdminUserUid()
	{
		String id=incAndGetUserUid();
		//String digit = String.format("%04d", id);
		String ret="ADM"+id;
		return ret;
	}
	
	public String getUserUid()
	{
		String id=incAndGetUserUid();
		//String digit = String.format("%04d", id);
		String ret="HR"+id;
		return ret;
	}
	

}
