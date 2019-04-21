package com.edu.banhang.service;

import com.edu.banhang.model.MyItem;
import java.util.Date;
import java.util.List;


public interface ReportService {

    List<MyItem> reportReceipt(Date date, int limit);
    
}
