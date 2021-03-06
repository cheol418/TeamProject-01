package concert.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import concert.model.ConcertDao;

@Controller
public class ConcertListController {
	final String command = "/list.do";
	final String getPage = "list";
	
	@Autowired
	private ConcertDao cdao;
	
	@RequestMapping(value = command)
	public ModelAndView doAction(ModelAndView mav, HttpSession session, 
								@RequestParam(value = "pageNumber")int pageNumber,
								@RequestParam(value = "miniclass",required = false)String miniclass)  {
		ConcertApi api = new ConcertApi();
		int startNum;
		
		if(pageNumber == 1) {
			startNum = 1;
		}else {
			//5 col, 4 row
			startNum = pageNumber*20+1;
		}
		List<Map<String,Object>> concertList = null;
		String sub = miniclass;
		if(sub.isEmpty()) {
			concertList = api.getCultureList(startNum,startNum+19);
		}else {
			concertList = api.getCultureList(startNum,startNum+19,miniclass);
		}
		
		session.setAttribute("concertList", concertList);
		mav.addObject("concertList", concertList);
		mav.setViewName(getPage);
		return mav;
	}
}
