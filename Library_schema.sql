Create database LibraryDB;
use LibraryDB;
Create  table Authors(
                       Author_id int auto_increment primary key,
                       Name varchar(100) not null);
Create table Books(
                   Book_id int auto_increment primary key ,
                   Title varchar(200),
                   ISBN varchar(20) ,
                   Category_id int,
                   foreign key (Category_id) references Categories(Category_id));
Create table BookAuthors(
                          Book_id int,
                          Author_id int,
                          primary key(Book_id,Author_id),
                          Foreign key(Book_id) references Books(Book_id),
                          Foreign key(Author_id) references  Authors(Author_id));
Create table Members(
                     MemberID int auto_increment primary key,
                     Name varchar(100),
                     JoinDate date);
Create Table Borrow ( 
                      BorrowID int auto_increment primary key,
                      Book_id int,
                      MemberID int,
                      BorrowDate date,
                      ReturnDate date,
                      foreign key(Book_id) references Books(Book_id),
					  foreign key(MemberID) references Members(MemberID));
