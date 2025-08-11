-- 1) INNER JOIN
-- Show only borrow records that have matching member and book rows
SELECT
  br.BorrowID,
  br.Book_id,
  b.Title   AS BookTitle,
  br.MemberID,
  m.Name    AS MemberName,
  br.BorrowDate,
  br.ReturnDate
FROM Borrow br
JOIN Members m 
ON br.MemberID = m.MemberID
JOIN Books b
 ON br.Book_id  = b.Book_id;

-- 2) LEFT JOIN
-- Show all members and any books they have borrowed (NULL when not borrowed)
SELECT
  m.MemberID,
  m.Name          AS MemberName,
  br.BorrowID,
  br.Book_id,
  b.Title         AS BookTitle,
  br.BorrowDate,
  br.ReturnDate
FROM Members m
LEFT JOIN Borrow br ON m.MemberID = br.MemberID
LEFT JOIN Books  b  ON br.Book_id = b.Book_id;

-- 3) RIGHT JOIN (MySQL supports RIGHT JOIN)
-- Show all books and the member who borrowed them (if any). Books without borrows will still appear.
SELECT
  b.Book_id,
  b.Title        AS BookTitle,
  br.BorrowID,
  br.MemberID,
  m.Name         AS MemberName,
  br.BorrowDate,
  br.ReturnDate
FROM Borrow br
RIGHT JOIN Books b ON br.Book_id = b.Book_id
LEFT JOIN Members m ON br.MemberID = m.MemberID;

-- 4) FULL OUTER JOIN simulation (MySQL has no FULL OUTER JOIN)
-- Combine members-with-books and books-with-members to include any side that is missing matches.
SELECT
  m.MemberID,
  m.Name         AS MemberName,
  b.Book_id,
  b.Title        AS BookTitle,
  br.BorrowDate,
  br.ReturnDate
FROM Members m
LEFT JOIN Borrow br ON m.MemberID = br.MemberID
LEFT JOIN Books  b  ON br.Book_id = b.Book_id

UNION

SELECT
  m.MemberID,
  m.Name         AS MemberName,
  b.Book_id,
  b.Title        AS BookTitle,
  br.BorrowDate,
  br.ReturnDate
FROM Books b
LEFT JOIN Borrow br ON b.Book_id = br.Book_id
LEFT JOIN Members m ON br.MemberID = m.MemberID;
-- Use UNION ALL instead of UNION if you want to keep duplicate rows.