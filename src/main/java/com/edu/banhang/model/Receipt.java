package com.edu.banhang.model;

import java.sql.Timestamp;
import java.util.List;

public class Receipt extends BaseModel {

    private String receiptName;
    private String phoneNumber;
    private String receiptAddress;
    private Timestamp receiptDate;
    private boolean receiptStatus;
    private List<ReceiptItem> listReceiptItem;

    public Receipt() {
    }
    public Receipt(Long id) {
        this.id = id;
    }

    public String getReceiptName() {
        return receiptName;
    }

    public void setReceiptName(String receiptName) {
        this.receiptName = receiptName;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getReceiptAddress() {
        return receiptAddress;
    }

    public void setReceiptAddress(String receiptAddress) {
        this.receiptAddress = receiptAddress;
    }

    public Timestamp getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(Timestamp receiptDate) {
        this.receiptDate = receiptDate;
    }

    public boolean getReceiptStatus() {
        return receiptStatus;
    }
    public void setReceiptStatus(boolean receiptStatus) {
        this.receiptStatus = receiptStatus;
    }


    public List<ReceiptItem> getListReceiptItem() {
        return listReceiptItem;
    }

    public void setListReceiptItem(List<ReceiptItem> listReceiptItem) {
        this.listReceiptItem = listReceiptItem;
    }
}
