package homework.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
		
		if(type==4){
			type=2;
			key="操作系统";
		}
		
		List<Book> list=bookDao.findAll();
		List<Book> res=new ArrayList<Book>();
		
		for(int i=0;i<list.size();i++){
			if(!siftPublisher(list.get(i), sift_publisher)||!siftTime(list.get(i), sift_time)||!siftPrice(list.get(i), sift_price)){
				continue;
			}
			
			if(list.get(i).getNumber()<=0&&hasStock) continue;
			
			if(type==1){
				if(list.get(i).getName().contains(key)||list.get(i).getNameCn().contains(key)){
					res.add(list.get(i));
				}else{
					continue;
				}
			}else if(type==2){
				if(list.get(i).getLevel1().equals(key)){
					res.add(list.get(i));
				}else{
					continue;
				}
			}else if(type==3){
				if(list.get(i).getLevel2().equals(key)){
					res.add(list.get(i));
				}else{
					continue;
				}
			}
			
		}
		
		switch(sort){
		case 0:res=sortScore(res);break;
		case 1:res=sortPrice(res);break;
		case 2:res=sortDiscount(res);break;
		}
		
		ArrayList<Book> res1=new ArrayList<Book>();
		
		for(int i=(page-1)*20;i<page*20&&i<res.size();i++){
			res1.add(res.get(i));
		}
		
		return res1;
	}
	
	public List<Book> sortScore(List<Book> res){
		for(int i=0;i<res.size();i++){
			for(int j=0;j<(res.size()-i-1);j++){
				if(res.get(j).getScore()<res.get(j+1).getScore()){
					Book l=res.get(j);
					res.set(j, res.get(j+1));
					res.set(j+1, l);
				}
			}
		}
		return res;
	}
	
	public List<Book> sortPrice(List<Book> res){
		for(int i=0;i<res.size();i++){
			for(int j=0;j<(res.size()-i-1);j++){
				if(res.get(j).getPrice()>res.get(j+1).getPrice()){
					Book l=res.get(j);
					res.set(j, res.get(j+1));
					res.set(j+1, l);
				}
			}
		}
		return res;
	}
	
	public List<Book> sortDiscount(List<Book> res){
		for(int i=0;i<res.size();i++){
			for(int j=0;j<(res.size()-i-1);j++){
				if(res.get(j).getDiscount()>res.get(j+1).getDiscount()){
					Book l=res.get(j);
					res.set(j, res.get(j+1));
					res.set(j+1, l);
				}
			}
		}
		return res;
	}
	
	public boolean siftPublisher(Book book, int sift_publisher){
		switch(sift_publisher){
			case 0: return true;
			case 1: return "机械工业出版社".equals(book.getPublisher());
			case 2: return "电子工业出版社".equals(book.getPublisher());
			case 3: return true;
		}
		return true;
	}
	
	public boolean siftTime(Book book, int sift_time){
		if(sift_time==0) return true;
		
		Date d=book.getTime();
		Calendar c=Calendar.getInstance();
		c.setTime(d);
		int year=c.get(Calendar.YEAR);
		int min=0;
		int max=3000;
		
		switch(sift_time){
		case 1:max=2000;break;
		case 2:min=2000;max=2010;break;
		case 3:min=2010;break;
		}
		if(year>=min&&year<=max) return true;
		return false;
	}
	
	public boolean siftPrice(Book book, int sift_price){
		if(sift_price==0)return true;
		int min=0;
		int max=10000;
		switch(sift_price){
		case 1:max=20;break;
		case 2:min=20;max=50;break;
		case 3:min=50;max=100;break;
		case 4:min=100;break;
		}
		if(book.getPrice()>=min&&book.getPrice()<=max) return true;
		return false;
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
