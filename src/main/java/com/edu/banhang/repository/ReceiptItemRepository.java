package com.edu.banhang.repository;

import com.edu.banhang.model.ReceiptItem;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface ReceiptItemRepository  extends PagingAndSortingRepository<ReceiptItem, Long> {
    List<ReceiptItem> getListByReceipt(long receiptId);
}
