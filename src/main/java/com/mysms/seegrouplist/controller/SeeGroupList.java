package com.mysms.seegrouplist.controller;
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
import com.mysms.menu.controller.MenuManagement;

@Controller
public class SeeGroupList
{
	@ResponseBody
	@RequestMapping(value="/MyGroupListData" , method = RequestMethod.POST)
	public List<AddGroupDto> checkGroups(HttpServletRequest request)
	{
		try
		{
			HttpSession session = request.getSession();
			String email = session.getAttribute("email").toString();
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory ss = cfg.buildSessionFactory();
			Session s = ss.openSession();
			Criteria cc = s.createCriteria(AddGroupDto.class);
			cc.add(Restrictions.eq("email",email));
			List<AddGroupDto>p = cc.list();
			return p;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@ResponseBody
	@RequestMapping(value="/delGrp",method = RequestMethod.POST)
	public byte delGroup(@RequestBody AddGroupDto dd)
	{
		try {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory ss = cfg.buildSessionFactory();
			Session s = ss.openSession();
			s.delete(dd);
			s.beginTransaction().commit();
			return 1;
		}
		catch(Exception e) {
			 e.printStackTrace();	
		}
		return 0;
	}
	
	@ResponseBody
	@RequestMapping(value="/deleteFriend",method = RequestMethod.POST)
	public byte delFriend(@RequestBody AddGroupDto dd2)
	{
		try {
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory ss = cfg.buildSessionFactory();
			Session s = ss.openSession();
			s.update(dd2);
			s.beginTransaction().commit();
			return 1;
		}
		catch(Exception e) {
			 e.printStackTrace();	
		}
		return 0;
	}
}