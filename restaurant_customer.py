'''
This is the main system for customer
'''

import getpass
from Customer import Customer
from os import system, name


# define constants
VALID_OPTIONS = ('1', '2', '3', '4', '5', '6', '7', '8', '9', '10',
                 '11', '12', '13', '14', '15', '16', '17', '18', '19', '20',
                 '21', '22', '23', '24')


# define screen clear function
def clear():
    # for windows
    if name == 'nt':
        _ = system('cls')
    # for mac and linux (here, os.name is 'posix')
    else:
        _ = system('clear')

# define the simple user interface
def gui():
    print("|---------W E L C O M E---------|")
    print("[1 ] -- Sign Up")
    print("[2 ] -- Sign In")
    print("[3 ] -- Sign Out")
    print("[4 ] -- View Account Information")
    print("[5 ] -- Change Phone Number")
    print("[6 ] -- Change Password")
    print("[7 ] -- Delete Account")
    print("[8 ] -- View Menu")
    print("[9 ] -- Add Dish")
    print("[10] -- Update Dish")
    print("[11] -- Remove Dish")
    print("[12] -- View Cart")
    print("[13] -- Place Order")
    print("[14] -- Cancel Order")
    print("[15] -- View Order Details")
    print("[16] -- View Order History")
    print("[17] -- View Business Hour")
    print("[18] -- Reserve Table")
    print("[19] -- Cancel Reservation")
    print("[20] -- View Reservation")
    print("[21] -- Join Waiting List")
    print("[22] -- Cancel Waiting List")
    print("[23] -- View Waiting List")
    print("[24] -- Exit")


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
    c = Customer()
    option = 0
    while option != int(VALID_OPTIONS[-1]):
        # clear the screen
        clear()
        if c.customerID:
            print(f"Current user: {c.firstName} {c.lastName}.")
        else:
            print(f"Current user: Guest.")
        gui()
        option = get_user_option()
        if option == 1: # sign up
            clear()
            if c.customerID != None:
                print("Sign out first.")
                pause_screen()
                continue
            firstName = input("First Name: ")
            lastName = input("Last Name: ")
            email = input("Email: ")
            phone = input("Phone: ")
            attempt1 = getpass.getpass("Enter password: ")
            attempt2 = getpass.getpass("Re-enter password: ")
            while attempt1 != attempt2:
                print("Passwords do not match!")
                attempt1 = getpass.getpass("Enter password: ")
                attempt2 = getpass.getpass("Re-enter password: ")
            password = attempt1
            c.sign_up(firstName, lastName, email, phone, password)
            pause_screen()
        elif option == 2: # sign in
            clear()
            if c.customerID != None:
                print("You are already signed in.")
                pause_screen()
                continue
            email = input("Email: ")
            password = getpass.getpass("Enter password: ")
            c.sign_in(email, password)
            pause_screen()
        elif option == 3: # sign out
            clear()
            c.sign_out()
            pause_screen()
        elif option == 4: # view info
            clear()
            if c.customerID == None:
                print("Sign in first to view information.")
                pause_screen()
                continue
            c.view_account_info()
            pause_screen()
        elif option == 5: # change phone
            clear()
            if c.customerID == None:
                print("Sign in first to change information.")
                pause_screen()
                continue
            new_phone = input("New phone number: ")
            c.change_phone(new_phone)
            pause_screen()
        elif option == 6: # change password
            clear()
            if c.customerID == None:
                print("Sign in first to change information.")
                pause_screen()
                continue
            old_pass = getpass.getpass("Enter old password: ")
            new_pass = getpass.getpass("Enter new password: ")
            c.change_password(old_pass, new_pass)
            pause_screen()
        elif option == 7: # delete account
            clear()
            if c.customerID == None:
                print("Sign in first to change information.")
                pause_screen()
                continue
            confirm = input("Confirm deletion? (Y/N): ").lower()
            if confirm != 'y':
                continue
            c.delete_account()
            pause_screen()
        elif option == 8: # view menu
            clear()
            c.view_menu()
            pause_screen()
        elif option == 9: # add dish
            clear()
            c.view_menu()
            menuID = int(input("Select dish ID: "))
            quantity = int(input("Input dish quantity: "))
            c.add_dish(menuID, quantity)
            c.view_cart()
            pause_screen()
        elif option == 10: # update dish
            clear()
            c.view_cart()
            if c.cart:
                menuID = int(input("Select dish ID: "))
                quantity = int(input("Input dish quantity: "))
                c.update_dish(menuID, quantity)
                c.view_cart()
            pause_screen()
        elif option == 11: # remove dish
            clear()
            c.view_cart()
            if c.cart:
                menuID = int(input("Select dish ID: "))
                c.remove_dish(menuID)
                c.view_cart()
            pause_screen()
        elif option == 12: # view cart
            clear()
            c.view_cart()
            pause_screen()
        elif option == 13: # place order
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            c.place_order()
            pause_screen()
        elif option == 14: # cancel order
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            table = c.read_database("customer_view_order_history", (c.customerID,))
            if not table:
                print("No history.")
                pause_screen()
                continue
            c.view_order_history()
            orderID = int(input("Select order ID: "))
            c.cancel_order(orderID)
            pause_screen()
        elif option == 15: # view order details
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            table = c.read_database("customer_view_order_history", (c.customerID,))
            if not table:
                print("No history.")
                pause_screen()
                continue
            c.view_order_history()
            orderID = int(input("Select order ID: "))
            c.view_order_details(orderID)
            pause_screen()
        elif option == 16: # view order history
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            c.view_order_history()
            pause_screen()
        elif option == 17: # view business hour
            clear()
            c.view_business_hour()
            pause_screen()
        elif option == 18: # reserve table
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            date = input("Input date (ex: 2022-10-17): ")
            time = input("Input time (ex: 18:00): ")
            num_of_people = int(input("Num of people (max 4): "))
            c.reserve_table(date, time, num_of_people)
            c.view_reservation()
            pause_screen()
        elif option == 19: # cancel reservation
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            table = c.read_database("view_reservation", (c.customerID,))
            if not table:
                print("No history.")
                pause_screen()
                continue
            c.view_reservation()
            date = input("Input date (ex: 2022-10-17): ")
            time = input("Input time (ex: 18:00): ")
            tableID = int(input("Select table ID: "))
            c.cancel_reservation(date, time, tableID)
            c.view_reservation()
            pause_screen()
        elif option == 20: # view reservation
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            c.view_reservation()
            pause_screen()
        elif option == 21: # join waiting list
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            date = input("Input date (ex: 2022-10-17): ")
            time = input("Input time (ex: 18:00): ")
            num_of_people = int(input("Num of people (max 4): "))
            c.join_waiting_list(date, time, num_of_people)
            c.view_waiting_list()
            pause_screen()
        elif option == 22: # cancel waiting list
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            table = c.read_database("view_waiting_list", (c.customerID,))
            if not table:
                print("No history.")
                pause_screen()
                continue
            c.view_waiting_list()
            waitingID = int(input("Select waiting list ID: "))
            c.cancel_waiting_list(waitingID)
            c.view_waiting_list()
            pause_screen()
        elif option == 23: # view waiting list
            clear()
            if c.customerID == None:
                print("Sign in first.")
                pause_screen()
                continue
            c.view_waiting_list()
            pause_screen()
        elif option == 24: # exit
            clear()
            # exit the python program
            c.exit_system()
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