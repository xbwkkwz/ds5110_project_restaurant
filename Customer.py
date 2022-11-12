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
        self.cart = {}
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
                self.conn.commit()
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






    ###########################
    # cart related methods
    ###########################

    # done
    def view_menu(self):
        query = "call customer_view_menu()"
        df = pd.read_sql(query, self.conn)
        df.index = df.index + 1
        print(df)

    # working
    def add_dish(self, menuID: int, quantity: int):
        if menuID in self.cart:
            self.cart[menuID] += 1
        else:
            self.cart[menuID] = 1
        print("Added.")

    # working
    def update_dish(self, menuID: int, quantity: int):
        if (menuID in self.cart) and quantity == 0:
            self.remove_dish(menuID)
        elif menuID in self.cart:
            self.cart[menuID] = quantity
        print("Updated.")
            
    # working
    def remove_dish(self, menuID: int):
        if menuID in self.cart:
            self.cart.pop(menuID)
        print("Removed.")

    # working
    def view_cart(self):
        for menuID in self.cart.keys():
            # call sql here
            query = "call view_cart(%s)"
            parames = []
            df = pd.read_sql(query, self.conn)
            df.index = df.index + 1
            print(df)



    ###########################
    # order related methods
    ###########################

    def place_order(self):
        if not self.cart:
            print("Empty cart!")
        else:
            # sql codes here
            pass


    def cancel_order(self, orderID: int):
        # after order in queue, cannot cancel
        pass

    def view_order(self, orderID: int):
        pass

    def view_order_history(self):
        pass






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



    