create database LIBRARY;
USE  LIBRARY;
CREATE TABLE BRANCH (Branch_no INT PRIMARY KEY,
Manager_Id  VARCHAR(10),
Branch_address  VARCHAR(30),
Contact_no BIGINT);
INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 'MGR001', '123 Main St', 1234567890),
(2, 'MGR002', '456 Elm St', 2345678901),
(3, 'MGR003', '789 Maple Ave', 3456789012),
(4, 'MGR004', '101 Oak St', 4567890123),
(5, 'MGR005', '202 Pine St', 5678901234),
(6, 'MGR006', '303 Cedar St', 6789012345),
(7, 'MGR007', '404 Birch Rd', 7890123456),
(8, 'MGR008', '505 Walnut St', 8901234567),
(9, 'MGR009', '606 Chestnut St', 9012345678),
(10, 'MGR010', '707 Spruce St', 1123456789);

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(50),
    Position VARCHAR(30),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(1, 'John Doe', 'Manager', 75000.00, 1),
(2, 'Jane Smith', 'Assistant Manager', 55000.00, 2),
(3, 'Emily Johnson', 'Sales Representative', 45000.00, 3),
(4, 'Michael Brown', 'Clerk', 35000.00, 4),
(5, 'Linda Davis', 'HR Specialist', 60000.00, 5),
(6, 'James Wilson', 'Accountant', 65000.00, 6),
(7, 'Patricia Taylor', 'Branch Manager', 80000.00, 7),
(8, 'Robert Anderson', 'Sales Manager', 70000.00, 8),
(9, 'Mary Thomas', 'Customer Service', 40000.00, 9),
(10, 'Charles Moore', 'IT Specialist', 72000.00, 10);

CREATE TABLE Books (
    ISBN VARCHAR(13) PRIMARY KEY,
    Book_title VARCHAR(100),
    Category VARCHAR(50),
    Rental_Price DECIMAL(6, 2),
    Status VARCHAR(3) CHECK (Status IN ('yes', 'no')),
    Author VARCHAR(50),
    Publisher VARCHAR(50)
);

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher)
VALUES
('9780131103627', 'The C Programming Language', 'Programming', 12.99, 'yes', 'Brian W. Kernighan', 'Prentice Hall'),
('9780596009205', 'Head First Java', 'Programming', 15.50, 'no', 'Kathy Sierra', "O'Reilly Media"),
('9780439064873', 'Harry Potter and the Chamber of Secrets', 'Fiction', 8.75, 'yes', 'J.K. Rowling', 'Scholastic Inc.'),
('9780451524935', '1984', 'Fiction', 7.99, 'yes', 'George Orwell', 'Signet Classic'),
('9780061120084', 'To Kill a Mockingbird', 'Fiction', 10.99, 'no', 'Harper Lee', 'Harper Perennial'),
('9780132350884', 'Clean Code', 'Programming', 18.00, 'yes', 'Robert C. Martin', 'Prentice Hall'),
('9780262033848', 'Introduction to Algorithms', 'Textbook', 35.99, 'no', 'Thomas H. Cormen', 'MIT Press'),
('9780131101630', 'The Art of Computer Programming', 'Programming', 45.99, 'yes', 'Donald Knuth', 'Addison-Wesley'),
('9780553293357', 'Dune', 'Science Fiction', 9.99, 'no', 'Frank Herbert', 'Ace Books'),
('9780140449266', 'The Brothers Karamazov', 'Fiction', 11.50, 'yes', 'Fyodor Dostoevsky', 'Penguin Classics');

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(100),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date)
VALUES
(1, 'John Doe', '123 Elm Street, Springfield', '2023-01-15'),
(2, 'Jane Smith', '456 Maple Avenue, Springfield', '2023-02-20'),
(3, 'Michael Johnson', '789 Oak Drive, Shelbyville', '2023-03-10'),
(4, 'Emily Davis', '321 Pine Lane, Capital City', '2023-04-05'),
(5, 'David Wilson', '654 Cedar Court, Ogdenville', '2023-05-12'),
(6, 'Sarah Brown', '987 Birch Boulevard, North Haverbrook', '2023-06-25'),
(7, 'James Jones', '135 Ash Street, Brockway', '2023-07-30'),
(8, 'Olivia Garcia', '246 Cherry Circle, Springfield', '2023-08-18'),
(9, 'William Martinez', '369 Willow Road, Capital City', '2023-09-07'),
(10, 'Sophia Rodriguez', '753 Poplar Place, Shelbyville', '2023-10-22');

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(100),
    Issue_date DATE,
    Isbn_book VARCHAR(13),
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(ISBN)
);

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book)
VALUES
(1, 1, 'The C Programming Language', '2024-01-05', '9780131103627'),
(2, 2, 'Head First Java', '2024-01-10', '9780596009205'),
(3, 3, 'Harry Potter and the Chamber of Secrets', '2024-01-15', '9780439064873'),
(4, 4, '1984', '2024-01-20', '9780451524935'),
(5, 5, 'To Kill a Mockingbird', '2024-01-25', '9780061120084'),
(6, 6, 'Clean Code', '2024-02-01', '9780132350884'),
(7, 7, 'Introduction to Algorithms', '2024-02-10', '9780262033848'),
(8, 8, 'The Art of Computer Programming', '2024-02-15', '9780131101630'),
(9, 9, 'Dune', '2024-02-20', '9780553293357'),
(10, 10, 'The Brothers Karamazov', '2024-02-25', '9780140449266');

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(100),
    Return_date DATE,
    Isbn_book2 VARCHAR(13),
    FOREIGN KEY (Isbn_book2) REFERENCES Books(ISBN)
);

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2)
VALUES
(1, 1, 'The C Programming Language', '2024-02-01', '9780131103627'),
(2, 2, 'Head First Java', '2024-02-05', '9780596009205'),
(3, 3, 'Harry Potter and the Chamber of Secrets', '2024-02-10', '9780439064873'),
(4, 4, '1984', '2024-02-15', '9780451524935'),
(5, 5, 'To Kill a Mockingbird', '2024-02-20', '9780061120084'),
(6, 6, 'Clean Code', '2024-02-25', '9780132350884'),
(7, 7, 'Introduction to Algorithms', '2024-03-01', '9780262033848'),
(8, 8, 'The Art of Computer Programming', '2024-03-05', '9780131101630'),
(9, 9, 'Dune', '2024-03-10', '9780553293357'),
(10, 10, 'The Brothers Karamazov', '2024-03-15', '9780140449266');

select * from books;
select * from branch;
select * from customer;
select * from employee;
select * from issuestatus;
select * from returnstatus;

-- Retrieve the book title, category, and rental price of all available books.

select book_title, category, rental_price from books;

-- List the employee names and their respective salaries in descending order of salary. 

select emp_name,salary from employee order by salary desc;

-- Retrieve the book titles and the corresponding customers who have issued those books. 

SELECT books.Book_title, customer.Customer_name
FROM IssueStatus 
JOIN Books ON IssueStatus.Isbn_book = Books.ISBN
JOIN Customer  ON IssueStatus.Issued_cust = Customer.Customer_Id;

-- Display the total count of books in each category. 

select category, count(book_title) from books group by category;

-- Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

select emp_name,position from employee where salary>50000;

-- List the customer names who registered before 2022-01-01 and have not issued any books yet.

select customer.customer_name from customer left join issuestatus on customer.customer_id=issuestatus.issued_cust
where customer.reg_date < '2022-01-01' AND issuestatus.Issue_Id IS NULL;

-- Display the branch numbers and the total count of employees in each branch.

select branch_no , count(*) as total_no_of_employee from employee group by branch_no;

-- Display the names of customers who have issued books in the month of January 2024.

select  customer.customer_name from customer join issuestatus on customer.customer_id=issuestatus.issued_cust 
where  issuestatus.Issue_date BETWEEN '2024-01-01' AND '2024-01-30';

-- Retrieve book_title from book table containing fiction. 

select book_title from books where category='fiction';

-- Retrieve the branch numbers along with the count of employees for branches having more than 5 employees

select branch_no , count(*) as count_of_employees from employee  group by branch_no having count(*) >5;

-- Retrieve the names of employees who manage branches and their respective branch addresses.

select employee.emp_name,branch.branch_no,branch.branch_address from employee join branch on employee.emp_id=branch.manager_id;

-- Display the names of customers who have issued books with a rental price higher than Rs. 25.

select customer.customer_name from customer join issuestatus on customer.customer_id=issuestatus.issued_cust 
join books on books.isbn=issuestatus.isbn_book where books.rental_price > 25;




