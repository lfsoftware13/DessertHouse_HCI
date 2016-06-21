package homework.service.impl;

import java.util.List;

import homework.model.Book;
import homework.model.Comment;
import homework.model.CommentStat;
import homework.service.BookService;

public class BookServiceImpl implements BookService {

	@Override
	public List<Book> search(int type, String key, int sift_publisher, int sift_time, int sift_price, int sort,
			boolean hasStock, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Book> bookrecommend() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Book getBook(int bookid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CommentStat getCommentStat(int bookid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getComment(int bookid, int page) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Comment> getSimilarBook(int bookid) {
		// TODO Auto-generated method stub
		return null;
	}

}
