'''
This module is a class of the employee
'''

import getpass
from mysql.connector import connect, Error
import pandas as pd

class Employee:
    '''
    Manager can do: view orders, cancel orders, change order status, 
    assign orders to chef, update inventory, update business hours, 
    update employees, assign waiters to tables, update reservations, 
    update waiting list.
    Chef can do: design menu, add ingredients, specify ingredient with dish,
    purchase ingredients.
    '''
    def __init__(self):
        self.conn = None
        self.__sql_connect()

    def __sql_connect(self):
        try:
            self.conn = connect(
                host = "localhost",
                user = "root",
                password = getpass.getpass("Enter SQL Server Password: "),
                database = "restaurant"
            )
        except Error as e:
            print(e)

    def sql_disconnect(self):
        self.conn.close()
        self.conn = None

    # done, use this if insert, update, delete database
    def modify_database(self, procedure_name: str, args: tuple):
        with self.conn.cursor() as cursor:
            cursor.callproc(procedure_name, args)
            self.conn.commit()
            tables = cursor.stored_results()
        for table in tables:
            for row in table.fetchall():
                return row[0]

    # done, use this if read database only
    def read_database(self, procedure_name: str, args: tuple, col: list):
        with self.conn.cursor() as cursor:
            if args:
                cursor.callproc(procedure_name, args)
            else:
                cursor.callproc(procedure_name)
            tables = cursor.stored_results()
        for table in tables:
            df = pd.DataFrame(table.fetchall(), columns = col)
            df.index = df.index + 1
            print(df)


    ###########################
    # order related methods
    ###########################

    # done
    def view_all_orders(self):
        col = ["Order ID", "Date", "Status", "In Queue", "Num Of Dish", "Subtotal", "Tips", "Total", "Customer ID", "Table ID"]
        self.read_database("employee_view_order_history", None, col)

    # done
    def view_order_detail(self, orderID: int):
        # this one should be the same as the method in customer
        col = ["Dish ID", "Name", "Quantity", "Price", "Subtotal"]
        self.read_database("view_order_detail", (orderID,), col)

    # done
    def assign_table(self, orderID: int, tableID: int):
        message = self.modify_database("assign_table", (orderID, tableID))
        print(message)

    # done
    def cancel_order(self, orderID: int):
        # this one should be the same as the method in customer
        message = self.modify_database("update_order_status", (orderID, "Canceled"))
        print(message)

    # done
    def update_order(self, orderID: int):
        # turn from "Received" to "Ready"
        message = self.modify_database("update_order_status", (orderID, "Ready"))
        print(message)
        
    # done
    def update_tips(self, orderID: int, tips: float):
        # this will change total cost also
        message = self.modify_database("update_tips", (orderID, tips))
        print(message)

    # done
    def create_order_queue(self, orderID: int, employeeID: int):
        # need to trigger order in queue
        # need to trigger subtract ingredient stock
        message = self.modify_database("create_order_queue", (orderID, employeeID))
        print(message)
        # done by the trigger "update_queue_status"
        # done by the trigger "subtract_ingredient_stock"

    # done
    def view_queue(self):
        col = ["Queue ID", "Order ID", "Order Time", "Employee ID", "Chef Name", "Status"]
        self.read_database("view_queue", None, col)


    
    ###########################
    # reservation and waiting list related methods
    ###########################

    def view_all_reservations(self):
        pass



    def assign_waiter_to_reservation(self, date: str, time: str, tableID: int, employeeID: int):
        pass


    

    def cancel_reservation(self, date: str, time: int, tableID: int):
        # this one should be the same as the method in customer
        pass


    


    def view_all_waiting_list(self):
        pass


    def cancel_waiting_list(self, waitingID: int):
        # this one should be the same as the method in customer
        pass




    ###########################
    # food related methods
    ###########################

    # done
    def view_menu(self):
        col = ["Category", "Dish ID", "Dish Name", "Description", "Price", "Status"]
        self.read_database("employee_view_menu", None, col)

    # done
    def add_new_category(self, categoryName: str):
        message = self.modify_database("add_new_category", (categoryName,))
        print(message)
    
    # done
    def add_new_dish(self, categoryName: str, dishName: str, price: float):
        message = self.modify_database("add_new_dish", (categoryName, dishName, price))
        print(message)

    # done
    def update_dish_status(self, menuID: int, dishStatus: int):
        message = self.modify_database("update_dish_status", (menuID, dishStatus))
        print(message)

    # done
    def update_dish_price(self, menuID: int, newPrice: float):
        message = self.modify_database("update_dish_price", (menuID, newPrice))
        print(message)

    # done
    def update_dish_description(self, menuID: int, newDes: str):
        message = self.modify_database("update_dish_description", (menuID, newDes))
        print(message)

    # done
    def view_ingredient_stock(self):
        col = ["Ingredient ID", "Ingredient Name", "Current Stock"]
        self.read_database("view_ingredient_stock", None, col)

    # done
    def add_new_ingredient(self, ingredientName: str):
        message = self.modify_database("add_new_ingredient", (ingredientName,))
        print(message)

    # done
    def view_dish_ingredient(self, menuID: int):
        col = ["Ingredient ID", "Ingredient Name", "Quantity"]
        self.read_database("view_dish_ingredient", (menuID,), col)

    # done
    def add_dish_has_ingredient(self, dishName: str, ingredientName: str, quantity: int):
        message = self.modify_database("add_dish_has_ingredient", (dishName, ingredientName, quantity))
        print(message)

    # done
    def view_inventory(self):
        col = ["Inventory ID", "Ingredient Name", "Quantity", "Cost", "Employee ID", "Employee Name", "Purchase Date", "Exp Date"]
        self.read_database("view_inventory", None, col)

    # done
    def add_inventory(self, ingredientName: str, quantity: int, totalCost: float, employeeID: int, purchaseDate: str, expDate: str):
        # this will trigger the stock column update in ingredient
        message = self.modify_database("add_inventory", (ingredientName, quantity, totalCost, employeeID, purchaseDate, expDate))
        print(message)
        # done through the trigger add_ingredient_stock


    ###########################
    # restaurant related methods
    ###########################

    # done
    def view_all_business_hours(self):
        col = ["Time ID", "Day", "Open", "Close", "Status"]
        self.read_database("view_all_business_hours", None, col)

    # done
    def add_business_hour(self, businessDay: str, openTime: str, closeTime: str):
        message = self.modify_database("add_business_hour", (businessDay, openTime, closeTime))
        print(message)

    # working
    def update_business_hour(self, timeID: int, dayStatus: int):
        # this will trigger the reservation windows update
        # the latest reservation window is one hour eariler before store close.
        message = self.modify_database("update_business_hour", (timeID, dayStatus))
        print(message)

    # bowen working
    def view_all_tables(self):
        pass

    # bowen working
    def add_table(self, capacity: int):
        pass

    # bowen working
    def update_table_status(self, tableID: int, tableStatus: int):
        pass


    ###########################
    # employee related methods
    ###########################

    def add_employee(self, firstName: str, lastName: str, email: str, phone: str, ssn: str, salary: float, occupation: str):
        pass

    def delete_employee(self, employeeID: int):
        pass

    def update_salary(self, employeeID: int, salary: float):
        pass

    def rate_employee(self, employeeID: int, rating: str):
        pass
