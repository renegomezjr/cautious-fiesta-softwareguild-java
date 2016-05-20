/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.vendingmachine2.dao;

import com.swcguild.vendingmachine2.dto.Item;
import java.util.List;

/**
 *
 * @author Rene Gomez
 */
public interface VendingMachineDAO {
    
    public List<Item> displayItemsToSell();
    public List<Item> allItemsThatCanBeSold();
    public void buyItem(int itemId);
    public Item getItem(int itemId);
    public void updateQuantity();
}
