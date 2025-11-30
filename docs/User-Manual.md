# User Manual - Faculty of Technology Student Management System

## Table of Contents
1. [System Overview](#system-overview)
2. [Getting Started](#getting-started)
3. [User Roles and Access](#user-roles-and-access)
4. [Administrator Guide](#administrator-guide)
5. [Dean Guide](#dean-guide)
6. [Lecturer Guide](#lecturer-guide)
7. [Technical Officer Guide](#technical-officer-guide)
8. [Student Guide](#student-guide)
9. [Common Procedures](#common-procedures)
10. [Troubleshooting](#troubleshooting)

## System Overview

The Faculty of Technology Student Management System is a comprehensive database solution designed to manage:
- Student registration and academic records
- Course management and enrollment
- Attendance tracking and reporting
- Assessment and examination management
- Result calculation and grade assignment
- User access control and authentication

## Getting Started

### System Requirements
- MySQL Server 5.7 or higher
- Web browser (for phpMyAdmin access)
- MySQL client or MySQL Workbench
- Appropriate user credentials

### Initial Login
1. Connect to the MySQL server using your assigned credentials
2. Select the `lms` database
3. Verify your access permissions match your role

## User Roles and Access

### Access Level Summary

| Role | Database Access | Key Responsibilities |
|------|----------------|---------------------|
| **Administrator** | Full control with grant privileges | System management, user creation |
| **Dean** | Full read/write (no grant) | Academic oversight, reporting |
| **Lecturer** | Full academic data access | Course management, grading |
| **Technical Officer** | Attendance data only | Attendance recording |
| **Student** | Read-only personal data | View grades and attendance |

## Administrator Guide

### User Management

#### Creating New Users
```sql
-- Create a new lecturer account
CALL Create_users_lec_account('Lecturer Account', 'LEC05', 'secure_password');

-- Create a new technical officer account
CALL Create_users_tec_account('Technical Officer Account', 'TEO04', 'secure_password');
```

#### Managing User Permissions
```sql
-- View user permissions
SHOW GRANTS FOR 'username'@'localhost';

-- Modify user password
ALTER USER 'username'@'localhost' IDENTIFIED BY 'new_password';
```

### System Maintenance

#### Database Backup
```sql
-- Create backup (run from command line)
mysqldump -u admin_user -p lms > lms_backup_YYYY-MM-DD.sql
```

#### View System Statistics
```sql
-- Check total users by type
SELECT Staff_account_type, COUNT(*) as User_Count 
FROM staff_account 
GROUP BY Staff_account_type;

-- Check database size
SELECT 
    table_name,
    ROUND(((data_length + index_length) / 1024 / 1024), 2) AS 'Size (MB)'
FROM information_schema.tables 
WHERE table_schema = 'lms'
ORDER BY (data_length + index_length) DESC;
```

## Dean Guide

### Academic Oversight

#### Department Statistics
```sql
-- View student count by department
CALL stud_count('ICT');
CALL stud_count('ET');
CALL stud_count('BST');

-- View staff by department
CALL department('ICT');
```

#### Academic Performance Reports
```sql
-- View results for a specific course
CALL find_Result_of_a_course('ICT4123');

-- View CA eligibility for a course
CALL CA_DETAILS_of_a_COURSE('ICT4123');

-- View attendance for a batch
CALL find_attendance_for_a_batch(2020);
```

#### Course Management
```sql
-- View course details
SELECT * FROM course WHERE department_name = 'ICT';

-- Check course enrollments
CALL enrol_stud('ICT4123');
```

## Lecturer Guide

### Course Management

#### View Your Courses
```sql
-- Get courses for a lecturer (replace with your lecturer ID)
CALL GetLecturerCourses(1);
```

#### Student Management
```sql
-- View students enrolled in your course
CALL enrol_stud('ICT4123');

-- Check student CA eligibility
CALL CA_DETAILS_of_a_Course_for_STUDENT('TG0200', 'ICT4123');
```

#### Grade Management
```sql
-- View student results for your course
CALL find_Result_of_a_course('ICT4123');

-- Update student marks (direct table access)
UPDATE result 
SET Marks = 85, GPV_Value = 3.3 
WHERE STUDENT_Reg_no = 'TG0200' AND Course_code = 'ICT4123';
```

#### Lab Sheet Management
```sql
-- Add new lab sheet
CALL AddLabSheet('ICT412302', 'Advanced Security Lab', '2023-12-15 23:59:59', 'ICT4123');

-- View student lab sheets
SELECT * FROM studentlabsheets WHERE course_code = 'ICT4123';
```

#### Past Papers Management
```sql
-- Add past paper
CALL AddPastpapers('Cybersecurity Final 2023', 2023, 'level4', 'sem1', 'ICT4123');
```

### Assessment Management

#### Recording Assessments
```sql
-- Insert assessment data
INSERT INTO assement (Submisson_id, Assement_type, Score, Due_date, Submission_date, Attendance_id_FK, Course_code, STUDENT_Reg_no)
VALUES ('S0010', 'MID_exam', 85, '2023-12-01 10:00:00', '2023-12-01 09:45:00', 'A0001', 'ICT4123', 'TG0200');
```

## Technical Officer Guide

### Attendance Management

#### Recording Attendance
```sql
-- Insert attendance record
CALL insert_attendance_data('A0020', 0, 1, '2023-11-20', 'ICT4123', 'TG0200');
-- Parameters: Attendance_id, Medical_status, Attendance_status, Date, Course_code, Student_Reg_no
```

#### Attendance Reports
```sql
-- View attendance for a specific batch
CALL find_attendance_for_a_batch(2020);

-- View attendance details for all students
SELECT * FROM attendence_detalis;

-- Check attendance for specific student
SELECT * FROM attendence_detalis WHERE STUDENT_Reg_no = 'TG0200';
```

#### Bulk Attendance Entry
```sql
-- Example: Mark multiple students present for a class
INSERT INTO attendance (Attendance_id, Medical_status, Attendance_status, Date, Course_code, STUDENT_Reg_no) VALUES
('A0021', 0, 1, '2023-11-20', 'ICT4123', 'TG0200'),
('A0022', 0, 1, '2023-11-20', 'ICT4123', 'TG0203'),
('A0023', 0, 0, '2023-11-20', 'ICT4123', 'TG0207');
```

## Student Guide

### Viewing Academic Information

#### Your Courses
```sql
-- View your enrolled courses (replace TG0200 with your registration number)
CALL GetStudentCourses('TG0200');

-- Alternative view
SELECT * FROM studentcourses WHERE Reg_no = 'TG0200';
```

#### Your Results
```sql
-- View your results
CALL find_Result_of_a_student('TG0200');

-- View specific course result
CALL find_Result_of_student_course('TG0200', 'ICT4123');
```

#### Your Attendance
```sql
-- Check your attendance status
SELECT * FROM attendence_detalis WHERE STUDENT_Reg_no = 'TG0200';

-- Check CA eligibility
CALL CA_DETAILS_of_a__STUDENT('TG0200');
```

#### Lab Sheets and Assignments
```sql
-- View upcoming lab sheets
CALL StudentUpcomeLab('TG0200');

-- View previous lab sheets
CALL StudentPreLab('TG0200');

-- View all your lab sheets
SELECT * FROM studentlabsheets WHERE Reg_no = 'TG0200';
```

#### Past Papers
```sql
-- View available past papers for your courses
SELECT * FROM studentpastpapers WHERE Reg_no = 'TG0200';
```

## Common Procedures

### Frequently Used Stored Procedures

#### Student Information
- `GetStudentCourses(student_reg_no)` - Get courses for a student
- `find_Result_of_a_student(student_reg_no)` - Get all results for a student
- `CA_DETAILS_of_a__STUDENT(student_reg_no)` - Get CA eligibility for a student

#### Course Information
- `enrol_stud(course_code)` - Get enrolled students for a course
- `find_Result_of_a_course(course_code)` - Get all results for a course
- `CA_DETAILS_of_a_COURSE(course_code)` - Get CA eligibility for a course

#### Attendance Management
- `insert_attendance_data(id, medical, status, date, course, student)` - Record attendance
- `find_attendance_for_a_batch(year)` - Get attendance for a batch

#### Administrative
- `Create_users_account(type, username, password)` - Create user account
- `updatepassword(username, new_password)` - Update user password
- `stud_count(department)` - Count students in department

### Important Views

#### Academic Views
- `result_details` - Complete result information with grades
- `attendence_detalis` - Attendance summary with percentages
- `ca_eligibility` - CA eligibility status
- `level` - Student level information

#### Information Views
- `studentcourses` - Student course enrollments
- `studentlabsheets` - Student lab sheet assignments
- `studentpastpapers` - Available past papers for students
- `staffdepartment` - Staff department assignments

## Troubleshooting

### Common Issues

#### Access Denied Errors
**Problem**: "Access denied for user"
**Solution**: 
1. Verify your username and password
2. Check if your account has the required permissions
3. Contact administrator if permissions are incorrect

#### Connection Issues
**Problem**: "Can't connect to MySQL server"
**Solution**:
1. Verify MySQL server is running
2. Check network connectivity
3. Verify server address and port
4. Check firewall settings

#### Permission Errors
**Problem**: "You don't have permission to access this table"
**Solution**:
1. Verify you're using the correct user account
2. Check your role-based permissions
3. Contact administrator for permission updates

### Data Integrity Issues

#### Foreign Key Constraints
**Problem**: "Cannot add or update a child row: a foreign key constraint fails"
**Solution**:
1. Verify referenced records exist
2. Check data types match
3. Ensure referential integrity

#### Duplicate Entry Errors
**Problem**: "Duplicate entry for key"
**Solution**:
1. Check for existing records with same primary key
2. Use appropriate UPDATE instead of INSERT
3. Verify unique constraints

### Performance Issues

#### Slow Queries
**Solution**:
1. Use appropriate indexes
2. Optimize WHERE clauses
3. Limit result sets with LIMIT clause
4. Use views for complex queries

#### Large Result Sets
**Solution**:
1. Use pagination with LIMIT and OFFSET
2. Filter results with specific WHERE conditions
3. Use date ranges for time-based queries

### Getting Help

#### Contact Information
- **System Administrator**: Contact for user account issues, permissions, and system maintenance
- **Database Administrator**: Contact for technical database issues and performance problems
- **Academic Office**: Contact for academic policy and procedure questions

#### Documentation
- Refer to this user manual for common procedures
- Check the ER diagram documentation for database structure
- Review stored procedure documentation for parameter details

#### Best Practices
1. Always backup data before making changes
2. Use transactions for multiple related operations
3. Verify data before committing changes
4. Follow naming conventions for consistency
5. Document any custom procedures or modifications

---

**Document Version**: 1.0  
**Last Updated**: [Current Date]  
**For Technical Support**: Contact System Administrator