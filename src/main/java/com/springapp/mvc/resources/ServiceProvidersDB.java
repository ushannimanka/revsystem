package com.springapp.mvc.resources;

import com.springapp.mvc.DataAccessObjects.JobLogDAO;
import com.springapp.mvc.DataAccessObjects.ServiceProviderDAO;
import com.springapp.mvc.helpers.serviceProvider;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.List;


public class ServiceProvidersDB {

    ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
    ServiceProviderDAO spDAO = (ServiceProviderDAO) context.getBean("serviceProvider");
    JobLogDAO jobDao=(JobLogDAO) context.getBean("JobsDAO");
   List<serviceProvider> sp = spDAO.readAll();




}
