CREATE TABLE Professor (
   ProfessorID INT NOT NULL PRIMARY KEY,
   Name        VARCHAR(50) NOT NULL);

CREATE TABLE Course (
   CourseID INT NOT NULL PRIMARY KEY,
   Name     VARCHAR(50),
   Credits  INT);

CREATE TABLE Room (
   RoomID   INT NOT NULL PRIMARY KEY,
   Comments VARCHAR(50),
   Capacity INT);

CREATE TABLE Class (
   ClassID     INT NOT NULL PRIMARY KEY,
   CourseID    INT NOT NULL,
   ProfessorID INT NOT NULL,
   RoomID      INT NOT NULL,
   Time        VARCHAR(50),
   CONSTRAINT  FK_Course FOREIGN KEY (CourseID)
               REFERENCES Course(CourseID),
   CONSTRAINT  FK_Prof FOREIGN KEY (ProfessorID)
               REFERENCES Professor(ProfessorID),
   CONSTRAINT  FK_Room FOREIGN KEY (RoomID)
               REFERENCES Room(RoomID));

CREATE TABLE Student (
   StudentID INT NOT NULL PRIMARY KEY,
   Name      VARCHAR(50) NOT NULL);

CREATE TABLE Exam (
   ExamID      INT NOT NULL PRIMARY KEY,
   CourseID    INT NOT NULL,
   ProfessorID INT NOT NULL,
   SustainedOn DATE,
   Comments    VARCHAR(255),
   CONSTRAINT  FK_ExamCourse FOREIGN KEY (CourseID)
               REFERENCES Course(CourseID),
   CONSTRAINT  FK_ExamProf FOREIGN KEY (ProfessorID)
               REFERENCES Professor(ProfessorID));

CREATE TABLE Enrollment (
   EnrollmentID INT NOT NULL PRIMARY KEY,
   StudentID    INT NOT NULL,
   ClassID      INT NOT NULL,
   EnrolledOn   DATE,
   Grade        INT,
   CONSTRAINT  FK_EnrollStudent FOREIGN KEY (StudentID)
               REFERENCES Student(StudentID),
   CONSTRAINT  FK_EnrollClass FOREIGN KEY (ClassID)
               REFERENCES Class(ClassID));

CREATE TABLE StudentExam (
   StudentID  INT NOT NULL,
   ExamID     INT NOT NULL,
   Mark       INT,
   IfPassed   SMALLINT,
   Comments   VARCHAR(255),
   CONSTRAINT PK_StudentExam PRIMARY KEY (StudentID, ExamID),
   CONSTRAINT FK_Student FOREIGN KEY (StudentID)
              REFERENCES Student(StudentID),
   CONSTRAINT FK_Exam FOREIGN KEY (ExamID)
              REFERENCES Exam(ExamID));

