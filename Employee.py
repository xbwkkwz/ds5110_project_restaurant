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
        self.sql_password = None
        self.__sql_connect()

    # done, connect to the mySQL
    def __sql_connect(self):
        try:
            in_password = getpass.getpass("Enter SQL Server Password: ")
            self.conn = connect(
                host = "localhost",
                user = "root",
                password = in_password,
                database = "restaurant"
            )
            self.sql_password = in_password
            print("Connected to the database.")
        except Error as e:
            print(e)

    # done, reconnect to the sql
    def sql_reconnect(self):
        try:
            self.conn = connect(
                host = "localhost",
                user = "root",
                password = self.sql_password,
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
        self.exit_system()
        self.sql_reconnect()
        with self.conn.cursor() as cursor:
            cursor.callproc(procedure_name, args)
            self.conn.commit()
            tables = cursor.stored_results()
        for table in tables:
            for row in table.fetchall():
                return row

    # done, use this if read database only
    def read_database(self, procedure_name: str, args: tuple) -> list:
        self.exit_system()
        self.sql_reconnect()
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

    # done, view all orders with all users
    def view_all_orders(self):
        table = self.read_database("employee_view_order_history", None)
        if not table:
            print("No history.")
            return
        # divided into several pages
        n = 20
        chunks = [table[i:i + n] for i in range(0, len(table), n)]
        page = int(input(f"Select page 1~{len(chunks)}: ")) -1
        col = ["Order ID", "Date", "Time", "Status", "In Queue", "Num Of Dish", "Subtotal", "Tips", "Total", "Customer ID", "Table ID"]
        self.print_database(chunks[page], col)

    # done
    def __view_one_order(self, orderID: int):
        table = self.read_database("employee_view_one_order", (orderID,))
        if not table:
            print("No history.")
            return
        col = ["Order ID", "Date", "Time", "Status", "In Queue", "Num Of Dish", "Subtotal", "Tips", "Total", "Customer ID", "Table ID"]
        self.print_database(table, col)

    # done, view the dish list of one order
    def view_order_detail(self, orderID: int):
        self.__view_one_order(orderID)
        # this one should be the same as the method in customer
        table = self.read_database("view_order_detail", (orderID,))
        col = ["Dish ID", "Name", "Quantity", "Price", "Subtotal"]
        self.print_database(table, col)

    # done, assign a table for a order for dining in people
    def assign_table(self, orderID: int, tableID: int):
        row = self.modify_database("assign_table", (orderID, tableID))
        print(row[0])
        self.__view_one_order(orderID)

    # done, cancel one order
    def cancel_order(self, orderID: int):
        # this one should be the same as the method in customer
        row = self.modify_database("update_order_status", (orderID, "Canceled"))
        print(row[0])
        self.__view_one_order(orderID)

    # done, from "Received" to "Ready"
    def update_order(self, orderID: int):
        # turn from "Received" to "Ready"
        row = self.modify_database("update_order_status", (orderID, "Ready"))
        print(row[0])
        self.__view_one_order(orderID)
        
    # done, add tips
    def update_tips(self, orderID: int, tips: float):
        # this will change total cost also
        row = self.modify_database("update_tips", (orderID, tips))
        print(row[0])
        self.__view_one_order(orderID)

    # done, add order to cooking queue
    def create_order_queue(self, orderID: int, employeeID: int):
        # need to trigger order in queue
        # need to trigger subtract ingredient stock
        row = self.modify_database("create_order_queue", (orderID, employeeID))
        print(row[0])
        # done by the trigger "update_queue_status"
        # done by the trigger "subtract_ingredient_stock"

    # done, view the cooking queue list
    def view_queue(self):
        table = self.read_database("view_queue", None)
        col = ["Queue ID", "Order ID", "Order Time", "Employee ID", "Chef Name", "Status"]
        self.print_database(table, col)

    
    ###########################
    # reservation and waiting list related methods
    ###########################

    # done, view all reservations for all customers
    def view_all_reservations(self):
        table = self.read_database("view_all_reservations", None)
        col = ["Date", "Time", "Table ID", "Customer ID", "Customer Name", "Num Of People", "Status", "Waiter ID", "Waiter Name"]
        self.print_database(table, col)

    # done, assign a waiter to a table
    def assign_waiter(self, date: str, time: str, tableID: int, employeeID: int):
        row = self.modify_database("assign_waiter", (date, time, tableID, employeeID))
        print(row[0])

    # done, cancel one reservation
    def cancel_reservation(self, date: str, time: int, tableID: int):
        # this one should be the same as the method in customer
        row = self.modify_database("cancel_reservation", (date, time, tableID))
        print(row[0])

    # done, view all waiting history for all users
    def view_all_waiting_list(self):
        table = self.read_database("view_all_waiting_list", None)
        col = ["Waiting ID", "Date", "Time", "Customer ID", "Customer Name", "Num Of People", "Status"]
        self.print_database(table, col)

    # done, cancel one waiting queue
    def cancel_waiting_list(self, waitingID: int):
        # this one should be the same as the method in customer
        row = self.modify_database("cancel_waiting_list", (waitingID,))
        print(row[0])


    ###########################
    # food related methods
    ###########################

    # done, view the entire menu with offline dish
    def view_menu(self):
        table = self.read_database("employee_view_menu", None)
        col = ["Dish ID", "Category", "Dish Name", "Description", "Price", "Status"]
        self.print_database(table, col)

    # done, add new dish category
    def add_new_category(self, categoryName: str):
        row = self.modify_database("add_new_category", (categoryName,))
        print(row[0])
    
    # done, add new dish
    def add_new_dish(self, categoryName: str, dishName: str, price: float):
        row = self.modify_database("add_new_dish", (categoryName, dishName, price))
        print(row[0])

    # done, make dish online or offline
    def update_dish_status(self, menuID: int, dishStatus: int):
        row = self.modify_database("update_dish_status", (menuID, dishStatus))
        print(row[0])

    # done, change price
    def update_dish_price(self, menuID: int, newPrice: float):
        row = self.modify_database("update_dish_price", (menuID, newPrice))
        print(row[0])

    # done, change dish description
    def update_dish_description(self, menuID: int, newDes: str):
        row = self.modify_database("update_dish_description", (menuID, newDes))
        print(row[0])

    # done, view stock for each ingredient
    def view_ingredient_stock(self):
        table = self.read_database("view_ingredient_stock", None)
        col = ["Ingredient ID", "Ingredient Name", "Current Stock"]
        self.print_database(table, col)

    # done, add new ingredient
    def add_new_ingredient(self, ingredientName: str):
        row = self.modify_database("add_new_ingredient", (ingredientName,))
        print(row[0])

    # done, view the composition of a dish
    def view_dish_ingredient(self, menuID: int):
        table = self.read_database("view_dish_ingredient", (menuID,))
        if not table:
            print("No information about this dish.")
            return
        col = ["Ingredient ID", "Ingredient Name", "Quantity"]
        self.print_database(table, col)

    # done, assign ingredient to new dish
    def add_dish_has_ingredient(self, dishName: str, ingredientName: str, quantity: int):
        row = self.modify_database("add_dish_has_ingredient", (dishName, ingredientName, quantity))
        print(row[0])

    # done, view ingredient purchase history
    def view_inventory(self):
        table = self.read_database("view_inventory", None)
        col = ["Inventory ID", "Ingredient Name", "Quantity", "Cost", "Employee ID", "Employee Name", "Purchase Date", "Expiration Date"]
        self.print_database(table, col)

    # done, buy more ingredients
    def add_inventory(self, ingredientName: str, quantity: int, totalCost: float, employeeID: int, purchaseDate: str, expDate: str):
        # this will trigger the stock column update in ingredient
        row = self.modify_database("add_inventory", (ingredientName, quantity, totalCost, employeeID, purchaseDate, expDate))
        print(row[0])
        # done through the trigger add_ingredient_stock


    ###########################
    # restaurant related methods
    ###########################

    # done, view history business hours
    def view_all_business_hours(self):
        table = self.read_database("view_all_business_hours", None)
        col = ["Time ID", "Day", "Open", "Close", "Status"]
        self.print_database(table, col)

    # done, add new business hours
    def add_business_hour(self, businessDay: str, openTime: str, closeTime: str):
        row = self.modify_database("add_business_hour", (businessDay, openTime, closeTime))
        print(row[0])

    # done, offline or online some days
    def update_business_hour(self, timeID: int, dayStatus: int):
        # this will also update the reservation windows automatically
        row = self.modify_database("update_business_hour", (timeID, dayStatus))
        print(row[0])

    # done, view all tables in the restaurant
    def view_all_tables(self):
        table = self.read_database("view_all_tables", None)
        col = ["Table ID", "Capacity", "Status"]
        self.print_database(table, col)

    # done, add new table to the restaurant
    def add_table(self, capacity: int):
        row = self.modify_database("add_table", (capacity,))
        print(row[0])

    # done, offline or online some tables
    def update_table(self, tableID: int, tableStatus: int):
        row = self.modify_database("update_table", (tableID, tableStatus))
        print(row[0])


    ###########################
    # employee related methods
    ###########################

    # done, view current employees
    def view_employee(self, occupation):
        if not occupation:
            table = self.read_database("view_employee", (" ", 1))
        else:
            table = self.read_database("view_employee", (occupation, 0))
        col = ["Employee ID", "Name", "Email", "Phone", "Ssn", "Salary", "Occupation", "Rating"]
        self.print_database(table, col)

    # done, add new employee
    def add_employee(self, firstName: str, lastName: str, email: str, phone: str, ssn: str, salary: float, occupation: str):
        try:
            row = self.modify_database("add_employee", (firstName, lastName, email, phone, ssn, salary, occupation))
            print(row[0])
        except Error as e:
            print(e)

    # done, delete one employee
    def delete_employee(self, employeeID: int):
        row = self.modify_database("delete_employee", (employeeID,))
        print(row[0])

    # done, update employee salary
    def update_salary(self, employeeID: int, salary: float):
        row = self.modify_database("update_salary", (employeeID, salary))
        print(row[0])

    # done, change employee rating
    def rate_employee(self, employeeID: int, rating: str):
        row = self.modify_database("rate_employee", (employeeID, rating))
        print(row[0])
