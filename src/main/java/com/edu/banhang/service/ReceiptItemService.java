package com.edu.banhang.service;

import com.edu.banhang.model.ReceiptItem;

import java.util.List;

public interface ReceiptItemService {

    ReceiptItem save(ReceiptItem object);

    void delete(ReceiptItem object);

    ReceiptItem findById(long receiptItemId);

    List<ReceiptItem> getListByReceipt(long receiptId);
}
