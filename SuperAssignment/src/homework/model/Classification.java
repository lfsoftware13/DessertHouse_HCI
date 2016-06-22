package homework.model;

import java.io.Serializable;

public class Classification implements Serializable {
	public String c1;
	public String[] c2;
	
	public Classification(){
		c1 = "一级分类";
		c2 = new String[4];
		for(int i=0; i<4; i++){
			c2[i] = "二级分类" + i;
		}
	}
	
	public Classification(String c1, String[] c2){
		this.c1 = c1;
		this.c2 = c2;
	}
	
}
