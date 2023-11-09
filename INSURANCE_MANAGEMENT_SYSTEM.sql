/* insurance  management system */

-- Customers table
CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    customer_name VARCHAR2(50),
    email VARCHAR2(50),
    phone_number VARCHAR2(15)
);

-- Policies table
CREATE TABLE Policies (
    policy_id NUMBER PRIMARY KEY,
    policy_name VARCHAR2(50),
    coverage_amount NUMBER,
    premium_amount NUMBER
);

-- Bookings table
CREATE TABLE Bookings (
    booking_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    policy_id NUMBER,
    booking_date varchar(100),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (policy_id) REFERENCES Policies(policy_id)
);


-- Inserting sample data into Customers table
INSERT INTO Customers VALUES (1, 'John Doe',  'john@example.com', '1234567890');
INSERT INTO Customers VALUES (2, 'Jane Smith','jane@example.com', '9876543210');
INSERT INTO Customers VALUES (3, 'Johnson',   'johnson@example.com', '5751234567');
INSERT INTO Customers VALUES (4, 'Williams',  'willam@example.com', '33935557890');
INSERT INTO Customers VALUES (5, 'Alice',     'alice@example.com', '5651234567');
INSERT INTO Customers VALUES (6, 'Bob ',      'bob@example.com', '3395557890');
INSERT INTO Customers VALUES (7, 'ramya',     'ramya@example.com', '5101234567');
INSERT INTO Customers VALUES (8, 'john',      'john@example.com', '313-555-7890');
INSERT INTO Customers VALUES (9, 'stalin',    'stalin@example.com', '5651234567');
INSERT INTO Customers VALUES (10, 'stella',    'stella@example.com', '3335557890');
INSERT INTO Customers VALUES (11, 'mary',      'mary@example.com', '8551234567');
INSERT INTO Customers VALUES (12, 'theyliys',  'thayliys@example.com', '3735557890');


select * from customers;


-- Inserting sample data into Policies table
INSERT INTO Policies VALUES (101, 'Life Insurance', 500000, 100);
INSERT INTO Policies VALUES (102, 'Auto Insurance', 20000, 50);
INSERT INTO Policies VALUES (103, 'Life Insurance', 500000, 100);
INSERT INTO Policies VALUES (104, 'home Insurance', 30000, 50);
INSERT INTO Policies VALUES (105, 'bike Insurance', 600000, 100);
INSERT INTO Policies VALUES (106, 'home Insurance', 30000, 50);
INSERT INTO Policies VALUES (107, 'Life Insurance', 500000, 100);
INSERT INTO Policies VALUES (108, 'auto Insurance', 20000, 50);
INSERT INTO Policies VALUES (109, 'Life Insurance', 500000, 100);
INSERT INTO Policies VALUES (110, 'bike Insurance', 600000, 50);
INSERT INTO Policies VALUES (111, 'Life Insurance', 500000, 100);
INSERT INTO Policies VALUES (112, 'bike Insurance', 600000, 50);

select * from policies;


-- Inserting sample data into Bookings table
INSERT INTO Bookings VALUES (1001, 1, 101, '2023-11-09');
INSERT INTO Bookings VALUES (1002, 2, 102, '2023-09-10');
INSERT INTO Bookings VALUES (1003, 3, 103, '2023-11-09');
INSERT INTO Bookings VALUES (1004, 4, 104, '2023-05-10');
INSERT INTO Bookings VALUES (1005, 5, 105, '2023-11-09');
INSERT INTO Bookings VALUES (1006, 6, 106, '2023-02-10');
INSERT INTO Bookings VALUES (1007, 7, 107, '2023-10-09');
INSERT INTO Bookings VALUES (1008, 8, 108, '2023-11-10');
INSERT INTO Bookings VALUES (1009, 9, 109, '2023-12-09');
INSERT INTO Bookings VALUES (1010, 10, 110,'2023-11-10');
INSERT INTO Bookings VALUES (1011, 11, 111,'2023-12-09');
INSERT INTO Bookings VALUES (1012, 12, 112,'2023-11-10');


select * from bookings;

/* join the individual table */

SELECT
    B.booking_id,
    C.customer_id,
    C.customer_name,
    C.email,
    C.phone_number,
    P.policy_id,
    P.policy_name,
    P.coverage_amount,
    P.premium_amount,
    B.booking_date
FROM
    Bookings B
JOIN
    Customers C ON B.customer_id = C.customer_id
JOIN
    Policies P ON B.policy_id = P.policy_id;


     /* view the table;

-- Create a view to join the tables
CREATE VIEW InsuranceView AS
SELECT
    B.booking_id,
    C.customer_id,
    C.customer_name,
    C.email,
    C.phone_number,
    P.policy_id,
    P.policy_name,
    P.coverage_amount,
    P.premium_amount,
    B.booking_date
FROM
    Bookings B
JOIN
    Customers C ON B.customer_id = C.customer_id
JOIN
    Policies P ON B.policy_id = P.policy_id;



-- Select data from the view
SELECT * FROM InsuranceView;
