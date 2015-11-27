package kosta.teamd.mvc.controller;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.apache.ibatis.type.IntegerTypeHandler;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.AnimalDao;
import kosta.teamd.mvc.dao.AnimalsDao;
import kosta.teamd.mvc.dao.ChartDao;
import kosta.teamd.vo.AniBoardVO;
import kosta.teamd.vo.AnimalsVO;
import kosta.teamd.vo.ChartAniBreedVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller
public class AnimalChart {

	
	@Autowired
	private AnimalsDao anisdao;
	
	@Autowired
	private AnimalDao anidao;
	
	@Autowired
	private ChartDao cdao;
	
	// 아작스 
	@RequestMapping(value="animalcnt")
	public ModelAndView anispectes(){
	List<AnimalsVO> list=	anisdao.selectallCnt();
//	List<AnimalsVO> list2 = anisdao.selectallanisCnt();
	List<ChartAniBreedVO> list2= cdao.selectallanibreed();

	JSONArray arr = new JSONArray();
	JSONObject jobj = null;
	JSONArray arr2 = new JSONArray();
	JSONObject jobj2= null;
	JSONArray ja2= null;
	JSONArray data_arr = null;
	int start=0;
	int end=list2.size();
	for(AnimalsVO e : list){
		jobj = new JSONObject();
		jobj.put("name", e.getAnispecies());
		jobj.put("y", e.getCnt());
		jobj.put("drilldown", e.getAnispecies());
		arr.add(jobj);
		System.out.println(arr);
		jobj2= new JSONObject();
		jobj2.put("name", e.getAnispecies());
		jobj2.put("id", e.getAnispecies());
		data_arr= new JSONArray();
		for(int i=start; i<end; i++){
			//같으면..
			if(e.getAnispecies().equals(list2.get(i).getAnispecies())){
				ja2=new JSONArray();
				ja2.add(list2.get(i).getAnibreed());
				ja2.add(list2.get(i).getCnt());
				data_arr.add(ja2);
				System.out.println(data_arr);
			}else{
				start=i;
				break;
			}
		}
		jobj2.put("data", data_arr);
		System.out.println(jobj2);
		arr2.add(jobj2);
		System.out.println(arr2);
	}
	ModelAndView mav =  new ModelAndView("/animaltest/anijson");
	System.out.println(arr.toString());
	System.out.println(arr2);
	StringBuffer json = new StringBuffer();
	json.append(arr.toString()).append("/").append(arr2.toString());
	System.out.println("json" + json.toString() );
	mav.addObject("aniscnt", json.toString());
	return mav;
	}
	
	
	// 차트 뷰
	//리스트 그냥 폼으로
	@RequestMapping(value="testani")
	public ModelAndView formaniChart(){
		List<AniBoardVO> list = anidao.getImgList();
		List<AnimalsVO> anisvo  = anisdao.selectallCnt();
		System.out.println(list.size());
		System.out.println(anisvo.size());
		ModelAndView mav = new ModelAndView("animaltest/testanimal");
		mav.addObject("ablilst",list);
		mav.addObject("anisvo", anisvo);
		for(AnimalsVO e : anisvo){
		System.out.println(e.getCnt());
		System.out.println(e.getAnispecies());
		}
		return mav;
	}
}
