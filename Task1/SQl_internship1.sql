Use library;
-- Authors Table
CREATE TABLE Authors (
    Author_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Bio TEXT
);
Select * from Authors;
-- Categories Table
CREATE TABLE Categories (
    Category_ID INT PRIMARY KEY,
    Category_Name VARCHAR(50) NOT NULL
);
Select * from Categories;
-- Books Table
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(150) NOT NULL,
    ISBN VARCHAR(20) UNIQUE,
    Category_ID INT,
    AvailableCopies INT DEFAULT 1,
    TotalCopies INT DEFAULT 1,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);
Select * from Books;

-- BookAuthors Table 
CREATE TABLE Book_Authors (
    Book_ID INT,
    Author_ID INT,
    PRIMARY KEY (Book_ID, Author_ID),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Author_ID) REFERENCES Authors(Author_ID)
);
Select * from Book_Authors;
-- Members Table
CREATE TABLE Members (
    Member_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Join_Date DATE NOT NULL
);
Select * from Members;
-- Loans Table
CREATE TABLE Loans (
    Loan_ID INT PRIMARY KEY,
    Book_ID INT,
    Member_ID INT,
    Issue_Date DATE NOT NULL,
    Return_Date DATE,
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES Members(Member_ID)
);
Select * from Loans;
-- Librarians Table (Optional: Admin users)
CREATE TABLE Librarians (
    Librarian_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100) UNIQUE
);
Select * from Librarians;

