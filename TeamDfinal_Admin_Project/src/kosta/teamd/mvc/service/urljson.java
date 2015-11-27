package kosta.teamd.mvc.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import net.sf.json.xml.XMLSerializer;



@Service
public class urljson {
	
	
//	private XMLSerializer xmlSeri;
	
	public JSONObject myJason(String param){
		URL url=null;
		String apikey="cafcd4fae4be10d7ffdde1bc7cadf004";
		
		String str=param.replaceAll(" ", "%20");
		//String str="제주%20특별자치도%20제주시%20첨단로%20242";
		
		//XMLSerializer xmlseri= new XMLSerializer();
		XMLSerializer xmlSeri=new XMLSerializer();
		JSONObject jsonObject = new JSONObject();
		//String address="https://apis.daum.net/local/geo/addr2coord?apikey="+apikey+"&q="+str+"&output=json";
		//String address="http://openapi.naver.com/search?key=c1b406b32dbbbbeee5f2a36ddc14067f&query=주식&target=news&start=1&display=10";

		String address="https://apis.daum.net/local/geo/addr2coord?apikey="+apikey+"&q="+str+"&output=json";
		System.out.println(address);

		try {
			url=new URL(address);
//			URLConnection conn=url.openConnection();
//			String contType=conn.getContentType();
//			System.out.println(conn.getContent());
//			System.out.println(contType);
			
			HttpURLConnection con= (HttpURLConnection) url.openConnection();
//			System.out.println("문자 타입 : " +con.getContentType());
			String kind=con.getContentType().split("/")[1].split(";")[0];
			System.out.println("kind : " + kind);
			BufferedReader br=new BufferedReader( new InputStreamReader(con.getInputStream(),"UTF-8"));
			String line = null;
			StringBuffer sb= new StringBuffer();
			while((line=br.readLine())!= null){
				sb.append(line);
			}
			System.out.println("line : " +line);
			System.out.println("sb : " + sb);
			if(kind.equals("json")){
//			Object obj= JSONValue.parse(new InputStreamReader(con.getInputStream()));
//			jsonObject=(JSONObject) obj;
//			System.out.println(jsonObject);
				System.out.println(sb.toString());
				
				//simple json 나머지는 net.sf.json!!
//				Object obj=JSONValue.parse(sb.toString());
//				jsonObject=(JSONObject) obj;
				//JSONObject json = (JSONObject) JSONSerializer.toJSON( jsonTxt );
				jsonObject = (JSONObject) JSONSerializer.toJSON(sb.toString());
				System.out.println("jsonobject : "+jsonObject);
			}else{
				System.out.println("sbtest : " +sb.toString());
				String xml=sb.toString();
				System.out.println(xml);
				jsonObject =  (JSONObject) xmlSeri.read(xml);
				System.out.println("xml->to json");
				System.out.println(jsonObject);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("테스트 제이슨 : " + jsonObject);
		
		return jsonObject;
	}
	
	
	public String mock(JSONObject jsondata){
	
		//먼저 주소를 변환한다.
				JSONObject jsonObject= new JSONObject();
				JSONArray jsonArray= new JSONArray();
//				jsonObject = myjson.myJason("제주 특별자치도 제주시 첨단로 242");
				//그 후에 리턴받아서 디비에 저장한다.
				//필요한거 뽑아서
				jsonObject=jsondata;
				System.out.println(jsonObject);
				
				System.out.println("channel  -- "+jsonObject.get("channel"));
				System.out.println("channel  -- "+jsonObject.get("channel"));
//				jsonArray=(JSONArray) jsonObject.get("channel");
//				jsonObject=(JSONObject) jsonArray.get(0);
//				
//				String x=jsonObject.get("point_x").toString();
//				String y=jsonObject.get("point_y").toString();
				
				jsonObject=(JSONObject) jsonObject.get("channel");
				System.out.println(jsonObject);
				jsonArray=jsonObject.getJSONArray("item");
				System.out.println("array -- "+jsonArray);
				
				jsonObject=jsonArray.getJSONObject(0);
				System.out.println(jsonObject);
				
				String x=jsonObject.get("point_x").toString();
				String y=jsonObject.get("point_y").toString();
				
				System.out.println(x+"--"+y);
				String cxy=y+","+x;
				
				
				return cxy;
				
				
				
				//jsonObject.get(key)
	}
	
	public static void main(String[] args) {
		urljson uj= new urljson();
		
		String param="제주 특별자치도 제주시 첨단로 242";
		//uj.mock();
		//uj.myJason(param);
		JSONObject jsonObject= new JSONObject();
		jsonObject = uj.myJason(param);
		//그 후에 리턴받아서 디비에 저장한다.
		//필요한거 뽑아서
		System.out.println(uj.mock(jsonObject));
		
		
	}
}
