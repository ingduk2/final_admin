package kosta.teamd.mvc.imple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.mvc.inter.MemRolesSelectInter;
import kosta.teamd.vo.MemRolesVO;

@Service
public class MemRolesImple implements MemRolesSelectInter {

	@Autowired
	private MemberDao mdao;
	
	@Override
	public MemRolesVO memrolesSelect(String mid) throws Exception {

		MemRolesVO mrvo = mdao.selectMemRoles(mid);
		
		return mrvo;
	}
}
