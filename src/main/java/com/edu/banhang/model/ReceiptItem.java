package com.edu.banhang.model;


import java.math.BigDecimal;

public class ReceiptItem extends BaseModel {

    private Receipt receipt;
    private Product product;
    private int receiptItemQuantity;
    private BigDecimal receiptItemPrice;

    public ReceiptItem() {
    }

    public ReceiptItem(Receipt receipt, Product product, int receiptItemQuantity, BigDecimal receiptItemPrice) {
        this.receipt = receipt;
        this.product = product;
        this.receiptItemQuantity = receiptItemQuantity;
        this.receiptItemPrice = receiptItemPrice;
    }

    public Receipt getReceipt() {
        return receipt;
    }

    public void setReceipt(Receipt receipt) {
        this.receipt = receipt;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getReceiptItemQuantity() {
        return receiptItemQuantity;
    }

    public void setReceiptItemQuantity(int receiptItemQuantity) {
        this.receiptItemQuantity = receiptItemQuantity;
    }

    public BigDecimal getReceiptItemPrice() {
        return receiptItemPrice;
    }

    public void setReceiptItemPrice(BigDecimal receiptItemPrice) {
        this.receiptItemPrice = receiptItemPrice;
    }
}
