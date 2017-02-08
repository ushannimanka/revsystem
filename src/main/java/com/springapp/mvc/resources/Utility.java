package com.springapp.mvc.resources;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Utility {


    public  String getCurrentTimeStamp()
    {
        Date dt = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return  sdf.format(dt);
    }
}
