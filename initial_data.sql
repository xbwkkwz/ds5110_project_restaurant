-- ds5110 restaurant project
-- second populate initial data

use restaurant;

-- add data to the business_hour table
-- regular
insert into business_hour (timeID, businessDay, openTime, closeTime, dayStatus)
values
(1, 'Monday', '11:00', '20:00', true),
(2, 'Tuesday', '11:00', '20:00', true),
(3, 'Wednesday', '11:00', '20:00', true),
(4, 'Thursday', '11:00', '20:00', true),
(5, 'Friday', '11:00', '20:00', true),
(6, 'Saturday', '11:00', '20:00', true),
(7, 'Sunday', '11:00', '20:00', true);
-- extended close
insert into business_hour (timeID, businessDay, openTime, closeTime, dayStatus)
values
(8, 'Monday', '11:00', '22:00', false),
(9, 'Tuesday', '11:00', '22:00', false),
(10, 'Wednesday', '11:00', '22:00', false),
(11, 'Thursday', '11:00', '22:00', false),
(12, 'Friday', '11:00', '22:00', false),
(13, 'Saturday', '11:00', '22:00', false),
(14, 'Sunday', '11:00', '22:00', false);
-- late open and close
insert into business_hour (timeID, businessDay, openTime, closeTime, dayStatus)
values
(15, 'Monday', '12:00', '22:00', false),
(16, 'Tuesday', '12:00', '22:00', false),
(17, 'Wednesday', '12:00', '22:00', false),
(18, 'Thursday', '12:00', '22:00', false),
(19, 'Friday', '12:00', '22:00', false),
(20, 'Saturday', '12:00', '22:00', false),
(21, 'Sunday', '12:00', '22:00', false);


-- add data to the dining table
-- table of 1 person, 5 seats
insert into dining_table (tableID, capacity, tableStatus)
values
(1, 1, true), (2, 1, true), (3, 1, true), (4, 1, true), (5, 1, true);
-- table of 2 persons, 10 seats
insert into dining_table (tableID, capacity, tableStatus)
values
(6, 2, true), (7, 2, true), (8, 2, true), (9, 2, true), (10, 2, true), (11, 2, true), (12, 2, true), (13, 2, true), (14, 2, true), (15, 2, true);
-- table of 4 persons, 5 seats
insert into dining_table (tableID, capacity, tableStatus)
values
(16, 4, true), (17, 4, true), (18, 4, true), (19, 4, true), (20, 4, true);

-- add data to the reservation window
insert into reservation_window (windowID, businessDay, startTime, windowStatus)
values
-- 7 days a week, 24 windows a day, all options are here
(1, 'Monday', '00:00', false),
(2, 'Monday', '01:00', false),
(3, 'Monday', '02:00', false),
(4, 'Monday', '03:00', false),
(5, 'Monday', '04:00', false),
(6, 'Monday', '05:00', false),
(7, 'Monday', '06:00', false),
(8, 'Monday', '07:00', false),
(9, 'Monday', '08:00', false),
(10, 'Monday', '09:00', false),
(11, 'Monday', '10:00', false),
(12, 'Monday', '11:00', true),
(13, 'Monday', '12:00', true),
(14, 'Monday', '13:00', true),
(15, 'Monday', '14:00', true),
(16, 'Monday', '15:00', true),
(17, 'Monday', '16:00', true),
(18, 'Monday', '17:00', true),
(19, 'Monday', '18:00', true),
(20, 'Monday', '19:00', true),
(21, 'Monday', '20:00', false),
(22, 'Monday', '21:00', false),
(23, 'Monday', '22:00', false),
(24, 'Monday', '23:00', false),
(25, 'Tuesday', '00:00', false),
(26, 'Tuesday', '01:00', false),
(27, 'Tuesday', '02:00', false),
(28, 'Tuesday', '03:00', false),
(29, 'Tuesday', '04:00', false),
(30, 'Tuesday', '05:00', false),
(31, 'Tuesday', '06:00', false),
(32, 'Tuesday', '07:00', false),
(33, 'Tuesday', '08:00', false),
(34, 'Tuesday', '09:00', false),
(35, 'Tuesday', '10:00', false),
(36, 'Tuesday', '11:00', true),
(37, 'Tuesday', '12:00', true),
(38, 'Tuesday', '13:00', true),
(39, 'Tuesday', '14:00', true),
(40, 'Tuesday', '15:00', true),
(41, 'Tuesday', '16:00', true),
(42, 'Tuesday', '17:00', true),
(43, 'Tuesday', '18:00', true),
(44, 'Tuesday', '19:00', true),
(45, 'Tuesday', '20:00', false),
(46, 'Tuesday', '21:00', false),
(47, 'Tuesday', '22:00', false),
(48, 'Tuesday', '23:00', false),
(49, 'Wednesday', '00:00', false),
(50, 'Wednesday', '01:00', false),
(51, 'Wednesday', '02:00', false),
(52, 'Wednesday', '03:00', false),
(53, 'Wednesday', '04:00', false),
(54, 'Wednesday', '05:00', false),
(55, 'Wednesday', '06:00', false),
(56, 'Wednesday', '07:00', false),
(57, 'Wednesday', '08:00', false),
(58, 'Wednesday', '09:00', false),
(59, 'Wednesday', '10:00', false),
(60, 'Wednesday', '11:00', true),
(61, 'Wednesday', '12:00', true),
(62, 'Wednesday', '13:00', true),
(63, 'Wednesday', '14:00', true),
(64, 'Wednesday', '15:00', true),
(65, 'Wednesday', '16:00', true),
(66, 'Wednesday', '17:00', true),
(67, 'Wednesday', '18:00', true),
(68, 'Wednesday', '19:00', true),
(69, 'Wednesday', '20:00', false),
(70, 'Wednesday', '21:00', false),
(71, 'Wednesday', '22:00', false),
(72, 'Wednesday', '23:00', false),
(73, 'Thursday', '00:00', false),
(74, 'Thursday', '01:00', false),
(75, 'Thursday', '02:00', false),
(76, 'Thursday', '03:00', false),
(77, 'Thursday', '04:00', false),
(78, 'Thursday', '05:00', false),
(79, 'Thursday', '06:00', false),
(80, 'Thursday', '07:00', false),
(81, 'Thursday', '08:00', false),
(82, 'Thursday', '09:00', false),
(83, 'Thursday', '10:00', false),
(84, 'Thursday', '11:00', true),
(85, 'Thursday', '12:00', true),
(86, 'Thursday', '13:00', true),
(87, 'Thursday', '14:00', true),
(88, 'Thursday', '15:00', true),
(89, 'Thursday', '16:00', true),
(90, 'Thursday', '17:00', true),
(91, 'Thursday', '18:00', true),
(92, 'Thursday', '19:00', true),
(93, 'Thursday', '20:00', false),
(94, 'Thursday', '21:00', false),
(95, 'Thursday', '22:00', false),
(96, 'Thursday', '23:00', false),
(97, 'Friday', '00:00', false),
(98, 'Friday', '01:00', false),
(99, 'Friday', '02:00', false),
(100, 'Friday', '03:00', false),
(101, 'Friday', '04:00', false),
(102, 'Friday', '05:00', false),
(103, 'Friday', '06:00', false),
(104, 'Friday', '07:00', false),
(105, 'Friday', '08:00', false),
(106, 'Friday', '09:00', false),
(107, 'Friday', '10:00', false),
(108, 'Friday', '11:00', true),
(109, 'Friday', '12:00', true),
(110, 'Friday', '13:00', true),
(111, 'Friday', '14:00', true),
(112, 'Friday', '15:00', true),
(113, 'Friday', '16:00', true),
(114, 'Friday', '17:00', true),
(115, 'Friday', '18:00', true),
(116, 'Friday', '19:00', true),
(117, 'Friday', '20:00', false),
(118, 'Friday', '21:00', false),
(119, 'Friday', '22:00', false),
(120, 'Friday', '23:00', false),
(121, 'Saturday', '00:00', false),
(122, 'Saturday', '01:00', false),
(123, 'Saturday', '02:00', false),
(124, 'Saturday', '03:00', false),
(125, 'Saturday', '04:00', false),
(126, 'Saturday', '05:00', false),
(127, 'Saturday', '06:00', false),
(128, 'Saturday', '07:00', false),
(129, 'Saturday', '08:00', false),
(130, 'Saturday', '09:00', false),
(131, 'Saturday', '10:00', false),
(132, 'Saturday', '11:00', true),
(133, 'Saturday', '12:00', true),
(134, 'Saturday', '13:00', true),
(135, 'Saturday', '14:00', true),
(136, 'Saturday', '15:00', true),
(137, 'Saturday', '16:00', true),
(138, 'Saturday', '17:00', true),
(139, 'Saturday', '18:00', true),
(140, 'Saturday', '19:00', true),
(141, 'Saturday', '20:00', false),
(142, 'Saturday', '21:00', false),
(143, 'Saturday', '22:00', false),
(144, 'Saturday', '23:00', false),
(145, 'Sunday', '00:00', false),
(146, 'Sunday', '01:00', false),
(147, 'Sunday', '02:00', false),
(148, 'Sunday', '03:00', false),
(149, 'Sunday', '04:00', false),
(150, 'Sunday', '05:00', false),
(151, 'Sunday', '06:00', false),
(152, 'Sunday', '07:00', false),
(153, 'Sunday', '08:00', false),
(154, 'Sunday', '09:00', false),
(155, 'Sunday', '10:00', false),
(156, 'Sunday', '11:00', true),
(157, 'Sunday', '12:00', true),
(158, 'Sunday', '13:00', true),
(159, 'Sunday', '14:00', true),
(160, 'Sunday', '15:00', true),
(161, 'Sunday', '16:00', true),
(162, 'Sunday', '17:00', true),
(163, 'Sunday', '18:00', true),
(164, 'Sunday', '19:00', true),
(165, 'Sunday', '20:00', false),
(166, 'Sunday', '21:00', false),
(167, 'Sunday', '22:00', false),
(168, 'Sunday', '23:00', false);

-- add data to the menu category
insert into menu_category (categoryID, categoryName, categoryDescription)
values
(1, 'Starters', 'Activate your taste buds'),
(2, 'Lobster Fra Diavolo', 'Seafood chowder'),
(3, 'Black Pasta', 'Fresh homemade black linguine made with squid ink'),
(4, 'Classics', 'Served a la carte'),
(5, 'Seafood & Linguine', 'Cooked from scratch & served in the pan'),
(6, 'Fried', 'Served lightly breaded with fries, onion rings, & tartar'),
(7, 'Broiled', 'Crispy topping, olive oil, garlic, romano, breadcrumbs'),
(8, 'Sides', 'Extra and more'),
(9, 'Pizza', 'Garlic-seasoned crust with a rich, buttery taste'),
(10, 'Drink', 'Refreshing taste');

-- add data to the menu
-- starters
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(1, 1, 'Fried Calamari', 'Lemon & red sauce', 16.50, true),
(2, 1, 'Clams Casino', 'Broiled cherrystones, crispy topping', 17.25, true),
(3, 1, 'Shrimp Scampi', 'Garlic, lemon, butter, romano', 17.50, true),
(4, 1, 'Calamari Scampi', 'Garlic, lemon, butter, romano', 17.50, true),
(5, 1, 'Mussel Siciliano', 'Fennel, thyme, shallots, lemon, wine', 16.00, true),
(6, 1, 'Littleneck Siciliano', 'Fennel, thyme, shallots, lemon, wine', 17.25, true),
(7, 1, 'Caesar Salad', 'Romaine, croutons, romano', 11.00, true),
(8, 1, 'Calamari Salad', 'Classic marinated calamari served over a bed of greens', 16.75, true),
(9, 1, 'House Salad', 'Greens, tomatoes, cucumbers, carrots, red onion, balsamic viniagrette', 9.75, true),
(10, 1, 'Cherrystones', '1/2 dozen raw, served with cocktail sauce', 14.00, true),
(11, 1, 'Littlenecks', '1/2 dozen raw, served with cocktail sauce', 14.00, true);
-- Lobster Fra Diavolo
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(12, 2, 'Lobster Fra Diavolo', '1.25 lb live lobster cut into pieces with littlenecks, mussels, shrimp and calamari simmered in a spicy seafood tomato sauce served over linguine', 67.00, true);
-- Black Pasta
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(13, 3, 'Aglio Olio', 'Ground calamari, olive oil, garlic, anchovy', 28.00, true),
(14, 3, 'Alfredo', 'Cream reduction, butter, romano', 28.00, true),
(15, 3, 'Puttanesca', 'Mushrooms, peppers, onions, olive anchovy butter', 28.00, true);
-- classics
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(16, 4, 'Monkfish Marsala', 'Tender medallions of monkfish simmered with mushrooms in a sweet marsala sauce', 26.25, true),
(17, 4, 'North End Style Salmon', 'Pan seared with sundried tomatoes & mushrooms in tomato basil sauce', 28.50, true),
(18, 4, 'North End Style Swordfish', 'Pan seared with sundried tomatoes & mushrooms in tomato basil sauce', 30.25, true);
-- SEAFOOD & LINGUINE
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(19, 5, 'Calamari', 'Signature seafood tomato sauce', 26.75, true),
(20, 5, 'Clams', 'Olive oil, garlic & clam sauce', 29.00, true),
(21, 5, 'Calamari & Clams Combo', 'Signature seafood tomato sauce', 29.00, true),
(22, 5, 'Mussel Marinara', 'Signature seafood tomato sauce', 25.50, true),
(23, 5, 'Vongole Neapolitan', 'Olive oil, garlic & clam sauce', 30.00, true),
(24, 5, 'Scallops', 'Signature seafood tomato sauce', 29.75, true),
(25, 5, 'Shrimp', 'Signature seafood tomato sauce', 29.75, true),
(26, 5, 'Shrimp, Scallops & Broccoli', 'Olive oil, garlic & clam sauce', 31.00, true),
(27, 5, 'Frutti Di Mare', 'Signature seafood tomato sauce', 43.00, true);
-- FRIED
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(28, 6, 'Fish Haddock Chips', 'Fresh filleted haddock', 28.50, true),
(29, 6, 'Fish Monkfish Chips', 'Fresh filleted monkfish', 28.50, true),
(30, 6, 'Fritto Misto', 'Shrimp, scallops, calamari, fish', 36.75, true);
-- BROILED
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(31, 7, 'Haddock', null, 25.50, true),
(32, 7, 'Swordfish', null, 25.50, true),
(33, 7, 'Scallops', null, 26.50, true),
(34, 7, 'Salmon', null, 28.50, true);
-- Sides
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(35, 8, 'Broccoli Saute', null, 8.50, true),
(36, 8, 'French Fries', null, 5.50, true),
(37, 8, 'Linguine', null, 8.00, true),
(38, 8, 'Black Pasta', null, 9.50, true);
-- pizza
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(39, 9, 'Cheese', '10-inch with alfredo sauce', 14.00, true),
(40, 9, 'Pepperoni', '10-inch with tomato sauce', 16.00, true);
-- drink
insert into menu (menuID, categoryID, dishName, dishDescription, price, dishStatus)
values
(41, 10, 'Orange Juice', 'Not from concentrate', 10.00, true);

-- add data to the ingredient table
insert into ingredient (ingredientID, ingredientName, stock)
values
(1, 'Calamari', 500),
(2, 'Red sauce', 100),
(3, 'Cherrystone', 500),
(4, 'Shrimp', 500),
(5, 'Scampi', 500),
(6, 'Mussel', 500),
(7, 'Littleneck', 500),
(8, 'Romaine', 500),
(9, 'Crouton', 500),
(10, 'Tomato', 500),
(11, 'Cucumber', 500),
(12, 'Carrot', 500),
(13, 'Red onion', 500),
(14, 'Cocktail sauce', 100),
(15, 'Lobster', 100),
(16, 'Tomato sauce', 500),
(17, 'Linguine', 500),
(18, 'Black pasta', 500),
(19, 'Alfredo sauce', 500),
(20, 'Mushroom', 500),
(21, 'Pepper', 500),
(22, 'Monkfish', 100),
(23, 'Marsala sauce', 100),
(24, 'Salmon', 100),
(25, 'Swordfish', 100),
(26, 'Clam sauce', 500),
(27, 'Scallop', 500),
(28, 'Broccoli', 500),
(29, 'Haddock', 100),
(30, 'Potato', 500),
(31, 'Cheese', 500),
(32, 'Pepperoni', 500),
(33, 'Orange', 500);

-- add data to the dish_has_ingredient table
insert into dish_has_ingredient (menuID, ingredientID, quantity)
values
(1, 1, 10),
(1, 2, 1),
(2, 3, 10),
(3, 4, 5),
(3, 5, 5),
(4, 1, 5),
(4, 5, 5),
(5, 6, 10),
(6, 7, 10),
(7, 8, 10),
(7, 9, 5),
(8, 1, 5),
(8, 8, 10),
(9, 8, 5),
(9, 10, 1),
(9, 11, 1),
(9, 12, 1),
(9, 13, 1),
(10, 3, 6),
(10, 14, 1),
(11, 7, 6),
(11, 14, 6),
(12, 15, 1),
(12, 7, 5),
(12, 6, 5),
(12, 4, 5),
(12, 1, 5),
(12, 16, 1),
(12, 17, 1),
(13, 18, 1),
(13, 1, 5),
(14, 18, 1),
(14, 19, 1),
(15, 18, 1),
(15, 13, 1),
(15, 20, 2),
(15, 21, 1),
(16, 22, 1),
(16, 20, 2),
(16, 23, 1),
(17, 24, 1),
(17, 10, 1),
(17, 20, 2),
(17, 16, 1),
(18, 25, 1),
(18, 10, 1),
(18, 20, 2),
(18, 16, 1),
(19, 17, 1),
(19, 1, 5),
(19, 16, 1),
(20, 17, 1),
(20, 3, 5),
(20, 26, 1),
(21, 17, 1),
(21, 1, 3),
(21, 3, 3),
(21, 16, 1),
(22, 17, 1),
(22, 6, 5),
(22, 16, 1),
(23, 17, 1),
(23, 3, 5),
(23, 26, 1),
(24, 17, 1),
(24, 27, 5),
(24, 16, 1),
(25, 17, 1),
(25, 4, 5),
(25, 16, 1),
(26, 17, 1),
(26, 4, 5),
(26, 27, 5),
(26, 28, 5),
(26, 26, 1),
(27, 17, 1),
(27, 1, 2),
(27, 3, 2),
(27, 4, 2),
(27, 5, 2),
(27, 6, 2),
(27, 7, 2),
(27, 27, 2),
(27, 16, 1),
(28, 29, 1),
(29, 22, 1),
(30, 1, 5),
(30, 4, 5),
(30, 27, 5),
(31, 29, 1),
(32, 25, 1),
(33, 27, 15),
(34, 24, 1),
(35, 28, 5),
(36, 30, 2),
(37, 17, 1),
(38, 18, 1),
(39, 31, 1),
(39, 19, 1),
(40, 32, 10),
(40, 16, 1),
(41, 33, 3);

-- insert data into inventory table
insert into inventory (inventoryID, ingredientID, quantity, totalCost, employeeID, purchaseDate, expDate)
values
(1, 1, 500, 100.00, 21, '2022-10-1', '2022-10-14'),
(2, 2, 100, 50.00, 22, '2022-10-1', '2023-09-30'),
(3, 3, 500, 100.00, 21, '2022-10-1', '2022-10-14'),
(4, 4, 500, 100.00, 21, '2022-10-1', '2022-10-14'),
(5, 5, 500, 100.00, 21, '2022-10-1', '2022-10-14'),
(6, 6, 500, 100.00, 21, '2022-10-1', '2022-10-14'),
(7, 7, 500, 100.00, 21, '2022-10-1', '2022-10-14'),
(8, 8, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(9, 9, 500, 50.00, 22, '2022-10-1', '2023-09-30'),
(10, 10, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(11, 11, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(12, 12, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(13, 13, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(14, 14, 100, 50.00, 22, '2022-10-1', '2022-09-30'),
(15, 15, 100, 200.00, 21, '2022-10-1', '2022-10-14'),
(16, 16, 500, 100.00, 22, '2022-10-1', '2022-09-30'),
(17, 17, 500, 100.00, 22, '2022-10-1', '2022-09-30'),
(18, 18, 500, 100.00, 22, '2022-10-1', '2022-09-30'),
(19, 19, 500, 100.00, 22, '2022-10-1', '2022-09-30'),
(20, 20, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(21, 21, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(22, 22, 100, 200.00, 21, '2022-10-1', '2022-10-14'),
(23, 23, 100, 50.00, 22, '2022-10-1', '2023-09-30'),
(24, 24, 100, 200.00, 21, '2022-10-1', '2022-10-14'),
(25, 25, 100, 200.00, 21, '2022-10-1', '2022-10-14'),
(26, 26, 500, 50.00, 22, '2022-10-1', '2023-09-30'),
(27, 27, 500, 200.00, 21, '2022-10-1', '2022-10-14'),
(28, 28, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(29, 29, 100, 200.00, 21, '2022-10-1', '2022-10-14'),
(30, 30, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(31, 31, 500, 150.00, 22, '2022-10-1', '2022-10-14'),
(32, 32, 500, 150.00, 23, '2022-10-1', '2022-10-14'),
(33, 33, 500, 150.00, 23, '2022-10-1', '2022-10-14');

-- add data into reservation table
insert into reservation (reservationDate, windowID, tableID, customerID, numOfPeople, reservationStatus, employeeID)
values
('2022-10-03', 13, 6, 1, 2, 'Reserved', 1),
('2022-10-03', 13, 7, 2, 2, 'Cancelled', 2),
('2022-10-03', 18, 8, 3, 2, 'Cancelled', 3),
('2022-10-03', 19, 16, 4, 4, 'Reserved', 4),
('2022-10-04', 38, 6, 5, 2, 'Reserved', 5), 
('2022-10-04', 38, 7, 6, 2, 'Cancelled', 6),
('2022-10-04', 43, 16, 7, 4, 'Cancelled', 7),
('2022-10-04', 43, 17, 8, 4, 'Cancelled', 8),
('2022-10-12', 61, 16, 9, 4, 'Cancelled', 9),
('2022-10-12', 61, 17, 10, 4, 'Cancelled', 10),
('2022-10-12', 66, 6, 11, 2, 'Cancelled', 3),
('2022-10-12', 66, 16, 12, 4, 'Cancelled', 4),
('2022-10-13', 85, 1, 13, 1, 'Cancelled', 5),
('2022-10-13', 86, 16, 14, 4, 'Cancelled', 6),
('2022-10-13', 91, 6, 15, 2, 'Cancelled', 7),
('2022-10-13', 92, 16, 16, 4, 'Cancelled', 8),
('2022-10-21', 115, 16, 17, 4, 'Reserved', 3),
('2022-10-21', 115, 17, 18, 4, 'Reserved', 4),
('2022-10-21', 115, 18, 19, 4, 'Reserved', 7),
('2022-10-21', 115, 19, 20, 4, 'Reserved', 8),
('2022-10-21', 115, 20, 21, 4, 'Reserved', 9),
('2022-10-22', 138, 6, 22, 2, 'Cancelled', 1),
('2022-10-22', 138, 7, 23, 2, 'Cancelled', 2),
('2022-10-30', 163, 6, 24, 2, 'Cancelled', 5),
('2022-10-30', 164, 7, 25, 2, 'Cancelled', 6);

-- insert data into waiting_list
insert into waiting_list (waitingID, waitingDate, windowID, customerID, numOfPeople, waitingStatus)
values
(1, '2022-10-21', 115, 26, 4, 'Joined'),
(2, '2022-10-21', 115, 27, 4, 'Joined'),
(3, '2022-10-21', 115, 28, 4, 'Joined'),
(4, '2022-10-21', 115, 29, 4, 'Joined'),
(5, '2022-10-21', 115, 30, 4, 'Joined'),
(6, '2022-10-21', 115, 31, 4, 'Joined'),
(7, '2022-10-21', 115, 32, 4, 'Joined'),
(8, '2022-10-21', 115, 33, 4, 'Joined'),
(9, '2022-10-21', 115, 34, 4, 'Joined'),
(10, '2022-10-21', 115, 35, 4, 'Joined'),
(11, '2022-10-21', 115, 36, 4, 'Cancelled');

-- insert data into orders table
insert into orders (orderID, orderDate, orderTime, orderStatus, orderInQueue, numOfDish, subtotal, tips, total, customerID, tableID)
values
(1, '2022-10-01', '12:17', 'Ready', true, 1, 26.75, 0, 26.75, 37, null),
(2, '2022-10-02', '17:32', 'Ready', true, 2, 31.00, 0, 31.00, 38, null),
(3, '2022-10-03', '14:15', 'Ready', true, 1, 14.00, 0, 14.00, 39, null),
(4, '2022-10-03', '12:00', 'Ready', true, 2, 31.00, 5.00, 36.00, 1, 6),
(5, '2022-10-03', '18:00', 'Ready', true, 4, 112.50, 20.00, 132.50, 4, 16),
(6, '2022-10-04', '13:00', 'Ready', true, 2, 56.50, 10.00, 66.50, 5, 6),
(7, '2022-10-21', '18:00', 'Ready', true, 4, 112.50, 20.00, 132.50, 17, 16),
(8, '2022-10-21', '18:00', 'Ready', true, 4, 102.75, 20.00, 122.75, 18, 17),
(9, '2022-10-21', '18:00', 'Ready', true, 4, 107.5, 19.00, 126.50, 19, 18),
(10, '2022-10-21', '18:00', 'Ready', true, 4, 143.5, 30.00, 173.50, 20, 19),
(11, '2022-10-21', '18:00', 'Ready', true, 4, 98.25, 20.00, 118.25, 21, 20),
(12, '2022-10-30', '19:00', 'Ready', true, 2, 28.50, 0, 28.50, 40, null);

-- insert data into order_list table
insert into order_list (orderID, listID, menuID, quantity)
values
(1, 1, 19, 1),
(2, 1, 31, 1),
(2, 2, 36, 1),
(3, 1, 39, 1),
(4, 1, 31, 1),
(4, 2, 36, 1),
(5, 1, 13, 1),
(5, 2, 14, 1),
(5, 3, 24, 1),
(5, 4, 19, 1),
(6, 1, 22, 1),
(6, 2, 26, 1),
(7, 1, 13, 1),
(7, 2, 14, 1),
(7, 3, 24, 1),
(7, 4, 19, 1),
(8, 1, 1, 1),
(8, 2, 15, 1),
(8, 3, 17, 1),
(8, 4, 25, 1),
(9, 1, 40, 1),
(9, 2, 34, 1),
(9, 3, 30, 1),
(9, 4, 16, 1),
(10, 1, 2, 1),
(10, 2, 12, 1),
(10, 3, 18, 1),
(10, 4, 20, 1),
(11, 1, 9, 1),
(11, 2, 21, 1),
(11, 3, 26, 1),
(11, 4, 29, 1),
(12, 1, 28, 1);

-- insert data into order_queue table
insert into order_queue (queueID, orderID, employeeID)
values
(1, 1, 11),
(2, 2, 12),
(3, 3, 13),
(4, 4, 14),
(5, 5, 15),
(6, 6, 16),
(7, 7, 17),
(8, 8, 18),
(9, 9, 19),
(10, 10, 20),
(11, 11, 11),
(12, 12, 12);



