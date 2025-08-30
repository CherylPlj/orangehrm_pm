# OrangeHRM University Configuration Guide

This guide provides step-by-step instructions for configuring OrangeHRM for university use, including employee management, leave policies, performance tracking, and UI customization.

## 📋 Table of Contents

1. [Initial System Setup](#initial-system-setup)
2. [Employee Management Configuration](#employee-management-configuration)
3. [Leave Management Setup](#leave-management-setup)
4. [Time Tracking Configuration](#time-tracking-configuration)
5. [Performance Module Setup](#performance-module-setup)
6. [Recruitment Module Configuration](#recruitment-module-configuration)
7. [UI/UX & Branding Customization](#uiux--branding-customization)
8. [Admin Access Control](#admin-access-control)
9. [Database Configuration](#database-configuration)
10. [Testing & Validation](#testing--validation)

---

## 🚀 Initial System Setup

### 1.1 System Requirements Verification

```bash
# Check PHP version (requires 7.4+)
php -v

# Check MySQL/MariaDB version (requires 5.7+)
mysql --version

# Verify Node.js version (requires 16+)
node --version

# Check Yarn version
yarn --version
```

### 1.2 Database Setup

```sql
-- Create database for university HRM
CREATE DATABASE orangehrm_university CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Create dedicated user
CREATE USER 'orangehrm_user'@'localhost' IDENTIFIED BY 'secure_password_here';
GRANT ALL PRIVILEGES ON orangehrm_university.* TO 'orangehrm_user'@'localhost';
FLUSH PRIVILEGES;
```

### 1.3 Environment Configuration

Create `.env` file in the root directory:

```env
# Database Configuration
DB_HOST=localhost
DB_NAME=orangehrm_university
DB_USER=orangehrm_user
DB_PASS=secure_password_here

# Application Settings
APP_ENV=production
APP_DEBUG=false
APP_URL=https://your-university-domain.com

# University-specific Settings
UNIVERSITY_NAME="Your University Name"
UNIVERSITY_ABBR="YU"
SCHOOL_YEAR_START=2024
SCHOOL_YEAR_END=2025

# Email Configuration
MAIL_HOST=smtp.university.edu
MAIL_PORT=587
MAIL_USERNAME=hr@university.edu
MAIL_PASSWORD=email_password
MAIL_ENCRYPTION=tls
```

---

## 👥 Employee Management Configuration

### 2.1 University Job Structure Setup

#### 2.1.1 Create Job Titles

Navigate to **Admin > Job > Job Titles** and add:

```yaml
Academic Positions:
  - Professor
  - Associate Professor
  - Assistant Professor
  - Instructor
  - Lecturer
  - Teaching Assistant

Administrative Positions:
  - Dean
  - Department Head
  - Program Coordinator
  - Academic Advisor
  - Registrar Staff

Support Positions:
  - Maintenance Staff
  - IT Support
  - Library Staff
  - Security Personnel
  - Administrative Assistant
```

#### 2.1.2 Configure Pay Grades

Set up pay grades for university positions:

```yaml
Pay Grade A: 45,000 - 65,000 
Pay Grade B: 65,000 - 85,000 
Pay Grade C: 85,000 - 110,000 
Pay Grade D: 110,000 - 140,000 
Pay Grade E: 140,000
```

#### 2.1.3 Department Structure

Create university departments:

```yaml
Academic Departments:
  - College of Arts & Sciences
  - College of Business
  - College of Education

Administrative Departments:
  - Human Resources
  - Information Technology
  - Finance & Administration
```

### 2.2 Employee Information Fields

#### 2.2.1 Custom Employee Fields

Add university-specific fields:

```yaml
Academic Information:
  - Faculty Rank
  - Tenure Status
  - Department Chair
  - Research Areas
  - Publications Count

Certification Fields:
  - Teaching License Number
  - License Expiry Date
  - Professional Certifications
  - Continuing Education Hours

University-Specific:
  - Campus Location
  - Office Building/Room
  - Academic Year Start Date
```

#### 2.2.2 Employee Status Configuration

```yaml
Active Statuses:
  - Full-time Faculty
  - Part-time Faculty
  - Full-time Staff
  - Part-time Staff
  - Temporary Staff

Inactive Statuses:
  - On Leave
  - Retired
  - Terminated
  - Sabbatical
```

---

## 📅 Leave Management Setup

### 3.1 University Leave Policies

#### 3.1.1 Holidays Calendar Integration

#### 3.1.2 Leave Types Configuration

Navigate to **Admin > Leave > Leave Types** and configure:

```yaml
Academic Leave Types:
  - Annual Leave (Faculty: 22 days, Staff: 25 days)
  - Sick Leave (10 with documentation)
  - Personal Leave (5 days per year)
  - Sabbatical Leave (Faculty only, 1 semester/1 year)
  - Research Leave (Faculty only, up to 6 months)
  - Conference Leave (Faculty only, up to 10 days)
  - Maternity/Paternity Leave (12 weeks)
  - Bereavement Leave (5 days)
  - Jury Duty Leave (As required)
  - Military Leave (As required)
```

#### 3.1.3 Leave Rules Setup

```yaml
Faculty Leave Rules:
  - Annual leave cannot be taken during active teaching periods
  - Sabbatical requires 6 years of service
  - Research leave requires department approval
  - Conference leave requires presentation proof

Staff Leave Rules:
  - Annual leave requires 2 weeks notice
  - Sick leave requires doctor's note after 3 days
  - Personal leave cannot be taken during peak periods
```

### 3.2 Leave Workflow Configuration

#### 3.2.1 Approval Hierarchy

```yaml
Leave Approval Flow:
  Level 1: Immediate Supervisor
  Level 2: Department Head
  Level 3: Dean (for faculty)
  Level 4: HR Director (for extended leaves)
```

---

## ⏰ Time Tracking Configuration

### 4.1 Hide Time Tracking Module

Since time tracking is not required for university use:

#### 4.1.1 Module Visibility Control

```php
// In src/config/modules.php
'time' => [
    'enabled' => false,
    'visible' => false,
    'permissions' => [
        'view' => false,
        'edit' => false,
        'delete' => false
    ]
]
```

#### 4.1.2 Menu Configuration

```php
// Remove time tracking from navigation menu
// In src/config/menu.php
'unset' => ['time', 'attendance', 'timesheet']
```

#### 4.1.3 Permission Updates

```sql
-- Disable time tracking permissions for all roles
UPDATE ohrm_user_role SET can_view_time = 0, can_edit_time = 0;
```

---

## 📊 Performance Module Setup

### 5.1 Certification Tracking

#### 5.1.1 Certification Categories

```yaml
Teaching Certifications:
  - State Teaching License
  - Subject Area Certifications
  - Online Teaching Certification
  - Special Education Certification

Professional Certifications:
  - Industry Certifications
  - Software Certifications
  - Safety Certifications
  - Management Certifications

Academic Certifications:
  - PhD/Doctorate
  - Master's Degree
  - Bachelor's Degree
  - Professional Development Certificates
```

#### 5.1.2 Certification Fields

```yaml
Required Fields:
  - Certification Name
  - Issuing Organization
  - Issue Date
  - Expiry Date
  - Certification Number
  - Status (Active/Expired/Pending)
  - Renewal Requirements
  - Cost of Renewal
```

### 5.2 Training Log Configuration

#### 5.2.1 Training Categories

```yaml
Mandatory Training:
  - Title IX Training
  - FERPA Training
  - Safety Training
  - Diversity Training
  - IT Security Training

Professional Development:
  - Teaching Methods
  - Technology Training
  - Leadership Development
  - Research Methods
  - Grant Writing
```

---

## 🎯 Recruitment Module Configuration

### 6.1 Job Posting Structure

#### 6.1.1 University Job Categories

```yaml
Academic Positions:
  - Faculty Positions
  - Research Positions
  - Teaching Assistant Positions

Administrative Positions:
  - Department Head
  - Program Coordinator
  - Academic Advisor
  - Registrar Staff

Support Positions:
  - IT Support
  - Maintenance
  - Library Staff
  - Administrative Support
```

#### 6.1.2 Job Posting Templates

```yaml
Faculty Template:
  - Position Title
  - Department
  - Rank/Level
  - Qualifications Required
  - Teaching Responsibilities
  - Research Expectations
  - Service Requirements

```

### 6.2 Applicant Management

#### 6.2.1 Application Status Workflow

```yaml
Application Statuses:
  - Applied
  - Under Review
  - Shortlisted
  - Interview Scheduled
  - Interview Completed
  - Reference Check
  - Offer Made
  - Offer Accepted
  - Offer Declined
  - Position Filled
  - Application Rejected
```

#### 6.2.2 Applicant Information Fields

```yaml
Required Information:
  - Personal Details
  - Contact Information
  - Educational Background
  - Work Experience
  - Teaching Experience (for faculty)
  - Research Publications
  - References
  - Cover Letter
  - Resume/CV
  - Transcripts
  - Certifications
```

### 6.3 Interview Process

#### 6.3.1 Interview Types

```yaml
Interview Stages:
  - Phone Screening
  - Campus Visit
  - Teaching Demonstration
  - Research Presentation
  - Committee Interview
  - Dean Interview
  - Final Interview
```

#### 6.3.2 Evaluation Criteria

```yaml
Faculty Evaluation:
  - Teaching Ability (30%)
  - Research Potential (30%)
  - Service Commitment (20%)
  - Cultural Fit (20%)

Staff Evaluation:
  - Technical Skills (40%)
  - Experience (30%)
  - Communication (20%)
  - Team Fit (10%)
```

---

## 🎨 UI/UX & Branding Customization

### 7.1 Blue Eagles Theme Implementation

#### 7.1.1 Color Scheme Configuration

```scss
// In src/client/src/core/styles/variables.scss
:root {
  // Primary Blue Eagles Colors
  --primary-color: #1e3a8a;        // Dark Blue
  --secondary-color: #3b82f6;      // Medium Blue
  --accent-color: #60a5fa;         // Light Blue
  --success-color: #10b981;        // Green
  --warning-color: #f59e0b;        // Orange
  --error-color: #ef4444;          // Red
  
  // Neutral Colors
  --text-primary: #1f2937;
  --text-secondary: #6b7280;
  --background-primary: #ffffff;
  --background-secondary: #f9fafb;
  --border-color: #e5e7eb;
}
```

#### 7.1.2 Logo and Branding

```yaml
Branding Elements:
  - University Logo (PNG/SVG format)
  - Favicon (32x32, 16x16)
  - Email Signature Template
  - Letterhead Template
  - Business Card Design
```

### 7.2 School Terminology Updates

#### 7.2.1 Language Customization

```yaml
Terminology Mapping:
  - "Employee" → "Faculty/Staff Member"
  - "Department" → "Academic Department"
  - "Manager" → "Department Head"
  - "Company" → "University"
  - "Position" → "Academic Position"
  - "Hire Date" → "Appointment Date"
  - "Termination" → "Separation"
  - "Pay Grade" → "Salary Grade"
```

#### 7.2.2 Form Labels and Messages

```yaml
Form Customizations:
  - "Employee Information" → "Faculty/Staff Information"
  - "Job Details" → "Academic Position Details"
  - "Work Experience" → "Professional Experience"
  - "Emergency Contact" → "Emergency Contact"
  - "Dependents" → "Dependents"
```

### 7.3 Streamlined Forms

#### 7.3.1 Simplified Employee Form

```yaml
Essential Fields Only:
  - Personal Information
  - Contact Details
  - Academic Position
  - Department
  - Appointment Date
  - Salary Information
  - Emergency Contact
```

#### 7.3.2 Conditional Field Display

```javascript
// Show/hide fields based on employee type
if (employeeType === 'faculty') {
  showFields(['academicRank', 'tenureStatus', 'researchAreas']);
} else if (employeeType === 'staff') {
  showFields(['jobTitle', 'supervisor', 'workSchedule']);
}
```

---

## 🔐 Admin Access Control

### 8.1 Role-Based Access Control

#### 8.1.1 User Roles Definition

```yaml
System Roles:
  - Super Admin (Full system access)
  - HR Admin (HR functions only)
  - Department Head (Department-level access)
  - Faculty (Limited self-service)

```

#### 8.1.2 Permission Matrix

```yaml
Super Admin Permissions:
  - All system functions
  - User management
  - System configuration
  - Data backup/restore
  - Security settings

HR Admin Permissions:
  - Employee management
  - Leave management
  - Performance tracking
  - Recruitment
  - Reports generation

Department Head Permissions:
  - View department employees
  - Approve leave requests
  - Performance reviews
  - Department reports

Faculty/Staff Permissions:
  - View own information
  - Submit leave requests
  - Update personal details
  - View own performance
```

### 8.2 Feature Visibility Control

#### 8.2.1 Module Access Control

```php
// In src/config/modules.php
'modules' => [
    'admin' => [
        'visible' => ['super_admin', 'hr_admin'],
        'permissions' => ['view', 'edit', 'delete']
    ],
    'pim' => [
        'visible' => ['super_admin', 'hr_admin', 'department_head'],
        'permissions' => ['view', 'edit']
    ],
    'leave' => [
        'visible' => ['super_admin', 'hr_admin', 'department_head', 'faculty', 'staff'],
        'permissions' => ['view', 'submit', 'approve']
    ],
    'performance' => [
        'visible' => ['super_admin', 'hr_admin', 'department_head'],
        'permissions' => ['view', 'edit', 'evaluate']
    ],
    'recruitment' => [
        'visible' => ['super_admin', 'hr_admin'],
        'permissions' => ['view', 'edit', 'hire']
    ]
]
```

#### 8.2.2 Menu Visibility

```php
// Hide admin menu for non-admin users
if (!in_array($userRole, ['super_admin', 'hr_admin'])) {
    unset($menuItems['admin']);
}
```

### 8.3 Security Configuration

#### 8.3.1 Password Policies

```yaml
Password Requirements:
  - Minimum 8 characters
  - At least 1 uppercase letter
  - At least 1 lowercase letter
  - At least 1 number
  - At least 1 special character
  - Cannot reuse last 5 passwords
  - Expires every 90 days
```

#### 8.3.2 Session Management

```yaml
Session Settings:
  - Session timeout: 30 minutes
  - Maximum login attempts: 5
  - Lockout duration: 15 minutes
  - Force logout on password change
  - IP-based session validation
```

---

## 🗄️ Database Configuration

### 9.1 Database Schema Updates

#### 9.1.1 Custom Tables

```sql
-- Certification tracking table
CREATE TABLE ohrm_certifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    certification_name VARCHAR(255) NOT NULL,
    issuing_organization VARCHAR(255),
    issue_date DATE,
    expiry_date DATE,
    certification_number VARCHAR(100),
    status ENUM('active', 'expired', 'pending') DEFAULT 'active',
    renewal_requirements TEXT,
    renewal_cost DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES hs_hr_employee(emp_number)
);

-- Training log table
CREATE TABLE ohrm_training_log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    training_name VARCHAR(255) NOT NULL,
    provider VARCHAR(255),
    completion_date DATE,
    duration_hours DECIMAL(5,2),
    certificate_received BOOLEAN DEFAULT FALSE,
    next_required_date DATE,
    cost DECIMAL(10,2),
    funding_source VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES hs_hr_employee(emp_number)
);

-- License renewal table
CREATE TABLE ohrm_license_renewals (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT NOT NULL,
    license_type VARCHAR(100) NOT NULL,
    license_number VARCHAR(100),
    issue_date DATE,
    expiry_date DATE,
    renewal_status ENUM('active', 'pending', 'expired') DEFAULT 'active',
    renewal_cost DECIMAL(10,2),
    last_reminder_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES hs_hr_employee(emp_number)
);
```

#### 9.1.2 Data Migration Scripts

```php
// Migration script for existing data
class UniversityDataMigration {
    public function migrateEmployeeData() {
        // Update job titles to university format
        $this->updateJobTitles();
        
        // Update department names
        $this->updateDepartments();
        
        // Add university-specific fields
        $this->addCustomFields();
    }
    
    private function updateJobTitles() {
        $jobTitles = [
            'Manager' => 'Department Head',
            'Supervisor' => 'Program Coordinator',
            'Employee' => 'Faculty/Staff Member'
        ];
        
        foreach ($jobTitles as $old => $new) {
            DB::table('ohrm_job_title')
                ->where('job_title_name', $old)
                ->update(['job_title_name' => $new]);
        }
    }
}
```

### 9.2 Backup and Recovery

#### 9.2.1 Automated Backup

```bash
#!/bin/bash
# backup_script.sh

DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_DIR="/backup/orangehrm"
DB_NAME="orangehrm_university"

# Create backup directory
mkdir -p $BACKUP_DIR

# Database backup
mysqldump -u orangehrm_user -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR/db_backup_$DATE.sql

# File backup
tar -czf $BACKUP_DIR/files_backup_$DATE.tar.gz /var/www/orangehrm

# Keep only last 30 days of backups
find $BACKUP_DIR -name "*.sql" -mtime +30 -delete
find $BACKUP_DIR -name "*.tar.gz" -mtime +30 -delete
```

---

## ✅ Testing & Validation

### 10.1 Configuration Testing

#### 10.1.1 System Functionality Tests

```yaml
Test Scenarios:
  - Employee creation with university fields
  - Leave application and approval workflow
  - Performance review process
  - Recruitment workflow
  - Certification tracking
  - Training log entries
  - License renewal notifications
  - Role-based access control
  - UI theme display
  - Form validation
```

#### 10.1.2 User Acceptance Testing

```yaml
UAT Checklist:
  - [ ] Admin can create university job titles
  - [ ] Faculty can submit leave requests
  - [ ] Department heads can approve leaves
  - [ ] HR can track certifications
  - [ ] Recruitment workflow functions properly
  - [ ] UI displays Blue Eagles theme
  - [ ] Forms use university terminology
  - [ ] Access controls work correctly
  - [ ] Reports generate correctly
  - [ ] Email notifications work
```

### 10.2 Performance Validation

#### 10.2.1 Load Testing

```yaml
Performance Benchmarks:
  - Page load time: < 3 seconds
  - Database queries: < 1 second
  - Concurrent users: 100+
  - Report generation: < 30 seconds
  - Email delivery: < 5 minutes
```

#### 10.2.2 Security Testing

```yaml
Security Checklist:
  - [ ] Password policies enforced
  - [ ] Session timeout working
  - [ ] Role-based access functional
  - [ ] SQL injection prevention
  - [ ] XSS protection active
  - [ ] CSRF tokens implemented
  - [ ] Data encryption in transit
  - [ ] Audit logs maintained
```

---

## 📞 Support and Maintenance

### 11.1 Documentation

- Maintain configuration documentation
- Update user guides with university-specific procedures
- Create troubleshooting guides
- Document customizations and modifications

### 11.2 Regular Maintenance

- Monthly security updates
- Quarterly performance reviews
- Annual configuration audits
- Continuous user feedback collection

### 11.3 Training and Support

- Admin user training sessions
- Faculty/staff orientation
- Ongoing technical support
- Regular system demonstrations

---

## 🔄 Version Control

### 12.1 Configuration Management

```yaml
Version Control Strategy:
  - Track all configuration changes
  - Maintain configuration backups
  - Document all customizations
  - Use environment-specific configs
  - Implement rollback procedures
```

### 12.2 Change Management

```yaml
Change Process:
  1. Document proposed changes
  2. Test in development environment
  3. Get stakeholder approval
  4. Schedule maintenance window
  5. Implement changes
  6. Validate functionality
  7. Update documentation
```

---

*This configuration guide should be updated regularly as the system evolves and new requirements are identified.*
