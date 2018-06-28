package com.eoxys.Util;


public class AppUrl {
	public static final int Img=3;
	public static final int thumbImg=4;
	public String baseUrl="";
	public String mediaUrl="";
	private String excelOutputDir ="";
	private String excelOutputFile ="";
	private String excelsource ="";
	public String getExcelOutputDir() {
		return excelOutputDir;
	}
	public void setExcelOutputDir(String excelOutputDir) {
		this.excelOutputDir = excelOutputDir;
	}
	public String getExcelOutputFile() {
		return excelOutputFile;
	}
	public void setExcelOutputFile(String excelOutputFile) {
		this.excelOutputFile = excelOutputFile;
	}
	public String backgroudImgUrl="";
	
	public String getBaseUrl() {
		return baseUrl;
	}
	public void setBaseUrl(String baseUrl) {
		this.baseUrl = baseUrl;
	}
	public String getMediaUrl() {
		return mediaUrl;
	}
	public void setMediaUrl(String mediaUrl) {
		this.mediaUrl = mediaUrl;
	}
	public String getBackgroudImgUrl() {
		return backgroudImgUrl;
	}
	public void setBackgroudImgUrl(String backgroudImgUrl) {
		this.backgroudImgUrl = backgroudImgUrl;
	}
	
	public String getExcelsource() {
		return excelsource;
	}
	public void setExcelsource(String excelsource) {
		this.excelsource = excelsource;
	}
	
}
