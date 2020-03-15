package com.daos;
import com.jdbc.*;
import com.beans.Stureg;
import java.sql.*;
import java.util.ArrayList;
import sun.net.smtp.SmtpClient;


public class SturegDao {

 
    public boolean add(Stureg stureg) {
        boolean status = false;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "insert into Stureg (userid,age,zipcode,name,fname,dob,gender,email,phone,image,address,line,city,instname,password) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            //create prepared Statment -
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, stureg.getUserid());
            smt.setInt(2, stureg.getAge());
            smt.setInt(3, stureg.getZipcode());
            smt.setString(4, stureg.getName());
            smt.setString(5, stureg.getFname());
            smt.setString(6, stureg.getDob());
            smt.setString(7, stureg.getGender());
            smt.setString(8, stureg.getEmail());
            smt.setString(9, stureg.getPhone());
            smt.setString(10, stureg.getImage());
            smt.setString(11, stureg.getAddress());
            smt.setString(12, stureg.getLine());
            smt.setString(13, stureg.getCity());
            smt.setString(14, stureg.getInstname());
            smt.setString(15, stureg.getPassword());
           
          int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Inserted !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
       return status;
    }
            
       
    public boolean removeById(int id){
        boolean status = false;
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "Delete from stureg where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id );
                
                int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Removed !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
        
        
        return status;
    }
    
    public boolean remove(Stureg stureg){
        boolean status=false;
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "Delete from stureg where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, stureg.getId());
                
                int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Removed !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
        
        return status;
    }
    
    
    
         public Stureg getById(int id){
        Stureg sr=null;
        
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from stureg where id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, id );
                ResultSet rs = smt.executeQuery();
                if(rs.next()){
            {
                sr = new Stureg();
                
                 sr.setId(rs.getInt("id"));
                sr.setUserid(rs.getString("userid"));
                sr.setAge(rs.getInt("age"));
                sr.setZipcode(rs.getInt("zipcode"));  
                sr.setName(rs.getString("name"));
                sr.setFname(rs.getString("fname"));
                sr.setDob(rs.getString("dob"));
                sr.setGender(rs.getString("gender"));
                sr.setEmail(rs.getString("email"));
                sr.setPhone(rs.getString("phone"));
                sr.setImage(rs.getString("image"));
                sr.setAddress(rs.getString("address"));
                sr.setLine(rs.getString("line"));
                sr.setCity(rs.getString("city"));
                sr.setInstname(rs.getString("instname"));   
                sr.setPassword(rs.getString("password"));
               
            }
        }
            }
          }
          catch (Exception e)
          {
            System.out.println("Error " + e.getMessage());
          }
        
        return sr;
}
            
 
   
    
     public ArrayList<Stureg> getAllRecords(int start,int end){
        ArrayList<Stureg> SturegList = new ArrayList<>();
        
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
             // String sql = "select * from stureg limit ?,?";
               String sql = "select * from stureg";
            //create prepared Statment -
            PreparedStatement smt = con.prepareStatement(sql);
            //smt.setInt(1,start);
            //smt.setInt(2,end);
            ResultSet rs = smt.executeQuery();
            while(rs.next()){
               
                Stureg sr = new Stureg();
                sr.setId(rs.getInt("id"));
                sr.setUserid(rs.getString("userid"));
                sr.setAge(rs.getInt("age"));
                sr.setZipcode(rs.getInt("zipcode"));  
                sr.setName(rs.getString("name"));
                sr.setFname(rs.getString("fname"));
                sr.setDob(rs.getString("dob"));
                sr.setGender(rs.getString("gender"));
                sr.setEmail(rs.getString("email"));
                sr.setPhone(rs.getString("phone"));
                sr.setImage(rs.getString("image"));
                sr.setAddress(rs.getString("address"));
                sr.setLine(rs.getString("line"));
                sr.setCity(rs.getString("city"));
                sr.setInstname(rs.getString("instname"));   
                sr.setPassword(rs.getString("password"));
                SturegList.add(sr);
             }
               cp.putConnection(con);
               smt.close();
              }
         }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
          return SturegList;
    }
     
     public boolean isUseridExist(String userid){
          boolean status= false;
             try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from stureg where userid=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, userid );
                ResultSet rs = smt.executeQuery();
                if(rs.next()){
            {
                 status= true;
            }
            cp.putConnection(con);

           smt.close();
            }
            }
             }
          catch (Exception e)
          {
            System.out.println("Error " + e.getMessage());
          }
        
        return status;
         
        
    }
   
     public boolean update(Stureg stureg)
     {
     boolean status=false;
     
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "update Stureg set userid=?,age=?,zipcode=?,name=?,fname=?,dob=?,gender=?,email=?,phone=?,image=?,address=?,line=?,city=?,instname=?,password=? where id=?";

            //create prepared Statment -
            PreparedStatement smt = con.prepareStatement(sql);
            smt.setString(1, stureg.getUserid());
            smt.setInt(2, stureg.getAge());
            smt.setInt(3, stureg.getZipcode());
            smt.setString(4, stureg.getName());
            smt.setString(5, stureg.getFname());
            smt.setString(6, stureg.getDob());
            smt.setString(7, stureg.getGender());
            smt.setString(8, stureg.getEmail());
            smt.setString(9, stureg.getPhone());
            smt.setString(10, stureg.getImage());
            smt.setString(11, stureg.getAddress());
            smt.setString(12, stureg.getLine());
            smt.setString(13, stureg.getCity());
            smt.setString(14, stureg.getInstname());
            smt.setString(15, stureg.getPassword());
            smt.setInt(16,stureg.getId());
           
          int n = smt.executeUpdate();
                if (n>0){
                   status=true;
                   System.out.println("Record Inserted !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
     
     return status;
     }
     
     public int getRecordCount() {
         int total= 0;
         try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if(con!=null)
            {
            String sql = "select count(*) from Stureg";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs = smt.executeQuery();
            if(rs.next()) {
                total= rs.getInt(1);
                   System.out.println("Record Inserted !!");
                }
                   
                cp.putConnection(con);
                smt.close();
                
            }
            
            
        }catch(Exception e){
            System.out.println("Error " + e.getMessage());
       
     
     }
         return total;
}
     public ArrayList<Stureg> getRowsByLimit(int start,int end){
     ArrayList<Stureg> sturegs=new ArrayList();
    
          try{
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con!=null){
                String sql = "select * from stureg limit ?,?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, end);
                
                ResultSet rs = smt.executeQuery();
            while(rs.next()){
               
                Stureg sr = new Stureg();
                sr =new Stureg();
                sr.setId(rs.getInt("id"));
                sr.setUserid(rs.getString("userid"));
                sr.setAge(rs.getInt("age"));
                sr.setZipcode(rs.getInt("zipcode"));  
                sr.setName(rs.getString("name"));
                sr.setFname(rs.getString("fname"));
                sr.setDob(rs.getString("dob"));
                sr.setGender(rs.getString("gender"));
                sr.setEmail(rs.getString("email"));
                sr.setPhone(rs.getString("phone"));
                sr.setImage(rs.getString("image"));
                sr.setAddress(rs.getString("address"));
                sr.setLine(rs.getString("line"));
                sr.setCity(rs.getString("city"));
                sr.setInstname(rs.getString("instname"));   
                sr.setPassword(rs.getString("password"));
                sturegs.add(sr);
             
              }
               cp.putConnection(con);
               smt.close();
              }
         }catch(Exception e){
            System.out.println("Error " + e.getMessage());
        }
 
    return sturegs; 
}
     public static void main(String[] args) {
        SturegDao sd = new SturegDao();
        
    }
}