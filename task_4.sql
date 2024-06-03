DELETE FROM Enrollments
WHERE student_id = 2
    AND course_id = 3;
    
DELETE FROM Courses
WHERE course_id NOT IN (
        SELECT course_id
        FROM Enrollments
    );
    