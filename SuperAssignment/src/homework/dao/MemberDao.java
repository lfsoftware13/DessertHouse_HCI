package homework.dao;

import java.util.List;

import homework.model.Member;

public interface MemberDao {
	
	public List findAll();
	
	public Member findById(int id);
	
	public boolean save(Member mem);
	
	public boolean update(Member mem);
	
	public boolean delete(Member mem);
	
	public boolean delete(int id);

}
