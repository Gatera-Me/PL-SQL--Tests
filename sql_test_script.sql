Perform joins to retrieve related data across tables
------------------------------------------------------------------------

SELECT 
    p.Name AS ProjectName,
    e.Name AS EmployeeName,
    pe.RoleInProject
FROM 
    Projects p
JOIN 
    Project_Employee pe ON p.ProjectID = pe.ProjectID
JOIN 
    Employees e ON pe.EmployeeID = e.EmployeeID;
=======================================================================

SELECT 
    p.Name AS ProjectName,
    t.Title AS TaskTitle,
    t.Status AS TaskStatus
FROM 
    Projects p
JOIN 
    Project_Task pt ON p.ProjectID = pt.ProjectID
JOIN 
    Tasks t ON pt.TaskID = t.TaskID;
=============================================================

INSERT INTO Employees (EmployeeID, Name, Role, Email, PhoneNumber, DepartmentID) VALUES
(1, 'Jean Claude', 'Responsable', 'jean.claude@example.com', '788123456', 1);





SELECT 
    p.Name AS ProjectName,
    p.Status AS ProjectStatus,
    e.Name AS EmployeeName,
    pe.RoleInProject,
    t.Title AS TaskTitle,
    t.Status AS TaskStatus
FROM 
    Projects p
LEFT JOIN 
    Project_Employee pe ON p.ProjectID = pe.ProjectID
LEFT JOIN 
    Employees e ON pe.EmployeeID = e.EmployeeID
LEFT JOIN 
    Project_Task pt ON p.ProjectID = pt.ProjectID
LEFT JOIN 
    Tasks t ON pt.TaskID = t.TaskID;
////////////////////////////////////////////////////////////


CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    Name VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Status VARCHAR(50)
);

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50),
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15)
);

ALTER TABLE Employees
ADD DepartmentID INT;
ALTER TABLE Employees
ADD CONSTRAINT fk_Department
FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID);

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100)
);

INSERT INTO Departments (DepartmentID, DepartmentName, Location) VALUES
(1, 'Human Resources', 'New York');
(2, 'Information Technology', 'San Francisco');



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
