package com.springapp.mvc.helpers;


public class Jobs {
    Integer JOB_ID;
    String TIMESTAMP;
    String DESCRIPTION;

    public Integer getJOB_ID() {
        return JOB_ID;
    }

    public void setJOB_ID(Integer JOB_ID) {
        this.JOB_ID = JOB_ID;
    }

    public String getTIMESTAMP() {
        return TIMESTAMP;
    }

    public void setTIMESTAMP(String TIMESTAMP) {
        this.TIMESTAMP = TIMESTAMP;
    }

    public String getDESCRIPTION() {
        return DESCRIPTION;
    }

    public void setDESCRIPTION(String DESCRIPTION) {
        this.DESCRIPTION = DESCRIPTION;
    }
}
