# Entity-Relationship Diagram Documentation

## Faculty of Technology Student Management System

### 1. ER Diagram Overview

This document describes the Entity-Relationship model for the Faculty of Technology Student Management System, showing the relationships between different entities and their attributes.

### 2. Entities and Attributes

#### 2.1 STUDENT Entity
**Primary Key**: Reg_no (CHAR(6))

| Attribute | Type | Description | Constraints |
|-----------|------|-------------|-------------|
| Reg_no | CHAR(6) | Student registration number | PRIMARY KEY, NOT NULL |
| First_name | VARCHAR(25) | Student first name | NOT NULL |
| Last_name | VARCHAR(25) | Student last name | NOT NULL |
| Email | VARCHAR(30) | Student email address | NOT NULL, UNIQUE |
| Home_address | VARCHAR(30) | Home address | NOT NULL |
| Street_address | VARCHAR(50) | Street address | NOT NULL |
| Country | VARCHAR(25) | Country of residence | NOT NULL |
| Entrance_year | YEAR(4) | Year of admission | |

#### 2.2 COURSE Entity
**Primary Key**: course_code (CHAR(7))

| Attribute | Type | Description | Constraints |
|-----------|------|-------------|-------------|
| course_code | CHAR(7) | Unique course identifier | PRIMARY KEY, NOT NULL |
| name | VARCHAR(255) | Course name | |
| course_hours | DECIMAL(10,0) | Total course hours | |
| department_name | VARCHAR(10) | Associated department | FOREIGN KEY |
| Credits | INT | Course credit value | |

#### 2.3 STAFF Entity
**Primary Key**: Staff_no (CHAR(5))

| Attribute | Type | Description | Constraints |
|-----------|------|-------------|-------------|
| Staff_no | CHAR(5) | Staff identification number | PRIMARY KEY, NOT NULL |
| Name | VARCHAR(25) | Staff full name | |
| Position | VARCHAR(20) | Job position | |
| Gender | VARCHAR(6) | Gender | |
| Home_address | VARCHAR(30) | Home address | |
| Street_address | VARCHAR(20) | Street address | |
| Country | VARCHAR(25) | Country of residence | |

#### 2.4 DEPARTMENT Entity
**Primary Key**: Name (VARCHAR(10))

| Attribute | Type | Description | Constraints |
|-----------|------|-------------|-------------|
| Name | VARCHAR(10) | Department name | PRIMARY KEY, NOT NULL |
| Location | VARCHAR(40) | Department location | NOT NULL |

#### 2.5 ATTENDANCE Entity
**Primary Key**: Attendance_id (CHAR(5))

| Attribute | Type | Description | Constraints |
|-----------|------|-------------|-------------|
| Attendance_id | CHAR(5) | Attendance record ID | PRIMARY KEY, NOT NULL |
| Medical_status | TINYINT(1) | Medical absence flag | |
| Attendance_status | TINYINT(1) | Present/Absent status | |
| Date | DATE | Attendance date | |
| Course_code | CHAR(7) | Associated course | FOREIGN KEY |
| STUDENT_Reg_no | CHAR(6) | Associated student | FOREIGN KEY |

#### 2.6 RESULT Entity
**Primary Key**: (STUDENT_Reg_no, Course_code)

| Attribute | Type | Description | Constraints |
|-----------|------|-------------|-------------|
| STUDENT_Reg_no | CHAR(6) | Student registration | PRIMARY KEY, FOREIGN KEY |
| Course_code | CHAR(7) | Course code | PRIMARY KEY, FOREIGN KEY |
| Marks | INT | Final marks obtained | |
| GPV_Value | DECIMAL(3,1) | Grade Point Value | |

#### 2.7 ASSEMENT Entity
**Primary Key**: Submisson_id (CHAR(5))

| Attribute | Type | Description | Constraints |
|-----------|------|-------------|-------------|
| Submisson_id | CHAR(5) | Submission identifier | PRIMARY KEY, NOT NULL |
| Assement_type | VARCHAR(30) | Type of assessment | |
| Score | INT | Score obtained | |
| Due_date | DATETIME | Assignment due date | |
| Submission_date | DATETIME | Actual submission date | |
| Attendance_id_FK | CHAR(5) | Related attendance | FOREIGN KEY |
| Course_code | CHAR(7) | Associated course | FOREIGN KEY |
| STUDENT_Reg_no | CHAR(6) | Associated student | FOREIGN KEY |

### 3. Relationships

#### 3.1 STUDENT Relationships

**STUDENT - DEPARTMENT (Many-to-Many)**
- Relationship: STUDENT_DEPARTMENT
- Attributes: STUDENT_Reg_no, DEPARTMENT_name
- Description: Students can belong to multiple departments (double major)

**STUDENT - COURSE (Many-to-Many)**
- Relationship: STUDENT_COURSE
- Attributes: STUDENT_Reg_no, COURSE_code
- Description: Students enroll in multiple courses

**STUDENT - ATTENDANCE (One-to-Many)**
- Description: Each student has multiple attendance records
- Foreign Key: STUDENT_Reg_no in ATTENDANCE

**STUDENT - RESULT (One-to-Many)**
- Description: Each student has multiple course results
- Foreign Key: STUDENT_Reg_no in RESULT

#### 3.2 COURSE Relationships

**COURSE - DEPARTMENT (Many-to-One)**
- Description: Each course belongs to one department
- Foreign Key: department_name in COURSE

**COURSE - LABSHEET (One-to-Many)**
- Description: Each course has multiple lab sheets
- Foreign Key: course_code in LABSHEET

**COURSE - PAST_PAPERS (One-to-Many)**
- Description: Each course has multiple past papers
- Foreign Key: course_code in PAST_PAPERS

#### 3.3 STAFF Relationships

**STAFF - DEPARTMENT (Many-to-Many)**
- Relationship: STAFF_DEPARTMENT
- Attributes: Staff_no, Department_name
- Description: Staff can work in multiple departments

**STAFF - STAFF_ACCOUNT (One-to-One)**
- Description: Each staff member has one account
- Foreign Key: Staff_user_name in STAFF_ACCOUNT

**STAFF - STAFF_TELEPHONE (One-to-Many)**
- Description: Staff can have multiple phone numbers
- Foreign Key: Staff_no in STAFF_TELEPHONE

### 4. Cardinality Specifications

#### 4.1 Relationship Cardinalities

| Relationship | Entity 1 | Cardinality | Entity 2 | Description |
|--------------|----------|-------------|----------|-------------|
| Enrollment | STUDENT | M | COURSE | Students enroll in multiple courses |
| Department Assignment | STUDENT | M | DEPARTMENT | Students belong to departments |
| Course Offering | COURSE | M | DEPARTMENT | Courses offered by departments |
| Staff Assignment | STAFF | M | DEPARTMENT | Staff work in departments |
| Attendance Recording | STUDENT | 1 | ATTENDANCE | Student has many attendance records |
| Course Attendance | COURSE | 1 | ATTENDANCE | Course has many attendance records |
| Result Recording | STUDENT | 1 | RESULT | Student has many results |
| Course Results | COURSE | 1 | RESULT | Course has many student results |

### 5. Constraints and Business Rules

#### 5.1 Entity Constraints
- Student registration numbers must follow format: TG#### (4 digits)
- Course codes follow format: AAA#### (3 letters + 4 digits)
- Staff numbers follow format: AAA## (3 letters + 2 digits)

#### 5.2 Relationship Constraints
- A student must be enrolled in at least one course
- A course must belong to exactly one department
- Attendance records must have valid student and course references
- Results can only exist for enrolled student-course combinations

#### 5.3 Business Rules
- Students must maintain 80% attendance for exam eligibility
- Maximum 3 repeat attempts per course
- CA marks ≥ 50% required for final exam eligibility
- Grade calculation based on weighted assessments

### 6. Derived Attributes and Calculations

#### 6.1 Calculated Fields
- **Attendance Percentage**: Calculated from attendance records
- **CA Eligibility**: Based on assessment scores and attendance
- **Final Grade**: Calculated from various assessment components
- **GPA**: Calculated from course grades and credits

#### 6.2 Views and Computed Data
- `attendence_detalis`: Attendance summary with percentages
- `ca_eligibility`: CA eligibility status per student-course
- `result_details`: Complete result information with grades
- `level`: Student level based on entrance year

### 7. Normalization Analysis

#### 7.1 First Normal Form (1NF)
- All tables have atomic values
- No repeating groups
- Each row is unique

#### 7.2 Second Normal Form (2NF)
- All non-key attributes fully dependent on primary key
- Partial dependencies eliminated through decomposition

#### 7.3 Third Normal Form (3NF)
- No transitive dependencies
- All non-key attributes directly dependent on primary key

### 8. ER Diagram Symbols Legend

```
[Entity] - Rectangle
(Attribute) - Oval
{Primary Key} - Underlined attribute
<<Relationship>> - Diamond
||--|| - One-to-One relationship
||--o{ - One-to-Many relationship
}o--o{ - Many-to-Many relationship
```

### 9. Physical Implementation Notes

#### 9.1 Indexing Strategy
- Primary keys automatically indexed
- Foreign keys indexed for join performance
- Composite indexes on frequently queried combinations

#### 9.2 Storage Considerations
- CHAR for fixed-length codes
- VARCHAR for variable-length text
- Appropriate data types for numeric values
- Date/time types for temporal data

---

**Document Version**: 1.0  
**Last Updated**: [Current Date]  
**Created By**: Database Design Team