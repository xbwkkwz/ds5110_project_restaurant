'''
This module is a class of the customer
'''

import getpass
from mysql.connector import connect, Error
import pandas as pd

class Customer:
    '''
    Customers can create new accounts or sign in to view account history 
    such as past orders, reservations, and waiting lists. Customers can view
    menu, put foods into cart, place orders, cancel orders, reserve tables, 
    and join a waiting list.
    '''

    # done
    def __init__(self):
        self.customerID = None
        self.firstName = None
        self.lastName = None
        self.email = None
        self.phone = None
        self.__password = None
        self.cart = {} # format->{menuID: [dishName, price, quantity]}
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
    # account related methods
    ###########################

    # done, sign up for a account
    def sign_up(self, firstName, lastName, email, phone, password):
        # call your sql code here and return a customer ID and save to customerID.
        try:
            row = self.modify_database("sign_up", (firstName, lastName, email, phone, password))        
            self.customerID = row[0]
            self.firstName = firstName
            self.lastName = lastName
            self.email = email
            self.phone = phone
            self.__password = password
            print(f"Welcome {self.firstName} {self.lastName}!")
        except Error as e:
            print(e)
            print("Account exists. Please sign in or change your password.")
            
    # done, sign in with registered account
    def sign_in(self, email, password):
        # call sql code here to find account match and then save all customer info.
        try:
            table = self.read_database("sign_in", (email, password))
            if not table:
                print("Account does not exist or wrong password.")
                return
            (self.customerID, self.firstName, self.lastName, self.email,
                self.phone, self.__password) = table[0]
            print(f"Welcome {self.firstName} {self.lastName}!")
        except Error as e:
            print(e)

    # done
    def sign_out(self):
        self.customerID = None
        self.firstName = None
        self.lastName = None
        self.email = None
        self.phone = None
        self.__password = None
        self.cart = {}
        print("Signed out.")

    # done
    def view_account_info(self):
        print("Customer ID:", self.customerID)
        print("First Name:", self.firstName)
        print("Last Name:", self.lastName)
        print("Email:", self.email)
        print("Phone:", self.phone)

    # done
    def change_phone(self, phone: str):
        try:
            row = self.modify_database("change_phone", (self.customerID, phone))
            print(row[0])
            self.phone = phone
        except Error as e:
            print(e)

    # done
    def change_password(self, old_pass: str, new_pass: str):
        if old_pass == self.__password:
            try:
                row = self.modify_database("change_password", (self.customerID, new_pass))
                print(row[0])
                self.__password = new_pass
            except Error as e:
                print(e)
        else:
            print("Old passwords do not match!")

    # done
    def delete_account(self):
        try:
            row = self.modify_database("delete_account", (self.customerID,))
            print(row[0])
            self.sign_out()
        except Error as e:
            print(e)

    # done, disconnect the sql 
    def exit_system(self):
        self.conn.close()
        self.conn = None


    ###########################
    # cart related methods
    ###########################

    # done, view available menu dishes
    def view_menu(self):
        try:
            table = self.read_database("customer_view_menu", None)
            if not table:
                print("No available menu right now.")
                return
            col = ["Dish ID", "Category", "Dish Name", "Price"]
            self.print_database(table, col)
        except Error as e:
            print(e)

    # done, return the name and price of the dish
    def __get_name_price(self, menuID: int) -> str:
        with self.conn.cursor() as cursor:
            cursor.callproc("get_dish_name_price", (menuID,))
            tables = cursor.stored_results()
        for table in tables:
            for row in table.fetchall():
                return row

    # done, format->{menuID: [dishName, price, quantity]}
    def add_dish(self, menuID: int, quantity: int):
        if menuID in self.cart:
            self.cart[menuID][2] += quantity
        else:
            self.cart[menuID] = [self.__get_name_price(menuID)[0], float(self.__get_name_price(menuID)[1]), quantity]
        print("Added.")

    # done, update quantity of dishes in the cart
    def update_dish(self, menuID: int, quantity: int):
        if (menuID in self.cart) and quantity == 0:
            self.remove_dish(menuID)
        elif menuID in self.cart:
            self.cart[menuID][2] = quantity
        print("Updated.")
            
    # done, delete one dish from the cart
    def remove_dish(self, menuID: int):
        if menuID in self.cart:
            self.cart.pop(menuID)
        print("Removed.")

    # done, view the cart
    def view_cart(self):
        if self.cart:  # format->{menuID: [dishName, price, quantity]}
            c_menuID, c_dishName, c_price, c_quantity, c_subtotal = [], [], [], [], []
            for key, value in self.cart.items():
                c_menuID.append(key)
                c_dishName.append(value[0])
                c_price.append(value[1])
                c_quantity.append(value[2])
                c_subtotal.append(value[1]*value[2])
            table_format = {"Dish ID": c_menuID, "Name": c_dishName, "Price": c_price, "Quantity": c_quantity, "Subtotal": c_subtotal}
            df = pd.DataFrame(table_format)
            df.index = df.index + 1
            print(df)
            print("-----------------")
            print("Number of Dishes: " + str(sum(c_quantity)))
            print("Total: $" + str(sum(c_subtotal)))
        else:
            print("Empty Cart.")


    ###########################
    # order related methods
    ###########################
    
    # done, send order to the restaurant
    def place_order(self):
        if not self.cart:
            print("Empty cart!")
        else:
            c_listID, c_menuID, c_price, c_quantity, c_subtotal = [], [], [], [], []
            list_start = 1
            for key, value in self.cart.items():
                c_listID.append(list_start)
                list_start += 1
                c_menuID.append(key)
                c_price.append(value[1])
                c_quantity.append(value[2])
                c_subtotal.append(value[1]*value[2])
            num_dish = sum(c_quantity)
            total_before_tips = sum(c_subtotal)
            self.cart.clear()
            # save data to the order table
            row = self.modify_database("create_order", (self.customerID, num_dish, total_before_tips))
            orderID = row[0]
            if orderID == "error":
                print("Out of business hours. The restaurant is closed.")
                return
            # save data to the order_list
            for i in range(len(c_listID)):
                self.modify_database("create_order_list", (orderID, c_listID[i], c_menuID[i], c_quantity[i]))
            print("Order received.")
            self.view_order_details(orderID)

    # done, print one order
    def __view_one_order(self, orderID: int):
        table = self.read_database("customer_view_one_order", (orderID,))
        if not table:
            print("No history.")
            return
        col = ["Order ID", "Date", "Status", "Num Of Dish", "Subtotal", "Tips", "Total"]
        self.print_database(table, col)

    # done, cancel one order before it goes to the chef queue
    def cancel_order(self, orderID: int):
        # this one should be the same as the method in employee
        row = self.modify_database("update_order_status", (orderID, "Canceled"))
        print(row[0])
        self.__view_one_order(orderID)

    # done, view dish list of one order
    def view_order_details(self, orderID: int):
        self.__view_one_order(orderID)
        # this one should be the same as the method in employee
        table = self.read_database("view_order_detail", (orderID,))
        col = ["Dish ID", "Name", "Quantity", "Price", "Subtotal"]
        self.print_database(table, col)

    # done, view all orders belog to the account
    def view_order_history(self):
        table = self.read_database("customer_view_order_history", (self.customerID,))
        if not table:
            print("No history.")
            return
        col = ["Order ID", "Date", "Status", "Num Of Dish", "Subtotal", "Tips", "Total"]
        self.print_database(table, col)


    ###########################
    # reservation related methods
    ###########################

    # done, view the current restaurant hour
    def view_business_hour(self):
        table = self.read_database("view_business_hour", None)
        col = ["Day", "Open", "Close"]
        self.print_database(table, col)

    # done, reserve a table by selecting a day and time
    def reserve_table(self, date: str, time: str, num_of_people: int):
        # input format (Y:M:D, H:00, n=4 max)
        row = self.modify_database("reserve_table", (date, time, num_of_people, self.customerID))
        print(row[0])

    # done, cancel one reservation
    def cancel_reservation(self, date: str, time: str, tableID: int):
        row = self.modify_database("cancel_reservation", (date, time, tableID))
        print(row[0])

    # done, view reservation history
    def view_reservation(self):
        table = self.read_database("view_reservation", (self.customerID,))
        if not table:
            print("No history.")
            return
        col = ["Date", "Time", "Table ID", "Num Of People", "Status"]
        self.print_database(table, col)


    ###########################
    # waiting list related methods
    ###########################

    # done, join a waiting list of no space
    def join_waiting_list(self, date: str, time: str, num_of_people: int):
        # input format (Y:M:D, H:00, n=4 max)
        row = self.modify_database("join_waiting_list", (date, time, num_of_people, self.customerID))
        print(row[0])

    # done, cancel one waiting 
    def cancel_waiting_list(self, waitingID: int):
        row = self.modify_database("cancel_waiting_list", (waitingID,))
        print(row[0])

    # done, view all waiting list history 
    def view_waiting_list(self):
        table = self.read_database("view_waiting_list", (self.customerID,))
        if not table:
            print("No history.")
            return
        col = ["Waiting ID", "Date", "Time", "Num Of People", "Status"]
        self.print_database(table, col)
