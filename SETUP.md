# Setup Guide - Faculty of Technology Student Management System

## Quick Start Guide

Follow these steps to set up the Faculty of Technology Student Management System on your local machine.

## Prerequisites

Before you begin, ensure you have the following installed:

- **MySQL Server 8.0** or higher (MySQL 5.7 minimum)
- **MySQL Workbench** (recommended) or **phpMyAdmin**
- **Git** (for cloning the repository)
- A text editor or IDE of your choice

## Step-by-Step Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/Faculty-Technology-Student-Management-System.git
cd Faculty-Technology-Student-Management-System
```

### 2. Database Setup

#### Option A: Using MySQL Command Line

1. **Start MySQL Server**
   ```bash
   # On Windows (if MySQL is in PATH)
   mysql -u root -p
   
   # On Linux/Mac
   sudo mysql -u root -p
   ```

2. **Create the Database**
   ```sql
   CREATE DATABASE lms CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
   USE lms;
   ```

3. **Import the Database Schema**
   ```bash
   # Exit MySQL first, then run:
   mysql -u root -p lms < sql-scripts/lms_complete.sql
   ```

#### Option B: Using MySQL Workbench

1. Open MySQL Workbench
2. Connect to your MySQL server
3. Create a new schema named `lms`
4. Open and execute `sql-scripts/lms_complete.sql`

#### Option C: Using phpMyAdmin

1. Open phpMyAdmin in your browser
2. Create a new database named `lms`
3. Import the file `sql-scripts/lms_complete.sql`

### 3. Create User Accounts

Execute the user creation script:

```bash
mysql -u root -p lms < sql-scripts/create_users.sql
```

Or manually execute the SQL commands in MySQL Workbench/phpMyAdmin.

### 4. Load Sample Data (Optional)

To populate the database with sample data for testing:

```bash
mysql -u root -p lms < sql-scripts/sample_data.sql
```

### 5. Verify Installation

Connect to the database and run verification queries:

```sql
-- Check if all tables are created
SHOW TABLES;

-- Check sample data
SELECT COUNT(*) as student_count FROM student;
SELECT COUNT(*) as course_count FROM course;
SELECT COUNT(*) as staff_count FROM staff;

-- Test a stored procedure
CALL GetStudentCourses('TG0200');
```

## User Account Information

After setup, you'll have the following default accounts:

### System Users (MySQL Users)

| Username | Password | Role | Description |
|----------|----------|------|-------------|
| `admin_user` | `admin_secure_pass_2024` | Administrator | Full system control |
| `dean_user` | `dean_secure_pass_2024` | Dean | Full data access |
| `lecturer_user` | `lecturer_secure_pass_2024` | Lecturer | Academic data access |
| `tech_officer` | `tech_officer_pass_2024` | Technical Officer | Attendance management |
| `student_user` | `student_secure_pass_2024` | Student | Read-only access |

### Application Users (Staff Accounts)

| Staff ID | Password | Role | Description |
|----------|----------|------|-------------|
| `ADM01` | `adminpass123` | Administrator | System admin |
| `DEA01` | `deanpass432` | Dean | Academic dean |
| `LEC01` | `lecturerpass456` | Lecturer | Course lecturer |
| `LEC02` | `lecturer2pass987` | Lecturer | Course lecturer |
| `TEO01` | `tauser789` | Technical Officer | Attendance officer |

**⚠️ IMPORTANT**: Change all default passwords immediately after setup!

## Configuration

### 1. Security Configuration

**Change Default Passwords:**
```sql
-- Change MySQL user passwords
ALTER USER 'admin_user'@'localhost' IDENTIFIED BY 'your_strong_password';
ALTER USER 'dean_user'@'localhost' IDENTIFIED BY 'your_strong_password';
-- Repeat for all users

-- Change application user passwords
CALL updatepassword('ADM01', 'your_new_password');
CALL updatepassword('DEA01', 'your_new_password');
-- Repeat for all staff accounts
```

### 2. Connection Configuration

Create a configuration file for your application (not included in repository):

```ini
# database_config.ini (add to .gitignore)
[database]
host = localhost
port = 3306
database = lms
charset = utf8mb4

[admin]
username = admin_user
password = your_admin_password

[application]
username = lecturer_user
password = your_app_password
```

## Testing the Installation

### 1. Basic Functionality Tests

```sql
-- Test student enrollment
CALL GetStudentCourses('TG0200');

-- Test attendance recording
CALL insert_attendance_data('TEST01', 0, 1, CURDATE(), 'ICT4123', 'TG0200');

-- Test result viewing
CALL find_Result_of_a_student('TG0200');

-- Test CA eligibility
CALL CA_DETAILS_of_a__STUDENT('TG0200');
```

### 2. Permission Tests

Test each user role to ensure proper access control:

```sql
-- Connect as student_user and try to insert (should fail)
INSERT INTO student (Reg_no, First_name, Last_name, Email, Home_address, Street_address, Country) 
VALUES ('TEST1', 'Test', 'User', 'test@test.com', 'Test', 'Test', 'Test');

-- Connect as tech_officer and try to view results (should fail)
SELECT * FROM result;
```

## Troubleshooting

### Common Issues

#### 1. "Access denied for user" Error
**Solution:**
- Verify MySQL server is running
- Check username and password
- Ensure user has been created properly

#### 2. "Table doesn't exist" Error
**Solution:**
- Verify the database schema was imported correctly
- Check if you're connected to the correct database
- Re-run the schema import script

#### 3. "Foreign key constraint fails" Error
**Solution:**
- Ensure you imported the complete schema before adding data
- Check that referenced records exist
- Import sample data in the correct order

#### 4. Stored Procedure Errors
**Solution:**
- Verify all stored procedures were created successfully
- Check for syntax errors in the SQL files
- Ensure proper delimiter settings

### Performance Optimization

#### 1. Index Optimization
```sql
-- Check existing indexes
SHOW INDEX FROM student;
SHOW INDEX FROM course;
SHOW INDEX FROM attendance;

-- Add custom indexes if needed
CREATE INDEX idx_student_entrance_year ON student(Entrance_year);
CREATE INDEX idx_attendance_date ON attendance(Date);
```

#### 2. Query Optimization
```sql
-- Use EXPLAIN to analyze query performance
EXPLAIN SELECT * FROM result_details WHERE STUDENT_Reg_no = 'TG0200';

-- Optimize slow queries
EXPLAIN SELECT * FROM attendence_detalis WHERE Course_code = 'ICT4123';
```

## Backup and Maintenance

### 1. Regular Backups

Create automated backup scripts:

```bash
#!/bin/bash
# backup_script.sh
DATE=$(date +%Y%m%d_%H%M%S)
mysqldump -u admin_user -p lms > backups/lms_backup_$DATE.sql
```

### 2. Maintenance Tasks

```sql
-- Check table integrity
CHECK TABLE student, course, attendance, result;

-- Optimize tables
OPTIMIZE TABLE student, course, attendance, result;

-- Update table statistics
ANALYZE TABLE student, course, attendance, result;
```

## Development Environment

### 1. Development Database

For development, create a separate database:

```sql
CREATE DATABASE lms_dev;
-- Import schema and sample data to lms_dev
```

### 2. Testing Framework

Set up automated tests for critical functions:

```sql
-- Test data integrity
SELECT 'PASS' as test_result WHERE (SELECT COUNT(*) FROM student) > 0;

-- Test stored procedures
CALL GetStudentCourses('TG0200');
SELECT 'PASS' as test_result WHERE FOUND_ROWS() > 0;
```

## Production Deployment

### 1. Security Checklist

- [ ] Change all default passwords
- [ ] Remove or secure test accounts
- [ ] Enable SSL/TLS connections
- [ ] Configure firewall rules
- [ ] Set up monitoring and logging
- [ ] Implement backup procedures
- [ ] Configure user session timeouts

### 2. Performance Checklist

- [ ] Optimize MySQL configuration
- [ ] Set up proper indexing
- [ ] Configure connection pooling
- [ ] Monitor query performance
- [ ] Set up database replication (if needed)

## Support

### Getting Help

1. **Documentation**: Check the `docs/` folder for detailed documentation
2. **Issues**: Create an issue on GitHub for bugs or feature requests
3. **Community**: Join discussions in the repository

### Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

---

**Setup Complete!** 🎉

Your Faculty of Technology Student Management System is now ready to use. 

**Next Steps:**
1. Review the [User Manual](docs/User-Manual.md) for detailed usage instructions
2. Check the [ER Diagram Documentation](docs/ER-Diagram.md) to understand the database structure
3. Explore the sample data and test the system functionality

**Remember to change all default passwords before using in production!**