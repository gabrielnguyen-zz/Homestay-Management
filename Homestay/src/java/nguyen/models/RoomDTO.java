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
public class RoomDTO implements Serializable{
    private String roomName,image;
    private int price,roomID;
    private int quantity;

    public RoomDTO() {
    }

    public RoomDTO(String roomName, int price, int roomID, int quantity) {
        this.roomName = roomName;
        this.price = price;
        this.roomID = roomID;
        this.quantity = quantity;
    }

    public RoomDTO(String roomName, String image, int price, int roomID) {
        this.roomName = roomName;
        this.image = image;
        this.price = price;
        this.roomID = roomID;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public RoomDTO(String roomName, String image, int price, int roomID, int quantity) {
        this.roomName = roomName;
        this.image = image;
        this.price = price;
        this.roomID = roomID;
        this.quantity = quantity;
    }

    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    
    

    

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
    
}
