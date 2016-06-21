package homework.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.stereotype.Service;

import homework.service.NoteService;

@Service
public class NoteServiceImpl implements NoteService {
	
	String filePath="";
	
	static int bankcard=-1;
	static int clerk=-1;
	static int consumption=-1;
	static int member=-1;
	static int payment=-1;
	static int plan=-1;
	static int plan_item=-1;
	static int product=-1;
	static int stock=-1;
	static int store=-1;
	
	static int promotion=-1;
	static int promotion_item=-1;
	static int purchase=-1;
	static int warehouse=-1;
	
	@Override
	public String getNote(String type) {
		// TODO Auto-generated method stub
		if(bankcard<0){
			readFile();
		}
		
		String res="";
		
		switch(type){
			case "bankcard":bankcard++;res="B"+changeNumber(bankcard);break;
			case "clerk":clerk++;res="C"+changeNumber(clerk);break;
			case "consumption":consumption++;res="U"+changeNumber(consumption);break;
			case "member":member++;res="M"+changeNumber(member);break;
			case "payment":payment++;res="P"+changeNumber(payment);break;
			case "plan":plan++;res="N"+changeNumber(plan);break;
			case "plan_item":plan_item++;res="I"+changeNumber(plan_item);break;
			case "product":product++;res="R"+changeNumber(product);break;
			case "stock":stock++;res="O"+changeNumber(stock);break;
			case "store":store++;res="S"+changeNumber(store);break;
			
			case "promotion":promotion++;res="T"+changeNumber(promotion);break;
			case "promotion_item":promotion_item++;res="E"+changeNumber(promotion_item);break;
			case "purchase":purchase++;res="A"+changeNumber(purchase);break;
			case "warehouse":warehouse++;res="W"+changeNumber(warehouse);break;
		}
		
		String path=NoteServiceImpl.class.getClassLoader().getResource("").getPath();
		try {
			
			PrintWriter out = new PrintWriter(new BufferedWriter(new FileWriter(path+"note")));
			out.println("bankcard:"+bankcard);
			out.println("clerk:"+clerk);
			out.println("consumption:"+consumption);
			out.println("member:"+member);
			out.println("payment:"+payment);
			out.println("plan:"+plan);
			out.println("plan_item:"+plan_item);
			out.println("product:"+product);
			out.println("stock:"+stock);
			out.println("store:"+store);
			out.println("promotion:"+promotion);
			out.println("promotion_item:"+promotion_item);
			out.println("purchase:"+purchase);
			out.println("warehouse:"+warehouse);
			out.flush();
			
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return res;
	}
	
	public String changeNumber(int number){
		String num=Integer.toString(number);
		int len=num.length();
		for(int i=6;i>len;i--){
			num="0"+num;
		}
		return num;
	}
	
	public void readFile(){
		String tempString;
		String path=NoteServiceImpl.class.getClassLoader().getResource("").getPath();
		try {
		BufferedReader reader = new BufferedReader(new FileReader(path+"note"));

			while ((tempString = reader.readLine()) != null) {
				String[] str=tempString.split(":");
				int temp=Integer.parseInt(str[1]);
				switch(str[0]){
					case "bankcard":bankcard=temp;break;
					case "clerk":clerk=temp;break;
					case "consumption":consumption=temp;break;
					case "member":member=temp;break;
					case "payment":payment=temp;break;
					case "plan":plan=temp;break;
					case "plan_item":plan_item=temp;break;
					case "product":product=temp;break;
					case "stock":stock=temp;break;
					case "store":store=temp;break;
					
					case "promotion":promotion=temp;break;
					case "promotion_item":promotion_item=temp;break;
					case "purchase":purchase=temp;break;
					case "warehouse":warehouse=temp;break;
				}
			 }

		//counter = Integer.parseInt( reader.readLine() );
		reader.close();
		
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
}
