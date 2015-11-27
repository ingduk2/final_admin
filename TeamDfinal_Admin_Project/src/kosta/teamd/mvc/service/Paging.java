package kosta.teamd.mvc.service;

import org.springframework.stereotype.Service;

@Service
public class Paging {
	
	private String pagingCode;
	
	public String getPagingCode() {
		return pagingCode;
	}

	public void setPagingCode(String pagingCode) {
		this.pagingCode = pagingCode;
	}
	
	public String Paging(int totalRecord, int nowPage, int numPerPage,
			int numPerBlock, String url){
	
       int totalPage = (int) Math.ceil((double)totalRecord / numPerPage);

       int totalBlock = (int) Math.ceil((double)totalPage / numPerBlock);
      
       int nowBlock = (int) Math.ceil((double)nowPage / numPerBlock);
      
       StringBuffer prev = new StringBuffer();
    
       StringBuffer next = new StringBuffer();
       
       StringBuffer paging = new StringBuffer();

       if(nowBlock> 1){ // nowBlock �� 1���� ũ�ٸ� ������������ ��ũ�� ����
    	   prev.append("<a href='");
    	   prev.append("?nowPage=");
    	   prev.append((nowBlock-2) * numPerBlock +1);
    	   prev.append("'><span class=\"glyphicon glyphicon-circle-arrow-left\"></span></a>&nbsp;nbsp;");
       }else{
    	   prev.append("<span class=\"glyphicon glyphicon-circle-arrow-left\"></span>&nbsp;&nbsp;");
       }

	
	//������ ���
	
	for(int i=0; i<numPerBlock; i++){
		//��µǴ� ������ ��
		int printPage = ((nowBlock - 1) * numPerBlock)+ i+ 1;
		
		if(printPage == nowPage){//���� �������� ���
			paging.append("<font color='olive'>");
			paging.append(printPage).append("</font>");
		}else{
			// ���� �������� �ƴ� ��쿡�� �������� ���̸� �θ� �ȴ�.
			paging.append("<a href='").append(url);
			paging.append("?nowPage=");
			paging.append(printPage).append("'>");
			paging.append(printPage).append("</a>&nbsp;&nbsp;");
		}
		//��ü �������� ���ٸ�, ������ ��¹��� ���� ���;� �Ѵ�.
		if(printPage == totalPage){
			break;
		}
	}//for�� ����
	// ���� �������� ���� :  totalBlock �� nowBlock ���� Ŭ���
	if(totalBlock > nowBlock){
		next.append("<a href='").append(url);
		next.append("?nowPage=").append(nowBlock * numPerBlock + 1);
		next.append("'><span class=\"glyphicon glyphicon-circle-arrow-right\"></span>").append("</a>");
	}else{
		next.append("&nbsp;&nbsp; <span class=\"glyphicon glyphicon-circle-arrow-right\"></span>");
	}
	// �������� �ϼ� �Ǿ����� ���յ� ������ �ڵ忡 ����
	pagingCode = prev.toString() + paging.toString()
					+ next.toString();
	
	return pagingCode;
}
	
}
