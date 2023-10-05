USE university;

-- Inserting initial junk data

-- If there are any errors, scrap the entire insert (atomic insertion)
START TRANSACTION;

-- Administrative insert
INSERT INTO Administrative (year_established, university_name, city, street_address, state, district)
VALUES (1990, 'Sample University', 'Sample City', '123 Sample Street', 'Sample State', 'Sample District');

-- Person insert
INSERT INTO Person (name, city, address, state, phone, admin_id)
VALUES ('John Doe', 'Sample City', '123 Sample Street', 'Sample State', '123-456-7890', 1),
       ('Jane Smith', 'Sample City', '456 Another Street', 'Sample State', '987-654-3210', 1);

-- Student insert
INSERT INTO Student (id, cwid, year)
VALUES (1, 'CWID001', 2022),
       (2, 'CWID002', 2021);

-- Librarian insert
INSERT INTO Librarian (id, employee_id, salary, schedule)
VALUES (1, 'EMP001', 50000.00, '9AM-5PM'),
       (2, 'EMP002', 52000.00, '10AM-6PM');

-- Library insert
INSERT INTO Library (schedule, admin_id)
VALUES ('8AM-8PM', 1);

-- Book insert
INSERT INTO Book (title, isbn, genre, author_first_name, author_last_name, quantity, library_id)
VALUES ('Sample Book 1', 'ISBN001', 'Fiction', 'Author', 'One', 10, 1),
       ('Sample Book 2', 'ISBN002', 'Non-Fiction', 'Author', 'Two', 5, 1);

-- BookCheckout insert
INSERT INTO BookCheckout (isbn, student_cwid, checkout_date, due_date, returned)
VALUES ('ISBN001', 'CWID001', '2023-01-01', '2023-01-15', FALSE),
       ('ISBN002', 'CWID002', '2023-01-05', '2023-01-20', TRUE);

COMMIT;

-- You can use this if there is an error and you want to rollback the transaction
-- ROLLBACK;