# PL-SQL--Tests
This repository includes relational database schemas, optimized SQL queries, and stored procedures to streamline project workflows and ensure data consistency. Warm Welcome!!!

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID) 
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    Name VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50)
);
CREATE TABLE Tasks (
    TaskID INT PRIMARY KEY,
    Title VARCHAR(100),
    DueDate DATE,
    Status VARCHAR(50)
);

CREATE TABLE Project_Employee (
    ProjectID INT,
    EmployeeID INT,
    RoleInProject VARCHAR(50),
    PRIMARY KEY (ProjectID, EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Project_Task (
    ProjectID INT,
    TaskID INT,
    PRIMARY KEY (ProjectID, TaskID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (TaskID) REFERENCES Tasks(TaskID)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES (1, 'Human Resources', 'New York');

INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES (2, 'Engineering', 'San Francisco');

INSERT INTO Departments (DepartmentID, DepartmentName, Location)
VALUES (3, 'Marketing', 'Los Angeles');

INSERT INTO Employees (EmployeeID, Name, Role, Email, PhoneNumber, DepartmentID) VALUES
INSERT INTO Employees (EmployeeID, Name, Role, Email, PhoneNumber, DepartmentID) VALUES
(1, 'Alice Niyonsaba', 'Project Manager', 'alice.niyonsaba@yahoo.com', '+250788123456', 1),
(2, 'Jean-Pierre Nkurunziza', 'Engineer', 'jean.nkurunziza@yaoo.com', '+250788234567', 2),
(3, 'Mireille Uwase', 'Architect', 'mireille.uwase@yahoo.com', '+250788325678',3);

INSERT INTO Projects (ProjectID, Name, StartDate, EndDate, Status) VALUES
  2  (1, 'Gahunda yIterambere', TO_DATE('01-OCT-20', 'DD-MON-YY'), TO_DATE('01-NOV-21', 'DD-MON-YY'), 'Started');
INSERT INTO Projects (ProjectID, Name, StartDate, EndDate, Status) VALUES 
(2, 'Ubumenyi bw Ikoranabuhanga', TO_DATE('15-NOV-20', 'DD-MON-YY'), TO_DATE('30-DEC-21', 'DD-MON-YY'), 'In Progress');
INSERT INTO Projects (ProjectID, Name, StartDate, EndDate, Status) VALUES 
(4, 'Ikoranabuhanga mu Burezi', TO_DATE('05-MAR-21', 'DD-MON-YY'), TO_DATE('15-APR-22', 'DD-MON-YY'), 'Pending');

INSERT INTO Project_Employee (ProjectID, EmployeeID, RoleInProject) VALUES
(1, 1, 'Project Manager');
INSERT INTO Project_Employee (ProjectID, EmployeeID, RoleInProject) VALUES
(1, 2, 'Engineer');
INSERT INTO Project_Employee (ProjectID, EmployeeID, RoleInProject) VALUES
(2, 3, 'Architect');

INSERT INTO Tasks (TaskID, Title, DueDate, Status) VALUES
(3, 'Guteza imbere amashuri',TO_DATE('01-OCT-20', 'DD-MON-YY'), 'Started');

INSERT INTO Tasks (TaskID, Title, DueDate, Status) VALUES
(4, 'Gushyira ikoranabuhanga mu Mujyi', TO_DATE('11-OCT-22', 'DD-MON-YY'), 'Pending');

UPDATE Project_Employee 
SET RoleInProject = 'new role'
WHERE ProjectID = 1 AND EmployeeID = 1;

DELETE FROM Project_Employee 
WHERE ProjectID = 1 AND EmployeeID = 1;


INSERT INTO Project_Employee (ProjectID, EmployeeID, RoleInProject) VALUES
(1, 1, 'lead of program');
INSERT INTO Project_Employee (ProjectID, EmployeeID, RoleInProject) VALUES
(2, 2, 'lead IT');

SELECT * FROM Tasks WHERE TaskID = 3;
INSERT INTO Tasks (TaskID, Title, DueDate, Status) VALUES 
(3, 'Kwagura Ubushobozi', TO_DATE('15-DEC-20', 'DD-MON-YY'), 'Pending');

INSERT INTO Project_Task (ProjectID, TaskID) VALUES (2, 3); 
INSERT INTO Project_Task (ProjectID, TaskID) VALUES (2,4);
SELECT * FROM Project_Employee WHERE ProjectID = 1 AND EmployeeID = 1;

ALTER TABLE Employees
ADD DepartmentID INT, 
ADD CONSTRAINT fk_department
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

SELECT Projects.Name AS ProjectName, Employees.Name AS EmployeeName, Project_Employee.RoleInProject
FROM Projects
JOIN Project_Employee ON Projects.ProjectID = Project_Employee.ProjectID
JOIN Employees ON Project_Employee.EmployeeID = Employees.EmployeeID;


SELECT Projects.Name AS ProjectName, Tasks.Title AS TaskTitle, Tasks.DueDate, Tasks.Status
FROM Projects
JOIN Project_Task ON Projects.ProjectID = Project_Task.ProjectID
JOIN Tasks ON Project_Task.TaskID = Tasks.TaskID;

SELECT Employees.Name AS EmployeeName, Employees.Role, Projects.Name AS ProjectName, Project_Employee.RoleInProject, Tasks.Title AS TaskTitle, Tasks.DueDate, Tasks.Status
FROM Employees
JOIN Project_Employee ON Employees.EmployeeID = Project_Employee.EmployeeID
JOIN Projects ON Project_Employee.ProjectID = Projects.ProjectID
JOIN Project_Task ON Projects.ProjectID = Project_Task.ProjectID
JOIN Tasks ON Project_Task.TaskID = Tasks.TaskID;

ALTER TABLE Employees
ADD Gender VARCHAR(10);
CREATE USER username IDENTIFIED BY password;
GRANT SELECT ON Employees TO user_name;
Commit;


![Screenshot (4)](https://github.com/user-attachments/assets/1e66adb4-964a-4892-8f30-b91882de1b2d)

