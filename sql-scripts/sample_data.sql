-- =====================================================
-- Faculty of Technology Student Management System
-- Sample Data Insertion Script
-- =====================================================

USE lms;

-- =====================================================
-- 1. DEPARTMENT DATA
-- =====================================================

INSERT INTO department (Name, Location) VALUES
('ICT', 'Faculty of Technology - Building A'),
('ET', 'Faculty of Technology - Building B'),
('BST', 'Faculty of Technology - Building C'),
('MDS', 'Faculty of Technology - Building D');

-- =====================================================
-- 2. COURSE DATA
-- =====================================================

-- ICT Department Courses
INSERT INTO course (course_code, name, course_hours, department_name, Credits) VALUES
('ICT1112', 'Introduction to Programming', 45, 'ICT', 2),
('ICT1123', 'Web Development Fundamentals', 30, 'ICT', 3),
('ICT1242', 'Computer Architecture', 30, 'ICT', 4),
('ICT1243', 'Database Management Systems', 30, 'ICT', 1),
('ICT1244', 'Database Management Systems Practicum', 60, 'ICT', 2),
('ICT2112', 'Software Development Fundamentals', 45, 'ICT', 2),
('ICT2223', 'Object-Oriented Programming', 45, 'ICT', 3),
('ICT3112', 'Database Administration', 42, 'ICT', 4),
('ICT3234', 'Machine Learning and AI', 45, 'ICT', 1),
('ICT4123', 'Cybersecurity Management', 38, 'ICT', 2),
('ICT4243', 'Ethical Hacking and Penetration Testing', 38, 'ICT', 3);

-- ET Department Courses
INSERT INTO course (course_code, name, course_hours, department_name, Credits) VALUES
('ET1112', 'Engineering Fundamentals', 45, 'ET', 2),
('ET1223', 'Technical Drawing and Blueprint Reading', 38, 'ET', 3),
('ET2122', 'Fluid Mechanics', 42, 'ET', 4),
('ET2243', 'Mechanical Design and Analysis', 40, 'ET', 1),
('ET3112', 'Engineering Project Management', 40, 'ET', 2),
('ET3222', 'Computer Networks for Engineers', 60, 'ET', 3),
('ET4114', 'Robotics and Automation', 80, 'ET', 4),
('ET4242', 'Advanced Manufacturing Processes', 40, 'ET', 1);

-- BST Department Courses
INSERT INTO course (course_code, name, course_hours, department_name, Credits) VALUES
('BST1113', 'Introduction to Biological Systems', 45, 'BST', 1),
('BST1222', 'Bioinformatics', 45, 'BST', 2),
('BST2113', 'Biochemistry', 60, 'BST', 3),
('BST2213', 'Plant Biotechnology', 60, 'BST', 4),
('BST3133', 'Food Biotechnology', 40, 'BST', 1),
('BST3222', 'Stem Cell Biology', 45, 'BST', 2),
('BST4113', 'Pharmacology and Drug Development', 40, 'BST', 3),
('BST4222', 'Biosecurity and Biosafety', 45, 'BST', 4);

-- MDS Department Courses
INSERT INTO course (course_code, name, course_hours, department_name, Credits) VALUES
('ENG1212', 'English II', 30, 'MDS', 1);

-- =====================================================
-- 3. STAFF DATA
-- =====================================================

INSERT INTO staff (Staff_no, Name, Position, Gender, Home_address, Street_address, Country) VALUES
-- Administrators
('ADM01', 'Sahan Viduranaga', 'Administrator', 'MALE', 'No 57', 'Kalawana', 'Sri Lanka'),

-- Deans
('DEA01', 'Nimala Fernando', 'Dean', 'MALE', '123 Main Street', 'Cityville', 'Sri Lanka'),

-- Lecturers
('LEC01', 'Michael Johnson', 'Lecturer', 'MALE', '789 Oak Drive', 'Villagetown', 'United Kingdom'),
('LEC02', 'Alice Williams', 'Lecturer', 'FEMALE', '987 Pine Lane', 'Countryside', 'United States'),
('LEC03', 'Dilani Silva', 'Lecturer', 'FEMALE', '101 Maple Drive', 'Valleyville', 'Sri Lanka'),
('LEC04', 'Samadhi Jayasinghe', 'Lecturer', 'FEMALE', '123 Oak Lane', 'Mountainside', 'Sri Lanka'),

-- Technical Officers
('TEO01', 'Jane Smith', 'Technical Officer', 'FEMALE', '456 Elm Avenue', 'Townsville', 'America'),
('TEO02', 'Kamal Perera', 'Technical Officer', 'MALE', '42 Lake Road', 'Harbor City', 'Sri Lanka'),
('TEO03', 'Ranjan Rajapakse', 'Technical Officer', 'MALE', '88 Red Avenue', 'Hometown', 'Sri Lanka');

-- =====================================================
-- 4. STAFF DEPARTMENT ASSIGNMENTS
-- =====================================================

INSERT INTO staff_department (Staff_no, Department_name) VALUES
('LEC01', 'ICT'),
('LEC02', 'ET'),
('LEC03', 'BST'),
('LEC04', 'ICT'),
('TEO01', 'ET'),
('TEO02', 'BST'),
('TEO03', 'ICT');

-- =====================================================
-- 5. STAFF TELEPHONE DATA
-- =====================================================

INSERT INTO staff_telephone (Staff_no, Telephone) VALUES
('ADM01', '07123456789'),
('ADM01', '07534567890'),
('DEA01', '07198765432'),
('LEC01', '01154321987'),
('LEC02', '07187654321'),
('LEC03', '07176543210'),
('LEC04', '07165432109'),
('TEO01', '08112345678'),
('TEO02', '07154321098'),
('TEO03', '07143210987');

-- =====================================================
-- 6. STUDENT DATA (Sample Students)
-- =====================================================

-- Level 4 Students (2018 batch)
INSERT INTO student (Reg_no, First_name, Last_name, Email, Home_address, Street_address, Country, Entrance_year) VALUES
('TG0200', 'Kasun', 'Kavihara', 'kaskavi45@gmail.com', 'No23', 'Anuradhapura - Samagi Mawatha', 'Sri Lanka', '2018'),
('TG0203', 'Samadhi', 'Tharuka', 'SamaTharu78@gmail.com', 'No512/34', 'Colombo - Issac Newton Road', 'Sri Lanka', '2018'),
('TG0207', 'Hirukshan', 'Krishnan', 'Krish99@gmail.com', 'No98', 'Jaffna - Mahendran Road', 'Sri Lanka', '2018'),
('TG0240', 'Shehan', 'Ranidu', 'SheRanid23@gmail.com', 'No1', 'Ratnapura - Mahagamasekara Road', 'Sri Lanka', '2018'),
('TG0251', 'Keshika', 'Ruwanthi', 'Ruwi1999@gmail.com', 'No8/67', 'Mathale - Pansala Road', 'Sri Lanka', '2018');

-- Level 3 Students (2019 batch)
INSERT INTO student (Reg_no, First_name, Last_name, Email, Home_address, Street_address, Country, Entrance_year) VALUES
('TG0400', 'Shayne', 'Alhamdri', 'ShayAli90@gmail.com', 'No55', 'Maradana - Alwis road', 'Sri Lanka', '2019'),
('TG0420', 'Naveen', 'Rajapakse', 'navraja98@gmail.com', 'No67', 'Kandy - Hill Street', 'Sri Lanka', '2019'),
('TG0450', 'Lakshmi', 'Kumari', 'kumari99@gmail.com', 'No12', 'Kandy - Temple Street', 'Sri Lanka', '2019'),
('TG0478', 'Rajiv', 'Patel', 'rajiv91@email.com', 'No9', 'Jaffna - New Town road', 'Sri Lanka', '2019'),
('TG0502', 'Ahmed', 'Abdullah', 'aabdul12@email.com', 'No34', 'Hikkaduwa - Beach road', 'Sri Lanka', '2019');

-- Level 2 Students (2020 batch)
INSERT INTO student (Reg_no, First_name, Last_name, Email, Home_address, Street_address, Country, Entrance_year) VALUES
('TG0601', 'Dilhara', 'Wijesinghe', 'dilhwijesinghe@gmail.com', 'No890', 'Trincomalee - Main Street', 'Sri Lanka', '2020'),
('TG0650', 'Saman', 'Perera', 'samanperera@gmail.com', 'No12', 'Anuradhapura - Main Road', 'Sri Lanka', '2020'),
('TG0678', 'Thilani', 'Weerasinghe', 'thilweerasinghe@gmail.com', 'No45', 'Jaffna - KKS Road', 'Sri Lanka', '2020'),
('TG0701', 'Nimanthi', 'Fernando', 'nimanthi.f@gmail.com', 'No876', 'Negombo - Main Street', 'Sri Lanka', '2020'),
('TG0756', 'Lasitha', 'Gunasekara', 'lasitha.gunasekara@gmail.com', 'No89', 'Kandy - Dalada Veediya', 'Sri Lanka', '2020');

-- Level 1 Students (2021 batch)
INSERT INTO student (Reg_no, First_name, Last_name, Email, Home_address, Street_address, Country, Entrance_year) VALUES
('TG1010', 'Nuwan', 'Gunasekara', 'nuwan.gunasekara@gmail.com', 'No77', 'Kandy - Saranankara Road', 'Sri Lanka', '2021'),
('TG1027', 'Krishna', 'Suren', 'balamKrsh@gmail.com', 'No98', 'Kandy - Ganedran Road', 'Sri Lanka', '2021'),
('TG1036', 'Upeksha', 'Ishini', 'Upekshaish@gmail.com', 'No12', 'Ratnapura - Main Road', 'Sri Lanka', '2021'),
('TG1067', 'Dumindu', 'Gawesha', 'Dumi99@gmail.com', 'No4', 'Biyagama - Wolcott Road', 'Sri Lanka', '2021'),
('TG1100', 'Hashan', 'Kavindu', 'HashKavi@gmail.com', 'No75', 'Polonnaruwa - Mahesh Road', 'Sri Lanka', '2021');

-- =====================================================
-- 7. STUDENT DEPARTMENT ASSIGNMENTS
-- =====================================================

INSERT INTO student_department (STUDENT_Reg_no, DEPARTMENT_name) VALUES
-- ICT Students
('TG0200', 'ICT'), ('TG0203', 'ICT'), ('TG0207', 'ICT'), ('TG0240', 'ICT'), ('TG0251', 'ICT'),
('TG0400', 'ICT'), ('TG0450', 'ICT'), ('TG0478', 'ICT'),
('TG0601', 'ICT'), ('TG0650', 'ICT'), ('TG0701', 'ICT'),
('TG1100', 'ICT'),

-- BST Students
('TG0420', 'BST'), ('TG0502', 'BST'),
('TG0756', 'BST'),
('TG1010', 'BST'), ('TG1027', 'BST'), ('TG1067', 'BST'),

-- ET Students
('TG0678', 'ET'),
('TG1036', 'ET');

-- =====================================================
-- 8. STUDENT COURSE ENROLLMENTS
-- =====================================================

INSERT INTO student_course (STUDENT_Reg_no, COURSE_code) VALUES
-- Level 4 ICT Students
('TG0200', 'ICT4243'), ('TG0200', 'ICT4123'),
('TG0203', 'ICT4123'),
('TG0207', 'ICT4123'),
('TG0240', 'ICT4243'),
('TG0251', 'ICT4243'),

-- Level 3 Students
('TG0400', 'ICT3112'),
('TG0450', 'ICT3234'),
('TG0478', 'ICT3234'), ('TG0478', 'ICT3112'),
('TG0420', 'BST3222'),
('TG0502', 'BST3133'),

-- Level 2 Students
('TG0601', 'ICT2112'),
('TG0650', 'ICT2223'),
('TG0701', 'ICT2223'),
('TG0678', 'ET2243'),
('TG0756', 'BST2113'),

-- Level 1 Students
('TG1010', 'BST1222'),
('TG1027', 'BST1113'),
('TG1036', 'ET1112'),
('TG1067', 'BST1222'),
('TG1100', 'ICT1242');

-- =====================================================
-- 9. STUDENT ACCOUNTS
-- =====================================================

INSERT INTO student_account (STUDENT_USERNAME, STUDENT_Account_type, STUDENT_Password) VALUES
('TG0200', 'internal', 'password1'),
('TG0203', 'external', 'password2'),
('TG0207', 'internal', 'password3'),
('TG0240', 'external', 'password4'),
('TG0251', 'internal', 'password5'),
('TG0400', 'external', 'password14'),
('TG0420', 'internal', 'password15'),
('TG0450', 'external', 'password16'),
('TG0478', 'internal', 'password17'),
('TG0502', 'external', 'password18'),
('TG0601', 'external', 'password20'),
('TG0650', 'internal', 'password21'),
('TG0678', 'external', 'password22'),
('TG0701', 'internal', 'password23'),
('TG0756', 'external', 'password24'),
('TG1010', 'external', 'password30'),
('TG1027', 'internal', 'password31'),
('TG1036', 'external', 'password32'),
('TG1067', 'internal', 'password33'),
('TG1100', 'external', 'password34');

-- =====================================================
-- 10. ATTENDANCE DATA
-- =====================================================

INSERT INTO attendance (Attendance_id, Medical_status, Attendance_status, Date, Course_code, STUDENT_Reg_no) VALUES
('A0001', 1, 0, '2023-10-25', 'ICT4243', 'TG0200'),
('A0002', 0, 0, '2023-10-25', 'ICT4123', 'TG0200'),
('A0003', 0, 1, '2023-10-25', 'ICT4123', 'TG0203'),
('A0004', 0, 1, '2023-10-25', 'ICT4123', 'TG0207'),
('A0005', 1, 0, '2023-10-25', 'ICT4243', 'TG0240'),
('A0006', 1, 0, '2023-10-30', 'ICT4123', 'TG0200'),
('A0007', 0, 1, '2023-10-26', 'ICT3112', 'TG0400'),
('A0008', 0, 1, '2023-10-26', 'ICT3234', 'TG0450'),
('A0009', 1, 0, '2023-10-27', 'BST3222', 'TG0420'),
('A0010', 0, 1, '2023-10-27', 'ICT2112', 'TG0601');

-- =====================================================
-- 11. ASSESSMENT DATA
-- =====================================================

INSERT INTO assement (Submisson_id, Assement_type, Score, Due_date, Submission_date, Attendance_id_FK, Course_code, STUDENT_Reg_no) VALUES
('S0001', 'Homework', 95, '2023-11-05 00:00:00', '2023-11-04 00:00:00', 'A0001', 'ICT4123', 'TG0200'),
('S0002', 'MID_exam', 96, '2023-11-10 00:00:00', '2023-11-04 00:00:00', 'A0001', 'ICT4123', 'TG0200'),
('S0003', 'MID_exam', 88, '2023-11-10 00:00:00', '2023-11-03 00:00:00', 'A0002', 'ICT4123', 'TG0203'),
('S0004', 'Homework', 92, '2023-11-12 00:00:00', '2023-11-04 00:00:00', 'A0003', 'ICT4123', 'TG0207'),
('S0005', 'Quize', 85, '2023-11-08 00:00:00', '2023-11-07 00:00:00', 'A0007', 'ICT3112', 'TG0400'),
('S0006', 'MID_exam', 78, '2023-11-15 00:00:00', '2023-11-14 00:00:00', 'A0008', 'ICT3234', 'TG0450');

-- =====================================================
-- 12. RESULT DATA
-- =====================================================

INSERT INTO result (STUDENT_Reg_no, Course_code, Marks, GPV_Value) VALUES
('TG0200', 'ICT4243', 85, 3.3),
('TG0203', 'ICT4123', 92, 3.7),
('TG0207', 'ICT4123', 78, 2.5),
('TG0240', 'ICT4243', 86, 3.1),
('TG0251', 'ICT4243', 93, 3.7),
('TG0400', 'ICT3112', 89, 3.7),
('TG0420', 'BST3222', 75, 2.2),
('TG0450', 'ICT3234', 87, 2.9),
('TG0478', 'ICT3112', 82, 2.8),
('TG0478', 'ICT3234', 79, 2.5),
('TG0502', 'BST3133', 91, 3.6),
('TG0601', 'ICT2112', 88, 3.1),
('TG0650', 'ICT2223', 87, 2.9),
('TG0678', 'ET2243', 93, 3.8),
('TG0701', 'ICT2223', 85, 3.2),
('TG0756', 'BST2113', 76, 2.3);

-- =====================================================
-- 13. LAB SHEET DATA
-- =====================================================

INSERT INTO labsheet (labsheet_id, title, due_date, course_code) VALUES
('ICT412301', 'Cybersecurity Management Lab 01', '2023-11-10 20:00:00', 'ICT4123'),
('ICT424301', 'Ethical Hacking Lab 01', '2023-11-11 21:00:00', 'ICT4243'),
('ICT311201', 'Database Administration Lab 01', '2023-11-08 18:00:00', 'ICT3112'),
('ICT323401', 'Machine Learning Lab 01', '2023-11-09 19:00:00', 'ICT3234'),
('BST322201', 'Stem Cell Biology Lab 01', '2023-11-25 21:00:00', 'BST3222'),
('BST313301', 'Food Biotechnology Lab 01', '2023-11-24 20:00:00', 'BST3133'),
('ICT211201', 'Software Development Lab 01', '2023-11-06 16:00:00', 'ICT2112'),
('ICT222301', 'OOP Lab 01', '2023-11-07 17:00:00', 'ICT2223'),
('ET224301', 'Mechanical Design Lab 01', '2023-11-15 11:00:00', 'ET2243'),
('BST211301', 'Biochemistry Lab 01', '2023-11-22 18:00:00', 'BST2113');

-- =====================================================
-- 14. PAST PAPERS DATA
-- =====================================================

INSERT INTO past_papers (paper_title, year, level, semester, course_code) VALUES
('Cybersecurity Management 2021 Level 4 Semester 1', '2021', 'level4', 'sem1', 'ICT4123'),
('Ethical Hacking 2020 Level 4 Semester 2', '2020', 'level4', 'sem2', 'ICT4243'),
('Database Administration 2019 Level 3 Semester 1', '2019', 'level3', 'sem1', 'ICT3112'),
('Machine Learning 2020 Level 3 Semester 2', '2020', 'level3', 'sem2', 'ICT3234'),
('Stem Cell Biology 2018 Level 3 Semester 2', '2018', 'level3', 'sem2', 'BST3222'),
('Food Biotechnology 2021 Level 3 Semester 1', '2021', 'level3', 'sem1', 'BST3133'),
('Software Development 2017 Level 2 Semester 1', '2017', 'level2', 'sem1', 'ICT2112'),
('Object-Oriented Programming 2018 Level 2 Semester 2', '2018', 'level2', 'sem2', 'ICT2223'),
('Mechanical Design 2019 Level 2 Semester 2', '2019', 'level2', 'sem2', 'ET2243'),
('Biochemistry 2019 Level 2 Semester 1', '2019', 'level2', 'sem1', 'BST2113');

-- =====================================================
-- 15. STUDENT LOGIN DATA
-- =====================================================

INSERT INTO student_login (Reg_no, Last_login) VALUES
('TG0200', '2023-10-25 15:30:00'),
('TG0203', '2023-10-25 22:20:00'),
('TG0207', '2023-10-26 08:45:00'),
('TG0240', '2023-10-26 14:15:00'),
('TG0251', '2023-10-27 09:30:00'),
('TG0400', '2023-11-05 19:45:00'),
('TG0420', '2023-11-06 14:55:00'),
('TG0450', '2023-11-07 16:20:00'),
('TG0478', '2023-11-08 21:35:00'),
('TG0502', '2023-11-09 10:40:00'),
('TG0601', '2023-11-11 08:15:00'),
('TG0650', '2023-11-12 17:05:00'),
('TG0678', '2023-11-13 09:25:00'),
('TG0701', '2023-11-14 22:40:00'),
('TG0756', '2023-11-15 12:30:00'),
('TG1010', '2023-11-21 15:30:00'),
('TG1027', '2023-11-21 14:30:00'),
('TG1036', '2023-11-21 16:30:00'),
('TG1067', '2023-11-21 18:30:00'),
('TG1100', '2023-11-21 17:30:00');

-- =====================================================
-- VERIFICATION QUERIES
-- =====================================================

-- Check data insertion
SELECT 'Departments' as Table_Name, COUNT(*) as Record_Count FROM department
UNION ALL
SELECT 'Courses', COUNT(*) FROM course
UNION ALL
SELECT 'Staff', COUNT(*) FROM staff
UNION ALL
SELECT 'Students', COUNT(*) FROM student
UNION ALL
SELECT 'Attendance', COUNT(*) FROM attendance
UNION ALL
SELECT 'Assessments', COUNT(*) FROM assement
UNION ALL
SELECT 'Results', COUNT(*) FROM result
UNION ALL
SELECT 'Lab Sheets', COUNT(*) FROM labsheet
UNION ALL
SELECT 'Past Papers', COUNT(*) FROM past_papers;

-- Show sample data from key tables
SELECT 'Sample Students:' as Info;
SELECT Reg_no, First_name, Last_name, Entrance_year FROM student LIMIT 5;

SELECT 'Sample Courses:' as Info;
SELECT course_code, name, department_name, Credits FROM course LIMIT 5;

SELECT 'Sample Staff:' as Info;
SELECT Staff_no, Name, Position FROM staff LIMIT 5;