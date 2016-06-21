package homework.service.impl;

import homework.model.Member;
import homework.service.MemberService;

public class MemberServiceImpl implements MemberService {

	@Override
	public Member getMember(int memberid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean updateMember(int id, String nickname, String sex, String name) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updateMail(int memberid, String mail) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatePhone(int memberid, String phone) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updatePassword(int memberid, String oldpassword, String newpassword) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean login(String account, String password) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean register(String account, String password) {
		// TODO Auto-generated method stub
		return false;
	}

}
