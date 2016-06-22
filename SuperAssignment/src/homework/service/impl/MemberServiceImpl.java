package homework.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.AccountDao;
import homework.dao.MemberDao;
import homework.model.Account;
import homework.model.Member;
import homework.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao memberDao;
	@Autowired
	AccountDao accountDao;

	@Override
	public Member getMember(int memberid) {
		// TODO Auto-generated method stub
		return memberDao.findById(memberid);
	}

	@Override
	public boolean updateMember(int id, String nickname, String sex, String name) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(id);
		if(mem==null) return false;
		mem.setNickname(nickname);
		mem.setSex(sex);
		mem.setName(name);
		return memberDao.update(mem);
	}

	@Override
	public boolean updateMail(int memberid, String mail) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(memberid);
		if(mem==null) return false;
		mem.setMail(mail);
		return memberDao.update(mem);
	}

	@Override
	public boolean updatePhone(int memberid, String phone) {
		// TODO Auto-generated method stub
		Member mem=memberDao.findById(memberid);
		if(mem==null) return false;
		mem.setPhone(phone);
		return memberDao.update(mem);
	}

	@Override
	public boolean updatePassword(int memberid, String oldpassword, String newpassword) {
		// TODO Auto-generated method stub
		Account acc=accountDao.findById(memberid);
		if(acc==null) return false;
		if(acc.getPassword().equals(oldpassword)){
			acc.setPassword(newpassword);
		} else {
			return false;
		}
		return accountDao.update(acc);
	}

	@Override
	public int login(String account, String password) {
		// TODO Auto-generated method stub
		Account acc=accountDao.findByName(account);
		if(acc==null) return -1;
		if(acc.getPassword().equals(password)){
			return acc.getId();
		}
		return -1;
	}

	@Override
	public boolean register(String account, String password) {
		// TODO Auto-generated method stub
		Member mem=new Member();
		mem.setName(account);
		mem.setImage("");
		mem.setMail("");
		mem.setNickname("");
		mem.setPhone("");
		mem.setSex("");
		mem.setAge(0);
		memberDao.save(mem);
		
		Account acc=new Account();
		acc.setAccount(account);
		acc.setPassword(password);
		acc.setType(1);
		acc.setId(mem.getId());
		accountDao.save(acc);
		
		return true;
	}

}
