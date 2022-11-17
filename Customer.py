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
    def __init__(self):
        self.conn = None
        self.customerID = None
        self.firstName = None
        self.lastName = None
        self.email = None
        self.phone = None
        self.__password = None
        self.cart = {} # format->{menuID: [dishName, price, quantity]}
        self.__sql_connect()

    ###########################
    # account related methods
    ###########################

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

    # done
    def sign_up(self):
        self.firstName = input("First Name: ")
        self.lastName = input("Last Name: ")
        self.email = input("Email: ")
        self.phone = input("Phone: ")
        attempt1 = getpass.getpass("Enter password: ")
        attempt2 = getpass.getpass("Enter password again: ")
        if attempt1 == attempt2:
            self.__password = attempt1
            # call your sql code here and return a customer ID and save to customerID.
            val = (self.firstName, self.lastName, self.email, self.phone, self.__password)
            with self.conn.cursor() as cursor:
                cursor.callproc("sign_up", val)
                self.conn.commit()
                tables = cursor.stored_results()
            for table in tables:
                for row in table.fetchall():
                    self.customerID = row[0]
            print(f"Welcome {self.firstName} {self.lastName}!")
        else:
            print("Passwords do not match!")
        
    # done
    def sign_in(self):
        if self.customerID != None:
            print("You are already signed in.")
        else:
            input_email = input("Email: ")
            input_password = getpass.getpass("Enter password: ")
            # call sql code here to find account match and then save all customer info.
            val = (input_email, input_password)
            with self.conn.cursor() as cursor:
                cursor.callproc("sign_in", val)
                tables = cursor.stored_results()
            for table in tables:
                for row in table.fetchall():
                    (self.customerID, self.firstName, self.lastName, self.email,
                    self.phone, self.__password) = row
            print(f"Welcome {self.firstName} {self.lastName}!")

    # done
    def sign_out(self):
        self.conn.close()
        self.conn = None
        self.customerID = None
        self.firstName = None
        self.lastName = None
        self.email = None
        self.phone = None
        self.__password = None
        print("Signed out.")

    # done
    def view_account_info(self):
        print("ID:", self.customerID)
        print("First Name:", self.firstName)
        print("Last Name:", self.lastName)
        print("Email:", self.email)
        print("Phone:", self.phone)

    def change_phone(self):
        self.phone = input("Phone: ")
        print("Saved.")

    def change_password(self):
        old_pass = getpass.getpass("Enter old password: ")
        if old_pass == self.__password:
            self.__password = getpass.getpass("Enter new password: ")
            print("Saved.")
        else:
            print("Old passwords do not match!")

    def delete_account(self):
        pass

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
    # cart related methods
    ###########################

    # done
    def view_menu(self):
        col = ["Category", "Dish ID", "Dish Name", "Description", "Price"]
        self.read_database("customer_view_menu", None, col)

    # done
    def __get_name_price(self, menuID: int) -> str:
        with self.conn.cursor() as cursor:
            cursor.callproc("get_dish_name_price", (menuID,))
            tables = cursor.stored_results()
        for table in tables:
            for row in table.fetchall():
                return row

    # done
    def add_dish(self, menuID: int, quantity: int):
        if menuID in self.cart:
            self.cart[menuID][2] += quantity
        else:
            self.cart[menuID] = [self.__get_name_price(menuID)[0], self.__get_name_price(menuID)[1], quantity]
        print("Added.")

    # done
    def update_dish(self, menuID: int, quantity: int):
        if (menuID in self.cart) and quantity == 0:
            self.remove_dish(menuID)
        elif menuID in self.cart:
            self.cart[menuID][2] = quantity
        print("Updated.")
            
    # done
    def remove_dish(self, menuID: int):
        if menuID in self.cart:
            self.cart.pop(menuID)
        print("Removed.")

    # done
    def view_cart(self):
        if self.cart:
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
            print("Total: $" + str(sum(c_subtotal)))
        else:
            print("Empty Cart.")



    ###########################
    # order related methods
    ###########################
    
    # done, ignore business time check for now
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
            orderID = self.modify_database("create_order", (self.customerID, num_dish, total_before_tips))
            # save data to the order_list
            for i in range(len(c_listID)):
                self.modify_database("create_order_list", (orderID, c_listID[i], c_menuID[i], c_quantity[i]))
            print("Order received.")
            
    # done
    def cancel_order(self, orderID: int):
        # this one should be the same as the method in employee
        message = self.modify_database("update_order_status", (orderID, "Canceled"))
        print(message)

    # done
    def view_order_details(self, orderID: int):
        # this one should be the same as the method in employee
        col = ["Dish ID", "Name", "Quantity", "Price", "Subtotal"]
        self.read_database("view_order_detail", (orderID,), col)

    # done
    def view_order_history(self):
        col = ["Order ID", "Date", "Status", "Num Of Dish", "Subtotal", "Tips", "Total"]
        self.read_database("customer_view_order_history", (self.customerID,), col)



    ###########################
    # reservation related methods
    ###########################

    def view_business_hour(self):
        pass

    def reserve_table(self):
        date = input("Date(Y:M:D): ")
        # sql here to display available time
        time = input("Time(H:00): ")
        num_of_people = input("Number of People: ")
        # sql here
        pass

    def cancel_reservation(self, date: str, time: str, tableID: int):
        pass


    def view_reservation(self):
        pass





    ###########################
    # waiting list related methods
    ###########################

    def join_waiting_list(self):
        date = input("Date(Y:M:D): ")
        # sql here to display available time
        time = input("Time(H:00): ")
        num_of_people = input("Number of People: ")

    def cancel_waiting_list(self, waitingID: int):
        pass


    def view_waiting_list(self):
        pass



    