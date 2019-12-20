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
public class InvoiceDTO implements  Serializable{
    private int invoiceID,roomPrice,servicePrice,roomQuantity,serviceQuantity,invoiceRoomID,invoiceServiceID,roomID,serviceID;
    private String dateCreate, roomName,serviceName, customerName,checkIn,checkOut;
    private String status;

    public String getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(String checkIn) {
        this.checkIn = checkIn;
    }

    public String getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(String checkOut) {
        this.checkOut = checkOut;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public int getInvoiceServiceID() {
        return invoiceServiceID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getServiceID() {
        return serviceID;
    }

    public void setServiceID(int serviceID) {
        this.serviceID = serviceID;
    }

    public void setInvoiceServiceID(int invoiceServiceID) {
        this.invoiceServiceID = invoiceServiceID;
    }

    public InvoiceDTO(int roomPrice, int roomQuantity, int roomID, String roomName) {
        this.roomPrice = roomPrice;
        this.roomQuantity = roomQuantity;
        this.roomID = roomID;
        this.roomName = roomName;
    }
    

    public InvoiceDTO() {
    }

    

    public InvoiceDTO(int invoiceID, int roomPrice, int servicePrice, int roomQuantity, int serviceQuantity,int invoiceServiceID, int invoiceRoomID, String roomName, String serviceName, String customerName) {
        this.invoiceID = invoiceID;
        this.roomPrice = roomPrice;
        this.servicePrice = servicePrice;
        this.roomQuantity = roomQuantity;
        this.serviceQuantity = serviceQuantity;
        this.invoiceRoomID = invoiceRoomID;
        this.roomName = roomName;
        this.serviceName = serviceName;
        this.customerName = customerName;
        this.invoiceServiceID = invoiceServiceID;
    }

    public int getInvoiceRoomID() {
        return invoiceRoomID;
    }

    public void setInvoiceRoomID(int invoiceRoomID) {
        this.invoiceRoomID = invoiceRoomID;
    }

    public InvoiceDTO(int invoiceID, int roomPrice, int servicePrice, int roomQuantity, int serviceQuantity, String dateCreate, String roomName, String serviceName, String customerName, String checkIn, String checkOut, String status) {
        this.invoiceID = invoiceID;
        this.roomPrice = roomPrice;
        this.servicePrice = servicePrice;
        this.roomQuantity = roomQuantity;
        this.serviceQuantity = serviceQuantity;
        this.dateCreate = dateCreate;
        this.roomName = roomName;
        this.serviceName = serviceName;
        this.customerName = customerName;
        this.checkIn = checkIn;
        this.checkOut = checkOut;
        this.status = status;
    }

    
    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    

    public int getInvoiceID() {
        return invoiceID;
    }

    public void setInvoiceID(int invoiceID) {
        this.invoiceID = invoiceID;
    }

    public int getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(int roomPrice) {
        this.roomPrice = roomPrice;
    }

    public int getServicePrice() {
        return servicePrice;
    }

    public void setServicePrice(int servicePrice) {
        this.servicePrice = servicePrice;
    }

    public int getRoomQuantity() {
        return roomQuantity;
    }

    public void setRoomQuantity(int roomQuantity) {
        this.roomQuantity = roomQuantity;
    }

    public int getServiceQuantity() {
        return serviceQuantity;
    }

    public void setServiceQuantity(int serviceQuantity) {
        this.serviceQuantity = serviceQuantity;
    }

    public String getDateCreate() {
        return dateCreate;
    }

    public void setDateCreate(String dateCreate) {
        this.dateCreate = dateCreate;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getServiceName() {
        return serviceName;
    }

    public void setServiceName(String serviceName) {
        this.serviceName = serviceName;
    }
    
    
}
