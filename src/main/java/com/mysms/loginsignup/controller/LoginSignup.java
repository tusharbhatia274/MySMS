package com.mysms.loginsignup.controller;
import java.util.*;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.condition.RequestMethodsRequestCondition;

import com.mysms.daomodel.LoginSignupDao;
import com.mysms.daomodel.MenuDao;
import com.mysms.dtomodel.AddFriendDto;
import com.mysms.utility.SendEmail;

@Controller
public class LoginSignup
{
	@RequestMapping("/home")
	public String login()
	{
		return "user_login";
	}
	
	@RequestMapping("/reg")
	public String signup()
	{
		return "user_register";
	}
	
	@RequestMapping("/homepg")
	public String homepage()
	{
		return "user_homepage";
	}
	
	@RequestMapping("/viewfriendlist")
	public String frndlist()
	{
		return "user_friendlist";
	}
	
	@RequestMapping("/viewgrouplist")
	public String grplist()
	{
		return "user_grouplist";
	}
	
	@ResponseBody
	@RequestMapping(value="/registerData")
	public byte add_user(@RequestBody LoginSignupDao p)
	{
		try {
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
	
	@ResponseBody
	@RequestMapping(value="/getLoginData" , method = RequestMethod.POST)
	public byte check_user(HttpServletRequest request , @RequestBody LoginSignupDao q )
	{
		try
		{
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory ss = cfg.buildSessionFactory();
			Session s = ss.openSession();
			Criteria cc = s.createCriteria(LoginSignupDao.class);
			List<LoginSignupDao>p = cc.list();
			int flag=0;
			for(int i=0;i<p.size();i++) {
				if(p.get(i).getUsername().equals(q.getUsername()) && p.get(i).getPassword().equals(q.getPassword())) {
					flag=1;
				    HttpSession session = request.getSession();
				    session.setAttribute("email",p.get(i).getEmail());
				}
			}
	         if(flag==1) {
	        	 return 1;
	         }
	         else {
	        	 return 0 ;
	         }
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
}
