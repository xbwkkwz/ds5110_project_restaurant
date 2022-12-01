'''
This module will generate dummy orders
'''

from Customer import Customer
from random import randint
from random import gauss
import pandas as pd
import matplotlib.pyplot as plt

num_customer = 52
num_menu = 43
num_quantity = 2
num_people = 4
num_orders = 15

c = Customer()

def generate_orders():
    for i in range(num_orders):
        c.customerID = randint(1, num_customer)
        for j in range(round(gauss(2,1))):
            menuID = randint(1, num_menu)
            quantity = randint(1, num_quantity)
            c.add_dish(menuID, quantity)
        c.place_order()

def plot_data1():
    table = c.read_database("employee_view_order_history", None)
    x = [int(row[0]) for row in table]
    y1 = [float(row[6]) for row in table]
    y2 = [float(float(row[6])/int(row[5])) for row in table]

    # col = ["Order ID", "Date", "Time", "Status", "In Queue", "Num Of Dish", "Subtotal", "Tips", "Total", "Customer ID", "Table ID"]
    # df = pd.DataFrame(table, columns = col, dtype = float)
    # ax = df.plot.bar(x='Order ID', y='Total', rot=0)
    #plt.style.use('_mpl-gallery')

    # first plot, total spending per order
    fig, ax = plt.subplots()
    ax.hist(y1, bins=8, linewidth=0.5, edgecolor="white")
    plt.xlabel("Total Spending per Order ($)")
    plt.ylabel("Number of Orders")
    plt.show()

def plot_data2():
    table = c.read_database("employee_view_order_history", None)
    x = [int(row[0]) for row in table]
    y1 = [float(row[6]) for row in table]
    y2 = [float(float(row[6])/int(row[5])) for row in table]

    # second plot, average dish spending per order
    fig, ax = plt.subplots()
    ax.hist(y2, bins=8, linewidth=0.5, edgecolor="white")
    plt.xlabel("Average Spending per Dish ($)")
    plt.ylabel("Number of Orders")
    plt.show()

def plot_data3():
    # third plot, popular dish category
    table = c.read_database("popular_category", None)
    id = [int(row[0]) for row in table]
    name = [str(row[1]) for row in table]
    count = [int(row[2]) for row in table]
    fig, ax = plt.subplots()
    ax.pie(count, wedgeprops={"linewidth": 0.5, "edgecolor": "white"}, labels=name)
    plt.title("Popular Dish Categories")
    plt.show()

def plot_data4():
    # fourth plot, freq ingredient
    table = c.read_database("freq_ingredient", None)
    id = [int(row[0]) for row in table]
    name_raw = [str(row[1]) for row in table]
    count_raw = [int(row[2]) for row in table]
    name = name_raw[0:13]
    name.append("Other")
    count = count_raw[0:13]
    count.append(sum(count_raw[13:]))
    fig, ax = plt.subplots()
    ax.pie(count, wedgeprops={"linewidth": 0.5, "edgecolor": "white"}, labels=name)
    plt.title("Most Commonly Used Ingredients")
    plt.show()

def main():
    # generate_orders()
    # plot_data1()
    # plot_data2()
    #plot_data3()
    plot_data4()

if __name__ == "__main__":
    main()