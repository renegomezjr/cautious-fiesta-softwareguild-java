/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.vendingmachine2.dao;

import com.swcguild.vendingmachine2.dto.Item;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Rene Gomez
 */
public class VendingMachineDAOImpl implements VendingMachineDAO {

    List<Item> vendingMachine = new ArrayList<>();

    public VendingMachineDAOImpl() {
        //        public Item(Double itemPrice, int itemQuantity, String itemName)

        Item skittles = new Item(1, .75, 10, "Skittles");
        Item starburst = new Item(2, .75, 5, "Starburst");
        Item snikcers = new Item(3, 1.25, 5, "Snickers");
        Item doritos = new Item(4, 1.75, 0, "Doritos");
        Item ruffles = new Item(5, 1.50, 8, "Ruffles");
        Item cheetos = new Item(6, 1.50, 8, "Cheetos");
        Item rolos = new Item(7, .50, 8, "Rolos");
        Item mAndMs = new Item(8, .75, 8, "M&Ms");
        Item reeses = new Item(9, 1.25, 8, "Reese's");
        
        vendingMachine.add(skittles);
        vendingMachine.add(starburst);
        vendingMachine.add(snikcers);
        vendingMachine.add(doritos);
        vendingMachine.add(ruffles);
        vendingMachine.add(cheetos);
        vendingMachine.add(rolos);
        vendingMachine.add(mAndMs);
        vendingMachine.add(reeses);

    }

    @Override
    public List<Item> displayItemsToSell() {
//        List<Item> availableItems = new ArrayList();
//
//        for (Item i : vendingMachine) {
//            if (i.getItemQuantity() > 0) {
//                availableItems.add(i);
//            }
//        }
        return vendingMachine;

    }

    @Override
    public List<Item> allItemsThatCanBeSold() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Item getItem(int itemId) {
        Item item = null;
        for (Item i : vendingMachine) {
            if (i.getItemId() == itemId) {
                item = i;
            }
        }

        return item;

    }

    @Override
    public void buyItem(int itemId) {

        for (Item i : vendingMachine) {
            if (i.getItemId() == itemId) {
                i.setItemQuantity(i.getItemQuantity() - 1);
            }
        }

    }

    @Override
    public void updateQuantity() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
