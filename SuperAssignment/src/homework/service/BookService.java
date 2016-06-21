package homework.service;

import java.util.List;

import homework.model.Book;
import homework.model.Comment;
import homework.model.CommentStat;

public interface BookService {
	
	/**
	 * @param type	搜索类型: 1 关键词，2 一级分类，3 二级分类 
	 * @param key	关键词
	 * @param sift_publisher	筛选出版社
	 * @param sift_time	筛选时间
	 * @param sift_price	筛选价格
	 * @param sort	排序: 1 评分，2 价格，3 折扣
	 * @param hasStock	是否有货
	 * @param page	分页
	 * @return	图书列表
	 */
	public List<Book> search(int type, String key, int sift_publisher, int sift_time, int sift_price, int sort, boolean hasStock, int page);

	/**
	 * @return	图书列表
	 */
	public List<Book> bookrecommend();
	
	
	/**
	 * @param bookid 书籍id
	 * @return	图书列表
	 */
	public Book getBook(int bookid);
	
	/**
	 * @param bookid 书籍id
	 * @return	累计评论
	 */
	public CommentStat getCommentStat(int bookid);
	
	/**
	 * @param bookid 书籍id
	 * @param page 分页
	 * @return 评论列表
	 */
	public List<Comment> getComment(int bookid, int page);
	
	/**
	 * @param bookid 书籍id
	 * @return 书籍列表
	 */
	public List<Book> getSimilarBook(int bookid);
	
}
