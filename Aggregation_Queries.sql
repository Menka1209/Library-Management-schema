-- Count Queries
-- Total number of members
SELECT COUNT(*) AS TotalMembers FROM Members;

-- Total number of books
SELECT COUNT(*) AS TotalBooks FROM Books;

-- Count how many books each category has
SELECT Category_id, COUNT(*) AS BookCount
FROM Books
GROUP BY Category_id;

-- Sum Queries
-- Total borrowed books count
SELECT SUM(Book_id IS NOT NULL) AS TotalBorrowed
FROM Borrow;

-- Total phone digits sum (just for example)
SELECT SUM(phone) AS TotalPhoneNumbers
FROM Members;

-- Average Avg(), Min(), MAx() Queries 
-- Average MemberID
SELECT AVG(MemberID) AS AverageMemberID FROM Members;

-- Earliest and latest join dates
SELECT MIN(JoinDate) AS FirstJoin, MAX(JoinDate) AS LastJoin
FROM Members;

-- Group By Usage 
-- Number of books borrowed by each member
SELECT MemberID, COUNT(*) AS BooksBorrowed
FROM Borrow
GROUP BY MemberID;

-- Number of books per author
SELECT Author_id, COUNT(*) AS BooksWritten
FROM BookAuthors
GROUP BY Author_id;

-- Having Usage 
-- Members who borrowed more than 2 books
SELECT MemberID, COUNT(*) AS BooksBorrowed
FROM Borrow
GROUP BY MemberID
HAVING COUNT(*) < 2;

-- Categories with more than 3 books
SELECT Category_id, COUNT(*) AS BookCount
FROM Books
GROUP BY Category_id
HAVING COUNT(*) < 3;
