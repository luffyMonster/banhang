package com.edu.banhang.service.impl;

import com.edu.banhang.model.Receipt;
import com.edu.banhang.repository.ReceiptItemRepository;
import com.edu.banhang.repository.ReceiptRepository;
import com.edu.banhang.service.ReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ReceiptServiceImpl implements ReceiptService {

    private ReceiptRepository receiptRepository;

    private ReceiptItemRepository receiptItemRepository;

    @Autowired
    public ReceiptServiceImpl(ReceiptRepository receiptRepository, ReceiptItemRepository receiptItemRepository) {
        this.receiptRepository = receiptRepository;
        this.receiptItemRepository = receiptItemRepository;
    }

    @Override
    public Receipt save(Receipt object) {
        Receipt receipt = receiptRepository.save(object);
        receipt.setListReceiptItem(receiptItemRepository.getListByReceipt(receipt.getId()));
        return receipt;
    }

    @Override
    public void delete(Receipt object) {
        receiptRepository.delete(object.getId());
    }

    @Override
    public Receipt findById(long receiptId) {
        Receipt receipt = receiptRepository.findOne(receiptId);
        receipt.setListReceiptItem(receiptItemRepository.getListByReceipt(receipt.getId()));
        return receipt;
    }

    @Override
    public List<Receipt> getAll() {
        List<Receipt> receipts = new ArrayList<>();
        receiptRepository.findAll().forEach(receipts::add);
        receipts.forEach(receipt -> receipt.setListReceiptItem(receiptItemRepository.getListByReceipt(receipt.getId())));
        return receipts;
    }

    public Page<Receipt> findAll(Pageable pageable){
        Page<Receipt> receiptPage = receiptRepository.findAll(pageable);
        receiptPage.getContent().forEach(receipt -> receipt.setListReceiptItem(receiptItemRepository.getListByReceipt(receipt.getId())));
        return receiptPage;
    }
}
