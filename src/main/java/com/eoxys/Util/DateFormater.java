package com.eoxys.Util;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class DateFormater {
 
 Date date;
 
 public DateFormater() {
  // TODO Auto-generated constructor stub
  date = new Date();
 }
 
 public DateFormater(Date date) {
  // TODO Auto-generated constructor stub
  this.date = date;
 }
 
 public DateFormater(long milSec) {
  // TODO Auto-generated constructor stub
  this.date = new Date(milSec);
  //System.out.println("dtae "+this.date);
 }

 public DateFormater(String dateStr,String format) {
  // TODO Auto-generated constructor stub
  try{
   SimpleDateFormat formater = new SimpleDateFormat(format);
   this.date = formater.parse(dateStr);
  }catch(Exception e){
   System.out.println("EX "+e);
  }
 }
 public String formatToString(String format,String timeZone){
	  String dateString="";
	  
			  
	  try{
		  System.out.println("format "+format);
		  System.out.println("lolo=="+date);
		  System.out.println("lo=="+timeZone);
	   SimpleDateFormat formater = new SimpleDateFormat(format);
	   TimeZone tz = TimeZone.getTimeZone(timeZone);
	   formater.setTimeZone(tz);
	   dateString=formater.format(this.date);
	   //System.out.println("dateStr123 "+dateString);
	  }catch(Exception e){
	   e.printStackTrace();
	  }
	  
	  return dateString;
	 }
 
 
 public Date parseFromString(){
  /*String dateString="";
  try{
   SimpleDateFormat formater = new SimpleDateFormat(format);
   dateString=formater.format(this.date);
  }catch(Exception e){
   e.printStackTrace();
  }
  */
  return this.date;
 }
 
 public String formatToString(String format){
  String dateString="";
 
  try{
	  //System.out.println("format "+format);
   SimpleDateFormat formater = new SimpleDateFormat(format);
   dateString=formater.format(this.date);
   
   //System.out.println("dateStr "+dateString);
  }catch(Exception e){
   e.printStackTrace();
  }
  
  return dateString;
 }
 public long StrToMilSec(String format){
  long milSec=0;
  try{
//   SimpleDateFormat formater = new SimpleDateFormat(format);
//   this.date=formater.parse(this.date);
   milSec = this.date.getTime();
  }catch(Exception e){
   e.printStackTrace();
  }
  
  return milSec;
 }
}