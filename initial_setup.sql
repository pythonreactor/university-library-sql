-- Create the database

-- Use this if you want to nuke your DB and start fresh
-- DROP DATABASE university;

CREATE DATABASE IF NOT EXISTS university;
USE university;

-- Create the initial tables

-- Administrative table (Formerly "School")
CREATE TABLE IF NOT EXISTS Administrative (
    id INT PRIMARY KEY DEFAULT 1,
    year_established INT,
    university_name VARCHAR(255),
    city VARCHAR(255),
    street_address VARCHAR(255),
    state VARCHAR(50),
    district VARCHAR(255)
);

-- Person table (Tied to Administrative)
CREATE TABLE IF NOT EXISTS Person (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255),
    city VARCHAR(255),
    address VARCHAR(255),
    state VARCHAR(50),
    phone VARCHAR(20),
    admin_id INT,
    
    FOREIGN KEY (admin_id) REFERENCES Administrative(id)
);

-- Student table (Child of Person)
CREATE TABLE IF NOT EXISTS Student (
    id INT PRIMARY KEY,
    cwid VARCHAR(50) UNIQUE,
    year INT,
    
    FOREIGN KEY (id) REFERENCES Person(id)
);

-- Librarian table (Child of Person)
CREATE TABLE IF NOT EXISTS Librarian (
    id INT PRIMARY KEY,
    employee_id VARCHAR(50) UNIQUE,
    salary DECIMAL(10, 2),
    schedule VARCHAR(255),
    
    FOREIGN KEY (id) REFERENCES Person(id)
);

-- Library table (Tied to Administrative)
CREATE TABLE IF NOT EXISTS Library (
    id INT PRIMARY KEY DEFAULT 1,
    schedule VARCHAR(255),
    admin_id INT,
    
    FOREIGN KEY (admin_id) REFERENCES Administrative(id)
);

-- Book table (Tied to Library)
CREATE TABLE IF NOT EXISTS Book (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    isbn VARCHAR(20) UNIQUE,
    genre VARCHAR(100),
    author_first_name VARCHAR(255),
    author_last_name VARCHAR(255),
    quantity INT DEFAULT 0,
    library_id INT,
    
    FOREIGN KEY (library_id) REFERENCES Library(id)
);

-- BookCheckout table (Formerly "Inventory")
CREATE TABLE IF NOT EXISTS BookCheckout (
    checkout_id INT PRIMARY KEY AUTO_INCREMENT,
    isbn VARCHAR(20),
    student_cwid VARCHAR(50),
    checkout_date DATE,
    due_date DATE,
    returned BOOLEAN DEFAULT FALSE,
    
    UNIQUE (student_cwid, isbn, returned),
    FOREIGN KEY (isbn) REFERENCES Book(isbn),
    FOREIGN KEY (student_cwid) REFERENCES Student(cwid)
);