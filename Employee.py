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

    # done
    def __init__(self):
        self.conn = None
        self.__sql_connect()

    # done
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

    # done, disconnect the sql 
    def exit_system(self):
        self.conn.close()
        self.conn = None


    ###########################
    # procedure call related methods
    ###########################

    # done, use this if insert, update, delete database
    def modify_database(self, procedure_name: str, args: tuple) -> tuple:
        with self.conn.cursor() as cursor:
            cursor.callproc(procedure_name, args)
            self.conn.commit()
            tables = cursor.stored_results()
        for table in tables:
            for row in table.fetchall():
                return row

    # done, use this if read database only
    def read_database(self, procedure_name: str, args: tuple) -> list:
        with self.conn.cursor() as cursor:
            if args:
                cursor.callproc(procedure_name, args)
            else:
                cursor.callproc(procedure_name)
            tables = cursor.stored_results()
        for table in tables:
            return table.fetchall()

    # done, output a formatted data
    def print_database(self, table: list, col: list):
        df = pd.DataFrame(table, columns = col)
        df.index = df.index + 1
        print(df)


    ###########################
    # order related methods
    ###########################

    # done
    def view_all_orders(self):
        table = self.read_database("employee_view_order_history", None)
        if not table:
            print("No history.")
            return
        col = ["Order ID", "Date", "Status", "In Queue", "Num Of Dish", "Subtotal", "Tips", "Total", "Customer ID", "Table ID"]
        self.print_database(table, col)

    # done
    def view_order_detail(self, orderID: int):
        # this one should be the same as the method in customer
        table = self.read_database("view_order_detail", (orderID,))
        col = ["Dish ID", "Name", "Quantity", "Price", "Subtotal"]
        self.print_database(table, col)

    # done
    def assign_table(self, orderID: int, tableID: int):
        row = self.modify_database("assign_table", (orderID, tableID))
        print(row[0])

    # done
    def cancel_order(self, orderID: int):
        # this one should be the same as the method in customer
        row = self.modify_database("update_order_status", (orderID, "Canceled"))
        print(row[0])

    # done
    def update_order(self, orderID: int):
        # turn from "Received" to "Ready"
        row = self.modify_database("update_order_status", (orderID, "Ready"))
        print(row[0])
        
    # done
    def update_tips(self, orderID: int, tips: float):
        # this will change total cost also
        row = self.modify_database("update_tips", (orderID, tips))
        print(row[0])

    # done
    def create_order_queue(self, orderID: int, employeeID: int):
        # need to trigger order in queue
        # need to trigger subtract ingredient stock
        row = self.modify_database("create_order_queue", (orderID, employeeID))
        print(row[0])
        # done by the trigger "update_queue_status"
        # done by the trigger "subtract_ingredient_stock"

    # done
    def view_queue(self):
        table = self.read_database("view_queue", None)
        col = ["Queue ID", "Order ID", "Order Time", "Employee ID", "Chef Name", "Status"]
        self.print_database(table, col)

    
    ###########################
    # reservation and waiting list related methods
    ###########################

    # done
    def view_all_reservations(self):
        table = self.read_database("view_all_reservations", None)
        col = ["Date", "Time", "Table ID", "Customer ID", "Customer Name", "Num Of People", "Status", "Waiter ID", "Waiter Name"]
        self.print_database(table, col)

    # done
    def assign_waiter(self, date: str, time: str, tableID: int, employeeID: int):
        row = self.modify_database("assign_waiter", (date, time, tableID, employeeID))
        print(row[0])

    # done
    def cancel_reservation(self, date: str, time: int, tableID: int):
        # this one should be the same as the method in customer
        row = self.modify_database("cancel_reservation", (date, time, tableID))
        print(row[0])

    # done
    def view_all_waiting_list(self):
        table = self.read_database("view_all_waiting_list", None)
        col = ["Waiting ID", "Date", "Time", "Customer ID", "Customer Name", "Num Of People", "Status"]
        self.print_database(table, col)

    # done
    def cancel_waiting_list(self, waitingID: int):
        # this one should be the same as the method in customer
        row = self.modify_database("cancel_waiting_list", (waitingID,))
        print(row[0])


    ###########################
    # food related methods
    ###########################

    # done
    def view_menu(self):
        table = self.read_database("employee_view_menu", None)
        col = ["Category", "Dish ID", "Dish Name", "Description", "Price", "Status"]
        self.print_database(table, col)

    # done
    def add_new_category(self, categoryName: str):
        row = self.modify_database("add_new_category", (categoryName,))
        print(row[0])
    
    # done
    def add_new_dish(self, categoryName: str, dishName: str, price: float):
        row = self.modify_database("add_new_dish", (categoryName, dishName, price))
        print(row[0])

    # done
    def update_dish_status(self, menuID: int, dishStatus: int):
        row = self.modify_database("update_dish_status", (menuID, dishStatus))
        print(row[0])

    # done
    def update_dish_price(self, menuID: int, newPrice: float):
        row = self.modify_database("update_dish_price", (menuID, newPrice))
        print(row[0])

    # done
    def update_dish_description(self, menuID: int, newDes: str):
        row = self.modify_database("update_dish_description", (menuID, newDes))
        print(row[0])

    # done
    def view_ingredient_stock(self):
        table = self.read_database("view_ingredient_stock", None)
        col = ["Ingredient ID", "Ingredient Name", "Current Stock"]
        self.print_database(table, col)

    # done
    def add_new_ingredient(self, ingredientName: str):
        row = self.modify_database("add_new_ingredient", (ingredientName,))
        print(row[0])

    # done
    def view_dish_ingredient(self, menuID: int):
        table = self.read_database("view_dish_ingredient", (menuID,))
        col = ["Ingredient ID", "Ingredient Name", "Quantity"]
        self.print_database(table, col)

    # done
    def add_dish_has_ingredient(self, dishName: str, ingredientName: str, quantity: int):
        row = self.modify_database("add_dish_has_ingredient", (dishName, ingredientName, quantity))
        print(row[0])

    # done
    def view_inventory(self):
        table = self.read_database("view_inventory", None)
        col = ["Inventory ID", "Ingredient Name", "Quantity", "Cost", "Employee ID", "Employee Name", "Purchase Date", "Exp Date"]
        self.print_database(table, col)

    # done
    def add_inventory(self, ingredientName: str, quantity: int, totalCost: float, employeeID: int, purchaseDate: str, expDate: str):
        # this will trigger the stock column update in ingredient
        row = self.modify_database("add_inventory", (ingredientName, quantity, totalCost, employeeID, purchaseDate, expDate))
        print(row[0])
        # done through the trigger add_ingredient_stock


    ###########################
    # restaurant related methods
    ###########################

    # done
    def view_all_business_hours(self):
        table = self.read_database("view_all_business_hours", None)
        col = ["Time ID", "Day", "Open", "Close", "Status"]
        self.print_database(table, col)

    # done
    def add_business_hour(self, businessDay: str, openTime: str, closeTime: str):
        row = self.modify_database("add_business_hour", (businessDay, openTime, closeTime))
        print(row[0])

    # done
    def update_business_hour(self, timeID: int, dayStatus: int):
        # this will also update the reservation windows automatically
        row = self.modify_database("update_business_hour", (timeID, dayStatus))
        print(row[0])

    # done
    def view_all_tables(self):
        table = self.read_database("view_all_tables", None)
        col = ["Table ID", "Capacity", "Status"]
        self.print_database(table, col)

    # done
    def add_table(self, capacity: int):
        row = self.modify_database("add_table", (capacity,))
        print(row[0])

    # done
    def update_table(self, tableID: int, tableStatus: int):
        row = self.modify_database("update_table", (tableID, tableStatus))
        print(row[0])


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
