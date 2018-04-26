/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package classes;

import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.stage.Stage;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import javafx.stage.Modality;

/**
 * Created by erikd on 2/22/2017.
 */

//this class contains some auxiliary methods which location is not bonded to controller file nor PrintED.java file
public class MngApi {
    
    //opens windows from specific fxmlFile with specific title and dimensions
    public void openWindow(String fxmlFile, String title, int width, int height){
        try{
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource(fxmlFile));
            Parent root1 = (Parent) fxmlLoader.load();
            Stage stage = new Stage();
            stage.setTitle(title);
            stage.setScene(new Scene(root1, width, height));//1058, 763
            stage.initModality(Modality.APPLICATION_MODAL);
            stage.show();
            stage.setResizable(false);            
            
            
        }catch (IOException e){

        }
    }
    
    public static boolean isNumber(String string){
        Boolean status;
        try{
             int a = Integer.parseInt(string);
             status = true;
        }catch (NumberFormatException e){
            status = false;
        }
    return status;
    }
    
    public static boolean isString(String string){
        Boolean status;
        try{
             int a = Integer.parseInt(string);
             status = true;
        }catch (NumberFormatException e){
            status = false;
        }
    return status;
    }
    
    //closes any window of specified component/child
    public static void closeWindow(Button btn){
        Stage stage = (Stage) btn.getScene().getWindow();
        stage.close();
    }
    
    //method for rounding double numbers
    public static double round(double value, int places) {        
        if (places < 0) throw new IllegalArgumentException();

        BigDecimal bd = new BigDecimal(value);
        bd = bd.setScale(places, RoundingMode.HALF_UP);
        return bd.doubleValue();
    }
}

