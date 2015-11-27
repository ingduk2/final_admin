package kosta.teamd.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.vo.Company;
import kosta.teamd.vo.Person;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class TestController {
	
	@RequestMapping(value="/")
	public String a(){
		return "admin";
	}
	
	@RequestMapping(value="/main")
	public String b(){
		return "main";
	}
	@RequestMapping(value="/adopt")
	public String adopt(){
		return "adoptboard";
	}
	
	@RequestMapping(value="/block")
	public String block(){
		return "blockboard";
	}
	
	@RequestMapping(value="/volunteer")
	public String volunteer(){
		return "volunteerboard";
	}
	
	@RequestMapping(value="/center")
	public String center(){
		return "insertcenter";
	}
	
	@RequestMapping(value="/member")
	public String member(){
		return "member";
	}
	
	@RequestMapping(value="/samplejson")
	public ModelAndView json(){
		ModelAndView mav= new ModelAndView("samplejson");
		/*
		 * 
		 * 
		 * [
    {
        "no": 0,
        "name": "Nexus",
        "snippet": "aaaaaaa"
    },
    {
        "no": 1,
        "name": "motorora",
        "snippet": "bbbbbb"
    },
    {
        "no": 2,
        "name": "xxxxxx",
        "snippet": "cccccc"
    }
]
		 */
		JSONObject jo= new JSONObject();
		JSONArray ja= new JSONArray();
		JSONObject in= new JSONObject();
		
		in.put("no", 0);
		in.put("name", "Nexus");
		in.put("snippet", "aaaaaaa");
		ja.add(in);
		
		in=new JSONObject();
		in.put("no", 1);
		in.put("name", "motorora");
		in.put("snippet", "bbbbbb");
		ja.add(in);
		
		in=new JSONObject();
		in.put("no", 2);
		in.put("name", "xxxxxx");
		in.put("snippet", "cccccc");
		ja.add(in);
		
		System.out.println(ja);
		mav.addObject("json",ja);
		return mav;
	}
	
	@RequestMapping(value = "/angularjs-http-service-ajax-post-json-data-code-example", method = RequestMethod.GET)
	public ModelAndView httpServicePostJSONDataExample( ModelMap model ) {
		return new ModelAndView("testangular");
	}

	@RequestMapping(value = "/savecompany_json", method = RequestMethod.POST)	
	public  @ResponseBody String saveCompany_JSON( @RequestBody Company company )   {		
		//
		// Code processing the input parameters
		//	
		System.out.println("asdfasdfasdf");
		System.out.println(company.getHeadoffice());
		return "JSON: The company name: " + company.getName() + ", Employees count: " + company.getEmployees() + ", Headoffice: " + company.getHeadoffice();
	}
	
	
	@RequestMapping(value = "/PostFormData", method = RequestMethod.POST)
	public @ResponseBody Person PostService(@RequestBody Person person) {
		System.out.println("afafffff");
		return person;
	}
	
	@RequestMapping(value="drag")
	public String drag(){
		return "dragdrop";
	}
}
