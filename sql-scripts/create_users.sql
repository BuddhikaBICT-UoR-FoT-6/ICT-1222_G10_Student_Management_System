-- =====================================================
-- Faculty of Technology Student Management System
-- User Creation and Permission Management Script
-- =====================================================

-- Create database if not exists
CREATE DATABASE IF NOT EXISTS lms;
USE lms;

-- =====================================================
-- 1. ADMIN USER CREATION
-- =====================================================
-- Admin: All privileges with Grant Option for all tables

-- Drop user if exists (for clean setup)
DROP USER IF EXISTS 'admin_user'@'localhost';

-- Create Admin user
CREATE USER 'admin_user'@'localhost' IDENTIFIED BY 'admin_secure_pass_2024';

-- Grant all privileges with grant option
GRANT ALL PRIVILEGES ON lms.* TO 'admin_user'@'localhost' WITH GRANT OPTION;

-- Allow admin to create users
GRANT CREATE USER ON *.* TO 'admin_user'@'localhost';

FLUSH PRIVILEGES;

-- =====================================================
-- 2. DEAN USER CREATION
-- =====================================================
-- Dean: All privileges without Grant for all tables

-- Drop user if exists
DROP USER IF EXISTS 'dean_user'@'localhost';

-- Create Dean user
CREATE USER 'dean_user'@'localhost' IDENTIFIED BY 'dean_secure_pass_2024';

-- Grant all privileges without grant option
GRANT ALL PRIVILEGES ON lms.* TO 'dean_user'@'localhost';

-- Explicitly revoke grant option
REVOKE GRANT OPTION ON lms.* FROM 'dean_user'@'localhost';

FLUSH PRIVILEGES;

-- =====================================================
-- 3. LECTURER USER CREATION
-- =====================================================
-- Lecturer: All privileges without Grant and user creation

-- Drop user if exists
DROP USER IF EXISTS 'lecturer_user'@'localhost';

-- Create Lecturer user
CREATE USER 'lecturer_user'@'localhost' IDENTIFIED BY 'lecturer_secure_pass_2024';

-- Grant all privileges without grant option
GRANT ALL PRIVILEGES ON lms.* TO 'lecturer_user'@'localhost';

-- Revoke grant option and user creation privileges
REVOKE GRANT OPTION ON lms.* FROM 'lecturer_user'@'localhost';
REVOKE CREATE USER ON *.* FROM 'lecturer_user'@'localhost';

FLUSH PRIVILEGES;

-- =====================================================
-- 4. TECHNICAL OFFICER USER CREATION
-- =====================================================
-- Technical Officer: Read, write, update permissions for attendance related tables/views

-- Drop user if exists
DROP USER IF EXISTS 'tech_officer'@'localhost';

-- Create Technical Officer user
CREATE USER 'tech_officer'@'localhost' IDENTIFIED BY 'tech_officer_pass_2024';

-- Grant specific permissions on attendance-related tables
GRANT SELECT, INSERT, UPDATE ON lms.attendance TO 'tech_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON lms.student TO 'tech_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON lms.course TO 'tech_officer'@'localhost';
GRANT SELECT, INSERT, UPDATE ON lms.student_course TO 'tech_officer'@'localhost';

-- Grant permissions on attendance-related views
GRANT SELECT ON lms.attendence_detalis TO 'tech_officer'@'localhost';
GRANT SELECT ON lms.studentcourses TO 'tech_officer'@'localhost';

-- Grant permission to execute attendance-related procedures
GRANT EXECUTE ON PROCEDURE lms.insert_attendance_data TO 'tech_officer'@'localhost';
GRANT EXECUTE ON PROCEDURE lms.find_attendance_for_a_batch TO 'tech_officer'@'localhost';

FLUSH PRIVILEGES;

-- =====================================================
-- 5. STUDENT USER CREATION
-- =====================================================
-- Student: Read permission for final attendance and final marks/grades tables/views

-- Drop user if exists
DROP USER IF EXISTS 'student_user'@'localhost';

-- Create Student user
CREATE USER 'student_user'@'localhost' IDENTIFIED BY 'student_secure_pass_2024';

-- Grant read-only permissions on result and attendance views
GRANT SELECT ON lms.result_details TO 'student_user'@'localhost';
GRANT SELECT ON lms.attendence_detalis TO 'student_user'@'localhost';
GRANT SELECT ON lms.ca_eligibility TO 'student_user'@'localhost';
GRANT SELECT ON lms.studentcourses TO 'student_user'@'localhost';
GRANT SELECT ON lms.studentlabsheets TO 'student_user'@'localhost';
GRANT SELECT ON lms.studentpastpapers TO 'student_user'@'localhost';

-- Grant read access to course information
GRANT SELECT ON lms.course TO 'student_user'@'localhost';
GRANT SELECT ON lms.labsheet TO 'student_user'@'localhost';
GRANT SELECT ON lms.past_papers TO 'student_user'@'localhost';

-- Grant permission to execute student-related procedures
GRANT EXECUTE ON PROCEDURE lms.GetStudentCourses TO 'student_user'@'localhost';
GRANT EXECUTE ON PROCEDURE lms.StudentPreLab TO 'student_user'@'localhost';
GRANT EXECUTE ON PROCEDURE lms.StudentUpcomeLab TO 'student_user'@'localhost';
GRANT EXECUTE ON PROCEDURE lms.find_Result_of_a_student TO 'student_user'@'localhost';
GRANT EXECUTE ON PROCEDURE lms.CA_DETAILS_of_a__STUDENT TO 'student_user'@'localhost';

FLUSH PRIVILEGES;

-- =====================================================
-- 6. ADDITIONAL SPECIFIC USER ACCOUNTS
-- =====================================================

-- Create specific staff accounts based on existing data
-- These will use the stored procedures for account creation

-- Admin Account
CALL Create_users_account('Administrator Account', 'ADM01', 'adminpass123');

-- Dean Account  
CALL Create_users_account('Dean Account', 'DEA01', 'deanpass432');

-- Lecturer Accounts
CALL Create_users_lec_account('Lecturer Account', 'LEC01', 'lecturerpass456');
CALL Create_users_lec_account('Lecturer Account', 'LEC02', 'lecturer2pass987');
CALL Create_users_lec_account('Lecturer Account', 'LEC03', 'lecturer3pass123');
CALL Create_users_lec_account('Lecturer Account', 'LEC04', 'lecturer4pass456');

-- Technical Officer Accounts
CALL Create_users_tec_account('Technical Officer Account', 'TEO01', 'techpass789');
CALL Create_users_tec_account('Technical Officer Account', 'TEO02', 'techpass456');
CALL Create_users_tec_account('Technical Officer Account', 'TEO03', 'techpass123');

-- =====================================================
-- 7. VERIFICATION QUERIES
-- =====================================================

-- Check created users
SELECT User, Host FROM mysql.user WHERE User IN ('admin_user', 'dean_user', 'lecturer_user', 'tech_officer', 'student_user');

-- Check user privileges
SHOW GRANTS FOR 'admin_user'@'localhost';
SHOW GRANTS FOR 'dean_user'@'localhost';
SHOW GRANTS FOR 'lecturer_user'@'localhost';
SHOW GRANTS FOR 'tech_officer'@'localhost';
SHOW GRANTS FOR 'student_user'@'localhost';

-- =====================================================
-- 8. SECURITY NOTES
-- =====================================================

/*
IMPORTANT SECURITY CONSIDERATIONS:

1. Change default passwords immediately after setup
2. Use strong passwords with mixed case, numbers, and symbols
3. Consider implementing password expiration policies
4. Regularly audit user permissions
5. Monitor user activity through logs
6. Implement connection limits if needed
7. Use SSL/TLS for database connections in production

Example of changing password:
ALTER USER 'admin_user'@'localhost' IDENTIFIED BY 'new_strong_password';

Example of setting connection limits:
ALTER USER 'student_user'@'localhost' WITH MAX_CONNECTIONS_PER_HOUR 100;
*/

-- =====================================================
-- 9. ROLE-BASED ACCESS SUMMARY
-- =====================================================

/*
USER ROLE SUMMARY:

1. ADMIN_USER:
   - Full database control
   - Can create/modify users
   - Can grant permissions to others
   - Complete system administration

2. DEAN_USER:
   - Full read/write access to all data
   - Cannot create users or grant permissions
   - Academic oversight and reporting

3. LECTURER_USER:
   - Full access to academic data
   - Cannot create users or grant permissions
   - Course and student management

4. TECH_OFFICER:
   - Limited to attendance management
   - Can insert/update attendance records
   - Can view student and course information
   - Cannot modify grades or results

5. STUDENT_USER:
   - Read-only access to personal academic data
   - Can view grades, attendance, and course info
   - Cannot modify any data
   - Limited to relevant procedures only
*/

FLUSH PRIVILEGES;