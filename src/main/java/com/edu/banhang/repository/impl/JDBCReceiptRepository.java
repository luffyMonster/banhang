package com.edu.banhang.repository.impl;

import com.edu.banhang.model.MyItem;
import com.edu.banhang.model.Receipt;
import com.edu.banhang.repository.ReceiptRepository;
import com.edu.banhang.repository.common.AbstractJdbcRepository;
import org.springframework.stereotype.Repository;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

import static com.edu.banhang.constant.DBConstants.*;

@Repository
public class JDBCReceiptRepository extends AbstractJdbcRepository<Receipt, Long> implements ReceiptRepository {

    @Override
    public void initialize() {
        this.tableName = RECEIPT;
        this.idColumn = RECEIPT_ID;
        this.rowMapper = (resultSet, i) -> {
            Receipt receipt = new Receipt();
            receipt.setId(resultSet.getLong(RECEIPT_ID));
            receipt.setReceiptStatus(resultSet.getBoolean(RECEIPT_STATUS));
            receipt.setReceiptDate(resultSet.getTimestamp(RECEIPT_DATE));
            receipt.setReceiptAddress(resultSet.getString(RECEIPT_ADDRESS));
            receipt.setReceiptName(resultSet.getString(RECEIPT_NAME));
            receipt.setListReceiptItem(new ArrayList<>());
            return receipt;
        };

        this.updater = (receipt, mapping) -> {
            mapping.put(RECEIPT_ID, receipt.getId());
            mapping.put(RECEIPT_STATUS, receipt.getReceiptStatus());
            mapping.put(RECEIPT_DATE, receipt.getReceiptDate());
            mapping.put(RECEIPT_ADDRESS, receipt.getReceiptAddress());
            mapping.put(RECEIPT_NAME, receipt.getReceiptName());
        };
        afterPropertiesSet();
    }

    @Override
    public List<MyItem> reportReceipt(Date date, int limit) {
        List<MyItem> list = new ArrayList<>();
        for (int i = limit - 1; i >= 0; i--) {
            Date d = subDays(date, i);
            MyItem myItem = new MyItem();
            myItem.setTime(covertD2S(d));
            myItem.setValue(countItemByDate(d));
            list.add(myItem);
        }
        return list;
    }

    private int countItemByDate(Date date) {
        String sql = "SELECT count(*) FROM receipt WHERE DATE_FORMAT(" + RECEIPT_DATE + ",'%Y-%m-%d') = DATE_FORMAT(?, '%Y-%m-%d')";
        Integer count = jdbcTemplate.queryForObject(sql, new Object[]{date}, Integer.class);
        return count == null ? 0 : count;
    }

    public static Date addDays(Date date, int days) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE, days);
        return cal.getTime();
    }

    private static Date subDays(Date date, int days) {
        GregorianCalendar cal = new GregorianCalendar();
        cal.setTime(date);
        cal.add(Calendar.DATE, -days);
        return cal.getTime();
    }

    private String covertD2S(Date date) {
        DateFormat df = new SimpleDateFormat("dd/MM/yyy");
        return df.format(date);
    }

}
