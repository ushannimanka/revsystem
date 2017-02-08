package com.springapp.mvc;

import com.springapp.mvc.DataAccessObjects.JobLogDAO;
import com.springapp.mvc.DataAccessObjects.ServiceProviderDAO;
import com.springapp.mvc.helpers.APIResponse;
import com.springapp.mvc.helpers.Jobs;
import com.springapp.mvc.helpers.JobsLog;
import com.springapp.mvc.helpers.serviceProvider;
import com.springapp.mvc.resources.SPhelper;
import com.springapp.mvc.resources.Utility;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.BufferedOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/")
public class SPController {


	@RequestMapping(value ="/Dashboard",method = RequestMethod.GET)
	public ModelAndView printWelcomeSBC() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");

		return mav;
	}

	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	public ModelAndView
	  uploadFileHandler(@RequestParam("file") MultipartFile file) throws FileNotFoundException {

		ModelAndView mav = new ModelAndView();
		if (!file.isEmpty()) {
			try {
				byte[] bytes = file.getBytes();

				// Creating the directory to store file
				/*String rootPath = System.getProperty("catalina.home");*/
				String rootPath ="F:";
				java.io.File dir = new java.io.File(rootPath + java.io.File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();

				// Create the file on server
				java.io.File serverFile = new java.io.File(dir.getAbsolutePath() + java.io.File.separator +"Fs");
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

                System.out.println(stream);
                System.out.println(serverFile);

			} catch (Exception e) {
				mav.setViewName(e.getMessage());
				return mav;
			}


		} else {
			mav.setViewName("emptyFile");
			return mav;
		}

		try {


			SPhelper fRW = new SPhelper();
			List<String[]> spList= fRW.fileRead();
            System.out.println(spList);



			if(spList==null){
				mav.setViewName("errorRead");
				return mav;
			}

			if(!(fRW.updateSPTable(spList))){
				mav.setViewName("errorSQL");
				return mav;

			}


		}catch (Exception e){
			System.out.print(e.getMessage());
			mav.setViewName("errorUnknown");
			return mav;
		}

		/*ModelAndView mav = new ModelAndView();
		mav.setViewName("upload");
		return mav;*/
		String Url="/Dashboard#/sp_list";
		return new ModelAndView("redirect:" + Url);
	}

  /*  @RequestMapping(value ="/spLog",method = RequestMethod.GET)
     public ModelAndView printLog(@RequestParam (value = "jobNumber") String jobNumber) {
        ModelAndView mav = new ModelAndView();

		SPhelper fRW= new SPhelper();
		fRW.revenueLog(fRW.fileRead(),jobNumber);

		mav.setViewName("index");

        return mav;
    }*/
/*
    @RequestMapping(value ="/clearLog",method = RequestMethod.GET)
    public ModelAndView clearLog(@RequestParam (value = "jobNumber") String jobNumber) {
        ModelAndView mav = new ModelAndView();
        SPhelper fRW= new SPhelper();
        fRW.deleteLog(fRW.fileRead());
        mav.setViewName("index");

        return mav;
    }*/
/*
	@RequestMapping(value ="/credit",method = RequestMethod.GET)
	public ModelAndView clearLog(@RequestParam (value = "filterNum") Double filterNum) {
		ModelAndView mav = new ModelAndView();
		SPhelper fRW= new SPhelper();
		//fRW.(fRW.fileRead());
		mav.setViewName("index");

		return mav;
	}*/



	@RequestMapping(value ="/filter",method = RequestMethod.GET)
	public @ResponseBody APIResponse filter(@RequestParam (value = "filterNum") Double filterNum) {


        System.out.println(filterNum);
        try{

		ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
		ServiceProviderDAO spDAO = (ServiceProviderDAO) context.getBean("serviceProvider");
		APIResponse apiResponse = new APIResponse();


		List<serviceProvider> filteredList = spDAO.filterSP(filterNum);



		if (filteredList.size() == 0) {
			apiResponse.setHasError(true);
			apiResponse.setErrorCode(204);
			apiResponse.setErrorMessage("No Content");

		} else if(filteredList.equals(null)) {

			apiResponse.setHasError(true);
			apiResponse.setErrorCode(205);
			apiResponse.setErrorMessage("Unknown Error");

		}
		else {
			apiResponse.setResponseData(filteredList);
		}

		return apiResponse;

	}catch (Exception e){
		return null;
	}


	}


    @RequestMapping(value ="/filterpdf",method = RequestMethod.GET)
    public @ResponseBody APIResponse filterPDF(@RequestParam (value = "spid") Double spid) {


       // System.out.println(spId);

        try{

            ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
            ServiceProviderDAO spDAO = (ServiceProviderDAO) context.getBean("serviceProvider");
            APIResponse apiResponse = new APIResponse();


            List<serviceProvider> filteredList = spDAO.filterSP(spid);



            if (filteredList.size() == 0) {
                apiResponse.setHasError(true);
                apiResponse.setErrorCode(204);
                apiResponse.setErrorMessage("No Content");

            } else if(filteredList.equals(null)) {

                apiResponse.setHasError(true);
                apiResponse.setErrorCode(205);
                apiResponse.setErrorMessage("Unknown Error");

            }
            else {
                apiResponse.setResponseData(filteredList);
            }

            return apiResponse;

        }catch (Exception e){
            return null;
        }


    }


	@RequestMapping(value ="/credit",method = RequestMethod.GET)
	public @ResponseBody APIResponse credit(@RequestParam (value = "creditNum") Double filterNumber) {


		try {
			ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
			ServiceProviderDAO spDAO = (ServiceProviderDAO) context.getBean("serviceProvider");
			JobLogDAO jobDAO = (JobLogDAO) context.getBean("jobLogDAO");
			Utility util = new Utility();

			ArrayList<Jobs> job = new ArrayList<Jobs>();

			APIResponse apiResponse = new APIResponse();


			List<serviceProvider> filteredList = spDAO.filterSP(filterNumber);
			if (filteredList.equals(null)) {
				apiResponse.setHasError(true);
				apiResponse.setErrorCode(205);
				apiResponse.setErrorMessage("Unknown Error");
				return apiResponse;
			}
			if (!(jobDAO.createJob(util.getCurrentTimeStamp(), "CREDIT"))) {
				apiResponse.setHasError(true);
				apiResponse.setErrorCode(206);
				apiResponse.setErrorMessage("SQL Error");
				return apiResponse;
			}

			job = jobDAO.getLastEntry();

			if (job.equals(null)) {
				apiResponse.setHasError(true);
				apiResponse.setErrorCode(206);
				apiResponse.setErrorMessage("SQL Error");
				return apiResponse;
			}

			Integer jobNum = job.get(0).getJOB_ID();

			if (filteredList.size() > 0) {
				for (int i = 0; i < filteredList.size(); i++) {

					if (!(spDAO.updateSPBalance(filteredList.get(i).getId(), 0))) {

						apiResponse.setHasError(true);
						apiResponse.setErrorCode(206);
						apiResponse.setErrorMessage("SQL Error");
						return apiResponse;
					}


					if (!(jobDAO.createJobLog(util.getCurrentTimeStamp(), jobNum, filteredList.get(i).getId(),
							filteredList.get(i).getCurrent_balance(), "CREDIT"))) {
						apiResponse.setHasError(true);
						apiResponse.setErrorCode(206);
						apiResponse.setErrorMessage("SQL Error");
						return apiResponse;
					}


					if (!(jobDAO.balanceLog(jobNum, util.getCurrentTimeStamp(), filteredList.get(i).getId(), filteredList.get(i).getUsername(), 0.00))) {
						apiResponse.setHasError(true);
						apiResponse.setErrorCode(206);
						apiResponse.setErrorMessage("SQL Error");
						return apiResponse;
					}
				}

				apiResponse.setResponseData(filteredList);
			} else {
				apiResponse.setHasError(true);
				apiResponse.setErrorCode(204);
				apiResponse.setErrorMessage("No Content");
			}


			return apiResponse;
		} catch (Exception e) {
			return null;
		}
	}

	@RequestMapping(value = "/showLog", method = RequestMethod.GET)
	public @ResponseBody APIResponse getData() {
		ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
		ServiceProviderDAO spDAO = (ServiceProviderDAO) context.getBean("serviceProvider");

		List<serviceProvider> list = spDAO.readAll();
		APIResponse apiResponse= new APIResponse();


		if(list.size()>0) {
			apiResponse.setResponseData(list);
		}else{
			apiResponse.setHasError(true);
			apiResponse.setErrorCode(204);
			apiResponse.setErrorMessage("No Content");
		}


		return apiResponse;

		//return back to index.jsp
	/*	ModelAndView model = new ModelAndView("index");
		model.addObject("lists", list);

		return model;*/

	}


    @RequestMapping(value = "/loghistory", method = RequestMethod.GET)
    public @ResponseBody APIResponse getjobData() {
        ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
        JobLogDAO jbDAO = (JobLogDAO) context.getBean("jobLogDAO");


        List<Jobs> list = jbDAO.getAllJobs();
        APIResponse apiResponse= new APIResponse();


        if(list.size()>0) {
            apiResponse.setResponseData(list);
        }else{
            apiResponse.setHasError(true);
            apiResponse.setErrorCode(204);
            apiResponse.setErrorMessage("No Content");
        }


        return apiResponse;

        //return back to index.jsp
	/*	ModelAndView model = new ModelAndView("index");
		model.addObject("lists", list);

		return model;*/

    }


    @RequestMapping(value ="/jobSearch",method = RequestMethod.GET)
    public @ResponseBody APIResponse jobSearch(@RequestParam (value = "spid") int spid) {


        // System.out.println(spId);

        try{

            ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
            JobLogDAO jbDAO = (JobLogDAO) context.getBean("jobLogDAO");
            APIResponse apiResponse = new APIResponse();


            List<JobsLog> filteredList = jbDAO.jobsearch(spid);



            if (filteredList.size() == 0) {
                apiResponse.setHasError(true);
                apiResponse.setErrorCode(204);
                apiResponse.setErrorMessage("No Content");

            } else if(filteredList.equals(null)) {

                apiResponse.setHasError(true);
                apiResponse.setErrorCode(205);
                apiResponse.setErrorMessage("Unknown Error");

            }
            else {
                apiResponse.setResponseData(filteredList);
            }

            return apiResponse;

        }catch (Exception e){
            return null;
        }


    }


}

