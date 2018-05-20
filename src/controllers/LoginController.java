package controllers;

import classes.MngApi;
import classes.User;
import javafx.event.ActionEvent;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.control.Button;
import javafx.stage.Stage;
import java.io.IOException;
import java.sql.SQLNonTransientConnectionException;
import javafx.fxml.FXML;

public class LoginController {
    @FXML
    private TextField ipAddress, uName;
    @FXML
    private PasswordField uPasswd;
    @FXML
    private Button btn_login;    

    //signs in user into database and displays application's main window with loaded "Orders" table
    public void signIn(ActionEvent event) {
        MngApi.closeWindow(btn_login); //closes parent window of specified node

        try{            
            FXMLLoader fxmlLoader = new FXMLLoader(getClass().getResource("/fxml/Main.fxml"));            
            Parent root1 = fxmlLoader.load();
            MainController ctrl = fxmlLoader.getController();
            Stage stage = new Stage();
            stage.setTitle("PrintED");
            stage.setMinHeight(680);
            stage.setMinWidth(1139);
           
            stage.setScene(new Scene(root1));
            stage.setMaximized(true);
            
            //creating user
            User user = new User(uName.getText(), uPasswd.getText(), ipAddress.getText(), uName.getText());
            
            //passing credentials to main controller
            ctrl.setUser(user);            
            stage.show();            
            
            //when we first open up main windows, we need to load all orders - that's default view
            ctrl.runService(ctrl.getService_refreshOrders());
                
            
        }catch (IOException e){

        }

    }//signIn end
    
}//loginController end