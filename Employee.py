'''
This module is a class of the employee
'''

import getpass
from mysql.connector import connect, Error

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

    ###########################
    # order related methods
    ###########################

    def view_all_orders(self):
        pass



    def view_order(self, orderID: int):
        # this one should be the same as the method in customer
        pass

    def assign_table_to_order(self, orderID: int, tableID: int):
        pass

    def cancel_order(self, orderID: int):
        # this one should be the same as the method in customer
        # after order in queue, cannot cancel
        pass

    def update_order(self, orderID: int):
        # turn from "Received" to "Ready"
        pass

    def update_tips(self, orderID: int, tips: float):
        # this will trigger total
        pass

    def put_order_in_queue(self, orderID: int, employeeID: int):
        pass


    
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

    def view_menu(self):
        pass

    def add_new_category(self, categoryName: str):
        pass

    def add_new_dish(self, categoryName: str, dishName: str, dishDescription: str, price: float):
        pass

    def update_dish_status(self, menuID: int, dishStatus: int):
        pass


    def update_dish_price(self, menuID: int, newPrice: float):
        pass

    def view_ingredient_stock(self):
        pass

    def add_new_ingredient(self, ingredientName: str):
        pass

    def view_dish_has_ingredient(self):
        pass

    def add_dish_has_ingredient(self, dishName: str, ingredientName: str, quantity: int):
        pass

    def view_inventory(self):
        pass

    def add_inventory(self, ingredientName: str, quantity: int, totalCost: float, employeeID: int, purchaseDate: str, expDate: str):
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