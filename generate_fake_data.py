'''
This module will generate fake data
'''

import pandas as pd
import faker

# define constants
NUM_OF_CUSTOMER = 50
WAITER = 10
CHEF = 10
MANAGER = 10
NUM_OF_EMPLOYEE = [WAITER, CHEF, MANAGER]

# fake data for customers
def generate_customer_email():
    # define the fields
    customerID, email = [], []

    # generate fake data
    fake = faker.Faker()
    start = 1
    for i in range(NUM_OF_CUSTOMER):
        customerID.append(start)
        start += 1
        email.append(fake.email(domain = "gmail.com"))

    # save to the csv file
    dicts = {
        "customerID" : customerID,
        "email" : email, 
        }
    df = pd.DataFrame(dicts)
    df.to_csv("customer_bulk_email.csv")

# fake data for customers
def generate_customer_other():
    # define the fields
    customerID, firstName, lastName, phone, customerPassword = [], [], [], [], []

    # generate fake data
    fake = faker.Faker()
    start = 1
    for i in range(NUM_OF_CUSTOMER):
        customerID.append(start)
        start += 1
        name = fake.name().split(' ')
        firstName.append(name[0])
        lastName.append(name[1])
        num_str = str(fake.random_number(digits = 10, fix_len = True))
        phone.append('(' + num_str[0:3] + ')' + num_str[3:6] + '-' + num_str[6:])
        customerPassword.append(fake.password())

    # save to the csv file
    dicts = {
        "customerID" : customerID,
        "firstName" : firstName, 
        "lastName" : lastName, 
        "phone" : phone, 
        "customerPassword" : customerPassword
        }
    df = pd.DataFrame(dicts)
    df.to_csv("customer_bulk_other.csv")


# fake data for employees
def generate_employee_email():
    # define the fields
    employeeID, email = [], []

    # generate fake data
    fake = faker.Faker()
    start = 1
    for i in range(30):
        employeeID.append(start)
        start += 1
        email.append(fake.email(domain = "gmail.com"))

    # save to the csv file
    dicts = {
        "employeeID" : employeeID,
        "email" : email, 
        }
    df = pd.DataFrame(dicts)
    df.to_csv("employee_bulk_email.csv")

# fake data for employees
def generate_employee_other():
    # define the fields
    employeeID, firstName, lastName, phone, ssn, salary, occupation, rating = [], [], [], [], [], [], [], []
    salary_sample = [60000, 90000, 120000]
    occupation_sample = ["Waiter", "Chef", "Manager"]

    # generate fake data
    fake = faker.Faker()
    start = 1
    for i in range(3):
        for j in range(NUM_OF_EMPLOYEE[i]):
            employeeID.append(start)
            start += 1
            name = fake.name().split(' ')
            firstName.append(name[0])
            lastName.append(name[1])
            num_str = str(fake.random_number(digits = 10, fix_len = True))
            phone.append('(' + num_str[0:3] + ')' + num_str[3:6] + '-' + num_str[6:])
            ssn.append(fake.ssn())
            salary.append(salary_sample[i])
            occupation.append(occupation_sample[i])
            rating.append('5')

    # save to the csv file
    dicts = {
        "employeeID" : employeeID,
        "firstName" : firstName, 
        "lastName" : lastName, 
        "phone" : phone, 
        "ssn" : ssn, 
        "salary" : salary,
        "occupation" : occupation,
        "rating" : rating
        }
    df = pd.DataFrame(dicts)
    df.to_csv("employee_bulk_other.csv")


def main():
    #generate_customer_email()
    #generate_customer_other()
    #generate_employee_email()
    generate_employee_other()

if __name__ == "__main__":
    main()