# Data Requirements Document

## Faculty of Technology Student Management System

### 1. Introduction

This document outlines the data requirements for the Faculty of Technology Student Management System, designed to manage student details, academic records, attendance, and results.

### 2. System Scope

The system manages:
- Student registration and personal information
- Course catalog and enrollment
- Attendance tracking and reporting
- Assessment and examination management
- Result calculation and grade assignment
- User access control and authentication

### 3. User Requirements

#### 3.1 User Types and Access Levels

| User Type | Access Level | Responsibilities |
|-----------|--------------|------------------|
| **Administrator** | Full system access with grant privileges | System management, user creation, all data operations |
| **Dean** | Full read/write access (no grant) | Academic oversight, policy implementation, reporting |
| **Lecturer** | Full academic data access | Course management, grading, attendance tracking |
| **Technical Officer** | Attendance data only | Attendance recording and management |
| **Student** | Read-only personal data | View grades, attendance, course information |

#### 3.2 Functional Requirements

##### Student Management
- Register new students with complete personal details
- Assign students to departments and courses
- Track student academic progression
- Maintain student contact information

##### Course Management
- Define course catalog with credits and prerequisites
- Assign courses to departments
- Track course enrollment
- Manage course schedules and resources

##### Attendance Management
- Record daily attendance for each course
- Track medical absences
- Calculate attendance percentages
- Generate attendance reports

##### Assessment Management
- Support multiple assessment types (Quiz, Mid-exam, Final, Practical)
- Record assessment scores
- Calculate continuous assessment (CA) marks
- Determine examination eligibility

##### Result Management
- Calculate final grades based on assessments
- Generate transcripts and result sheets
- Track repeat students
- Maintain academic history

### 4. Data Requirements

#### 4.1 Student Data
- **Personal Information**: Registration number, name, email, address, country
- **Academic Information**: Entrance year, department, enrolled courses
- **Contact Information**: Multiple phone numbers, emergency contacts
- **Authentication**: Username, password, account type

#### 4.2 Course Data
- **Course Details**: Code, name, credit hours, department
- **Course Type**: Theory/Practical classification
- **Prerequisites**: Course dependencies
- **Resources**: Lab sheets, past papers, materials

#### 4.3 Staff Data
- **Personal Information**: Staff number, name, position, contact details
- **Professional Information**: Department assignment, qualifications
- **Authentication**: Username, password, role-based access

#### 4.4 Assessment Data
- **Assessment Types**: Quiz, Mid-semester, Final examination, Practical
- **Scoring**: Marks, weightage, grade calculation
- **Eligibility**: Attendance requirements, CA thresholds
- **Scheduling**: Due dates, submission tracking

#### 4.5 Attendance Data
- **Daily Records**: Date, course, student, attendance status
- **Medical Records**: Medical certificate status
- **Calculations**: Attendance percentage, eligibility status
- **Reporting**: Period-wise summaries

### 5. Data Relationships

#### 5.1 Primary Relationships
- Students belong to Departments
- Students enroll in Courses
- Courses belong to Departments
- Staff work in Departments
- Assessments belong to Courses
- Attendance records link Students and Courses

#### 5.2 Business Rules
- Students must maintain 80% attendance for examination eligibility
- CA marks must be ≥50% for final examination eligibility
- Each course has a maximum credit limit
- Students can repeat failed courses up to 3 times
- Grades are calculated based on predefined scales

### 6. Data Constraints

#### 6.1 Entity Constraints
- Student registration numbers must be unique
- Course codes must follow department naming convention
- Staff numbers must be unique within the system
- Email addresses must be unique per user type

#### 6.2 Referential Constraints
- All foreign key relationships must be maintained
- Cascade delete for dependent records
- Restrict delete for referenced entities

#### 6.3 Domain Constraints
- Marks must be between 0-100
- Attendance percentage between 0-100
- Credit hours must be positive integers
- Dates must be valid and logical

### 7. Security Requirements

#### 7.1 Access Control
- Role-based authentication system
- Password encryption and security policies
- Session management and timeout
- Audit trail for sensitive operations

#### 7.2 Data Privacy
- Student data protection compliance
- Restricted access to personal information
- Secure data transmission and storage
- Regular security audits

### 8. Performance Requirements

#### 8.1 Response Time
- Query response time < 2 seconds for standard operations
- Report generation < 30 seconds for complex queries
- User authentication < 1 second

#### 8.2 Scalability
- Support for 10,000+ students
- Concurrent user support (100+ simultaneous users)
- Data archiving for historical records

### 9. Backup and Recovery

#### 9.1 Backup Strategy
- Daily incremental backups
- Weekly full system backups
- Real-time replication for critical data

#### 9.2 Recovery Requirements
- Maximum 1-hour data loss tolerance
- 4-hour maximum recovery time
- Disaster recovery procedures

### 10. Reporting Requirements

#### 10.1 Standard Reports
- Student transcripts and grade reports
- Attendance summaries by course/student
- Department-wise enrollment statistics
- Faculty workload reports

#### 10.2 Ad-hoc Reporting
- Custom query capabilities for administrators
- Export functionality (PDF, Excel, CSV)
- Graphical dashboards for key metrics

### 11. Integration Requirements

#### 11.1 External Systems
- University information system integration
- Email notification system
- Document management system
- Payment processing system

#### 11.2 Data Exchange
- Standard data formats (XML, JSON, CSV)
- API endpoints for external access
- Real-time data synchronization

### 12. Compliance Requirements

#### 12.1 Educational Standards
- Academic record keeping standards
- Grade reporting requirements
- Student privacy regulations

#### 12.2 Technical Standards
- Database normalization (3NF minimum)
- SQL standard compliance
- Documentation standards

---

**Document Version**: 1.0  
**Last Updated**: [Current Date]  
**Approved By**: [Project Stakeholders]