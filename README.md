# PL-SQL--Tests
This repository includes relational database schemas, optimized SQL queries, and stored procedures to Project Management System. Warm Welcome!!!

 README FILE

 1. Problem Statement

This is a project management database system that helps manage employees, projects, and tasks in an organisation. The database allows me to track departments, assign employees to different projects with specific roles, and monitor tasks related to those projects. The system ensures that I can easily view which employees are working on what projects and the progress of the tasks they’re responsible for. This kind of system is particularly useful for any organization looking to keep track of multiple projects, assign roles efficiently, and manage deadlines.


 2. Description of SQL Commands Executed

- Table Creation:
  I created several tables to organise the data related to departments, employees, projects, and tasks:
  
   `Departments`: This table stores department information such as the department’s ID, name, and location. For example, I added a department called "Engineering" located in San Francisco.
 
  `Employees`: This table holds employee information like their name, role, email, phone number, and the department they work in. For example, I added an employee named Jean-Pierre Nkurunziza, who works as an engineer in the Engineering department.

 `Projects`: This table stores information about the different projects, including their name, start and end dates, and current status. For instance, I added a project called "Ubumenyi bw Ikoranabuhanga" which is currently in progress.

 `Tasks`: I also created a table for tasks, where I can record each task's title, due date, and status. For example, one task I added is "Kwagura Ubushobozi" with a due date of December 15, 2020, and its status set as "Pending."

 `Project_Employee`: This table links employees to the projects they’re working on and specifies their roles in each project. For example, Alice Niyonsaba is the "Project Manager" for the "Gahunda yIterambere" project.
 `Project_Task`: This table links tasks to the projects they belong to. For instance, I assigned the "Guteza imbere amashuri" task to the "Gahunda yIterambere" project.

- Inserting Data:

Ex;  INSERT INTO Employees (EmployeeID, Name, Role, Email, PhoneNumber, DepartmentID)
  VALUES (2, 'Jean-Pierre Nkurunziza', 'Engineer', 'jean.nkurunziza@yahoo.com', '+250788234567', 2);


  
- Updating Data:

  I used an `UPDATE` statement to modify the role of Alice Niyonsaba from "Project Manager" to "Lead of Program" in the "Gahunda yIterambere" project. This allows me to easily update responsibilities within a project.

- Deleting Data:
  I deleted Alice's assignment from the "Gahunda yIterambere" project when her role changed, using a `DELETE` statement:
  Ex: DELETE FROM Project_Employee WHERE ProjectID = 1 AND EmployeeID = 1;

- Selecting Data:
  
Used several `SELECT` queries to retrieve meaningful information:
  - For example,
  SELECT * FROM Tasks WHERE TaskID = 3;
  - I also retrieved a list of employees and their roles in specific projects:
Ex;  SELECT Projects.Name AS ProjectName, Employees.Name AS EmployeeName, Project_Employee.RoleInProject
  FROM Projects
  JOIN Project_Employee ON Projects.ProjectID = Project_Employee.ProjectID
  JOIN Employees ON Project_Employee.EmployeeID = Employees.EmployeeID;
  

- Alter:

  I added a `Gender` column to the `Employees` table in case I need to store that information in the future:
 Ex:  ALTER TABLE Employees ADD Gender VARCHAR(10);

- Transaction:
  I created a new user and granted them permission to select data from the `Employees` table:
Ex;  GRANT SELECT ON Employees TO user_name;
   This ensures that a specific user can view employee data but not make any changes.

3. Explanations of Results and Transactions

- Query Results:
  For example, when I queried the `Projects`, `Employees`, and `Project_Employee` tables, I could see which employees were assigned to specific projects and their roles. This helps me keep track of team assignments:
  ```sql
  SELECT Projects.Name AS ProjectName, Employees.Name AS EmployeeName, Project_Employee.RoleInProject
  FROM Projects
  JOIN Project_Employee ON Projects.ProjectID = Project_Employee.ProjectID
  JOIN Employees ON Project_Employee.EmployeeID = Employees.EmployeeID;
  ```

- Transactions:
  After updating or deleting data, I used `COMMIT` to finalize my changes. This ensures that the database remains consistent and that changes are saved permanently:
  ```sql
  COMMIT;

  ```
QUERIES

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






