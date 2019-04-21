package com.edu.banhang.repository;

import com.edu.banhang.model.MyItem;
import com.edu.banhang.model.Receipt;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.Date;
import java.util.List;

public interface ReceiptRepository extends PagingAndSortingRepository<Receipt, Long> {
    List<MyItem> reportReceipt(Date date, int limit);
}
