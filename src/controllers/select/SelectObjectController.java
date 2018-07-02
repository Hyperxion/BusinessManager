/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers.select;

import classes.MngApi;
import classes.User;
import classes.Object;
import classes.OrderItem;
import controllers.orders.NewOrderController;
import java.net.URL;
import java.util.List;
import java.util.ResourceBundle;
import javafx.beans.property.SimpleDoubleProperty;
import javafx.beans.property.SimpleIntegerProperty;
import javafx.beans.property.SimpleStringProperty;
import javafx.collections.FXCollections;
import javafx.collections.ObservableList;
import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableRow;
import javafx.scene.control.TableView;
import javafx.scene.control.TextField;

/**
 * FXML Controller class
 *
 * @author Erik PC
 */
public class SelectObjectController implements Initializable {

    private User user;
    
    private NewOrderController newOrderController;
    
    
    @FXML
    private TableView<classes.Object> tv_objects;
    
    @FXML
    private TableColumn<classes.Object, String> object_col_name, object_col_buildTime_formated, object_col_comment;
    
    @FXML
    private TableColumn<classes.Object, Integer> object_col_id, object_col_soldCount;
    
    @FXML
    private TableColumn<classes.Object, Double> object_col_weight, object_col_supportWeight;
    
    @FXML
    private TextField txtField_search;
    
    @FXML
    private Button btn_select, btn_close;
    
    
    @Override
    public void initialize(URL url, ResourceBundle rb) {
        
        tv_objects.setRowFactory( tv -> {
            TableRow<Object> row = new TableRow<>();
            row.setOnMouseClicked(event -> {
                if (event.getClickCount() == 2 && (! row.isEmpty()) ) {
                    ObservableList<OrderItem> selectedObjects = generateOrderItems(tv_objects.getSelectionModel().getSelectedItems());
                    //newOrderController.addSelectedObjects(selectedObjects);
                    newOrderController.getSelectedObjects().addAll(selectedObjects);
                    newOrderController.setSelectedObjects();
                    MngApi.closeWindow(btn_close);
                }
            });
            return row;
        });
        
        btn_select.setOnAction((event) -> {
            List<OrderItem> selectedObjects = generateOrderItems(tv_objects.getSelectionModel().getSelectedItems());                    
            newOrderController.getSelectedObjects().addAll(selectedObjects);
            newOrderController.setSelectedObjects();
            MngApi.closeWindow(btn_close);
        });
        
        btn_close.setOnAction((event) -> {
            
            MngApi.closeWindow(btn_close);
            
        });
    }    
    
    private ObservableList<OrderItem> generateOrderItems(ObservableList<Object> selectedObjects){
        
        //Create list of orders
        ObservableList<OrderItem> orderItems = FXCollections.observableArrayList();
        
        classes.Object listObject;
        
        int i = 0;
        
        while (selectedObjects.get(i) != null){
            
            listObject = selectedObjects.get(i);
            
            SimpleStringProperty  object_name, object_buildTime_formated, printer_name, material_type, material_color;
            SimpleIntegerProperty object_id, object_buildTime, quantity, printer_id, material_id;
            SimpleDoubleProperty object_supportWeight, object_weight, price, costs;
            
            object_name = listObject.getObject_name();
            object_buildTime_formated = listObject.getObject_buildTime_formated();            
            printer_name = new SimpleStringProperty(" ");
            material_type = new SimpleStringProperty(" ");
            material_color = new SimpleStringProperty(" ");
            
            object_id = listObject.getObject_id();
            object_buildTime = listObject.getObject_buildTime();
            quantity = new SimpleIntegerProperty();
            printer_id = new SimpleIntegerProperty();
            material_id = new SimpleIntegerProperty();
            
            
            object_supportWeight = listObject.getObject_supportWeight();
            object_weight = listObject.getObject_weight();
            price = new SimpleDoubleProperty();
            costs = new SimpleDoubleProperty();
            
            OrderItem orderItem = new OrderItem(object_name, object_buildTime_formated, printer_name, material_type, material_color, object_id, object_buildTime, quantity, printer_id, material_id, object_supportWeight, object_weight, price, costs);
            
            orderItems.add(orderItem);
            
            i++;
        }
        
        return orderItems;
    }
    
    public void displayObjects(){
        
        //Create list of orders
        ObservableList<classes.Object> objectList = FXCollections.observableArrayList(classes.Object.getObjects(user));
        
        object_col_name.setCellValueFactory((param) -> {return param.getValue().getObject_name();});
        object_col_buildTime_formated.setCellValueFactory((param) -> {return param.getValue().getObject_buildTime_formated();});
        object_col_comment.setCellValueFactory((param) -> {return param.getValue().getObject_comment();});
        
        object_col_id.setCellValueFactory((param) -> {return param.getValue().getObject_id().asObject();});        
        object_col_soldCount.setCellValueFactory((param) -> {return param.getValue().getObject_SoldCount().asObject();});
        
        object_col_weight.setCellValueFactory((param) -> {return param.getValue().getObject_weight().asObject();});
        object_col_supportWeight.setCellValueFactory((param) -> {return param.getValue().getObject_supportWeight().asObject();});
        
        //Centering content
        object_col_name.setStyle("-fx-alignment: CENTER;");

        
        object_col_id.setStyle("-fx-alignment: CENTER;");
        object_col_buildTime_formated.setStyle("-fx-alignment: CENTER;");
        object_col_soldCount.setStyle("-fx-alignment: CENTER;");
        
        object_col_weight.setStyle("-fx-alignment: CENTER;");
        object_col_supportWeight.setStyle("-fx-alignment: CENTER;");
        
        tv_objects.setItems(objectList);
        
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public void setNewOrderController(NewOrderController newOrderController) {
        this.newOrderController = newOrderController;
    }

    public TableView<Object> getTv_objects() {
        return tv_objects;
    }
    
    
    
}