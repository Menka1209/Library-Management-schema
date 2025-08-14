-- 1. Create a view to show detailed borrow information including member and book details
CREATE VIEW View_Borrow_Details AS
SELECT 
    Borrow.BorrowID,
    Members.Name AS Member_Name,
    Books.Title AS Book_Title,
    Borrow.BorrowDate,
    Borrow.ReturnDate
FROM Borrow
JOIN Members 
    ON Borrow.MemberID = Members.MemberID
JOIN Books 
    ON Borrow.Book_id = Books.Book_id;

-- Example usage of the view
SELECT * FROM View_Borrow_Details;


-- 2. Create a view to show the number of books in each category
CREATE VIEW View_Category_Book_Count AS
SELECT 
    Categories.Category_id,
    Categories.Name,
    COUNT(Books.Book_id) AS Number_Of_Books
FROM Categories
LEFT JOIN Books
    ON Categories.Category_id = Books.Category_id
GROUP BY Categories.Category_id, Categories.Name;

-- Example usage of the view
SELECT * FROM View_Category_Book_Count;


-- 3. Create a view to list books with their authors
CREATE VIEW View_Book_Author_Details AS
SELECT 
    Books.Book_id,
    Books.Title AS Book_Title,
    Authors.Name AS Author_Name
FROM Books
JOIN BookAuthors 
    ON Books.Book_id = BookAuthors.Book_id
JOIN Authors 
    ON BookAuthors.Author_id = Authors.Author_id;

-- Example usage of the view
SELECT * FROM View_Book_Author_Details;


-- 4. Create a view to show members who have overdue books (ReturnDate < current date)
CREATE VIEW View_Overdue_Books AS
SELECT 
    Borrow.BorrowID,
    Members.Name AS Member_Name,
    Books.Title AS Book_Title,
    Borrow.BorrowDate,
    Borrow.ReturnDate
FROM Borrow
JOIN Members 
    ON Borrow.MemberID = Members.MemberID
JOIN Books 
    ON Borrow.Book_id = Books.Book_id
WHERE Borrow.ReturnDate < CURDATE();

-- Example usage of the view
SELECT * FROM View_Overdue_Books;


-- 5. Create a view for security: show only pending returns without exposing member email
CREATE VIEW View_Pending_Returns AS
SELECT 
    Borrow.BorrowID,
    Members.Name AS Member_Name,
    Books.Title AS Book_Title,
    Borrow.BorrowDate,
    Borrow.ReturnDate
FROM Borrow
JOIN Members 
    ON Borrow.MemberID = Members.MemberID
JOIN Books 
    ON Borrow.Book_id = Books.Book_id
WHERE Borrow.ReturnDate IS NULL;

-- Example usage of the view
SELECT * FROM View_Pending_Returns;
