package homework.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import homework.dao.BookDao;
import homework.dao.BooktopicDao;
import homework.dao.TopicDao;
import homework.model.Book;
import homework.model.Booktopic;
import homework.model.Topic;
import homework.service.TopicService;

@Service
public class TopicServiceImpl implements TopicService {
	
	@Autowired
	TopicDao topicDao;
	@Autowired
	BooktopicDao booktopicDao;
	@Autowired
	BookDao bookDao;

	@Override
	public List<Book> newbook() {
		// TODO Auto-generated method stub
		Topic t=topicDao.findByName("new");
		List<Booktopic> list=booktopicDao.findByTopicid(t.getId());
		List<Book> res=new ArrayList<Book>();
		for(int i=0;i<list.size();i++){
			Book b=bookDao.findById(list.get(i).getBookid());
			res.add(b);
		}
		return res;
	}

	@Override
	public List<Topic> hotTopic() {
		// TODO Auto-generated method stub
		return topicDao.findAll();
	}

	@Override
	public List<Topic> morehotTopic() {
		// TODO Auto-generated method stub
		List<Topic> list=topicDao.findAll();
		List<Topic> res=new ArrayList<Topic>();
		for(int i=0;i<list.size();i++){
			res.add(0, list.get(i));
		}
		return res;
	}

	@Override
	public List<Book> hotBook(int topicid) {
		// TODO Auto-generated method stub
		Topic t=topicDao.findByName("hot");
		List<Booktopic> list=booktopicDao.findByTopicid(t.getId());
		List<Book> res=new ArrayList<Book>();
		for(int i=0;i<list.size();i++){
			Book b=bookDao.findById(list.get(i).getBookid());
			res.add(b);
		}
		return res;
	}

	@Override
	public List<Book> salesRankBook(int topicid) {
		// TODO Auto-generated method stub
		Topic t=topicDao.findByName("hot");
		List<Booktopic> list=booktopicDao.findByTopicid(t.getId());
		List<Book> res=new ArrayList<Book>();
		for(int i=0;i<list.size();i++){
			Book b=bookDao.findById(list.get(i).getBookid());
			res.add(b);
		}
		return res;
	}

}
