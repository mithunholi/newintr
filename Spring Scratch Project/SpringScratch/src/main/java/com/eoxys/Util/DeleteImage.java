package com.eoxys.Util;

import java.io.File;

public class DeleteImage {
	public void deleteImage(String url,String thumbUrl){
		try{

			File fileUrl = new File(url);
			File fileThumb=new File(thumbUrl);

			if(fileUrl.delete() && fileThumb.delete()){
				System.out.println(fileUrl.getName() + " is deleted And "+fileThumb.getName() + " is deleted!");
			}else{
				System.out.println("Delete operation is failed.");
			}

		}catch(Exception e){

			e.printStackTrace();

		}

	}

}
