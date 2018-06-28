package com.eoxys.Util;

import java.util.List;



public class Common {
	/*Menu*/
	public static final String dashboard="dashboard";
	public static final String employees="employees";
	public static final String users="users";
	public static final String patients="patients";
	public static final String doctors="doctors";
	public static final String patientsRecord="patientsRecord";
	public static final String sms="sms";
	public static final String smsTrigger="smsTrigger";
	public static final String emgRecord="emergencyRecord";
	
	/*Images*/
	public static final int showRecsPerPage=2;
	public static final int showImagesPerPage=25;
//	public String splitMediaUrl(String tar){
////		String urlSplit[]=url.split("/");
//		AppUrl au = new AppUrl();
//		String orgUrl = au.getBaseUrl()+au.getMediaUrl();
//		System.out.println("orgUrl "+orgUrl+","+url.replace("",orgUrl));
//		return url.replace("",orgUrl);
//		
//	}
	public String getUrl(String url){
		//url Split
		String urlSplit[]=url.split("/");
		int urlLength=urlSplit.length;
		int ImgUrl=AppUrl.Img;
		String url1="";
		for(int i=ImgUrl;i>0;i--){
			url1+="/"+url.split("/")[urlLength-i];
		}
		return url1;
	}
	public String getThumbUrl(String thumbUrl){
		//thumbSplit
				String thumbUrlSplit[]=thumbUrl.split("/");
				int thumbUrlLength=thumbUrlSplit.length;
				int thumbImgUrl=AppUrl.thumbImg;
				String thumbUrl1="";
				for(int i=thumbImgUrl;i>0;i--){
					thumbUrl1+="/"+thumbUrl.split("/")[thumbUrlLength-i];
				}
				return thumbUrl1;
	}
	
	public int[] calcPageRange(int page,int totrecs){
		int[] ret=new int[3];
		int start=0,end=0,recsPerPage=0;
		System.out.println(recsPerPage);
		int plus1=(totrecs%showRecsPerPage)==0 ? 0 : 1;
		int totpages = totrecs / showRecsPerPage + plus1;
		if(page !=1 && page>totpages){
			page=page-1;
		}
		start = showRecsPerPage*(page-1);
		if(totrecs<showRecsPerPage){
			end=start+totrecs;
			recsPerPage=totrecs;
		}else{
			if(page<totpages){
				end=start+showRecsPerPage;
				recsPerPage=showRecsPerPage;
			}else{
				end=totrecs;
				recsPerPage=end-start;
			}
		}	
		ret[0]=start;
		ret[1]=end;
		ret[2]=totpages;
		System.out.println("totpages="+totpages+"start="+ret[0]);
		return ret;

	}
	/*Page Navigation function*/
	public int[] calcImagePageRange(int page,int totrecs){
		int[] ret=new int[3];
		int start=0,end=0,recsPerPage=0;
		System.out.println(recsPerPage);
		int plus1=(totrecs%showImagesPerPage)==0 ? 0 : 1;
		int totpages = totrecs / showImagesPerPage + plus1;
		start = showImagesPerPage*(page-1);
		if(totrecs<showImagesPerPage){
			end=start+totrecs;
			recsPerPage=totrecs;
		}else{
			if(page<totpages){
				end=start+showImagesPerPage;
				recsPerPage=showImagesPerPage;
			}else{
				end=totrecs;
				recsPerPage=end-start;
			}
		}	
		ret[0]=start;
		ret[1]=end;
		ret[2]=totpages;
		System.out.println("totpages="+totpages+"start="+ret[0]);
		return ret;

	}

}
