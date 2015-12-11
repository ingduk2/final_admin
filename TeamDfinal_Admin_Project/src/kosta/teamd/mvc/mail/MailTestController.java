package kosta.teamd.mvc.mail;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kosta.teamd.mvc.dao.MemberDao;
import kosta.teamd.vo.MailTestVO;
import kosta.teamd.vo.MemberVO;

@Controller
public class MailTestController {

	
	@Autowired
	private JavaMailSender mailSender;
	
	@Autowired
	private MemberDao mdao; 
	
	@RequestMapping(value="mailsend")
	public ModelAndView mailSend(String sc){
		List<MemberVO> list = mdao.selectallMember();
		ModelAndView mav = new ModelAndView("email/mailsend");
		mav.addObject("list", list);
		
		
		return mav;
	}
	
	
	@RequestMapping(value="send", method=RequestMethod.POST)
	public ModelAndView sendMail(MailTestVO mvo, boolean check, HttpServletRequest request, HttpServletResponse response) throws AddressException, MessagingException, UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		MimeMessage message = mailSender.createMimeMessage();
		List<MemberVO> list =  mdao.selectallMember();
		message.setFrom(new InternetAddress(mvo.getFrom()));
		System.out.println("수??"+list.size());
		
		//배열 메일 보내기 테스트 ...
		if(check == false){
			System.out.println("false");
			message.addRecipient(RecipientType.TO, new InternetAddress((mvo.getTo())));
		}else{
			System.out.println("true");
			for(MemberVO m : list){
				StringBuffer sp = new StringBuffer();
				sp.append(m.getMname()).append("님 ").append("<").append(m.getMemail()).append(">");
			System.out.println(sp);
			message.addRecipient(RecipientType.TO, new InternetAddress(sp.toString()));
			}
		}
		
		message.setSubject(mvo.getSubject());
		message.setText(mvo.getText(),"utf-8","html");
		mailSender.send(message);
		return new ModelAndView("redirect:/mailsend?sc=1");
	}
	
	@RequestMapping(value="/success")
	public String success(){
		return "email/success";
	}
}
