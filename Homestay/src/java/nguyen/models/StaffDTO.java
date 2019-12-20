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
public class StaffDTO implements Serializable{
    private String account,fullName,phone;
    

    public StaffDTO(String account, String fullName, String phone) {
        this.account = account;
        this.fullName = fullName;
        this.phone = phone;
 
    }

    
    
    
    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
    
}
