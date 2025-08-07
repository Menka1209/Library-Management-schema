-- select use 
SELECT * FROM Authors;
SELECT * FROM Categories;
SELECT * FROM Books;
SELECT * FROM Members;
SELECT * FROM Borrow;
SELECT * FROM BookAuthors;

-- select specific columns
SELECT Name, JoinDate FROM Members;
SELECT Title, ISBN FROM Books;
SELECT Name AS Author FROM Authors;

-- Members who joined after 2023-01-01
SELECT * FROM Members WHERE JoinDate > '2023-01-01';

-- Books with Category_id = 3 (Mystery)
SELECT Title FROM Books WHERE Category_id = 3;
 
 -- Books published in Category 1 AND have ISBN starting with '978'
SELECT * FROM Books WHERE Category_id = 1 AND ISBN LIKE '978%';

-- Members with email OR phone missing
SELECT * FROM Members WHERE email IS NULL OR phone IS NULL;

-- Books that have 'Harry' in the title
SELECT * FROM Books WHERE Title LIKE '%Harry%';

-- Members whose name starts with 'A'
SELECT * FROM Members WHERE Name LIKE 'A%';

-- Members who joined between two dates
SELECT * FROM Members WHERE JoinDate BETWEEN '2022-01-01' AND '2023-12-31';

-- List all books ordered by title
SELECT * FROM Books ORDER BY Title ASC;

-- List all members by JoinDate (newest first)
SELECT * FROM Members ORDER BY JoinDate DESC;

-- Show only first 3 members
SELECT * FROM Members LIMIT 3;

-- Top 2 most recent borrowed books
SELECT * FROM Borrow ORDER BY BorrowDate DESC LIMIT 2;
