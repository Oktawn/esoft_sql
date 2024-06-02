UPDATE Students
SET address = 'Москва',
    phone_number = '8-800-555-35-35'
WHERE student_id = 1;
UPDATE Courses
SET description = 'Новое описание курса'
WHERE course_id = 1;
UPDATE Enrollments
SET grade = 5
WHERE student_id = 1
    AND course_id = 1;