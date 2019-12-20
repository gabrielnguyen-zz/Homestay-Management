/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.models;

import java.io.Serializable;

/**
 *
 * @author Gabriel Nguyen
 */
public class ServiceDTO implements Serializable{
    private int serviceID,price,quantity;
    private String serviceName;

    public ServiceDTO(int serviceID, int price, int quantity, String serviceName) {
        this.serviceID = serviceID;
        this.price = price;
        this.quantity = quantity;
        this.serviceName = serviceName;
    }

    public ServiceDTO() {
    }

    public ServiceDTO(int serviceID, int price, String serviceName) {
        this.serviceID = serviceID;
        this.price = price;
        this.serviceName = serviceName;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
    
    
}
