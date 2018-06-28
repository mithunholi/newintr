package com.eoxys.Util;

public class Time {
  public static String getTimeViaCount(String numOfRec){
	  int recCount = Integer.parseInt(numOfRec);
	  int sec = 0, min = 0, hours = 0, modMin = 0;
	  if(recCount != 0){
		sec = (recCount) * 10;
	  }
		if (sec >= 60) {
			/* min = sec / 60;
			hours = min / 60;
			modMin = sec % 60; */
			min = (sec % 3600) / 60;
			hours = sec / 3600;
			modMin = sec % 60;
		} else {
			modMin = sec;
		}
		System.out.println("sec,min,hours,modMin " + sec + ","
				+ min + "," + hours + "," + modMin);

		//									patRec1.size();
		String time = "";
		if (hours < 10) {
			time += "0" + hours;
		} else {
			time += "" + hours;
		}
		if (min < 10) {
			time += ":0" + min;
		} else {
			time += ":" + min;
		}
		if (modMin < 10) {
			time += ":0" + modMin;
		} else {
			time += ":" + modMin;
		}
	return time;
	  
  }
    
}