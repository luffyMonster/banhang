package com.edu.banhang.repository.impl;

import com.edu.banhang.model.Product;
import com.edu.banhang.model.Receipt;
import com.edu.banhang.model.ReceiptItem;
import com.edu.banhang.repository.ReceiptItemRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.edu.banhang.constant.DBConstants.*;

@Repository
public class JDBCReceiptItemRepository extends AbstractJdbcRepository<ReceiptItem, Long> implements ReceiptItemRepository {

    @Override
    public void initialize() {
        this.tableName = RECEIPT_ITEM;
        this.idColumn = RECEIPT_ITEM_ID;
        this.rowMapper = (resultSet, i) -> {
            ReceiptItem receiptItem = new ReceiptItem();
            receiptItem.setId(resultSet.getLong(RECEIPT_ITEM_ID));
            receiptItem.setReceiptItemPrice(resultSet.getBigDecimal(RECEIPT_ITEM_PRICE));
            receiptItem.setReceiptItemQuantity(resultSet.getInt(RECEIPT_ITEM_QUANTITY));
            receiptItem.setProduct(new Product(resultSet.getLong(PRODUCT_ID)));
            receiptItem.setReceipt(new Receipt(resultSet.getLong(RECEIPT_ID)));

            return receiptItem;
        };

        this.updater = (receipt, mapping) -> {
            mapping.put(RECEIPT_ITEM_ID, receipt.getId());
            mapping.put(RECEIPT_ID,  receipt.getReceipt().getId());
            mapping.put(PRODUCT_ID, receipt.getProduct().getId());
            mapping.put(RECEIPT_ITEM_PRICE, receipt.getReceiptItemPrice());
            mapping.put(RECEIPT_ITEM_QUANTITY, receipt.getReceiptItemQuantity());
        };
        afterPropertiesSet();
    }

    @Override
    public List<ReceiptItem> getListByReceipt(long receiptId) {
        Map<String, Object> columns = new HashMap<>();
        columns.put(RECEIPT_ID, receiptId);
        return findBy(columns);
    }
}
