# 🏛️ University ERD & SQL Project

This project models a fictional university database system using an Entity-Relationship Diagram (ERD) and normalized SQL tables. The goal is to represent real-world academic operations — including colleges, classes, professors, students, buildings, and deans — in a structured, queryable database format.

## 📚 Project Breakdown

The project is structured into two parts:

### Part 1: Story-Driven ERD Development
Modeled after the Bearcat Incorporated case, this project introduces six main entities through incremental "stories":

1. **Colleges and Classes** – Colleges offer many classes.
2. **Professors** – Professors are hired by colleges and teach classes.
3. **Students** – Students enroll in multiple classes.
4. **Buildings** – Classes are held in buildings.
5. **Deans** – Each college is headed by exactly one dean.

All relationships include defined cardinalities and participation constraints. Semantic rules (e.g., deletion rules, role constraints) are also documented to mirror real-world operations.

---

### Part 2: SQL Schema & Sample Data

A complete SQL schema is included using:
- `CREATE TABLE` statements for all entities
- Sample data inserts for:
  - 3 Colleges
  - 3 Deans
  - 3 Professors
  - 4 Buildings
  - 3 Classes
  - 10 Students
  - 8 Enrollment entries

---

## 🗃️ Database Entities

| Entity     | Key Attributes |
|------------|----------------|
| **College**  | `CollegeID`, `Name`, `Location`, `MissionStatement` |
| **Class**    | `ClassID`, `Title`, `Credits`, `ProfessorID`, `CollegeID`, `BuildingID` |
| **Professor**| `ProfessorID`, `FName`, `LName`, `Title`, `CollegeID` |
| **Student**  | `StudentID`, `FName`, `LName`, `Major`, `Classification` |
| **Building** | `BuildingID`, `Name`, `Address` |
| **Dean**     | `DeanID`, `FName`, `LName`, `CollegeID` |
| **Enrolls_In** | Composite key of `StudentID` and `ClassID` |

---

## 🔍 Example SQL Queries

Here are a few practical queries demonstrating the database's utility:

```sql
-- 1. Classes offered by the College of Engineering
SELECT Class.Title
FROM Class
JOIN College ON Class.CollegeID = College.CollegeID
WHERE College.Name = 'College of Engineering';

-- 2. Students enrolled in 'Intro to Engineering'
SELECT S.FName, S.LName
FROM Student S
JOIN Enrolls_In E ON S.StudentID = E.StudentID
JOIN Class C ON E.ClassID = C.ClassID
WHERE C.Title = 'Intro to Engineering';

-- 3. Number of students enrolled in each class
SELECT C.Title, COUNT(E.StudentID) AS NumEnrolled
FROM Class C
LEFT JOIN Enrolls_In E ON C.ClassID = E.ClassID
GROUP BY C.Title;
