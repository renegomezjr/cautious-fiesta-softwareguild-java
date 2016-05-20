/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.vendingmachine2.controller;

import com.swcguild.vendingmachine2.dao.VendingMachineDAO;
import com.swcguild.vendingmachine2.dto.Item;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 *
 * @author Rene Gomez
 */
@Controller
public class VendingMachineController {

    private VendingMachineDAO dao;

    @Inject
    public VendingMachineController(VendingMachineDAO dao) {
        this.dao = dao;

    }

    @RequestMapping(value = {"/index", "/"}, method = RequestMethod.GET)
    public String getIndexPage(Model model) {
        List<Item> vendingMachineList = dao.displayItemsToSell();
        model.addAttribute("itemsToSell", vendingMachineList);

        return "index";
    }

    @RequestMapping(value = "vendMethod", method = RequestMethod.POST)
    public String processVendForm(Model model, HttpServletRequest req) {
        List<Item> vendingMachineList = dao.displayItemsToSell();
        String userChoice = req.getParameter("userChoice");
        String userMoney = req.getParameter("userMoney");

        double userPaid = Double.parseDouble(userMoney);
        Item itemToVend = dao.getItem(Integer.parseInt(userChoice));

        if (itemToVend.getItemQuantity() == 0) {
            model.addAttribute("itemNotAvailable", true);
            model.addAttribute("change", userPaid);
            model.addAttribute("itemsToSell", vendingMachineList);

        } else if (itemToVend.getItemPrice() > userPaid) {
            model.addAttribute("youCantAfford", true);
            model.addAttribute("change", userPaid);
            model.addAttribute("itemsToSell", vendingMachineList);

        } else if (itemToVend.getItemPrice() < userPaid && itemToVend != null) {
            model.addAttribute("youGotItBaby", true);
            model.addAttribute("change", userPaid - itemToVend.getItemPrice());
            model.addAttribute("itemSold", itemToVend);
            dao.buyItem(Integer.parseInt(userChoice));
            model.addAttribute("itemsToSell", vendingMachineList);
        }

        return "index";
    }

}
