-- ds5110 restaurant project
-- first logical plan

-- create the database
create database if not exists restaurant;
use restaurant;

-- create the business_hour table
create table business_hour (
timeID int primary key auto_increment,
businessDay enum('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') not null,
openTime time not null, -- use 24 hour format 'Hour:Minute'
closeTime time not null, -- use 24 hour format
dayStatus boolean not null default True -- True means visible as the current option, False means offline
);

-- create the customer table
create table customer (
customerID int primary key auto_increment,
firstName varchar(64) not null,
lastName varchar(64) not null,
email varchar(64) not null unique,
phone varchar(64),
customerPassword varchar(64) not null
);

-- create the empyoyee table
create table employee (
employeeID int primary key auto_increment,
firstName varchar(64) not null,
lastName varchar(64) not null,
email varchar(64) not null unique,
phone varchar(64),
ssn char(11) unique,
salary decimal(9, 2) check (salary > 0),
occupation enum('Waiter', 'Chef', 'Manager') not null,
rating enum('1', '2', '3', '4', '5') -- 1 = bad, 5 = good
);

-- create the dining table table
create table dining_table (
tableID int primary key auto_increment,
capacity int not null check (capacity > 0),
tableStatus boolean not null default True -- True = enable this table, False = disable.
);

-- create the reservation_window table
create table reservation_window (
windowID int primary key auto_increment,
businessDay enum('Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday') not null,
startTime time not null, -- use 24 hour format 'Hour:Minute'
windowStatus boolean not null default True -- True means visible as the current option, False means offline
);

-- create the waiting_list table
create table waiting_list (
waitingID int primary key auto_increment,
waitingDate date not null,
windowID int not null,
customerID int,
numOfPeople int not null check (numOfPeople > 0),
waitingStatus enum('Joined', 'Cancelled') not null default 'Joined',
constraint waiting_fk_customer
	foreign key (customerID) references customer(customerID) on update cascade on delete set null,
constraint waiting_fk_window
	foreign key (windowID) references reservation_window(windowID) on update cascade on delete restrict
);

-- create the reservation table
create table reservation (
reservationDate date not null,
windowID int not null,
tableID int not null,
customerID int,
numOfPeople int not null check (numOfPeople > 0),
reservationStatus enum('Reserved', 'Cancelled') not null default 'Reserved',
employeeID int,
primary key (reservationDate, windowID, tableID),
constraint reservation_fk_window
	foreign key (windowID) references reservation_window(windowID) on update cascade on delete restrict,
constraint reservation_fk_table
	foreign key (tableID) references dining_table(tableID) on update cascade on delete restrict,
constraint reservation_fk_customer
	foreign key (customerID) references customer(customerID) on update cascade on delete set null,
constraint reservation_fk_employee
	foreign key (employeeID) references employee(employeeID) on update cascade on delete set null
);

-- create the menu_category table
create table menu_category (
categoryID int primary key auto_increment,
categoryName varchar(64) not null unique,
categoryDescription varchar(512)
);

-- create the menu table
create table menu (
menuID int primary key auto_increment,
categoryID int not null,
dishName varchar(64) not null,
dishDescription varchar(512),
price decimal(5,2) not null check (price > 0),
dishStatus boolean not null default True, -- True means customers can see, False = offline
constraint menu_fk_category
	foreign key (categoryID) references menu_category(categoryID) on update cascade on delete restrict
);

-- create the cart table
create table cart (
customerID int not null,
cartID int not null,
menuID int not null,
quantity int not null check (quantity > 0),
primary key (customerID, cartID),
constraint cart_fk_customer
	foreign key (customerID) references customer(customerID) on update cascade on delete cascade,
constraint cart_fk_menu
	foreign key (menuID) references menu(menuID) on update cascade on delete cascade
);

-- create the order table
create table orders (
orderID int primary key auto_increment,
orderDate date not null,
orderTime time not null,
orderStatus enum('Received', 'Ready', 'Cancelled') not null default 'Received',
orderInQueue boolean not null default False,
numOfDish int not null check (numOfDish > 0),
subtotal decimal(6,2) not null check (subtotal > 0),
tips decimal(6,2) default 0 check (tips >= 0),
total decimal(6,2) check (total > 0),
customerID int,
tableID int, 
constraint orders_fk_customer
	foreign key (customerID) references customer(customerID) on update cascade on delete set null,
constraint orders_fk_table
	foreign key (tableID) references dining_table(tableID) on update cascade on delete restrict
);

-- create the order_list table
create table order_list (
orderID int not null,
listID int not null,
menuID int not null,
quantity int not null check (quantity > 0),
primary key (orderID, listID),
constraint list_fk_order
	foreign key (orderID) references orders(orderID) on update cascade on delete restrict,
constraint list_fk_menu
	foreign key (menuID) references menu(menuID) on update cascade on delete restrict
);

-- create the ingredient table
create table ingredient (
ingredientID int primary key auto_increment,
ingredientName varchar(64) not null unique,
stock int not null default 0 check (stock >= 0)
);

-- create the dish_has_ingredient table
create table dish_has_ingredient (
menuID int not null,
ingredientID int not null,
quantity int not null check (quantity > 0),
primary key (menuID, ingredientID),
constraint dish_ingredient_fk_menu
	foreign key (menuID) references menu(menuID) on update cascade on delete cascade,
constraint dish_ingredient_fk_ingredient
	foreign key (ingredientID) references ingredient(ingredientID) on update cascade on delete cascade
);

-- create the inventory table
create table inventory (
inventoryID int primary key auto_increment,
ingredientID int not null,
quantity int not null check (quantity > 0),
totalCost decimal(6, 2) not null check (totalCost > 0),
employeeID int,
purchaseDate date not null,
expDate date,
constraint inventory_fk_ingredientID
	foreign key (ingredientID) references ingredient(ingredientID) on update cascade on delete restrict,
constraint inventory_fk_employeeID
	foreign key (employeeID) references employee(employeeID) on update cascade on delete set null
);

-- create the order_queue table
create table order_queue (
queueID int primary key auto_increment,
orderID int not null,
employeeID int,
constraint queue_fk_orders
	foreign key (orderID) references orders(orderID) on update cascade on delete restrict,
constraint queue_fk_employee
	foreign key (employeeID) references employee(employeeID) on update cascade on delete set null
);




