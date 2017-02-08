package com.springapp.mvc.DataAccessObjects;

import javax.sql.DataSource;

import com.springapp.mvc.helpers.serviceProvider;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;


public class ServiceProviderDAOimpl implements ServiceProviderDAO{
    private DataSource dataSource;
    private JdbcTemplate jdbcTemplateObject;

    public List<serviceProvider> readAll() {
        String sql = "SELECT * FROM tbl_sp";
        try {


            List<serviceProvider> users = jdbcTemplateObject.query(sql,
                    new BeanPropertyRowMapper(serviceProvider.class));
            return users;
        }catch (Exception e){
            System.out.print(e.getMessage());
            
            return null;
        }
    }

    public List<serviceProvider> filterSP (Double filterNum){
        try {
            String sql = "SELECT * FROM tbl_sp where current_balance >= ?";


            List<serviceProvider> sp = jdbcTemplateObject.query(sql, new Object[]{filterNum},
                    new BeanPropertyRowMapper(serviceProvider.class));
            return sp;
        }

        catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

    }


    public List<serviceProvider> filterSPpDf (Double filterNum){
        try {
            String sql = "SELECT * FROM tbl_sp where current_balance >= ?";


            List<serviceProvider> sp = jdbcTemplateObject.query(sql, new Object[]{filterNum},
                    new BeanPropertyRowMapper(serviceProvider.class));
            return sp;
        }

        catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

    }




    public void setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        this.jdbcTemplateObject = new JdbcTemplate(dataSource);
    }

    public boolean createJob(String timestamp, String description) {
        String sql = "INSERT INTO tbl_jobs ( TIMESTAMP, DESCRIPTION) VALUES ( ?, ?)";
        try {


            int effectedRows=jdbcTemplateObject.update(sql,timestamp,description);

            return effectedRows>0;

        } catch (Exception ex) {

            System.out.println(ex.getMessage());
            return false;
        }

    }


    public int check(String id) {
        String sql = "SELECT COUNT(*) FROM tbl_sp where id= ?";

        try {
            int total = jdbcTemplateObject.queryForInt(sql, id);

            return total;

        } catch (Exception e) {
            System.out.print(e.getMessage());
            return Integer.parseInt(null);
        }
    }


    public boolean create(String date,String id, String username,String bank_code, String branch_code,String bank,String account_number, double balance) {
        String sql = "INSERT INTO tbl_sp (date, id, username,bank_code,branch_code,bank ,account_number,current_balance) VALUES (?, ?, ?,?,?,?,?,?)";
        try {


            int effectedRows = jdbcTemplateObject.update(sql,date, id, username,bank_code,branch_code,bank,account_number, balance);

            return effectedRows > 0;

        } catch (Exception e) {

            System.out.print(e.getMessage());
            return false;

        }
    }


    public serviceProvider getSP (String id){
        try {
            String sql = "SELECT * FROM tbl_sp where id= ?";
            serviceProvider sp = (serviceProvider) jdbcTemplateObject.queryForObject(sql, new Object[]{id},
                    new BeanPropertyRowMapper(serviceProvider.class));
            return sp;
        }

        catch(Exception e) {
            System.out.println(e.getMessage());
            return null;
        }

    }
    public boolean updateSPBalance(String id, double balance) {

        String sql = "UPDATE tbl_sp SET current_balance=? WHERE id= ?";

        try {
            int isAvailable = jdbcTemplateObject.update(sql, balance, id);

            return isAvailable > 0;

        } catch (Exception e) {
            System.out.print(e.getMessage());
            return false;
        }
    }



    public boolean creditSPBalance(serviceProvider id){

        String sql= "UPDATE tbl_sp SET current_balance=? WHERE id= ?";

       try{
        int isAvailable=jdbcTemplateObject.update(sql, id);

        return isAvailable>0;

        } catch (Exception e) {
        System.out.print(e.getMessage());
        return false;
        }
    }




}
