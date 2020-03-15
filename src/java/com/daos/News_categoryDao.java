package com.daos;

import com.beans.News_category;
import com.jdbc.ConnectionPool;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class News_categoryDao {

    public boolean add(News_category news_category) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
            try {
                String sql = "Insert into news_category(name) values(?)";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, news_category.getName());
                smt.executeUpdate();

                status = true;
                cp.putConnection(con);
                smt.close();

            } catch (Exception e) {
                System.out.println("Error " + e.getMessage());
            }

        }
        return status;
    }

    public boolean removeById(int cat_id) {
        boolean status = false;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "Delete from news_category where cat_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, cat_id);

                int n = smt.executeUpdate();
                if (n > 0) {
                    status = true;
                    System.out.println("Category Removed !!");
                }

                cp.putConnection(con);
                smt.close();

            }

        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return status;
    }

    public News_category getById(int cat_id) {
        News_category news_category = null;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news_category where cat_id=?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, cat_id);
                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    news_category = new News_category();
                    news_category.setCat_id(rs.getInt("cat_id"));
                    news_category.setName(rs.getString("name"));
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return news_category;
    }

    public ArrayList<News_category> getAllNews_category() {
        ArrayList<News_category> news_categoryList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news_category";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News_category news_category = new News_category();
                    news_category.setCat_id(rs.getInt("cat_id"));
                    news_category.setName(rs.getString("name"));
                    news_categoryList.add(news_category);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return news_categoryList;
    }

    public ArrayList<News_category> getNews_categoryByLimit(int start, int stop) {
        ArrayList<News_category> news_categoryList = new ArrayList();
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select * from news_category limit ?, ?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setInt(1, start);
                smt.setInt(2, stop);
                ResultSet rs = smt.executeQuery();
                while (rs.next()) {
                    News_category news_category = new News_category();
                    news_category.setCat_id(rs.getInt("cat_id"));
                    news_category.setName(rs.getString("name"));
                    news_categoryList.add(news_category);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }
        return news_categoryList;
    }

    public int getNews_categoryCount() {
        int total = 0;
        try {
            ConnectionPool cp = ConnectionPool.getInstance();
            cp.initialize();
            Connection con = cp.getConnection();
            if (con != null) {
                String sql = "select count(*) from news_category";
                PreparedStatement smt = con.prepareStatement(sql);

                ResultSet rs = smt.executeQuery();
                if (rs.next()) {
                    total = rs.getInt(1);
                }
                cp.putConnection(con);
                smt.close();
            }
        } catch (Exception e) {
            System.out.println("Error " + e.getMessage());
        }

        return total;

    }

    public boolean update(News_category news_category) {
        boolean status = false;
        ConnectionPool cp = ConnectionPool.getInstance();
        cp.initialize();
        Connection con = cp.getConnection();

        if (con != null) {
            try {
                String sql = "update news_category set name=?  where cat_id = ?";
                PreparedStatement smt = con.prepareStatement(sql);
                smt.setString(1, news_category.getName());
                smt.setInt(2, news_category.getCat_id());
                int n = smt.executeUpdate();
                if (n > 0) {
                    status = true;
                }
                smt.close();

            } catch (Exception e) {

                System.out.println("Error " + e.getMessage());
            }

        }

        return status;
    }

    
    public ArrayList<News_category>  getAllRecords(){
    
       ArrayList<News_category> categorys =new ArrayList<News_category>();
       ConnectionPool cp = ConnectionPool.getInstance();
       cp.initialize();
       Connection con = cp.getConnection();
       if(con!=null){
        try{
            String sql = "select * from news_category";
            PreparedStatement smt = con.prepareStatement(sql);
            ResultSet rs= smt.executeQuery();
            while(rs.next()){
                News_category category=new News_category();
                category.setCat_id(rs.getInt("cat_id"));
                category.setName(rs.getString("name"));
                categorys.add(category);
            }
            smt.close();
            cp.releaseConnection(con);
        }   catch(Exception e){
            System.out.println("DBError :"+e.getMessage());
        }
       }
       
    return categorys;
   }
   
    
    
    public static void main(String[] args) {
        System.out.println("hello");
    }
}
