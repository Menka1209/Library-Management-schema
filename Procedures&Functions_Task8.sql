
-- ============================
-- STORED PROCEDURE
-- ============================
-- This procedure retrieves all books borrowed by a specific member
DELIMITER //
CREATE PROCEDURE GetBooksBorrowedByMember(IN Member_ID_Input INT)
BEGIN
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
    WHERE Members.MemberID = Member_ID_Input;
END //
DELIMITER ;

CALL GetBooksBorrowedByMember(1);

-- FUNCTION
-- This function returns the number of books in a given category
DELIMITER //
CREATE FUNCTION CountBooksInCategory(Category_ID_Input INT)
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE BookCount INT;
    
    SELECT COUNT(Book_id) INTO BookCount
    FROM Books
    WHERE Category_id = Category_ID_Input;
    
    RETURN BookCount;
END //
DELIMITER ;

SELECT CountBooksInCategory(2) AS Number_Of_Books;
