package com.bsb.cms.commons.security;

import java.security.NoSuchAlgorithmException;

import com.bsb.cms.commons.exceptions.BaseRuntimeException;

/**
 * 加密解密,hash算法等安全相关的
 * 
 * @author hongjian.liu
 * @since 2014-5-25
 */
public interface SecurityService {

	/**
	 * DES加密方法,内置key
	 * 
	 * @param clearData
	 * @return
	 * @throws Exception
	 */
	public byte[] encryptDES(byte[] clearData) throws BaseRuntimeException;

	/**
	 * DES加密方法
	 * 
	 * @param clearData
	 * @param key
	 *            加密密钥
	 * @return
	 * @throws Exception
	 */
	public byte[] encryptDES(byte[] clearData, byte[] key) throws BaseRuntimeException;

	/**
	 * DES解密服务,内置key
	 * 
	 * @param encData
	 *            密文
	 * @return
	 */
	public byte[] decryptDES(byte[] encData) throws BaseRuntimeException;

	/**
	 * DES解密服务
	 * 
	 * @param encData
	 *            密文
	 * @param key
	 *            解密密钥
	 * @return
	 */
	public byte[] decryptDES(byte[] encData, byte[] key) throws BaseRuntimeException;


	/**
	 * 密码加密
	 * 不可逆算法sha1
	 * @param password
	 * @return
	 */
	public String encPassword(String password)throws BaseRuntimeException;
	/**
	 * 生成密钥
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public byte[] genKey() throws NoSuchAlgorithmException;
	
}
