package kosta.teamd.mvc.dao;

import java.util.List;

import kosta.teamd.vo.SurveyVO;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class SurveyDao {
	@Autowired
	private SqlSessionTemplate template;
	
	public void surveyAdd(SurveyVO v){
		template.insert("survey.surveyAdd", v);
	}
	
	public void surveyUpdate(SurveyVO v){
		template.update("survey.surveyUpdate", v);
	}
	
	//제목 업데이트
	public void subUpdate(SurveyVO svo){
		template.update("survey.updateServey",svo);
	}
	
	public List<SurveyVO> surveyList(){
		return template.selectList("survey.surveyList");
	}
	
	public SurveyVO getDetail(int num){
		return template.selectOne("survey.surveyDetail",num);
	}
	
//	public void surveyView(int num){
//		
//	}
	

//	public void surveyAdd(String string, int i) {
//		// TODO Auto-generated method stub
//		
//	}
	

	
	
//	@Autowired
//	private SqlSessionTemplate template;
//	
//	public void update(int i){
//		template.selectOne("survey.update",i);
//	}
//	
//	public void update1(int i){
//		template.selectOne("survey1.update",i);
//	}
//	
//	public void update2(int i){
//		template.selectOne("survey2.update",i);
//	}
//	public void update3(int i){
//		template.selectOne("survey3.update",i);
//	}
//	
//	// 아이피 중복 체크
//		public int ipCntCheck(String ip) {
//			return template.selectOne("survey.ipCntCheck", ip);
//		}
//	
//	
//		public String insert(SurveyLogVO slogvo ){
//			return template.selectOne("surveylog.insert", slogvo);
//		}
//	
//	
//	

}
