package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.ChartAniBreedVO;
import kosta.teamd.vo.ChartMemAgeVO;
import kosta.teamd.vo.ChartMemberVO;
import kosta.teamd.vo.ChartSurveyVO;
import kosta.teamd.vo.ChartVO;
import kosta.teamd.vo.SurveyVO;

@Repository
public class ChartDao {
	
	@Autowired
	private SqlSessionTemplate template;
	
	public List<ChartVO> select(String year){
		return template.selectList("chart.selectall",year);
	}
	
	public List<ChartMemberVO> selectallChartMember(){
		return template.selectList("chart.selectallchartmember");
	}
	
	//돌려막기임 ㅜㅜ
	public List<ChartMemberVO> selectallchartaddr(){
		return template.selectList("chart.selectallchartaddr");
	}
	
	public ChartMemAgeVO selectallMemAge(){
		return template.selectOne("chart.selectallmemage");
	}
	
	public List<ChartAniBreedVO> selectallanibreed(){
		return template.selectList("chart.selectallanibreed");
	}
	
	public List<SurveyVO> selectallsurvey(){
		return template.selectList("chart.selectallsurvey");
	}
}
