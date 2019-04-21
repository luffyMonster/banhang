package com.edu.banhang.service.impl;

import com.edu.banhang.model.ReceiptItem;
import com.edu.banhang.repository.ReceiptItemRepository;
import com.edu.banhang.service.ReceiptItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReceiptItemServiceImpl implements ReceiptItemService {

    @Autowired
    private ReceiptItemRepository receiptItemRepository;

    @Override
    public ReceiptItem save(ReceiptItem object) {
        return receiptItemRepository.save(object);
    }

    @Override
    public void delete(ReceiptItem object) {
         receiptItemRepository.delete(object.getId());
    }

    @Override
    public ReceiptItem findById(long receiptItemId) {
        return receiptItemRepository.findOne(receiptItemId);
    }

    @Override
    public List<ReceiptItem> getListByReceipt(long receiptId) {
        return receiptItemRepository.getListByReceipt(receiptId);
    }
}
