package com.edu.banhang.service.impl;

import com.edu.banhang.model.MyItem;
import com.edu.banhang.repository.ReceiptRepository;
import com.edu.banhang.service.ReportService;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

@Service
public class ReportServiceImpl implements ReportService {

    ReceiptRepository receiptRepository;

    public ReportServiceImpl(ReceiptRepository receiptRepository) {
        this.receiptRepository = receiptRepository;
    }

    @Override
    public List<MyItem> reportReceipt(Date date, int limit) {
        return receiptRepository.reportReceipt(date, limit);
    }
}
