package homework.service;

import java.util.List;

import homework.model.Book;
import homework.model.Topic;

public interface TopicService {

	/**
	 * @return 新书推荐
	 */
	public List<Book> newbook();
	
	/**
	 * @return热门话题
	 */
	public List<Topic> hotTopic();
	
	/**
	 * @return 换一批话题
	 */
	public List<Topic> morehotTopic();
	
	/**
	 * @param topicid 话题id
	 * @return 热门书籍列表
	 */
	public List<Book> hotBook(int topicid);
	
	/**
	 * @param topicid 话题id
	 * @return 畅销书籍列表
	 */
	public List<Book> salesRankBook(int topicid);
	
}
