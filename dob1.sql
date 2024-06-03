CREATE VIEW StudentEnrollments AS
SELECT Students.student_id, Students.first_name, Students.last_name, Enrollments.course_id, Courses.course_name, Enrollments.grade
FROM Students
JOIN Enrollments ON Students.student_id = Enrollments.student_id
JOIN Courses ON Enrollments.course_id = Courses.course_id;
