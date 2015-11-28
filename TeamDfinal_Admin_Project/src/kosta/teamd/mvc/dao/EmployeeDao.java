package kosta.teamd.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kosta.teamd.vo.EmployeeJoinVO;
import kosta.teamd.vo.EmployeeVO;
import kosta.teamd.vo.MemberVO;

@Repository
public class EmployeeDao {
	@Autowired
	private SqlSessionTemplate template;
	
	public List<MemberVO> selectnoEmployee(){
		return template.selectList("member.selectnoEmployee");
	}
	
	public List<MemberVO> selectyesEmployee(){
		return template.selectList("member.selectyesEmployee");
	}
	
	//0->1
	public void updateyesEmployee(String mid){
		template.update("member.updateyesEmployee",mid);
	}
	//1->0
	public void updatenoEmployee(String mid){
		template.update("member.updatenoEmployee",mid);
	}
	
//	<insert id="insertemployee" parameterType="emvo">
//	insert into employee values(employee_seq.next_val,#{mid},#{emzic},#{emsalary})
//</insert>
//
//<select id="selectallemployee" resultType="emvo">
//	select * from employee
//</select>
	public void insertEmployee(EmployeeVO emvo){
		template.insert("employee.insertemployee",emvo);
	}
	
	public void updateEmployee(EmployeeVO emvo){
		template.update("employee.updateemployee",emvo);
	}
	public List<EmployeeJoinVO> selectalljoinemployee(){
		return template.selectList("employee.selectjoinemployee");
		
	}

}
