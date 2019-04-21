package com.edu.banhang.controller;

import com.edu.banhang.model.MyItem;
import com.edu.banhang.service.ReportService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/admin")
public class ManagerController {

    private ReportService reportService;



    @GetMapping(value = "/home")
    public String adminHome() {
        return "redirect:/admin/product/list";
    }

    @RequestMapping(value = "/report/receipt", method = RequestMethod.GET)
    public String viewReceipt(ModelMap mm) {
        Date date = new Date();
        List<MyItem> listItem = reportService.reportReceipt(date, 10);
        mm.put("listReceipt", listItem);
        return "admin/report-receipt";
    }

}
