package com.edu.banhang.service;

import com.edu.banhang.model.Receipt;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface ReceiptService {
    Receipt save(Receipt object);

    void delete(Receipt object);

    Receipt findById(long receiptId);

    List<Receipt> getAll();

    Page<Receipt> findAll(Pageable pageable);
}
