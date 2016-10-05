CREATE TABLE Professor (
   ProfessorID INT NOT NULL PRIMARY KEY,
   Name        VARCHAR(50) NOT NULL)
TYPE = InnoDB;

CREATE TABLE Course (
   CourseID INT NOT NULL PRIMARY KEY,
   Name     VARCHAR(50),
   Credits  INT)
TYPE = InnoDB;

CREATE TABLE Room (
   RoomID   INT NOT NULL PRIMARY KEY,
   Comments VARCHAR(50),
   Capacity INT)
TYPE = InnoDB;

CREATE TABLE Class (
   CourseID    INT NOT NULL,
   ProfessorID INT NOT NULL,
   RoomID      INT NOT NULL,
   ClassID     INT NOT NULL PRIMARY KEY,
   Time        VARCHAR(50),

   INDEX       course_index(CourseID),
   CONSTRAINT  FK_Course FOREIGN KEY (CourseID) 
               REFERENCES Course(CourseID),

   INDEX       prof_index(ProfessorID),
   CONSTRAINT  FK_Prof FOREIGN KEY (ProfessorID)
               REFERENCES Professor(ProfessorID),

   INDEX       room_index(RoomID),
   CONSTRAINT  FK_Room FOREIGN KEY (RoomID)
               REFERENCES Room(RoomID)
)TYPE = InnoDB;

CREATE TABLE Student (
   StudentID INT NOT NULL PRIMARY KEY,
   Name      VARCHAR(50) NOT NULL
)TYPE = InnoDB;

CREATE TABLE Exam (
   ExamID      INT NOT NULL PRIMARY KEY,
   CourseID    INT NOT NULL,
   ProfessorID INT NOT NULL,
   SustainedOn DATE,
   Comments    VARCHAR(255),

   INDEX       examcourse_index(CourseID),
   CONSTRAINT  FK_ExamCourse FOREIGN KEY (CourseID)
               REFERENCES Course(CourseID),

   INDEX       examprof_index(ProfessorID),
   CONSTRAINT  FK_ExamProf FOREIGN KEY (ProfessorID)
               REFERENCES Professor(ProfessorID)
)TYPE = InnoDB;

CREATE TABLE Enrollment (
   EnrollmentID INT NOT NULL PRIMARY KEY,
   StudentID    INT NOT NULL,
   ClassID      INT NOT NULL,
   EnrolledOn   DATE,
   Grade        INT,

   INDEX       enrollstudent_index(StudentID),
   CONSTRAINT  FK_EnrollStudent FOREIGN KEY (StudentID)
               REFERENCES Student(StudentID),

   INDEX       enrollclass_index(ClassID),
   CONSTRAINT  FK_EnrollClass FOREIGN KEY (ClassID)
               REFERENCES Class(ClassID)
)TYPE = InnoDB;

CREATE TABLE StudentExam (
   StudentID  INT NOT NULL,
   ExamID     INT NOT NULL,
   Mark       INT,
   IfPassed   SMALLINT,
   Comments   VARCHAR(255),

   CONSTRAINT PK_StudentExam PRIMARY KEY (StudentID, ExamID),

   INDEX      student_index (StudentID),
   CONSTRAINT FK_Student FOREIGN KEY (StudentID)
              REFERENCES Student(StudentID),

   INDEX      exam_index (ExamID),
   CONSTRAINT FK_Exam FOREIGN KEY (ExamID)
              REFERENCES Exam(ExamID)
)TYPE = InnoDB;

