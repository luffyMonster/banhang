package com.edu.banhang.service.impl;

import com.edu.banhang.model.ReceiptItem;
import com.edu.banhang.repository.ProductRepository;
import com.edu.banhang.repository.ReceiptItemRepository;
import com.edu.banhang.service.ReceiptItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReceiptItemServiceImpl implements ReceiptItemService {

    @Autowired
    private ReceiptItemRepository receiptItemRepository;

    @Autowired
    private ProductRepository productRepository;

    @Override
    public ReceiptItem save(ReceiptItem object) {
        ReceiptItem item = receiptItemRepository.save(object);
        item.setProduct(productRepository.findOne(item.getProduct().getId()));
        return item;
    }

    @Override
    public void delete(ReceiptItem object) {
         receiptItemRepository.delete(object.getId());
    }

    @Override
    public ReceiptItem findById(long receiptItemId) {
        ReceiptItem item = receiptItemRepository.findOne(receiptItemId);
        item.setProduct(productRepository.findOne(item.getProduct().getId()));
        return item;
    }

    @Override
    public List<ReceiptItem> getListByReceipt(long receiptId) {
        List<ReceiptItem> itemList = receiptItemRepository.getListByReceipt(receiptId);
        itemList.forEach(item -> item.setProduct(productRepository.findOne(item.getProduct().getId())));
        return itemList;
    }
}
