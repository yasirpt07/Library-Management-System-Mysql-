CREATE DATABASE library;
USE library;

-- Branch Table
CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

-- Employee Table
CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10 , 2 ),
    Branch_no INT,
    FOREIGN KEY (Branch_no)
        REFERENCES Branch (Branch_no)
);

-- Books Table
CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status VARCHAR(3),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);


-- Customer Table
CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);


-- IssueStatus Table
CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

-- ReturnStatus Table
CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Return_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);


-- inserting values to branch
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 201, 'MG Road, Bengaluru, Karnataka', '9876543210'),
(2, 202, 'Connaught Place, New Delhi, Delhi', '9876543211'),
(3, 203, 'Park Street, Kolkata, West Bengal', '9876543212'),
(4, 204, 'Marine Drive, Mumbai, Maharashtra', '9876543213'),
(5, 205, 'Anna Salai, Chennai, Tamil Nadu', '9876543214'),
(6, 206, 'Sector 17, Chandigarh', '9876543215'),
(7, 207, 'Law Garden, Ahmedabad, Gujarat', '9876543216'),
(8, 208, 'Hinjawadi, Pune, Maharashtra', '9876543217'),
(9, 209, 'Banjara Hills, Hyderabad, Telangana', '9876543218'),
(10, 210, 'Thampanoor, Thiruvananthapuram, Kerala', '9876543219'),
(11, 211, 'Jayanagar, Bengaluru, Karnataka', '9876543220'),
(12, 212, 'Shivaji Nagar, Nagpur, Maharashtra', '9876543221'),
(13, 213, 'Paltan Bazaar, Guwahati, Assam', '9876543222'),
(14, 214, 'Hazratganj, Lucknow, Uttar Pradesh', '9876543223'),
(15, 215, 'T Nagar, Chennai, Tamil Nadu', '9876543224');


-- employee table
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(201, 'John Doe', 'Manager', 60000, 1),
(202, 'Jane Smith', 'Librarian', 45000, 1),
(203, 'Mike Johnson', 'Clerk', 30000, 2),
(204, 'Emily Davis', 'Assistant', 35000, 2),
(205, 'Robert Brown', 'Manager', 70000, 3),
(206, 'Laura Wilson', 'Librarian', 48000, 3),
(207, 'David Taylor', 'Clerk', 32000, 4),
(208, 'Sophia Moore', 'Assistant', 36000, 4),
(209, 'James White', 'Manager', 65000, 5),
(210, 'Olivia Harris', 'Librarian', 46000, 5),
(211, 'William Clark', 'Clerk', 31000, 6),
(212, 'Ava Lewis', 'Assistant', 34000, 6),
(213, 'Michael Walker', 'Manager', 58000, 7),
(214, 'Charlotte Hall', 'Librarian', 42000, 7),
(215, 'Daniel Lee', 'Clerk', 30000, 8);

-- inserting 5 employee into same branch
INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(216, 'Suresh Kumar', 'Manager', 50000, 1),
(217, 'Anjali Gupta', 'Librarian', 40000, 1),
(218, 'Ravi Kumar', 'Clerk', 30000, 1),
(219, 'Priya Sharma', 'Assistant', 35000, 1),
(220, 'Vikram Singh', 'Librarian', 42000, 1);


-- book table
INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1001, 'To Kill a Mockingbird', 'Fiction', 20, 'yes', 'Harper Lee', 'Penguin'),
(1002, '1984', 'Dystopian', 25, 'yes', 'George Orwell', 'Penguin'),
(1003, 'Moby Dick', 'Classic', 18, 'no', 'Herman Melville', 'Random House'),
(1004, 'The Great Gatsby', 'Classic', 22, 'yes', 'F. Scott Fitzgerald', 'Scribner'),
(1005, 'War and Peace', 'Historical', 30, 'no', 'Leo Tolstoy', 'Vintage'),
(1006, 'Pride and Prejudice', 'Romance', 15, 'yes', 'Jane Austen', 'Penguin'),
(1007, 'The Catcher in the Rye', 'Fiction', 20, 'yes', 'J.D. Salinger', 'Little, Brown'),
(1008, 'Crime and Punishment', 'Crime', 28, 'no', 'Fyodor Dostoevsky', 'Vintage'),
(1009, 'The Hobbit', 'Fantasy', 18, 'yes', 'J.R.R. Tolkien', 'Houghton Mifflin'),
(1010, 'Harry Potter', 'Fantasy', 25, 'yes', 'J.K. Rowling', 'Bloomsbury'),
(1011, 'The Road', 'Post-Apocalyptic', 20, 'yes', 'Cormac McCarthy', 'Vintage'),
(1012, 'Animal Farm', 'Satire', 15, 'yes', 'George Orwell', 'Penguin'),
(1013, 'The Alchemist', 'Fiction', 18, 'yes', 'Paulo Coelho', 'HarperOne'),
(1014, 'The Shining', 'Horror', 25, 'no', 'Stephen King', 'Doubleday'),
(1015, 'Dracula', 'Gothic', 20, 'yes', 'Bram Stoker', 'Penguin');

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) 
VALUES (1019, 'History', 'Non-Fiction', 25.00, 'yes', 'Unknown', 'Random House');

-- coustomer table
INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(401, 'Anu Nair', 'MG Road, Kochi', '2023-01-15'),
(402, 'Ravi Pillai', 'Kowdiar, Thiruvananthapuram', '2022-12-05'),
(403, 'Lekshmi Menon', 'Wayanad', '2021-11-20'),
(404, 'Suresh Kumar', 'Calicut Beach, Kozhikode', '2023-06-10'),
(405, 'Bindu Ramesh', 'Thrissur Round, Thrissur', '2022-09-15'),
(406, 'Deepa Krishna', 'Vyttila, Ernakulam', '2023-03-12'),
(407, 'Ajay Das', 'Nadakkavu, Kozhikode', '2021-02-25'),
(408, 'Priya Varma', 'Alappuzha Beach, Alappuzha', '2022-08-18'),
(409, 'Manu Thomas', 'East Fort, Thiruvananthapuram', '2020-07-10'),
(410, 'Anjana George', 'Edappally, Kochi', '2021-05-30'),
(411, 'Rakesh Nambiar', 'Kottayam Town, Kottayam', '2023-04-22'),
(412, 'Sneha Mathew', 'Kumarakom, Kottayam', '2021-03-08'),
(413, 'Nikhil Dev', 'Vadakkanchery, Palakkad', '2020-10-15'),
(414, 'Gayathri Mohan', 'Palayam, Thiruvananthapuram', '2023-06-25'),
(415, 'Ashwin Raj', 'Fort Kochi, Kochi', '2022-07-05');

SELECT ISBN FROM Books;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(1016, 'The Odyssey', 'Epic', 20, 'yes', 'Homer', 'Penguin'),
(1018, 'The Kite Runner', 'Drama', 18, 'yes', 'Khaled Hosseini', 'Riverhead');


-- IssueStatus Table
INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(101, 401, '1984', '2023-06-05', 1002), 
(102, 402, 'The Great Gatsby', '2023-06-10', 1004), 
(103, 403, 'The Hobbit', '2023-06-15', 1009), 
(104, 404, 'The Road', '2023-06-20', 1011), 
(105, 405, 'Harry Potter', '2023-07-05', 1010), 
(107, 407, 'Animal Farm', '2023-05-10', 1012), 
(109, 409, 'The Alchemist', '2023-08-10', 1013), 
(110, 410, 'Pride and Prejudice', '2023-04-18', 1006);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(111, 401, 'War and Peace', '2023-07-01', 1005),
(112, 402, 'The Kite Runner', '2023-07-05', 1018),
(113, 403, 'Crime and Punishment', '2023-07-10', 1008);


-- 1.Retrieve the book title, category, and rental price of all available books
SELECT Book_title, Category, Rental_Price 
FROM Books 
WHERE Status = 'yes';

-- 2.List the employee names and their respective salaries in descending order of salary
SELECT Emp_name, Salary 
FROM Employee 
ORDER BY Salary DESC;

-- 3.Retrieve the book titles and the corresponding customers who have issued those books
SELECT b.Book_title, c.Customer_name 
FROM IssueStatus i 
JOIN Books b ON i.Isbn_book = b.ISBN 
JOIN Customer c ON i.Issued_cust = c.Customer_Id;

-- 4.Display the total count of books in each category
SELECT Category, COUNT(*) AS Total_Books 
FROM Books 
GROUP BY Category;

-- 5.employees whose salaries are above Rs.50,000
SELECT Emp_name, Position 
FROM Employee 
WHERE Salary > 50000;

--  6.who registered before 2022-01-01 and have not issued any books yet
SELECT c.Customer_name 
FROM Customer c 
LEFT JOIN IssueStatus i ON c.Customer_Id = i.Issued_cust 
WHERE c.Reg_date < '2022-01-01' AND i.Issue_Id IS NULL;

-- 7.Display the branch numbers and the total count of employees in each branch
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no;

-- 8.customers who have issued books in June 2023
SELECT c.Customer_name 
FROM IssueStatus i 
JOIN Customer c ON i.Issued_cust = c.Customer_Id 
WHERE MONTH(i.Issue_date) = 6 AND YEAR(i.Issue_date) = 2023;

-- 9.book_title from the book table containing 'history'
SELECT Book_title 
FROM Books 
WHERE Book_title LIKE '%history%';

-- 10.branches having more than 5 employees
SELECT Branch_no, COUNT(*) AS Total_Employees 
FROM Employee 
GROUP BY Branch_no 
HAVING COUNT(*) > 5;

-- 11.names of employees who manage branches and their respective branch addresses
SELECT e.Emp_name, b.Branch_address 
FROM Employee e 
JOIN Branch b ON e.Emp_Id = b.Manager_Id;

-- 12.customers who have issued books with a rental price higher than Rs.25
SELECT DISTINCT c.Customer_name 
FROM IssueStatus i 
JOIN Books b ON i.Isbn_book = b.ISBN 
JOIN Customer c ON i.Issued_cust = c.Customer_Id 
WHERE b.Rental_Price > 25;
