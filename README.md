# Faculty of Technology Student Management System

A comprehensive MySQL database system for managing student details, marks, attendance, and results for a Faculty of Technology.

## 📋 Project Overview

This system is designed to manage all aspects of student academic life including:
- Student registration and personal details
- Course enrollment and management
- Attendance tracking
- Assessment and examination marks
- Result calculation and grade management
- User access control with role-based permissions

## 🏗️ System Architecture

### Database Users & Permissions

| User Type | Permissions | Description |
|-----------|-------------|-------------|
| **Admin** | ALL PRIVILEGES WITH GRANT OPTION | Full database control and user management |
| **Dean** | ALL PRIVILEGES (no grant) | Complete access to all tables without user creation rights |
| **Lecturer** | ALL PRIVILEGES (no grant/user creation) | Full access to academic data |
| **Technical Officer** | READ, WRITE, UPDATE on attendance tables | Limited to attendance management |
| **Student** | READ ONLY on final results and attendance | View-only access to personal academic data |

## 📊 Database Schema

### Core Tables
- **student**: Student personal information and registration details
- **course**: Course information including credits and department
- **attendance**: Daily attendance records
- **result**: Final examination results and grades
- **staff**: Faculty and staff information
- **department**: Academic department details

### Assessment Tables
- **assement**: Various assessment types (Quiz, Mid-exam, Final, etc.)
- **labsheet**: Laboratory assignments and practicals
- **past_papers**: Historical examination papers

### Relationship Tables
- **student_course**: Student course enrollments
- **student_department**: Student department assignments
- **staff_department**: Staff department assignments

## 🎯 Key Features

### Student Management
- Complete student profile management
- Course enrollment tracking
- Academic progress monitoring
- Attendance percentage calculation

### Assessment System
- Multiple assessment types support
- Automated grade calculation
- CA (Continuous Assessment) eligibility tracking
- Repeat student management

### User Access Control
- Role-based authentication
- Secure password management
- Session tracking for students
- Audit trail for administrative actions

### Reporting & Analytics
- Student performance reports
- Attendance summaries
- Department-wise statistics
- Course enrollment analytics

## 🚀 Getting Started

### Prerequisites
- MySQL Server 5.7 or higher
- phpMyAdmin (optional, for GUI management)
- MySQL Workbench (recommended for development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/Faculty-Technology-Student-Management-System.git
   cd Faculty-Technology-Student-Management-System
   ```

2. **Create the database**
   ```sql
   CREATE DATABASE lms;
   USE lms;
   ```

3. **Import the database schema**
   ```bash
   mysql -u root -p lms < sql-scripts/lms_complete.sql
   ```

4. **Create user accounts**
   ```sql
   -- Run the user creation procedures
   CALL Create_users_account('Administrator Account', 'ADM01', 'your_password');
   CALL Create_users_lec_account('Lecturer Account', 'LEC01', 'your_password');
   -- Add other users as needed
   ```

## 📁 Project Structure

```
Faculty-Technology-Student-Management-System/
├── README.md
├── docs/
│   ├── Data-Requirements.md
│   ├── ER-Diagram.md
│   ├── User-Manual.md
│   └── API-Documentation.md
├── sql-scripts/
│   ├── lms_complete.sql
│   ├── create_users.sql
│   ├── stored_procedures.sql
│   └── sample_data.sql
├── diagrams/
│   ├── ER-Diagram.png
│   ├── Relational-Schema.png
│   └── System-Architecture.png
└── sample-data/
    ├── students.csv
    ├── courses.csv
    └── staff.csv
```

## 🔧 Database Design Process (DDLC)

This project follows the complete Database Development Life Cycle:

1. **Requirements Analysis** - Documented in `docs/Data-Requirements.md`
2. **Conceptual Design** - ER Diagrams in `diagrams/`
3. **Logical Design** - Relational mapping documented
4. **Physical Design** - MySQL implementation with optimizations
5. **Implementation** - Complete SQL scripts provided
6. **Testing** - Sample data and test procedures included

## 📈 Usage Examples

### For Students
```sql
-- View your courses
CALL GetStudentCourses('TG0200');

-- Check attendance
SELECT * FROM attendence_detalis WHERE STUDENT_Reg_no = 'TG0200';

-- View results
CALL find_Result_of_a_student('TG0200');
```

### For Lecturers
```sql
-- View enrolled students in a course
CALL enrol_stud('ICT4123');

-- Check CA eligibility for a course
CALL CA_DETAILS_of_a_COURSE('ICT4123');
```

### For Administrators
```sql
-- Create new user account
CALL Create_users_account('Lecturer Account', 'LEC05', 'newpassword');

-- View department statistics
CALL stud_count('ICT');
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request
