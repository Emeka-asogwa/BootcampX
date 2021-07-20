-- ############################################### 
-- total amount of time that a student has spent on all assignments.
-- ############################################### 
SELECT sum(assignment_submissions.duration) as total_duration
FROM assignment_submissions
  JOIN students ON students.id = student_id
WHERE students.name = 'Ibrahim Schimmel';

-- ############################################### 
-- total amount of time that all students from a specific cohort have spent on all assignments.
-- ###############################################
SELECT cohorts.name AS cohort, sum(duration) AS total_duration
FROM assignment_submissions
  JOIN students ON student_id = students.id
  JOIN cohorts ON cohorts.id = cohort_id
WHERE cohorts.name = 'FEB12'
GROUP BY cohorts.name;

-- ############################################### 
-- currently enrolled students
-- ###############################################
SELECT students.name as student, count(assignment_submissions) as total_submissions
FROM assignment_submissions
  JOIN students ON students.id = student_id
WHERE end_date IS NULL
GROUP BY students.name;

-- ############################################### 
-- students with total submission <100
-- ###############################################
SELECT students.name as student, count(assignment_submissions) as total_submissions
FROM assignment_submissions
  JOIN students ON students.id = student_id
WHERE end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions) <100;
