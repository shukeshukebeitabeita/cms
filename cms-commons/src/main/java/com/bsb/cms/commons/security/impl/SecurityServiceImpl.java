package com.bsb.cms.commons.security.impl;

import java.io.UnsupportedEncodingException;
import java.security.InvalidKeyException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.annotation.Resource;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.KeyGenerator;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Service;

import com.bsb.cms.commons.exceptions.BaseRuntimeException;
import com.bsb.cms.commons.security.SecurityService;

@Service("securityService")
public class SecurityServiceImpl implements SecurityService {

	private static final Log log = LogFactory.getLog(SecurityServiceImpl.class);

	private static final String algname = "SHA-1";

	private static final String ALGORITHM_OPTIONS = "DES/ECB/PKCS5Padding";

	private static final String ALGORITHM_KEY_DES = "DES";

	private static final String ALGORITHM_ENCODING = "UTF-8";

	private static final int keyleng = 56;

	// des 内置key ,从配置文件读取
	@Resource(name = "desKey")
	private String desKey;

	/**
	 * 生成密钥
	 * 
	 * @throws NoSuchAlgorithmException
	 */

	public byte[] genKey() throws NoSuchAlgorithmException {

		KeyGenerator kg = KeyGenerator.getInstance(ALGORITHM_KEY_DES);
		kg.init(keyleng);
		SecretKey key = kg.generateKey();
		byte[] encodedKey = key.getEncoded();
		return encodedKey;
	}

	public byte[] decryptDES(byte[] encData) throws BaseRuntimeException {
		if (this.desKey == null) {
			log.error("desKey is null");
			throw new BaseRuntimeException("desKey is null");
		}

		try {
			byte[] key = Base64.decodeBase64(this.desKey.getBytes(ALGORITHM_ENCODING));
			return this.decryptDES(encData, key);
		} catch (UnsupportedEncodingException e) {

			log.error(e);
			throw new BaseRuntimeException("解密失败", e);
		}

	}

	public byte[] decryptDES(byte[] encData, byte[] key) throws BaseRuntimeException {

		Cipher cipher;
		try {
			// 用密钥加密明文(plainText),生成密文(cipherText)
			cipher = Cipher.getInstance(ALGORITHM_OPTIONS);
			SecretKeySpec skey = new SecretKeySpec(key, ALGORITHM_KEY_DES);
			cipher.init(Cipher.DECRYPT_MODE, skey); // 操作模式为加密(Cipher.ENCRYPT_MODE),key为密钥
			return cipher.doFinal(encData);
		} catch (NoSuchAlgorithmException e) {

			log.error(e);
			throw new BaseRuntimeException("解密失败", e);
		} catch (NoSuchPaddingException e) {

			log.error(e);
			throw new BaseRuntimeException("解密失败", e);
		} catch (IllegalBlockSizeException e) {
			log.error(e);
			throw new BaseRuntimeException("解密失败", e);
		} catch (BadPaddingException e) {
			log.error(e);
			throw new BaseRuntimeException("解密失败", e);
		} catch (InvalidKeyException e) {
			log.error(e);
			throw new BaseRuntimeException("解密失败", e);
		}

	}

	public byte[] encryptDES(byte[] clearData) throws BaseRuntimeException {
		if (this.desKey == null) {
			log.error("desKey is null");
			throw new BaseRuntimeException("desKey is null");
		}
		byte[] key;
		try {
			key = Base64.decodeBase64(this.desKey.getBytes(ALGORITHM_ENCODING));
			return encryptDES(clearData, key);
		} catch (UnsupportedEncodingException e) {

			log.error(e);
			throw new BaseRuntimeException("加密失败", e);
		}

	}

	public byte[] encryptDES(byte[] clearData, byte[] key) throws BaseRuntimeException {
		Cipher cipher;
		try {
			cipher = Cipher.getInstance(ALGORITHM_OPTIONS);
			// 用密钥加密明文(plainText),生成密文(cipherText)
			SecretKeySpec skey = new SecretKeySpec(key, ALGORITHM_KEY_DES);
			cipher.init(Cipher.ENCRYPT_MODE, skey); // 操作模式为加密(Cipher.ENCRYPT_MODE),key为密钥
			return cipher.doFinal(clearData); // 得到加密后的字节数组

		} catch (NoSuchAlgorithmException e) {
			log.error(e);
			throw new BaseRuntimeException("加密失败", e);
		} catch (NoSuchPaddingException e) {
			log.error(e);
			throw new BaseRuntimeException("加密失败", e);
		} catch (InvalidKeyException e) {
			log.error(e);
			throw new BaseRuntimeException("加密失败", e);
		} catch (IllegalBlockSizeException e) {
			log.error(e);
			throw new BaseRuntimeException("加密失败", e);
		} catch (BadPaddingException e) {
			log.error(e);
			throw new BaseRuntimeException("加密失败", e);
		}

	}

	public String encPassword(String password) throws BaseRuntimeException {
		MessageDigest md;
		try {
			if (password != null) {
				md = MessageDigest.getInstance(algname);
				return new String(Base64.encodeBase64(md.digest(password.getBytes(ALGORITHM_ENCODING))),
						ALGORITHM_ENCODING);
			} else {
				return null;
			}
		} catch (NoSuchAlgorithmException e) {
			log.error(e);
			throw new BaseRuntimeException("密码加密失败", e);
		} catch (UnsupportedEncodingException e) {
			log.error(e);
			throw new BaseRuntimeException("密码加密失败", e);
		}

	}

}
