package homework.service;

import homework.model.Member;

public interface MemberService {
	
	/**
	 * @param memberid 用户id
	 * @return 用户信息
	 */
	public Member getMember(int memberid);
	
	/**
	 * @param id 用户id
	 * @param nickname 昵称
	 * @param sex 性别
	 * @param name 真实姓名
	 * @return 操作是否成功
	 */
	public boolean updateMember(int id, String nickname, String sex, String name);
	
	
	/**
	 * @param memberid 用户id
	 * @param mail 新邮箱
	 * @return 操作是否成功
	 */
	public boolean updateMail(int memberid, String mail);
	
	/**
	 * @param memberid 用户id
	 * @param phone 新手机
	 * @return 操作是否成功
	 */
	public boolean updatePhone(int memberid, String phone);
	
	/**
	 * @param memberid 用户id
	 * @param oldpassword 旧密码
	 * @param newpassword 新密码
	 * @return 操作是否成功
	 */
	public boolean updatePassword(int memberid, String oldpassword, String newpassword);
	
	
	/**
	 * @param account 账户名
	 * @param password 密码
	 * @return 登陆是否成功
	 */
	public int login(String account, String password);
	
	/**
	 * @param account 用户名
	 * @param password 密码
	 * @return 注册是否成功
	 */
	public boolean register(String account, String password);
	
}
