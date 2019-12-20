/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.models;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Gabriel Nguyen
 */
public class Cart implements Serializable {

    private String customerName;
    private Map<String, InvoiceDTO> cart;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Cart(String customerName, Map<String, InvoiceDTO> cart) {
        this.customerName = customerName;
        this.cart = cart;
    }

    public void setCart(Map<String, InvoiceDTO> cart) {
        this.cart = cart;
    }

    public Map<String, InvoiceDTO> getCart() {
        return cart;
    }

    public void addToRoomCart(InvoiceDTO dto) throws Exception {
        if (cart == null) {
            cart = new HashMap<>();
            int quantity = 1;
            dto.setRoomQuantity(quantity);
            cart.put(Integer.toString(dto.getRoomID()), dto);
        } else {
            cart.clear();
            int quantity = 1;
            dto.setRoomQuantity(quantity);
            cart.put(Integer.toString(dto.getRoomID()), dto);
        }
    }
//

    public void addToServiceCart(InvoiceDTO dto)throws Exception {
        int quantity = 1;
        if (this.cart.containsKey(dto.getRoomID() + "")) {
            quantity = this.cart.get(dto.getRoomID() + "").getServiceQuantity();
            dto.setServiceQuantity(quantity);
        } else {
            dto.setServiceQuantity(quantity);
        }
        
        cart.put(Integer.toString(dto.getRoomID()), dto);
    }

    public void delete(String id)throws Exception{
        
        if(this.cart.containsKey(id)){
            this.cart.remove(id);
        }
    }
}
