package com.eoxys.Util;


import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

import java.math.BigInteger;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

@SuppressWarnings("restriction")
public class EncDecPassword {
	
	public static String encBase64(String str){
		byte[]   bytesEncoded = Base64.encodeBase64(str .getBytes());
		System.out.println("ecncoded value is " + new String(bytesEncoded ));
		return new String(bytesEncoded );
	}
	public static String decBase64(String str){
		byte[]   bytesEncoded = Base64.decodeBase64(str .getBytes());
		System.out.println("ecncoded value is " + new String(bytesEncoded ));
		return new String(bytesEncoded );
	}

	 public static String encPassword(String unecryptedPassword) {
	        String salt = "LongStringForExtraSecurity@#$!%^&*(*)1234567890";
	        System.out.println("Unencrypted Password: " + unecryptedPassword);
	         
	        MessageDigest messageDigest=null;
	        try {
	            messageDigest = MessageDigest.getInstance("SHA");
	            messageDigest.update((unecryptedPassword+salt).getBytes());
	        } catch (NoSuchAlgorithmException e) {
	            e.printStackTrace();
	        }
	        String encryptedPassword = (new BigInteger(messageDigest.digest())).toString(16);
	        System.out.println("Encrypted Password: " + encryptedPassword);
	        return encryptedPassword;
	    }
}
