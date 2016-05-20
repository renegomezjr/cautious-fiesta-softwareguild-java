/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.swcguild.vendingmachine2.dto;

/**
 *
 * @author Rene Gomez
 */
public class Item {
    private int itemId;
    private double itemPrice;
    private int itemQuantity;
    private String itemName;

    public Item(int item, double itemPrice, int itemQuantity, String itemName) {
        this.itemId = item;
        this.itemPrice = itemPrice;
        this.itemQuantity = itemQuantity;
        this.itemName = itemName;
    }
    
    public int getItemId(){
        return itemId;
    }
    
    public double getItemPrice() {
        return itemPrice;
    }

    public void setItemPrice(Double itemPrice) {
        this.itemPrice = itemPrice;
    }

    public int getItemQuantity() {
        return itemQuantity;
    }

    public void setItemQuantity(int itemQuantity) {
        this.itemQuantity = itemQuantity;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

}
