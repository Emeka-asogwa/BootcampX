-- -- #######################################
-- -- total number of assistance_requests for a teacher
-- -- ############################################### 
SELECT count(assistance_requests.*) as total_assistances, teachers.name
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
WHERE name = 'Waylon Boehm'
GROUP BY teachers.name;

-- #######################################
-- total number of assistance_requests for a student.
-- ############################################### 
SELECT count(assistance_requests.*) as total_assistances, students.name
FROM assistance_requests
JOIN students ON students.id = student_id
WHERE name = 'Elliot Dickinson'
GROUP BY students.name;

-- #######################################
-- Get important data about each assistance request.
-- ############################################### 
SELECT teachers.name as teacher, students.name as student, assignments.name as assignment, (completed_at-started_at) as duration
FROM assistance_requests
JOIN teachers ON teachers.id = teacher_id
JOIN students ON students.id = student_id
JOIN assignments ON assignments.id = assignment_id
ORDER BY duration;

-- #######################################
-- the average time of an assistance request.
-- ############################################### 
SELECT avg(completed_at - started_at) AS average_assistance_request_duration
FROM assistance_requests;

-- 

-- #######################################
-- the cohort with the longest average duration of assistance requests.
-- ###############################################
SELECT cohorts.name, avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students ON students.id = assistance_requests.student_id
JOIN cohorts ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;

-- #######################################
-- the cohort with the longest average duration of assistance requests.
-- ###############################################
SELECT avg(started_at - created_at) AS average_wait_time 
FROM assistance_requests;

-- #######################################
-- the total duration of all assistance requests for each cohort.
-- ###############################################
SELECT cohorts.name AS cohort,
  sum(completed_at - started_at) AS total_duration
FROM assistance_requests
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
GROUP BY cohort
ORDER BY total_duration;

-- #######################################
-- the total duration of all assistance requests for each cohort.
-- ###############################################
SELECT avg (total_duration) as average_total_duration
FROM (
  SELECT cohorts.name as cohort, sum(completed_at-started_at) as total_duration
  FROM assistance_requests
  JOIN students ON students.id = student_id
  JOIN cohorts on cohorts.id = cohort_id
  GROUP BY cohorts.name
  ORDER BY total_duration
) as total_durations;

-- #######################################
-- Most Confusing Assignments
-- ###############################################
SELECT assignments.id, name, day, chapter, count(assistance_requests) as total_requests
FROM assignments
JOIN assistance_requests ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;

-- -- #######################################
-- -- Total Assignments and duration
-- -- ###############################################
SELECT 
  day,
  count(*) AS number_of_assignments,
  sum(duration) AS duration
FROM assignments
GROUP BY day
ORDER BY day;

-- -- #######################################
-- -- Name of Teachers That Assisted
-- -- ###############################################
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
ORDER BY teacher;

-- -- #######################################
-- -- same query as above, but includes the number of assistances as well.
-- -- ###############################################
SELECT teachers.name as teacher, cohorts.name as cohort, count(assistance_requests) as total_assistances
FROM teachers
JOIN assistance_requests ON teacher_id = teachers.id
JOIN students ON student_id = students.id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'JUL02'
GROUP BY teachers.name, cohorts.name
ORDER BY teacher;