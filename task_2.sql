INSERT INTO Students (first_name, last_name, data_of_birth, email, enrollment_date, gpa)
    VALUES 
    ('John', 'Doe', '1990-01-01', 'john.doe@example.com', '2022-09-01', 3.8),
    ('Jane', 'Smith', '1995-05-10', 'jane.smith@example.com', '2022-09-01', 3.5),
    ('Mike', 'Johnson', '1992-08-20', 'mike.johnson@example.com', '2022-09-01', 3.2),
    ('Sarah', 'Williams', '1998-12-15', 'sarah.williams@example.com', '2022-09-01', NULL),
    ('Alex', 'Brown', '1997-02-05', 'alex.brown@example.com', '2022-09-01', 2.8);

INSERT INTO Courses (course_name, department, credit, description)
    VALUES
    ('Mathematics', 'Science', 3, 'Introduction to Mathematics'),
    ('English Literature', 'Humanities', 4, 'Study of English literature'),
    ('Data Science', 'Science', 5, 'Introduction to data science'),
    ('History', 'Humanities', 4, 'Study of world history');

INSERT INTO Enrollments (student_id, course_id, grade, enrollment_date)
    VALUES
    (1, 1, 4, '2024-09-01'),
    (1, 2, 3, '2024-09-01'),
    (2, 3, 2, '2024-09-01'),
    (3, 4, 3, '2024-09-01'),
    (4, 5, 2, '2024-09-01');
    