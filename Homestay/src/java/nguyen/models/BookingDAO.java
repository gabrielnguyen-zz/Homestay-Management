/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nguyen.models;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import nguyen.db.DBUtils;

/**
 *
 * @author Gabriel Nguyen
 */
public class BookingDAO implements Serializable {

    private Connection con;
    private PreparedStatement pst;
    private ResultSet rs;

    public BookingDAO() {
    }

    private void closeConnection() throws Exception {
        if (rs != null) {
            rs.close();
        }
        if (pst != null) {
            pst.close();
        }
        if (rs != null) {
            rs.close();
        }
    }

    public String checkLogin(String accountName, String password) throws Exception {
        String role = "failed";
        try {
            String sql = "Select role From Account where accountName =? and password =?";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, accountName);
            pst.setString(2, password);
            rs = pst.executeQuery();
            if (rs.next()) {
                role = rs.getString("role");
            }
        } finally {
            closeConnection();
        }
        return role;
    }

    public boolean createAccount(String accountName, String password, String phone, String fullName) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT into Account(accountName,password,phone,role,isDelete,fullName) values(?,?,?,?,?,?)";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, accountName);
            pst.setString(2, password);
            pst.setString(3, phone);
            pst.setString(4, "user");
            pst.setBoolean(5, false);
            pst.setString(6, fullName);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;

    }

    public boolean createCustomer(String customerName, String phone) throws Exception {
        boolean check = false;
        try {
            String sql = "INSERT into Customer(customerName,phone) values(?,?)";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, customerName);
            pst.setString(2, phone);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<RoomDTO> findByPerson(String person) throws Exception {
        List<RoomDTO> result = new ArrayList<>();

        RoomDTO dto = null;
        String roomName = null;
        int price = 0;
        String image = null;
        int roomID = 0;
        try {
            String sql = "SELECT roomID,roomName,price,image From ListRoom where forType like ? and isDelete = 'False'";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + person + "%");
            rs = pst.executeQuery();
            while (rs.next()) {
                roomID = rs.getInt("roomID");
                roomName = rs.getString("roomName");
                image = rs.getString("image");
                price = rs.getInt("price");
                dto = new RoomDTO(roomName, image, price, roomID);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<StaffDTO> findByName(String name) throws Exception {
        List<StaffDTO> result = null;
        String fullName = null;
        String account = null;
        String phone = null;
        StaffDTO dto = null;

        try {
            String sql = "SELECT accountName,fullName,phone FROM Account where fullName like ? AND isDelete = 'false' AND role='staff' ";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + name + "%");
            rs = pst.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {

                account = rs.getString("accountName");
                fullName = rs.getString("fullName");
                phone = rs.getString("phone");
                dto = new StaffDTO(account, fullName, phone);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }

        return result;
    }

    public boolean updateStaff(String accountName, String fullName) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Account set fullName = ? where accountName = ? ";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, fullName);
            pst.setString(2, accountName);
            check = pst.executeUpdate() > 0;

        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean deleteStaff(String accountName) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Account set isDelete = 'true' WHERE accountName = ? AND role ='staff'";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, accountName);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<InvoiceDTO> findInvoiceByID(int invoiceID) throws Exception {
        List<InvoiceDTO> result = null;
        String roomName = null;
        String serviceName = null;
        String dateCreate = null;
        String customerName = null;
        int roomPrice = 0;
        int servicePrice = 0;
        int roomQuantity = 0;
        int serviceQuantity = 0;
        String checkIn = null;
        String checkOut = null;
        String status = null;
        try {
            String sql = "SELECT i.invoiceID as invoiceID,i.checkIn as checkIn,i.checkOut as checkOut,i.status as status,i.dateCreate as dateCreate,l.roomName as roomName,d.price as roomPrice,d.quantity as roomQuantity,o.serviceName as serviceName ,o.servicePrice as servicePrice,r.quantity as serviceQuantity,c.customerName as customerName"
                    + " FROM Invoice as i, InvoiceRoom as d , ListRoom as l, InvoiceService as r, Service as o, Customer as c "
                    + "where i.invoiceID = ? AND i.invoiceRoomID = d.invoiceRoomID AND d.roomID = l.roomID AND d.invoiceRoomID = r.invoiceRoomID AND r.serviceID = o.serviceID AND c.invoiceID = i.invoiceID";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, invoiceID);
            rs = pst.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                invoiceID = rs.getInt("invoiceID");
                dateCreate = rs.getString("dateCreate");
                roomName = rs.getString("roomName");
                roomPrice = rs.getInt("roomPrice");
                roomQuantity = rs.getInt("roomQuantity");
                serviceName = rs.getString("serviceName");
                servicePrice = rs.getInt("servicePrice");
                serviceQuantity = rs.getInt("serviceQuantity");
                customerName = rs.getString("customerName");
                checkIn = rs.getString("checkIn");
                String checkInArr[] = checkIn.split(" ");
                checkOut = rs.getString("checkOut");
                String checkOutArr[] = checkOut.split("\\s");
                status = rs.getString("status");
                InvoiceDTO dto = new InvoiceDTO(invoiceID, roomPrice, servicePrice, roomQuantity, serviceQuantity, dateCreate, roomName, serviceName, customerName, checkInArr[0], checkOutArr[0], status);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }
        return result;
    }

    public InvoiceDTO findInvoiceToEdit(int invoiceID) throws Exception {
        InvoiceDTO dto = null;
        String roomName = null;
        String serviceName = null;
        int invoiceServiceID = 0;
        String customerName = null;
        int roomPrice = 0;
        int servicePrice = 0;
        int roomQuantity = 0;
        int serviceQuantity = 0;
        int invoiceRoomID = 0;
        try {
            String sql = "SELECT i.invoiceID as invoiceID,r.invoiceServiceID as invoiceServiceID,d.invoiceRoomID as invoiceRoomID,l.roomName as roomName,d.price as roomPrice,d.quantity as roomQuantity,o.serviceName as serviceName ,o.servicePrice as servicePrice,r.quantity as serviceQuantity,c.customerName as customerName"
                    + " FROM Invoice as i, InvoiceRoom as d , ListRoom as l, InvoiceService as r, Service as o, Customer as c "
                    + "where i.invoiceID = ? AND i.invoiceRoomID = d.invoiceRoomID AND d.roomID = l.roomID AND d.invoiceRoomID = r.invoiceRoomID AND r.serviceID = o.serviceID AND c.invoiceID = i.invoiceID";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, invoiceID);
            rs = pst.executeQuery();

            while (rs.next()) {
                invoiceServiceID = rs.getInt("invoiceServiceID");
                invoiceID = rs.getInt("invoiceID");
                invoiceRoomID = rs.getInt("invoiceRoomID");
                roomName = rs.getString("roomName");
                roomPrice = rs.getInt("roomPrice");
                roomQuantity = rs.getInt("roomQuantity");
                serviceName = rs.getString("serviceName");
                servicePrice = rs.getInt("servicePrice");
                serviceQuantity = rs.getInt("serviceQuantity");
                customerName = rs.getString("customerName");
                dto = new InvoiceDTO(invoiceID, roomPrice, servicePrice, roomQuantity, serviceQuantity, invoiceServiceID, invoiceRoomID, roomName, serviceName, customerName);

            }
        } finally {
            closeConnection();
        }
        return dto;
    }

    public boolean updateServiceQuantity(int invoiceServiceID, int serviceQuantity) throws Exception {
        boolean check = false;

        try {
            String sql = "update InvoiceService set quantity = ? "
                    + "where invoiceServiceID = ?";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, serviceQuantity);
            pst.setInt(2, invoiceServiceID);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public List<ServiceDTO> searchService() throws Exception {
        List<ServiceDTO> result = null;
        int serviceID = 0;
        String serviceName = null;
        int servicePrice = 0;
        try {
            String sql = "SELECT serviceID,serviceName,servicePrice From Service";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {
                serviceID = rs.getInt("serviceID");
                serviceName = rs.getString("serviceName");
                servicePrice = rs.getInt("servicePrice");
                ServiceDTO dto = new ServiceDTO(serviceID, servicePrice, serviceName);
                result.add(dto);
            }

        } finally {
            closeConnection();
        }
        return result;
    }

    public List<StaffDTO> findUserByName(String name) throws Exception {
        List<StaffDTO> result = null;
        String fullName = null;
        String account = null;
        String phone = null;
        StaffDTO dto = null;

        try {
            String sql = "SELECT accountName,fullName,phone FROM Account where fullName like ? AND isDelete = 'false' AND role='user'";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, "%" + name + "%");
            rs = pst.executeQuery();
            result = new ArrayList<>();
            while (rs.next()) {

                account = rs.getString("accountName");
                fullName = rs.getString("fullName");
                phone = rs.getString("phone");
                dto = new StaffDTO(account, fullName, phone);
                result.add(dto);
            }
        } finally {
            closeConnection();
        }

        return result;
    }

    public boolean deleteUser(String accountName) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Account set isDelete = 'true' WHERE accountName = ? AND role ='user'";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, accountName);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkOut(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Invoice set status = ? where invoiceID = ? ";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, "checkout");
            pst.setInt(2, id);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean checkIn(int id) throws Exception {
        boolean check = false;
        try {
            String sql = "Update Invoice set status = ? where invoiceID = ? ";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, "checkin");
            pst.setInt(2, id);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }

    public boolean insertInvoiceRoom(int roomID,int roomPrice,int roomQuantity) throws Exception {
        boolean check = false;
        try {
            String sql ="Insert into InvoiceRoom(roomID,price,quantity) values(?,?,?)";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, roomID);
            pst.setInt(2, roomPrice);
            pst.setInt(3, roomQuantity);
            check = pst.executeUpdate() > 0;
        } finally {
            closeConnection();
        }
        return check;
    }
    
    public boolean insertInvoiceService(int invoiceRoomID,int serviceID, int servicePrice,int serviceQuantity ) throws Exception{
        boolean check = false;
        try {
            String sql ="Insert into InvoiceService(invoiceRoomID,serviceID,servicePrice,quantity) values(?,?,?,?)";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, invoiceRoomID);
            pst.setInt(2, serviceID);
            pst.setInt(3, servicePrice);
            pst.setInt(4, serviceQuantity);
            check = pst.executeUpdate() > 0 ;
        } finally{
            closeConnection();
        }
        return check;
    }
    public int getInvoiceRoomID() throws Exception{
        int invoiceRoomIDLastest = 0;
        try {
            String sql ="Select top 1 * from InvoiceRoom order by invoiceRoomID desc";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            if(rs.next()){
                invoiceRoomIDLastest = rs.getInt("invoiceRoomID");
            }
        } finally{
            closeConnection();
        }
        return invoiceRoomIDLastest;
    }
    
    
    public boolean insertInvoice(String checkIn,String checkOut,int invoicePrice,int invoiceRoomID,String customerName)throws Exception{
        boolean check = false;
        
        try {
            String sql ="Insert into Invoice(invoicePrice,invoiceRoomID,checkIn,checkOut,status,customerName) values(?,?,?,?,?,?)";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, invoicePrice);
            pst.setInt(2, invoiceRoomID);
            pst.setString(3, checkIn);
            pst.setString(4, checkOut);
            pst.setString(5, "waiting");
            pst.setString(6, customerName);
            check = pst.executeUpdate() > 0;
        }finally {
            closeConnection();
        }
        
        return check;
    }
    public boolean insertInvoiceToCustomer(int invoiceID,String customerName)throws Exception{
        boolean check = false;
        try {
            String sql ="update Customer set invoiceID = ? where customerName = ?";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setInt(1, invoiceID);
            pst.setString(2, customerName);
            check = pst.executeUpdate()>0;
        } finally {
            closeConnection();
        }
        return check;
    }
    public int getInvoiceID() throws Exception{
        int invoiceIDLastest = 0;
        try {
            String sql ="Select top 1 * from Invoice order by invoiceID desc";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            rs = pst.executeQuery();
            if(rs.next()){
                invoiceIDLastest = rs.getInt("invoiceID");
            }
        } finally{
            closeConnection();
        }
        return invoiceIDLastest;
    }
    public InvoiceDTO findInvoiceHistory(String customerName) throws Exception {
        InvoiceDTO dto = null;
        String roomName = null;
        String serviceName = null;
        int invoiceServiceID = 0;
        int invoiceID = 0;
        int roomPrice = 0;
        int servicePrice = 0;
        int roomQuantity = 0;
        int serviceQuantity = 0;
        int invoiceRoomID = 0;
        String checkIn = null;
        String checkOut = null;
        try {
            String sql = "SELECT i.checkIn as checkIn,i.checkOut as checkOut,i.invoiceID as invoiceID,r.invoiceServiceID as invoiceServiceID,d.invoiceRoomID as invoiceRoomID,l.roomName as roomName,d.price as roomPrice,d.quantity as roomQuantity,o.serviceName as serviceName ,o.servicePrice as servicePrice,r.quantity as serviceQuantity,c.customerName as customerName"
                    + " FROM Invoice as i, InvoiceRoom as d , ListRoom as l, InvoiceService as r, Service as o, Customer as c "
                    + "where c.customerName = ? AND i.invoiceRoomID = d.invoiceRoomID AND d.roomID = l.roomID AND d.invoiceRoomID = r.invoiceRoomID AND r.serviceID = o.serviceID AND c.invoiceID = i.invoiceID";
            con = DBUtils.getMyConnection();
            pst = con.prepareStatement(sql);
            pst.setString(1, customerName);
            rs = pst.executeQuery();

            if(rs.next()) {
                checkIn = rs.getString("checkIn");
                checkOut =rs.getString("checkOut");
                invoiceServiceID = rs.getInt("invoiceServiceID");
                invoiceID = rs.getInt("invoiceID");
                invoiceRoomID = rs.getInt("invoiceRoomID");
                roomName = rs.getString("roomName");
                roomPrice = rs.getInt("roomPrice");
                roomQuantity = rs.getInt("roomQuantity");
                serviceName = rs.getString("serviceName");
                servicePrice = rs.getInt("servicePrice");
                serviceQuantity = rs.getInt("serviceQuantity");
                
                dto = new InvoiceDTO(invoiceID, roomPrice, servicePrice, roomQuantity, serviceQuantity, checkOut, roomName, serviceName, customerName, checkIn, checkOut, sql);

            }
        } finally {
            closeConnection();
        }
        return dto;
    }
}
