package com.mysms.menu.controller;
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
import com.mysms.dtomodel.AddFriendDto;
import com.mysms.daomodel.MenuDao;

@Controller
public class MenuManagement
{
	@ResponseBody
	@RequestMapping(value="/getMyMenuData" , method = RequestMethod.POST)
	public List<MenuDao> fetch_menu()
	{
		try
		{
			Configuration cfg = new Configuration();
			cfg.configure("hibernate.cfg.xml");
			SessionFactory ss = cfg.buildSessionFactory();
			Session s = ss.openSession();
			Criteria cc = s.createCriteria(MenuDao.class);
			List<MenuDao>p = cc.list();
			return p;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}	
}
