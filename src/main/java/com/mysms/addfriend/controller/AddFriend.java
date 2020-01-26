package com.mysms.addfriend.controller;
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
import com.mysms.menu.controller.MenuManagement;

@Controller
public class AddFriend
{
	@RequestMapping("/addfriend")
	public String add_friend()
	{
		return "user_add_friend";
	}
	
	@ResponseBody
	@RequestMapping(value="/FriendListData")
	public byte add_new_friend(HttpServletRequest request, @RequestBody AddFriendDto p)
	{
		try {
			HttpSession session = request.getSession();
			String email = session.getAttribute("email").toString();
			p.setEmail(email);
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory ss = cfg.buildSessionFactory();
			Session s = ss.openSession();
			s.save(p);
			s.beginTransaction().commit();
		    return 1;
		} 
	    catch(Exception e) {
	    	e.printStackTrace();
	     }
		return 0;
	}
}
