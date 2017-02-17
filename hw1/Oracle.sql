CREATE TABLE Parent
(
  fullName VARCHAR2(100) NOT NULL PRIMARY KEY,
  phoneNumber VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  securityLevel NUMBER(1) NOT NULL
);

CREATE TABLE Department
(
  departmentName VARCHAR2(50) NOT NULL PRIMARY KEY,
  fName VARCHAR2(50) NOT NULL,
  lName VARCHAR2(50) NOT NULL
);

CREATE TABLE Admin
(
  employeeID VARCHAR2(7) NOT NULL PRIMARY KEY,
  fName VARCHAR2(50) NOT NULL,
  lName VARCHAR2(50) NOT NULL,
  securityLevel NUMBER(1) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  userID CHAR(7) NOT NULL UNIQUE
);

CREATE TABLE Teacher
(
  userID VARCHAR2(7) NOT NULL PRIMARY KEY,
  employeeID VARCHAR2(7) NOT NULL UNIQUE,
  fName VARCHAR2(50) NOT NULL,
  lName VARCHAR2(50) NOT NULL,
  securityLevel NUMBER(1) NOT NULL,
  departmentName VARCHAR2(50) NOT NULL FOREIGN KEY REFERENCES Department(departmentName)
);

CREATE TABLE Student
(
  fName VARCHAR2(50) NOT NULL,
  lName VARCHAR2(50) NOT NULL,
  studentID CHAR(8) NOT NULL PRIMARY KEY,
  gradeLevel NUMBER(1) NOT NULL,
  numberClasses NUMBER(1) NOT NULL,
  securityLevel NUMBER(1) NOT NULL,
  amountOwed NUMBER(7,2),
  email VARCHAR2(50) NOT NULL,
  userID VARCHAR2(7) NOT NULL FOREIGN KEY REFERENCES Teacher(userID)
);

CREATE TABLE Book
(
  bookID CHAR(10) NOT NULL PRIMARY KEY,
  ISBN VARCHAR2(13) NOT NULL,
  lName VARCHAR2(50) NOT NULL,
  fName VARCHAR2(50) NOT NULL,
  genre VARCHAR2(50) NOT NULL,
  title VARCHAR2(255) NOT NULL,
  price NUMBER(7,2) NOT NULL,
  studentID CHAR(8) FOREIGN KEY REFERENCES Student(studentID)
);

CREATE TABLE Class
(
  classID CHAR(5) NOT NULL PRIMARY KEY,
  className VARCHAR2(20) NOT NULL,
  subject VARCHAR2(20) NOT NULL,
  userID VARCHAR2(7) NOT NULL FOREIGN KEY REFERENCES Teacher(userID)
);

CREATE TABLE has
(
  studentID CHAR(8) NOT NULL,
  fullName VARCHAR2(100) NOT NULL,
  PRIMARY KEY (studentID, fullName),
  FOREIGN KEY (studentID) REFERENCES Student(studentID),
  FOREIGN KEY (fullName) REFERENCES Parent(fullName)
);

CREATE TABLE requires
(
  classID CHAR(5) NOT NULL,
  bookID CHAR(10) NOT NULL,
  PRIMARY KEY (classID, bookID),
  FOREIGN KEY (classID) REFERENCES Class(classID),
  FOREIGN KEY (bookID) REFERENCES Book(bookID)
);

CREATE TABLE takes
(
  studentID CHAR(8) NOT NULL,
  classID CHAR(5) NOT NULL,
  PRIMARY KEY (studentID, classID),
  FOREIGN KEY (studentID) REFERENCES Student(studentID),
  FOREIGN KEY (classID) REFERENCES Class(classID)
);