/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLNonTransientConnectionException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;

/**
 *
 * @author edemko
 */
public class Material {
    
    SimpleStringProperty material_color, material_manufacturer, material_type, material_finished, material_distributor, material_purchaseDate, material_comment;
    SimpleIntegerProperty material_id, material_weight;
    SimpleDoubleProperty material_diameter, material_price, material_shipping, material_used, material_trash, material_soldFor, material_profit;

    public Material(SimpleStringProperty material_color, SimpleStringProperty material_manufacturer, SimpleStringProperty material_type, SimpleStringProperty material_finished, SimpleStringProperty material_distributor, SimpleStringProperty material_purchaseDate, SimpleStringProperty material_comment, SimpleIntegerProperty material_id, SimpleIntegerProperty material_weight, SimpleDoubleProperty material_diameter, SimpleDoubleProperty material_price, SimpleDoubleProperty material_shipping, SimpleDoubleProperty material_used, SimpleDoubleProperty material_trash, SimpleDoubleProperty material_soldFor, SimpleDoubleProperty material_profit) {
        this.material_color = material_color;
        this.material_manufacturer = material_manufacturer;
        this.material_type = material_type;
        this.material_finished = material_finished;
        this.material_distributor = material_distributor;
        this.material_purchaseDate = material_purchaseDate;
        this.material_comment = material_comment;
        this.material_id = material_id;
        this.material_weight = material_weight;
        this.material_diameter = material_diameter;
        this.material_price = material_price;
        this.material_shipping = material_shipping;
        this.material_used = material_used;
        this.material_trash = material_trash;
        this.material_soldFor = material_soldFor;
        this.material_profit = material_profit;
    }

    public SimpleStringProperty getMaterial_comment() {
        return material_comment;
    }

    public void setMaterial_comment(SimpleStringProperty material_comment) {
        this.material_comment = material_comment;
    }

    

    public SimpleDoubleProperty getMaterial_diameter() {
        return material_diameter;
    }

    public void setMaterial_diameter(SimpleDoubleProperty material_diameter) {
        this.material_diameter = material_diameter;
    }
    
    public SimpleStringProperty getMaterial_color() {
        return material_color;
    }

    public void setMaterial_color(SimpleStringProperty material_color) {
        this.material_color = material_color;
    }

    public SimpleStringProperty getMaterial_manufacturer() {
        return material_manufacturer;
    }

    public void setMaterial_manufacturer(SimpleStringProperty material_manufacturer) {
        this.material_manufacturer = material_manufacturer;
    }

    public SimpleStringProperty getMaterial_type() {
        return material_type;
    }

    public void setMaterial_type(SimpleStringProperty material_type) {
        this.material_type = material_type;
    }

    public SimpleStringProperty getMaterial_finished() {
        return material_finished;
    }

    public void setMaterial_finished(SimpleStringProperty material_finished) {
        this.material_finished = material_finished;
    }

    public SimpleStringProperty getMaterial_distributor() {
        return material_distributor;
    }

    public void setMaterial_distributor(SimpleStringProperty material_distributor) {
        this.material_distributor = material_distributor;
    }

    public SimpleStringProperty getMaterial_purchaseDate() {
        return material_purchaseDate;
    }

    public void setMaterial_purchaseDate(SimpleStringProperty material_purchaseDate) {
        this.material_purchaseDate = material_purchaseDate;
    }

    public SimpleIntegerProperty getMaterial_id() {
        return material_id;
    }

    public void setMaterial_id(SimpleIntegerProperty material_id) {
        this.material_id = material_id;
    }

    public SimpleIntegerProperty getMaterial_weight() {
        return material_weight;
    }

    public void setMaterial_weight(SimpleIntegerProperty material_weight) {
        this.material_weight = material_weight;
    }

    

    public SimpleDoubleProperty getMaterial_price() {
        return material_price;
    }

    public void setMaterial_price(SimpleDoubleProperty material_price) {
        this.material_price = material_price;
    }

    public SimpleDoubleProperty getMaterial_shipping() {
        return material_shipping;
    }

    public void setMaterial_shipping(SimpleDoubleProperty material_shipping) {
        this.material_shipping = material_shipping;
    }

    public SimpleDoubleProperty getMaterial_used() {
        return material_used;
    }

    public void setMaterial_used(SimpleDoubleProperty material_used) {
        this.material_used = material_used;
    }

    public SimpleDoubleProperty getMaterial_trash() {
        return material_trash;
    }

    public void setMaterial_trash(SimpleDoubleProperty material_trash) {
        this.material_trash = material_trash;
    }

    public SimpleDoubleProperty getMaterial_soldFor() {
        return material_soldFor;
    }

    public void setMaterial_soldFor(SimpleDoubleProperty material_soldFor) {
        this.material_soldFor = material_soldFor;
    }

    public SimpleDoubleProperty getMaterial_profit() {
        return material_profit;
    }

    public void setMaterial_profit(SimpleDoubleProperty material_profit) {
        this.material_profit = material_profit;
    }

        
    
    //this method get list of materials - ONLY materials, without statistics
    public static List<Material> getMaterials(User user) {
        
        //Create list
        List<Material> allMaterialsList = new ArrayList<>();
        
        //Create query
        String query = "SELECT Materials.Comment, Materials.MaterialID, MaterialManufacturers.ManufacturerName AS 'Manufacturer', MaterialTypes.MaterialType, MaterialColors.ColorName AS 'Color', MaterialWeights.WeightValue, Materials.MaterialPrice, Materials.MaterialShipping, Materials.PurchaseDate, MaterialSellers.SellerName AS 'Seller', Materials.Finished, Materials.Trash, MaterialDiameters.DiameterValue FROM Materials JOIN MaterialTypes ON Materials.MaterialTypeID=MaterialTypes.MaterialTypeID JOIN MaterialManufacturers ON Materials.ManufacturerID = MaterialManufacturers.ManufacturerID JOIN MaterialSellers ON Materials.SellerID = MaterialSellers.SellerID JOIN MaterialColors ON Materials.ColorID = MaterialColors.ColorID JOIN MaterialWeights ON Materials.WeightID = MaterialWeights.WeightID JOIN MaterialDiameters ON Materials.DiameterID = MaterialDiameters.DiameterID ORDER BY Materials.MaterialID DESC";

        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if(conn.isValid(10) == false) {
                MngApi obj = new MngApi();
                obj.alertConnectionLost();
            }
            
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data
            //rs.next() loads row            
            //in this loop we sequentialy add columns to list of Strings
            while(rs.next()){
                
                SimpleStringProperty material_color, material_manufacturer, material_type, material_finished, material_distributor, material_purchaseDate, material_comment;
                SimpleIntegerProperty material_id,material_weight;
                SimpleDoubleProperty material_diameter, material_price, material_shipping, material_used, material_trash, material_soldFor, material_profit;
                
                material_color = new SimpleStringProperty(rs.getString("Color"));
                material_manufacturer = new SimpleStringProperty(rs.getString("Manufacturer"));
                material_type = new SimpleStringProperty(rs.getString("MaterialType"));
                material_finished = new SimpleStringProperty(rs.getString("Finished"));
                material_distributor = new SimpleStringProperty(rs.getString("Seller"));
                material_purchaseDate = new SimpleStringProperty(rs.getString("PurchaseDate"));
                material_comment = new SimpleStringProperty(rs.getString("Comment"));
                
                material_id = new SimpleIntegerProperty(rs.getInt("MaterialID"));
                material_weight = new SimpleIntegerProperty(rs.getInt("WeightValue"));
                
                material_diameter = new SimpleDoubleProperty(rs.getDouble("DiameterValue"));
                material_price = new SimpleDoubleProperty(rs.getDouble("MaterialPrice"));
                material_shipping = new SimpleDoubleProperty(rs.getDouble("MaterialShipping"));
                
                material_used = new SimpleDoubleProperty(getMaterialUsed(user, material_id));
                material_trash = new SimpleDoubleProperty(rs.getDouble("Trash"));                    
                material_soldFor = new SimpleDoubleProperty(getMaterialSoldFor(user, material_id));
                material_profit = new SimpleDoubleProperty(material_soldFor.get() - material_price.get());
                
                Material material = new Material(material_color, material_manufacturer, material_type, material_finished, material_distributor, material_purchaseDate, material_comment, material_id, material_weight, material_diameter, material_price, material_shipping, material_used, material_trash, material_soldFor, material_profit);
                
                allMaterialsList.add(material);
                
            }

            rs.close();
        } catch (SQLNonTransientConnectionException se) {
            MngApi obj = new MngApi();
            obj.alertConnectionLost();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return allMaterialsList;
    }
    
    
      
    public static Double getMaterialUsed(User user, SimpleIntegerProperty materialID) {        
                
        double used = 0;        
        
        String query = "SELECT OrderItems.ItemQuantity, OrderItems.ItemSupportWeight, OrderItems.ItemWeight, MaterialWeights.WeightValue FROM OrderItems JOIN Materials ON Materials.MaterialID = OrderItems.ItemMaterialID JOIN MaterialWeights ON Materials.WeightID=MaterialWeights.WeightID WHERE MaterialID=" + materialID.get();
        
        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data            
            while(rs.next()){                
                double itemQuantity = rs.getDouble("ItemQuantity");
                double itemSupportWeight = rs.getDouble("ItemSupportWeight");
                double itemWeight = rs.getDouble("ItemWeight");
                double materialWeight = rs.getDouble("WeightValue");                
                
                used = itemQuantity*(itemSupportWeight + itemWeight)/materialWeight*100;
                        
            }
            
            

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return used;
    }
    
    public static Double getMaterialSoldFor(User user, SimpleIntegerProperty materialID) {        
                
        double soldFor = 0;        
        
        String query = "SELECT SUM(ItemPrice) AS 'SoldFor' FROM OrderItems WHERE ItemMaterialID=" + materialID.get();
        
        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data            
            while(rs.next()){                
                                
                soldFor = rs.getDouble("SoldFor");
                        
            }
            
            

            rs.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return soldFor;
    }
    
    public static List<String> getMaterialTypes(User user) {
        
        //Create list
        List<String> materialTypes = new ArrayList<>();
        
        //Create query
        String query = "SELECT MaterialType FROM MaterialTypes ORDER BY MaterialType ASC";

        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if(conn.isValid(10) == false) {
                MngApi obj = new MngApi();
                obj.alertConnectionLost();
            }
            
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data
            //rs.next() loads row            
            //in this loop we sequentialy add columns to list of Strings
            while(rs.next()){
                
                String type = rs.getString("MaterialType");
                
                materialTypes.add(type);
                
            }

            rs.close();
        } catch (SQLNonTransientConnectionException se) {
            MngApi obj = new MngApi();
            obj.alertConnectionLost();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return materialTypes;
    }
    
    public static List<String> getMaterialManufacturers(User user) {
        
        //Create list
        List<String> materialManufacturers = new ArrayList<>();
        
        //Create query
        String query = "SELECT ManufacturerName FROM MaterialManufacturers ORDER BY ManufacturerName ASC";

        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if(conn.isValid(10) == false) {
                MngApi obj = new MngApi();
                obj.alertConnectionLost();
            }
            
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data
            //rs.next() loads row            
            //in this loop we sequentialy add columns to list of Strings
            while(rs.next()){
                
                String manufacturer = rs.getString("ManufacturerName");
                
                materialManufacturers.add(manufacturer);
                
            }

            rs.close();
        } catch (SQLNonTransientConnectionException se) {
            MngApi obj = new MngApi();
            obj.alertConnectionLost();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return materialManufacturers;
    }
    
    public static List<String> getMaterialSellers(User user) {
        
        //Create list
        List<String> materialSellers = new ArrayList<>();
        
        //Create query
        String query = "SELECT SellerName FROM MaterialSellers ORDER BY SellerName ASC";

        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if(conn.isValid(10) == false) {
                MngApi obj = new MngApi();
                obj.alertConnectionLost();
            }
            
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data
            //rs.next() loads row            
            //in this loop we sequentialy add columns to list of Strings
            while(rs.next()){
                
                String seller = rs.getString("SellerName");
                
                materialSellers.add(seller);
                
            }

            rs.close();
        } catch (SQLNonTransientConnectionException se) {
            MngApi obj = new MngApi();
            obj.alertConnectionLost();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return materialSellers;
    }
    
    public static List<String> getMaterialColors(User user) {
        
        //Create list
        List<String> materialColors = new ArrayList<>();
        
        //Create query
        String query = "SELECT ColorName FROM MaterialColors ORDER BY ColorName ASC";

        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if(conn.isValid(10) == false) {
                MngApi obj = new MngApi();
                obj.alertConnectionLost();
            }
            
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data
            //rs.next() loads row            
            //in this loop we sequentialy add columns to list of Strings
            while(rs.next()){
                
                String color = rs.getString("ColorName");
                
                materialColors.add(color);
                
            }

            rs.close();
        } catch (SQLNonTransientConnectionException se) {
            MngApi obj = new MngApi();
            obj.alertConnectionLost();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return materialColors;
    }
    
    public static List<Integer> getMaterialWeights(User user) {
        
        //Create list
        List<Integer> materialWeights = new ArrayList<>();
        
        //Create query
        String query = "SELECT WeightValue FROM MaterialWeights ORDER BY WeightValue ASC";

        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if(conn.isValid(10) == false) {
                MngApi obj = new MngApi();
                obj.alertConnectionLost();
            }
            
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data
            //rs.next() loads row            
            //in this loop we sequentialy add columns to list of Strings
            while(rs.next()){
                
                int weight = rs.getInt("WeightValue");
                                
                materialWeights.add(weight);
                
            }

            rs.close();
        } catch (SQLNonTransientConnectionException se) {
            MngApi obj = new MngApi();
            obj.alertConnectionLost();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return materialWeights;
    }
    
    public static List<Double> getMaterialDiameters(User user) {
        
        //Create list
        List<Double> materialDiameters = new ArrayList<>();
        
        //Create query
        String query = "SELECT DiameterValue FROM MaterialDiameters ORDER BY DiameterValue ASC";

        // JDBC driver name and database URL
        String JDBC_DRIVER = "org.mariadb.jdbc.Driver";
        String DB_URL = "jdbc:mariadb://" + user.getAddress() + "/" + user.getDbName();

        //  Database credentials
        String USER = user.getName();
        String PASS = user.getPass();


        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        try {
            
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.Driver");

            //STEP 3: Open a connection

            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            
            if(conn.isValid(10) == false) {
                MngApi obj = new MngApi();
                obj.alertConnectionLost();
            }
            
            //STEP 4: Execute a query
            stmt = conn.createStatement();
            
            rs = stmt.executeQuery(query);            
            //Query is executed, resultSet saved. Now we need to process the data
            //rs.next() loads row            
            //in this loop we sequentialy add columns to list of Strings
            while(rs.next()){
                
                
                double diameter = rs.getDouble("DiameterValue");
                
                materialDiameters.add(diameter);
                
            }

            rs.close();
        } catch (SQLNonTransientConnectionException se) {
            MngApi obj = new MngApi();
            obj.alertConnectionLost();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null)
                    conn.close();
            } catch (SQLException se) {
            }// do nothing
            try {
                if (conn != null)
                    conn.close();
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        
    return materialDiameters;
    }
}