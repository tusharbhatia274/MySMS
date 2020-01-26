package com.mysms.composemessage.controller;
import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.condition.RequestMethodsRequestCondition;

import com.mysms.daomodel.LoginSignupDao;
import com.mysms.dtomodel.AddFriendDto;
import com.mysms.dtomodel.AddGroupDto;
import com.mysms.daomodel.MessageSendingDao;
import com.mysms.seefriendlist.controller.SeeFriendList;
import com.mysms.seegrouplist.controller.SeeGroupList;
import com.mysms.menu.controller.MenuManagement;
import com.mysms.utility.SendEmail;

@Controller
public class ComposeMessage
{
		@RequestMapping("/compose")
		public String compose_message()
		{
			return "user_compose_message";
		}
		
		@ResponseBody
		@RequestMapping(value="/ComposeMsg", method = RequestMethod.POST)
		public byte sendMyMessage(HttpServletRequest request, @RequestBody MessageSendingDao p)
		{
			try {
				HttpSession session = request.getSession();
				p.setEmail(session.getAttribute("email").toString());
				Configuration cfg = new Configuration();
				cfg.configure("hibernate.cfg.xml");
				SessionFactory ss = cfg.buildSessionFactory();
				Session s = ss.openSession();
				s.save(p);
				s.beginTransaction().commit();
  				SendEmail sm = new SendEmail();
  				sm.mail(p.getReceiver(), p.getMessage_body());
			    return 1;
			} 
		    catch(Exception e) {
		    	e.printStackTrace();
		     }
			return 0;
		}
}