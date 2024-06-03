CREATE DATABASE UniversityDB;
CREATE TABLE Students(
    student_id serial PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    data_of_birth date not NULL,
    email varchar(50) UNIQUE,
    phone_number varchar(50),
    address varchar(50),
    enrollment_date date NOT NULL,
    gpa DECIMAL(3, 2)
);
CREATE TABLE Courses(
    course_id serial PRIMARY KEY,
    course_name varchar(50) NOT NULL,
    department varchar(50) NOT NULL,
    credit int NOT NULL,
    description varchar(50)
);
CREATE TABLE Enrollments(
    enrollment_id serial PRIMARY KEY,
    student_id int REFERENCES Students(student_id),
    course_id int REFERENCES Courses(course_id),
    grade int,
    enrollment_date date
);

