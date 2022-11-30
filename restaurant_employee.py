'''
This is the main system for back employee
'''

import getpass
from Employee import Employee
from os import system, name


# define constants
VALID_OPTIONS = ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                 '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                 '21', '22', '23', '24', '25', '26', '27', '28', '29', '30',
                 '31', '32', '33', '34', '35', '36', '37')


# define screen clear function
def clear():
    # for windows
    if name == 'nt':
        _ = system('cls')
    # for mac and linux (here, os.name is 'posix')
    else:
        _ = system('clear')


#define the simple user interface
def gui():
    print("|--Restaurant Database Management System--|")
    print("[1 ] -- View All Orders")
    print("[2 ] -- View Order Detail")
    print("[3 ] -- Assign Table")
    print("[4 ] -- Cancel Order")
    print("[5 ] -- Update Order")
    print("[6 ] -- Update Tips")
    print("[7 ] -- Create Order Queue")
    print("[8 ] -- View Queue")
    print("[9 ] -- View All Reservations")
    print("[10] -- Assign Waiter")
    print("[11] -- Cancel Reservation")
    print("[12] -- View All Waiting Lists")
    print("[13] -- Cancel Waiting List")
    print("[14] -- View Whole Menu")
    print("[15] -- Add New Category")
    print("[16] -- Add New Dish")
    print("[17] -- Update Dish Status")
    print("[18] -- Update Dish Price")
    print("[19] -- Update Dish Description")
    print("[20] -- View Ingredient Stock")
    print("[21] -- Add New Ingredient")
    print("[22] -- View Dish Ingredient")
    print("[23] -- Add Dish Ingredient")
    print("[24] -- View Inventory")
    print("[25] -- Add Inventory")
    print("[26] -- View All Business Hours")
    print("[27] -- Add Business Hour")
    print("[28] -- Update Business Hour")
    print("[29] -- View All Tables")
    print("[30] -- ADD Table")
    print("[31] -- Update Table")
    print("[32] -- View Employee")
    print("[33] -- Add Employee")
    print("[34] -- Delete Employee")
    print("[35] -- Update Salary")
    print("[36] -- Rate Employee")
    print("[37] -- Exit")


# get user menu optioin
def get_user_option() -> int:
    option = input(f"Select Option [1]~[{VALID_OPTIONS[-1]}]: ")
    while option not in VALID_OPTIONS:
        print("Please select a valid option.")
        option = input(f"Select Option [1]~[{VALID_OPTIONS[-1]}]: ")
    return int(option)


# pause screen
def pause_screen():
    print("\n|----------------------------|")
    print("| Press <Enter> to continue. |")
    print("|----------------------------|")
    input()


# the program loop function
def menu_loop():
    # create one customer object
    e = Employee()
    option = 0
    while option != int(VALID_OPTIONS[-1]):
        # clear the screen
        clear()
        gui()
        option = get_user_option()
        if option == 1: # view all orders
            clear()
            e.view_all_orders()
            pause_screen()
        elif option == 2: # view order details
            clear()
            e.view_all_orders()
            orderID = int(input("Select order ID: "))
            e.view_order_detail(orderID)
            pause_screen()
        elif option == 3: # assign table
            clear()
            e.view_all_orders()
            orderID = int(input("Select order ID: "))
            e.view_all_tables()
            tableID = int(input("Select table ID: "))
            e.assign_table(orderID, tableID)
            pause_screen()
        elif option == 4: # cancel order
            clear()
            e.view_all_orders()
            orderID = int(input("Select order ID: "))
            e.cancel_order(orderID)
            pause_screen()
        elif option == 5: # update order
            clear()
            e.view_all_orders()
            orderID = int(input("Select order ID: "))
            e.update_order(orderID)
            pause_screen()
        elif option == 6: # update tips
            clear()
            e.view_all_orders()
            orderID = int(input("Select order ID: "))
            tips = int(input("Input tips: "))
            e.update_tips(orderID, tips)
            pause_screen()
        elif option == 7: # create order queue
            clear()
            e.view_all_orders()
            orderID = int(input("Select order ID: "))
            e.view_employee("Chef")
            employeeID = int(input("Select employee ID: "))
            e.create_order_queue(orderID, employeeID)
            pause_screen()
        elif option == 8: # view order queue
            clear()
            e.view_queue()
            pause_screen()
        elif option == 9: # view all reservation
            clear()
            e.view_all_reservations()
            pause_screen()
        elif option == 10: # assign waiter
            clear()
            e.view_all_reservations()
            date = input("Input date (ex: 2022-10-17): ")
            time = input("Input time (ex: 18:00): ")
            e.view_all_tables()
            tableID = int(input("Select table ID: "))
            e.view_employee("Waiter")
            employeeID = int(input("Select employee ID: "))
            e.assign_waiter(date, time, tableID, employeeID)
            pause_screen()
        elif option == 11: # cancel reservation
            clear()
            e.view_all_reservations()
            date = input("Input date (ex: 2022-10-17): ")
            time = input("Input time (ex: 18:00): ")
            tableID = int(input("Select table ID: "))
            e.cancel_reservation(date, time, tableID)
            pause_screen()
        elif option == 12: # view all waiting list
            clear()
            e.view_all_waiting_list()
            pause_screen()
        elif option == 13: # cancel waiting
            clear()
            e.view_all_waiting_list()
            waitingID = int(input("Select waiting list ID: "))
            e.cancel_waiting_list(waitingID)
            pause_screen()
        elif option == 14: # view all menu items
            clear()
            e.view_menu()
            pause_screen()
        elif option == 15: # add new menu category
            clear()
            categoryName = input("Input new category name: ")
            e.add_new_category(categoryName)
            pause_screen()
        elif option == 16: # add new dish
            clear()
            categoryName = input("Input category name: ")
            dishName = input("Input dish name: ")
            price = float(input("Input price: "))
            e.add_new_dish(categoryName, dishName, price)
            pause_screen()
        elif option == 17: # update dish status
            clear()
            e.view_menu()
            menuID = int(input("Input dish ID: "))
            dishStatus = int(input("1=On 0=OFF: "))
            e.update_dish_status(menuID, dishStatus)
            pause_screen()
        elif option == 18: # update dish price
            clear()
            e.view_menu()
            menuID = int(input("Input dish ID: "))
            newPrice = float(input("Input new price: "))
            e.update_dish_price(menuID, newPrice)
            pause_screen()
        elif option == 19: # update dish description
            clear()
            e.view_menu()
            menuID = int(input("Input dish ID: "))
            newDes = input("Input new description: ")
            e.update_dish_description(menuID, newDes)
            pause_screen()
        elif option == 20: # view ingredient stock
            clear()
            e.view_ingredient_stock()
            pause_screen()
        elif option == 21: # add new ingredient
            clear()
            ingredientName = input("Input new ingredient name: ")
            e.add_new_ingredient(ingredientName)
            pause_screen()
        elif option == 22: # view dish ingredient
            clear()
            e.view_menu()
            menuID = int(input("Select dish ID: "))
            e.view_dish_ingredient(menuID)
            pause_screen()
        elif option == 23: # add dish ingredient
            clear()
            e.view_menu()
            dishName = input("Input dish name: ")
            e.view_ingredient_stock()
            ingredientName = input("Input ingredient name: ")
            quantity = int(input("Input quantity: "))
            e.add_dish_has_ingredient(dishName, ingredientName, quantity)
            pause_screen()
        elif option == 24: # view inventory
            clear()
            e.view_inventory()
            pause_screen()
        elif option == 25: # add inventory
            clear()
            ingredientName = input("Input ingredient name: ")
            quantity = int(input("Input quantity: "))
            totalCost = float(input("Input cost: "))
            e.view_employee("Manager")
            employeeID = int(input("Select employee ID: "))
            purchaseDate = input("Input purchase date: ")
            expDate = input("Input expiration date: ")
            e.add_inventory(ingredientName, quantity, totalCost, employeeID, purchaseDate, expDate)
            pause_screen()
        elif option == 26: # view all business hour
            clear()
            e.view_all_business_hours()
            pause_screen()
        elif option == 27: # add business hour
            clear()
            businessDay = input("Input day of the week: ").capitalize()
            openTime = input("Input open time (ex: 11:00): ")
            closeTime = input("Input close time (ex: 22:00): ")
            e.add_business_hour(businessDay, openTime, closeTime)
            pause_screen()
        elif option == 28: # update business hour
            clear()
            e.view_all_business_hours()
            timeID = int(input("Select time ID: "))
            dayStatus = int(input("1=On, 0=OFF: "))
            e.update_business_hour(timeID, dayStatus)
            pause_screen()
        elif option == 29: # view all table
            clear()
            e.view_all_tables()
            pause_screen()
        elif option == 30: # add new table
            clear()
            capacity = int(input("Input table capacity (max 4): "))
            e.add_table(capacity)
            pause_screen()
        elif option == 31: # update table
            clear()
            e.view_all_tables()
            tableID = int(input("Select table ID: "))
            tableStatus = int(input("1=On, 0=OFF: "))
            e.update_table(tableID, tableStatus)
            pause_screen()
        elif option == 32: # view employee
            clear()
            e.view_employee(None)
            pause_screen()
        elif option == 33: # add new employee
            clear()
            firstName = input("First Name: ")
            lastName = input("Last Name: ")
            email = input("Email: ")
            phone = input("Phone: ")
            ssn = input("SSN number: ")
            salary = float(input("Salary: "))
            occupation = input("Occupation: ")
            e.add_employee(firstName, lastName, email, phone, ssn, salary, occupation)
            pause_screen()
        elif option == 34: # delete employee
            clear()
            e.view_employee(None)
            employeeID = int(input("Select employee ID: "))
            confirm = input("Confirm deletion? (Y/N): ").lower()
            if confirm != 'y':
                continue
            e.delete_employee(employeeID)
            pause_screen()
        elif option == 35: # update salary
            clear()
            e.view_employee(None)
            employeeID = int(input("Select employee ID: "))
            salary = float(input("Input new salary: "))
            e.update_salary(employeeID, salary)
            pause_screen()
        elif option == 36: # rate employee
            clear()
            e.view_employee(None)
            employeeID = int(input("Select employee ID: "))
            rating = input("Input rating (1~5): ")
            e.rate_employee(employeeID, rating)
            pause_screen()
        elif option == 37: # exit
            clear()
            # exit the python program
            e.exit_system()
            print("Bye!")
        else:
            clear()
            print("Invalid option.")
            pause_screen()
    # end of while
        

def main():
    menu_loop()

if __name__ == "__main__":
    main()