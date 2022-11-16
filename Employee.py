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
    def view_order_details(self, orderID: int):
        # this one should be the same as the method in customer
        col = ["Dish ID", "Name", "Quantity", "Price", "Subtotal"]
        self.read_database("view_order_detail", (orderID,), col)

    # done for function, bowen needs to clean the code
    def assign_table_to_order(self, orderID: int, tableID: int):
        with self.conn.cursor() as cursor:
            cursor.callproc("assign_table", (orderID, tableID))
            self.conn.commit()
        print("Saved.")

    # done for function, bowen needs to clean the code
    def cancel_order(self, orderID: int):
        # this one should be the same as the method in customer
        # after order in queue, cannot cancel, check order in queue first
        with self.conn.cursor() as cursor:
            cursor.callproc("check_order_in_queue", (orderID,))
            tables = cursor.stored_results()
        for table in tables:
            for row in table.fetchall():
                inQueueStatus = row[0]
        # cancel the order
        if not inQueueStatus:
            with self.conn.cursor() as cursor:
                cursor.callproc("update_order_status", (orderID, "Canceled"))
                self.conn.commit()
            print("The order has been canceled.")
        else:
            print("The order is already in the queue and cannot be canceled.")

    # done for function, bowen needs to clean the code
    def update_order(self, orderID: int):
        # check order in queue first
        with self.conn.cursor() as cursor:
            cursor.callproc("check_order_in_queue", (orderID,))
            tables = cursor.stored_results()
        for table in tables:
            for row in table.fetchall():
                inQueueStatus = row[0]
        # turn from "Received" to "Ready"
        if inQueueStatus:
            with self.conn.cursor() as cursor:
                cursor.callproc("update_order_status", (orderID, "Ready"))
                self.conn.commit()
            print("The order is ready.")
        else:
            print("The order is not in the chef queue.")
        
    # done for function, bowen needs to clean the code
    def update_tips(self, orderID: int, tips: float):
        # this will change total cost also
        with self.conn.cursor() as cursor:
            cursor.callproc("update_tips", (orderID, tips))
            self.conn.commit()
        print("Saved.")

    # done for function, bowen needs to clean the code
    def put_order_in_queue(self, orderID: int, employeeID: int):
        # need to trigger order in queue
        with self.conn.cursor() as cursor:
            cursor.callproc("create_order_queue", (orderID, employeeID))
            self.conn.commit()
        print("Saved.")
        # need to trigger subtract ingredient stock
        # done by the trigger "update_ingredient_stock"

    # done for function, bowen needs to clean the code
    def view_queue(self):
        with self.conn.cursor() as cursor:
            cursor.callproc("view_queue")
            tables = cursor.stored_results()
        for table in tables:
            col = ["Queue ID", "Order ID", "Order Time", "Employee ID", "Chef Name", "Status"]
            df = pd.DataFrame(table.fetchall(), columns=col)
            df.index = df.index + 1
            print(df)


    
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
        with self.conn.cursor() as cursor:
            cursor.callproc("employee_view_menu")
            tables = cursor.stored_results()
        for table in tables:
            col = ["Category", "Dish ID", "Dish Name", "Description", "Price", "Status"]
            df = pd.DataFrame(table.fetchall(), columns=col)
            df.index = df.index + 1
            print(df)

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

    # bowen working
    def view_ingredient_stock(self):
        pass

    # bowen working
    def add_new_ingredient(self, ingredientName: str):
        pass

    # bowen working
    def view_dish_has_ingredient(self, dishName: str):
        pass

    # bowen working
    def add_dish_has_ingredient(self, dishName: str, ingredientName: str, quantity: int):
        pass

    # bowen working
    def view_inventory(self):
        pass

    # bowen working
    def add_inventory(self, ingredientName: str, quantity: int, totalCost: float, employeeID: int, purchaseDate: str, expDate: str):
        # this will trigger the stock column update in ingredient
        pass

    ###########################
    # restaurant related methods
    ###########################

    def view_all_business_hours(self):
        pass

    def add_new_business_hour(self, businessDay: str, openTime: str, closeTime: str):
        pass

    def update_business_hour_status(self, timeID: int, dayStatus: int):
        # this will trigger the reservation windows update
        # the latest reservation window is one hour eariler before store close.
        pass

    def view_all_tables(self):
        pass

    def add_new_table(self, capacity: int):
        pass

    def update_table_status(self, tableID: int, tableStatus: int):
        pass


    ###########################
    # employee related methods
    ###########################

    def add_new_employee(self, firstName: str, lastName: str, email: str, phone: str, ssn: str, salary: float, occupation: str):
        pass

    def update_salary(self, employeeID: int, salary: float):
        pass

    def rate_employee(self, employeeID: int, rating: str):
        pass