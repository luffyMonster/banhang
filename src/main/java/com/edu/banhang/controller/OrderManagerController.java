package com.edu.banhang.controller;

import com.edu.banhang.model.Category;
import com.edu.banhang.model.Receipt;
import com.edu.banhang.service.ReceiptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Optional;

import static com.edu.banhang.constant.DBConstants.*;

@Controller
@RequestMapping(value = "/admin/order")
public class OrderManagerController {
    private ReceiptService receiptService;

    @Autowired
    public OrderManagerController(ReceiptService receiptService) {
        this.receiptService = receiptService;
    }
    @GetMapping(value = "/list")
    public String listFirst(ModelMap mm) {
        return list(mm, Optional.of(1));
    }

    @GetMapping(value = "/list/{page}")
    public String list(ModelMap mm, @PathVariable Optional<Integer> page) {
        int evalPage = (page.orElse(0) < 1) ? 0 : page.get() - 1;
        PageRequest pageable = new PageRequest(evalPage, 10,
                new Sort(new Sort.Order(Sort.Direction.ASC, RECEIPT_STATUS), new Sort.Order(Sort.Direction.DESC, RECEIPT_DATE)));
        Page<Receipt> categoryPage = receiptService.findAll(pageable);
        mm.put("listReceipt", categoryPage.getContent());
        mm.put("totalPage", categoryPage.getTotalPages());
        mm.put("actualPage", evalPage);
        return "admin/receipt-list";
    }

    @GetMapping(value = "/confirm/{receiptId}")
    public String confirm(@PathVariable long receiptId, RedirectAttributes redirectAttributes) {
        Receipt receipt = receiptService.findById(receiptId);
        if (receipt != null) {
            receipt.setReceiptStatus(true);
            receiptService.save(receipt);
            redirectAttributes.addFlashAttribute("successMessage", "The order has been confirmed successfully. It will be deliver the product to the receipt");
        } else {
            redirectAttributes.addFlashAttribute("errorMessage", "Can't found the order with id = " + receiptId);
        }

        return "redirect:/admin/order/list";
    }

    @GetMapping(value = "/details/{receiptId}")
    public String viewItems(ModelMap mm, @PathVariable long receiptId, @RequestParam Optional<Integer> page) {
        Receipt receipt = receiptService.findById(receiptId);
        if (receipt != null) {
            mm.addAttribute("receipt", receipt);
            return "/admin/receipt-detail";
        } else {
            mm.addAttribute("errorMessage", "Can't found the order with id = " + receiptId);
            return list(mm, page);
        }
    }
}
