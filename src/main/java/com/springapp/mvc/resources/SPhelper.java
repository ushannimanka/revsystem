package com.springapp.mvc.resources;

import com.springapp.mvc.DataAccessObjects.JobLogDAO;
import com.springapp.mvc.DataAccessObjects.ServiceProviderDAO;
import com.springapp.mvc.helpers.Jobs;
import com.springapp.mvc.helpers.serviceProvider;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.*;
import java.util.*;


public class SPhelper {

    //   BufferedReader br = null;

    public List<String[]> fileRead() {


        ArrayList<String[]> spList = new ArrayList<String[]>();


        try {
            String sStartLine = "date,sp_id,sp_name,bank_code,branch_code,bank,account_number,total_revenue";
            String sCurrentLine;

           /* String rootPath = System.getProperty("catalina.home");*/
            String rootPath ="F:";
            BufferedReader br = new BufferedReader(new FileReader( rootPath+"Fs"));

            //RevenueTemp

            System.out.println(spList);

            while ((sCurrentLine = br.readLine()) != null) {

                if (sCurrentLine.equals(sStartLine)) {
                    continue;
                }
                if (sCurrentLine.equals(null)) {
                    break;
                }


                String[] words = sCurrentLine.split(",");
                spList.add(words);

                }

        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        System.out.println(spList);
        return spList;

    }


    public boolean updateSPTable(List<String[]> spList) {


        try {
            ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
            ServiceProviderDAO spDAO = (ServiceProviderDAO) context.getBean("serviceProvider");
            JobLogDAO jobDAO = (JobLogDAO) context.getBean("jobLogDAO");
            Utility util = new Utility();

            ArrayList<Jobs> job = new ArrayList<Jobs>();

            System.out.println(job);

            serviceProvider currentSP;
            double newBalance = 0;
            int count = 0;

            boolean x = jobDAO.createJob(util.getCurrentTimeStamp(), "DEBIT");
            if (!x) {
                return false;
            }

            job = jobDAO.getLastEntry();
            if (job.equals(null)) {
                return false;

            } else {
                Integer jobNum = job.get(0).getJOB_ID();
                for (int k = 0; k < spList.size(); k++) {

                    System.out.println(spList.get(k)[1]);
                    System.out.println(spList.size());
                    if (spDAO.check(spList.get(k)[1]) > 0) {
                        currentSP = spDAO.getSP(spList.get(k)[1]);
                        if (currentSP.equals(null)) {
                            return false;
                        }
                        newBalance = currentSP.getCurrent_balance() + Double.parseDouble(spList.get(k)[7]);
                        if (!(spDAO.updateSPBalance(spList.get(k)[1], newBalance))) {
                            return false;
                        }

                        if (!(jobDAO.createJobLog(util.getCurrentTimeStamp(), jobNum, spList.get(k)[1],
                                Double.parseDouble(spList.get(k)[7]), "DEBIT"))) {
                            return false;
                        }

                        if (!(jobDAO.balanceLog(jobNum, util.getCurrentTimeStamp(), spList.get(k)[1], spList.get(k)[2], newBalance))) {
                            return false;
                        }


                    } else {
                        if (!(spDAO.create(spList.get(k)[0], spList.get(k)[1],spList.get(k)[2], spList.get(k)[3],spList.get(k)[4], spList.get(k)[5],spList.get(k)[6], Double.parseDouble(spList.get(k)[7])))) {
                            System.out.println(spList);
                            return false;
                        }
                        if (!(jobDAO.createJobLog(util.getCurrentTimeStamp(), jobNum, spList.get(k)[1], Double.parseDouble(spList.get(k)[7]), "DEBIT"))) {
                            return false;
                        }
                        if (!(jobDAO.balanceLog(jobNum, util.getCurrentTimeStamp(), spList.get(k)[1], spList.get(k)[2], newBalance))) {
                            return false;
                        }
                    }


               /* SPhelper userFile = new SPhelper("E://User Accounts//" + spList.get(k)[0] + ".txt");
                if (!userFile.exists()) {
                    if (!spList.get(k)[0].equals(null)) {
                        spDAO.create(spList.get(k)[0], spList.get(k)[1], Double.parseDouble(spList.get(k)[2]));
                        userFile.createNewFile();
                        //System.out.println("exists");
                        FileWriter fw = new FileWriter(userFile.getAbsoluteFile());
                        BufferedWriter bw = new BufferedWriter(fw);
                        bw.write("Received Cash " + spList.get(k)[2]);
                        bw.write(System.getProperty("line.separator"));
                        bw.close();
                    }

                } else {
                    if (!spList.get(k)[0].equals(null)) {

                        newBalance = currentSP.getCurrent_balance() + Double.parseDouble(spList.get(k)[2]);
                        spDAO.updateSPBalance(spList.get(k)[0], newBalance);
                        FileWriter fw = new FileWriter(userFile.getAbsoluteFile(), true);
                        BufferedWriter bw = new BufferedWriter(fw);
                        bw.write("Received Cash " + spList.get(k)[2]);
                        bw.write(System.getProperty("line.separator"));
                        bw.close();
                    }
                }*/
                    System.out.println(count);
                    count++;


                }

            }

            return true;
        } catch (Exception e) {
            System.out.print(e.getMessage());
            return false;
        }

    }
  /*  public void deleteLog(List<String[]> spList){

        for (int k = 0; k < spList.size(); k++) {

            try {
               *//* String rootPath = System.getProperty("catalina.home");*//*
                String rootPath ="E:";
                RandomAccessFile f = new RandomAccessFile(rootPath+"//User Accounts//" + spList.get(k)[0] + ".txt", "rw");

                long length = f.length() - 1;
                byte b;
                do {
                    length -= 1;
                    f.seek(length);
                    b = f.readByte();
                } while (b != 10);
                f.setLength(length + 1);
                f.close();
            }
            catch (IOException e){

            }
        }
    }

    public void revenueLog(List<String[]> spList,String jobNum) {

        for (int k = 0; k < spList.size(); k++) {
            try {
               *//* String rootPath = System.getProperty("catalina.home");*//*
                String rootPath ="E:";
                SPhelper userFile = new SPhelper(rootPath+"//User Accounts//" + spList.get(k)[0] + ".txt");
                if (!userFile.exists()) {
                    if (!spList.get(k)[0].equals(null)) {

                        userFile.createNewFile();
                        //System.out.println("exists");
                        FileWriter fw = new FileWriter(userFile.getAbsoluteFile());
                        BufferedWriter bw = new BufferedWriter(fw);
                        bw.write("Job number "+jobNum+" Received Cash " + spList.get(k)[2]);
                        bw.write(System.getProperty("line.separator"));
                        bw.close();
                    }

                } else {
                    if (!spList.get(k)[0].equals(null)) {


                        FileWriter fw = new FileWriter(userFile.getAbsoluteFile(), true);
                        BufferedWriter bw = new BufferedWriter(fw);
                        bw.write("Job number "+jobNum+" Received Cash " + spList.get(k)[2]);
                        bw.write(System.getProperty("line.separator"));
                        bw.close();
                    }
                }
            } catch (IOException e) {

            }

        }

    }

*/
    public List<serviceProvider> filter(double filterNum){

        ApplicationContext context = new ClassPathXmlApplicationContext("Spring-Module.xml");
        ServiceProviderDAO spDAO = (ServiceProviderDAO) context.getBean("serviceProvider");


        List<serviceProvider> filteredList = spDAO.filterSP(filterNum);


        /*for (int k = 0; k < spList.size(); k++) {
           if(sp.getCurrent_balance()>=filterNum){
               filteredSP[0]=sp.getId();
               filteredSP[1]=sp.getUsername();
               filteredSP[2]="(sp.getCurrent_balance())";
               filteredList.add(filteredSP);
           }
        }*/
    return filteredList;}



}







