# 🏫 University ERD: Story-Based Breakdown

This document builds the Entity-Relationship Diagram (ERD) of a fictional university in **incremental stories**, similar to the Bearcat Incorporated example. Each story introduces new entities, relationships, attributes, and business rules.

By the final story, the ERD contains the following **six core entities**:

- College
- Class
- Professor
- Student
- Building
- Dean

---

## 📘 Story 1: Colleges and Classes

**Story:**  
The university is organized into several **Colleges**, each offering various academic **Classes**. Colleges have mission statements and represent major academic divisions (e.g., *Cullen College of Engineering*, *C.T. Bauer College of Business*). Classes represent specific course offerings (e.g., *Calculus I*, *Database Management*).

Each college **may offer multiple classes**, while every class **must belong to exactly one college**. A new college may offer zero classes initially. If a college is closed, its classes must be reassigned or deleted.

**Entities & Attributes Introduced:**

- **College**
  - `CollegeID` (PK)
  - `Name`
  - `MissionStatement`
  - `Location`

- **Class**
  - `ClassID` (PK)
  - `Title`
  - `Credits`
  - `CollegeID` (FK)

**Relationship:**
- **College offers Class** (1:N)
  - College side: optional participation
  - Class side: mandatory participation

---

## 👩‍🏫 Story 2: Professors in Colleges and Teaching Classes

**Story:**  
The university employs **Professors**, each affiliated with one **College**. Professors may teach multiple classes or none at all. A professor can only teach classes from their college. If a professor leaves, their classes must be reassigned.

**Entities & Attributes Introduced:**

- **Professor**
  - `ProfessorID` (PK)
  - `FName`, `MInit`, `LName`
  - `Title`
  - `CollegeID` (FK)

**Relationships:**
- **College employs Professor** (1:N)
  - Professor must belong to a College
  - College may have zero or many Professors

- **Professor teaches Class** (1:N)
  - Each Class must have a Professor
  - A Professor may teach zero or many Classes

---

## 🎓 Story 3: Students Enrolling in Classes

**Story:**  
**Students** can enroll in multiple **Classes**, and each class can have many students. A student cannot enroll in the same class more than once at the same time. Each enrollment may carry attributes like grade or term. If a student or class is removed, their enrollments must be deleted.

**Entities & Attributes Introduced:**

- **Student**
  - `StudentID` (PK)
  - `FName`, `MInit`, `LName`
  - `Major`
  - `Classification`

**Relationship:**
- **Student enrolls in Class** (M:N)
  - Optional participation on both sides
  - Implemented via associative entity `Enrolls_In`
    - Composite PK: (`StudentID`, `ClassID`)
    - Future attributes: `Grade`, `Term`, `EnrollmentDate`

---

## 🏢 Story 4: Class Locations and Buildings

**Story:**  
Each **Class** is held in a **Building**. A building can host multiple classes or none (e.g., under renovation). A class must have a valid building assigned; if the building is removed, classes must be reassigned.

**Entities & Attributes Introduced:**

- **Building**
  - `BuildingID` (PK)
  - `Name`
  - `Address`

**Relationship:**
- **Building houses Class** (1:N)
  - Each Class must be held in one Building
  - A Building may host many or zero Classes

---

## 🧑‍💼 Story 5: College Deans

**Story:**  
Each **College** is headed by a **Dean**, who serves as the administrator. A dean is tied to exactly one college. If a dean resigns, a replacement must be assigned. The dean is typically a professor from the same college, though not explicitly modeled here.

**Entities & Attributes Introduced:**

- **Dean**
  - `DeanID` (PK)
  - `FName`, `MInit`, `LName`
  - `Gender`
  - `CollegeID` (FK, UNIQUE)

**Relationship:**
- **Dean heads College** (1:1)
  - Mandatory participation on both sides

---

## 🧠 Additional Semantic Constraints & Business Rules

- A **Class** must be associated with a valid **Professor**, **College**, and **Building**
- A **Student** may not enroll in the same class more than once at the same time
- **Professors** may only teach classes from their own college
- Every **College** must have exactly one **Dean**
- If a **Class** is canceled or a **Student** drops out, related **Enrollments** must be removed
- If a **Building** is removed, all scheduled classes must be reassigned or canceled
- A **Dean** must also be a **Professor** in the same College (semantic rule)
- A **Person** cannot serve as Dean of more than one College

---
