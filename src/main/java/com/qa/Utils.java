package com.qa;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;

public class Utils {

	public static String hashPassword(String password) {
		String hashString = null;
		try {
			byte[] salt = "KUZTDGHV6GSHYJUI".getBytes();
			KeySpec spec = new PBEKeySpec("password".toCharArray(), salt, 65536, 128);
			SecretKeyFactory f;
			f = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA1");
			byte[] hash = f.generateSecret(spec).getEncoded();
			Base64.Encoder enc = Base64.getEncoder();
			hashString = enc.encodeToString(hash);
//			System.out.printf("salt: %s%n", enc.encodeToString(salt));
//			System.out.printf("hash: %s%n", enc.encodeToString(hash));
		} catch (NoSuchAlgorithmException | InvalidKeySpecException e) {
			e.printStackTrace();
		}
		return hashString;
	}
}
