package com.eoxys.Services;

import java.util.UUID;

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
	
	public String incAndGetCUserUid()
	{
		String ret=atomicCounterDao.incAndGetCUserUid();
		return ret;
	}

	public String getUserUid(String role)
	{
		String id=incAndGetUserUid();
		//String digit = String.format("%04d", id);
		String ret=role+id;
		return ret;
	}
	public String getCUserUid(String role)
	{
		String id=incAndGetCUserUid();
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
	public String getAdvertiserUserUid()
	{
		String id=incAndGetUserUid();
		String ret="ADV"+id;
		System.out.println("User_uid="+ret);
		return ret;
	}
	public String getDBOUserUid()
	{
		String id=incAndGetUserUid();
		String ret="DBO"+id;
		System.out.println("User_uid="+ret);
		return ret;
	}
	public String getDIOUserUid()
	{
		String id=incAndGetUserUid();
		String ret="DIO"+id;
		return ret;
	}

}
