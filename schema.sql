CREATE TABLE College (
    CollegeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Location VARCHAR(100),
    URL VARCHAR(255),
    MissionStatement TEXT
);

INSERT INTO College VALUES 
(1, 'College of Engineering', 'North Campus', 'https://eng.univ.edu', 'Innovate and impact the world through engineering.'),
(2, 'College of Arts', 'West Campus', 'https://arts.univ.edu', 'Creativity, expression, and critical thinking.'),
(3, 'College of Business', 'East Campus', 'https://biz.univ.edu', 'Empowering future business leaders.');


CREATE TABLE Dean (
    DeanID INT PRIMARY KEY,
    FName VARCHAR(50),
    MInit CHAR(1),
    LName VARCHAR(50),
    Gender CHAR(1),
    CollegeID INT UNIQUE, -- one-to-one relationship
    FOREIGN KEY (CollegeID) REFERENCES College(CollegeID)
);

INSERT INTO Dean VALUES 
(1, 'Emily', 'J', 'Johnson', 'F', 1),
(2, 'Robert', 'K', 'Miller', 'M', 2),
(3, 'Sara', 'L', 'Lee', 'F', 3);


CREATE TABLE Professor (
    ProfessorID INT PRIMARY KEY,
    FName VARCHAR(50),
    MInit CHAR(1),
    LName VARCHAR(50),
    Gender CHAR(1),
    Title VARCHAR(50),
    CollegeID INT,
    FOREIGN KEY (CollegeID) REFERENCES College(CollegeID)
);

INSERT INTO Professor VALUES 
(100, 'Alice', 'B', 'Nguyen', 'F', 'Associate Professor', 1),
(101, 'James', 'M', 'Wright', 'M', 'Assistant Professor', 2),
(102, 'Nina', 'C', 'Patel', 'F', 'Professor', 3);


CREATE TABLE Building (
    BuildingID INT PRIMARY KEY,
    Name VARCHAR(100),
    Address VARCHAR(255)
);

INSERT INTO Building VALUES 
(1, 'Engineering Hall', '123 North Campus Dr'),
(2, 'Art Center', '456 West Campus Blvd'),
(3, 'Business Tower', '789 East Campus Ln'),
(4, 'General Lecture Hall', '321 Central Plaza');


CREATE TABLE Class (
    ClassID INT PRIMARY KEY,
    Title VARCHAR(100),
    Credits INT,
    ProfessorID INT,
    CollegeID INT,
    BuildingID INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professor(ProfessorID),
    FOREIGN KEY (CollegeID) REFERENCES College(CollegeID),
    FOREIGN KEY (BuildingID) REFERENCES Building(BuildingID)
);

INSERT INTO Class VALUES 
(10, 'Intro to Engineering', 3, 100, 1, 1),
(20, 'Painting I', 3, 101, 2, 2),
(30, 'Marketing Principles', 3, 102, 3, 3);


CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    FName VARCHAR(50),
    MInit CHAR(1),
    LName VARCHAR(50),
    Gender CHAR(1),
    Major VARCHAR(100),
    Classification VARCHAR(20)
);

INSERT INTO Student VALUES
(1, 'John', 'A', 'Smith', 'M', 'Mechanical Engineering', 'Freshman'),
(2, 'Maria', 'B', 'Gomez', 'F', 'Marketing', 'Junior'),
(3, 'Liam', 'C', 'O\'Connor', 'M', 'Painting', 'Senior'),
(4, 'Olivia', 'D', 'Chen', 'F', 'Accounting', 'Sophomore'),
(5, 'Noah', 'E', 'Brown', 'M', 'Finance', 'Junior'),
(6, 'Emma', 'F', 'Lee', 'F', 'Mechanical Engineering', 'Freshman'),
(7, 'Ava', 'G', 'Garcia', 'F', 'Painting', 'Junior'),
(8, 'William', 'H', 'Martinez', 'M', 'Marketing', 'Senior'),
(9, 'Sophia', 'I', 'Rodriguez', 'F', 'Business Analytics', 'Senior'),
(10, 'Mason', 'J', 'Davis', 'M', 'Civil Engineering', 'Freshman');

  
CREATE TABLE Enrolls_In (
    StudentID INT,
    ClassID INT,
    PRIMARY KEY (StudentID, ClassID),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);

INSERT INTO Enrolls_In VALUES
(1, 10), (6, 10), (10, 10),  -- Class1
(3, 20), (7, 20),            -- Class2
(2, 30), (5, 30), (8, 30);   -- Class3
