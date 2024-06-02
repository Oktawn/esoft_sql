-- Получите список всех студентов, зачисленных на определенный курс, отсортированный по фамилии.
SELECT s.last_name,
    s.first_name
FROM Students s
    JOIN Enrollments ON s.student_id = Enrollments.student_id
WHERE Enrollments.course_id = 1 /* небоходимый курс */
ORDER BY s.last_name;

-- Получите список курсов с указанием количества студентов, зачисленных на каждый курс

SELECT c.course_name,count(Enrollments.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments on c.course_id = Enrollments.course_id
GROUP BY c.course_name;

-- Получите список студентов, которые имеют средний балл (GPA) выше определенного значения

SELECT s.last_name,s.first_name,s.gpa
FROM Students s
WHERE s.gpa > 3.5; /* небоходимый gpa */

-- Получите полную информацию о зачислениях (включая имя студента и название курса), произошедших в течение последнего месяца.


-- Получите список студентов, у которых нет номера телефона, отсортированный по дате зачисления.
SELECT * FROM Students
WHERE phone_number IS NULL
ORDER BY enrollment_date;

-- Получите список курсов, которые проводятся в определенном департаменте, и отсортируйте их по количеству кредитов.

SELECT course_name, credit FROM Courses
WHERE department = 'Humanities' /* небоходимый департамент */
ORDER BY credit;

-- Получите полную информацию о студентах, включая курсы, на которые они зачислены, и их оценки по этим курсам.

SELECT s.first_name, s.last_name, c.course_name, e.grade
 FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
     LEFT JOIN Courses c ON e.course_id = c.course_id
     ORDER BY s.first_name;

-- Получите список студентов, которые зачислены более чем на один курс.

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(e.course_id) > 1
ORDER BY s.first_name;

-- Получите список студентов, которые зачислены на курсы из разных департаментов

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.first_name, s.last_name
HAVING COUNT(DISTINCT c.department) > 1
ORDER BY s.first_name;

-- Получите список курсов, на которые не зачислен ни один студент.

SELECT c.course_name
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
WHERE e.student_id IS NULL
ORDER BY c.course_name;

-- Получите список студентов, которые зачислены на все курсы из определенного департамента.

SELECT s.first_name, s.last_name
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.department = 'Humanities'
GROUP BY s.first_name, s.last_name
HAVING COUNT(DISTINCT c.course_id) = (
    SELECT COUNT(course_id)
    FROM Courses
    WHERE department = 'Humanities'
)
ORDER BY s.first_name;

-- Найдите студентов, которые зачислены на курс с наибольшим количеством кредитов.

SELECT s.first_name, s.last_name,c.course_name, c.credit
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
WHERE c.credit = (
    SELECT MAX(credit)
    FROM Courses
)
ORDER BY s.first_name;

-- Получите средний балл (GPA) для каждого студента, который зачислен на курсы, и отсортируйте студентов по этому среднему баллу.

SELECT s.first_name, s.last_name, s.gpa
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON e.course_id = c.course_id
GROUP BY s.first_name, s.last_name,s.gpa
ORDER BY s.gpa;

-- Получите список студентов, которые были зачислены на курсы в течение последнего года.


-- Получите список студентов и их количество курсов, на которые они зачислены, отсортированный по количеству курсов.

SELECT s.first_name,s.last_name, COUNT(e.course_id) AS course_count
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.first_name,s.last_name
ORDER BY course_count;

