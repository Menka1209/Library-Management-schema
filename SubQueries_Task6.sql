-- Task 6
 -- Shows each book and how many times it has been borrowed
SELECT 
    books.Title,
    (SELECT COUNT(*) 
     FROM Borrow 
     WHERE borrow.Book_id = books.Book_id) AS TimesBorrowed
 from books;
 
 -- Members who have borrowed at least one book from the Fiction category
SELECT Name 
FROM Members
WHERE MemberID IN (
    SELECT borrow.MemberID
    FROM Borrow 
    JOIN Books  ON borrow.Book_id = books.Book_id
    JOIN Categories  ON books.Category_id = categories.Category_id
    WHERE categories.Name="Fiction"
);
 
 -- Books borrowed less than the average borrowing frequency
SELECT Title 
FROM Books 
WHERE (SELECT COUNT(*) 
       FROM Borrow 
       WHERE borrow.Book_id = books.Book_id) <
      (SELECT AVG(BorrowCount) 
       FROM (
           SELECT COUNT(*) AS BorrowCount
           FROM Borrow
           GROUP BY Book_id
       ) AS BorrowStats);
       
-- Categories and the total number of borrows for each
SELECT categories.Name AS CategoryName, Stats.TotalBorrows
FROM Categories 
JOIN (
    SELECT books.Category_id, COUNT(*) AS TotalBorrows
    FROM Borrow 
    JOIN Books  ON borrow.Book_id = books.Book_id
    GROUP BY books.Category_id
) AS Stats
ON categories.Category_id = Stats.Category_id;

-- Members who have borrowed at least one book in the 'Science' category
SELECT Members.MemberID, Members.Name
FROM Members
WHERE EXISTS (
    SELECT 1
    FROM Borrow
    JOIN Books ON Borrow.Book_id = Books.Book_id
    JOIN Categories ON Books.Category_id = Categories.Category_id
    WHERE Borrow.MemberID = Members.MemberID
      AND Categories.Name="Science" 
);