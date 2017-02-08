package com.springapp.mvc.DataAccessObjects;

import com.springapp.mvc.helpers.serviceProvider;

import javax.sql.DataSource;
import java.util.List;

public interface ServiceProviderDAO {
    public void setDataSource(DataSource ds);
    public boolean create(String date,String id, String username,String bank_code,String branch_code,String bank,String account_number, double balance);
    public serviceProvider getSP(String id);
    public boolean updateSPBalance(String id,double balance);
    List<serviceProvider> readAll();
    int check(String id);
    public List<serviceProvider> filterSP (Double filterNum);
    public boolean creditSPBalance(serviceProvider id);
    public boolean createJob(String timestamp, String description);
}
