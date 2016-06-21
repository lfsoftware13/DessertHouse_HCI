package homework.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.BookDao;
import homework.dao.CommentDao;
import homework.model.Book;
import homework.model.Comment;
import homework.model.CommentStat;
import homework.service.BookService;

@Service
public class BookServiceImpl implements BookService {
	
	@Autowired
	BookDao bookDao;
	@Autowired
	CommentDao commentDao;
	
	
	@Override
	public List<Book> search(int type, String key, int sift_publisher, int sift_time, int sift_price, int sort,
			boolean hasStock, int page) {
		// TODO Auto-generated method stub
		return new ArrayList<Book>();
	}

	@Override
	public List<Book> bookrecommend() {
		// TODO Auto-generated method stub
		return bookDao.findAll();
	}

	@Override
	public Book getBook(int bookid) {
		// TODO Auto-generated method stub
		return bookDao.findById(bookid);
	}

	@Override
	public CommentStat getCommentStat(int bookid) {
		// TODO Auto-generated method stub
		List<Comment> list=commentDao.findByBook(bookid);
		Book b=bookDao.findById(bookid);
		double goods=0;
		double sco=0;
		CommentStat sta=new CommentStat();
		sta.setBookid(bookid);
		sta.setBook(b.getName());
		sta.setNumber(list.size());
		sta.setRank(b.getRank());
		for(int i=0;i<list.size();i++){
			if(list.get(i).getAtt()>3){
				goods++;
			}
			sco=sco+list.get(i).getAtt();
		}
		sta.setGoodrate(goods/list.size());
		sta.setScore(sco/list.size());
		return sta;
	}

	@Override
	public List<Comment> getComment(int bookid, int page) {
		// TODO Auto-generated method stub
		List<Comment> list=commentDao.findByBook(bookid);
		List<Comment> res=new ArrayList<Comment>();
		for(int i=(page-1)*8;i<list.size()&&i<page*8;i++){
			res.add(list.get(i));
		}
		return res;
	}

	@Override
	public List<Book> getSimilarBook(int bookid) {
		// TODO Auto-generated method stub
		return bookDao.findAll();
	}

}
