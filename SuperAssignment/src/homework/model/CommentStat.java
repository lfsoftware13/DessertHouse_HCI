package homework.model;

import javax.persistence.Entity;


public class CommentStat {
	
	int number;
	
	double goodrate;
	
	double score;
	
	int rank;
	
	int bookid;
	
	String book;

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public double getGoodrate() {
		return goodrate;
	}

	public void setGoodrate(double goodrate) {
		this.goodrate = goodrate;
	}

	public double getScore() {
		return score;
	}

	public void setScore(double score) {
		this.score = score;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public String getBook() {
		return book;
	}

	public void setBook(String book) {
		this.book = book;
	}
	
	
	

}
