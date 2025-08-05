-- insertion of values 
INSERT INTO Authors (Name) VALUES
('J.K. Rowling'),
('George Orwell'),
('Jane Austen'),
('Mark Twain'),
('Agatha Christie');

INSERT INTO Categories (Name) VALUES
('Fiction'),
('Science Fiction'),
('Mystery'),
('Romance'),
('Classic');

INSERT INTO Books (Title, ISBN, Category_id) VALUES
('Harry Potter and the Sorcerer''s Stone', '9780439554930', 1),
('1984', '9780451524935', 2),
('Pride and Prejudice', '9780141439518', 4),
('Adventures of Huckleberry Finn', '9780486280615', 5),
('Murder on the Orient Express', '9780062073501', 3);

INSERT INTO BookAuthors (Book_id, Author_id) VALUES
(1, 1), -- Harry Potter by J.K. Rowling
(2, 2), -- 1984 by George Orwell
(3, 3), -- Pride and Prejudice by Jane Austen
(4, 4), -- Huck Finn by Mark Twain
(5, 5); -- Orient Express by Agatha Christie

INSERT INTO Members (Name, email, phone, JoinDate) VALUES
('Alice Smith', 'alice@example.com', 9876543210, '2022-01-10'),
('Bob Johnson', 'bob@example.com', 9876543211, '2022-03-15'),
('Cathy Brown', 'cathy@example.com', 9876543212, '2023-05-22'),
('David Clark', 'david@example.com', 9876543213, '2024-07-01'),
('Eva Green', 'eva@example.com', 9876543214, '2024-09-30');

INSERT INTO Borrow (Book_id, MemberID, BorrowDate, ReturnDate) VALUES
(1, 1, '2024-07-10', '2024-07-20'),
(2, 2, '2024-07-12', '2024-07-22'),
(3, 3, '2024-07-14', NULL), -- Not returned yet
(4, 4, '2024-07-15', '2024-07-25'),
(5, 5, '2024-07-18', NULL); -- Not returned yet

-- updation query
UPDATE Members
SET phone = 9998887776
WHERE MemberID = 3;

-- deletion query 
DELETE FROM Borrow
WHERE Book_id = 2 AND MemberID = 2;
