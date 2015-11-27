package kosta.teamd.mvc.service;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Service
public class testjson {
	
	public void json(){
		
	}
	
	public static void main(String[] args) {
		JSONArray ja= new JSONArray();
		JSONObject jo= new JSONObject();
		
		ja.add("1");
		ja.add("2");
		
		
		System.out.println(ja);
	}
}
