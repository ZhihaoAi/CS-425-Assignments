CREATE TABLE Parent
(
  fullName VARCHAR(100) NOT NULL,
  phoneNumber VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  securityLevel INT NOT NULL,
  PRIMARY KEY (fullName)
);

CREATE TABLE Department
(
  departmentName VARCHAR(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  PRIMARY KEY (departmentName)
);

CREATE TABLE Admin
(
  employeeID VARCHAR(7) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  securityLevel INT NOT NULL,
  email VARCHAR(50) NOT NULL,
  userID CHAR(7) NOT NULL,
  PRIMARY KEY (employeeID),
  UNIQUE (userID)
);

CREATE TABLE Teacher
(
  userID VARCHAR(7) NOT NULL,
  employeeID VARCHAR(7) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  securityLevel INT NOT NULL,
  departmentName VARCHAR(50) NOT NULL,
  PRIMARY KEY (userID),
  FOREIGN KEY (departmentName) REFERENCES Department(departmentName),
  UNIQUE (employeeID)
);

CREATE TABLE Student
(
  fName VARCHAR(50) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  studentID CHAR(8) NOT NULL,
  gradeLevel INT NOT NULL,
  numberClasses INT NOT NULL,
  securityLevel INT NOT NULL,
  amountOwed NUMERIC(7,2),
  email VARCHAR(50) NOT NULL,
  userID VARCHAR(7) NOT NULL,
  PRIMARY KEY (studentID),
  FOREIGN KEY (userID) REFERENCES Teacher(userID)
);

CREATE TABLE Book
(
  bookID CHAR(10) NOT NULL,
  ISBN VARCHAR(13) NOT NULL,
  lName VARCHAR(50) NOT NULL,
  fName VARCHAR(50) NOT NULL,
  genre VARCHAR(50) NOT NULL,
  title VARCHAR(255) NOT NULL,
  price NUMERIC(7,2) NOT NULL,
  studentID CHAR(8),
  PRIMARY KEY (bookID),
  FOREIGN KEY (studentID) REFERENCES Student(studentID)
);

CREATE TABLE Class
(
  classID CHAR(5) NOT NULL,
  className VARCHAR(20) NOT NULL,
  subject VARCHAR(20) NOT NULL,
  userID VARCHAR(7) NOT NULL,
  PRIMARY KEY (classID),
  FOREIGN KEY (userID) REFERENCES Teacher(userID)
);

CREATE TABLE has
(
  studentID CHAR(8) NOT NULL,
  fullName VARCHAR(100) NOT NULL,
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