-- ############################################### 
-- Names of all students from a single cohort
-- ############################################### 
SELECT id, name
FROM students
WHERE cohort_id = 1
ORDER BY name ASC;

-- ############################################### 
--  total number of students in the first 3 cohorts 
-- ############################################### 
SELECT COUNT(id)
FROM students
WHERE cohort_id IN (1,2,3);

-- ############################################### 
-- students with no email and phone number 
-- ############################################### 
SELECT name, id, cohort_id
FROM students
WHERE email IS NULL OR phone is NULL;

-- ############################################### 
-- students without gmail and phone number 
-- ############################################### 
SELECT name, email, id, cohort_id
FROM students
WHERE email NOT LIKE '%gmail%' AND phone IS NULL;

-- ############################################### 
-- students currently enrolled 
-- ###############################################
SELECT name, id, cohort_id
FROM students
WHERE end_date IS NULL
ORDER BY cohort_id;

-- ############################################### 
-- students without Github account
-- ###############################################
SELECT name, email, phone
FROM students
WHERE github IS NULL AND end_date IS NOT NULL ;