-- Employees Table
CREATE TABLE Employees (
    EmpID INT,
    EmpName VARCHAR(100),
    Age INT,
    Salary INT,
    DeptID INT
);

-- Departments Table
CREATE TABLE Departments (
    DeptID INT,
    DeptName VARCHAR(100)
);

-- Sample Data
INSERT INTO Departments VALUES (1, 'HR'), (2, 'IT'), (3, 'Finance');

INSERT INTO Employees VALUES 
(101, 'Alice', 25, 50000, 2),
(102, 'Bob', 28, 55000, 1),
(103, 'Charlie', 30, 60000, 3),
(104, 'David', 35, 70000, 2),
(105, 'Eve', 29, 52000, 1);

SELECT EmpName, Salary
FROM Employees
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
);


SELECT EmpName, Salary, DeptID
FROM Employees E
WHERE Salary > (
    SELECT AVG(Salary)
    FROM Employees
    WHERE DeptID = E.DeptID
);


SELECT EmpName
FROM Employees
WHERE DeptID IN (
    SELECT DeptID
    FROM Employees
    GROUP BY DeptID
    HAVING COUNT(*) > 1
);


SELECT DeptName
FROM Departments D
WHERE EXISTS (
    SELECT 1
    FROM Employees E
    WHERE E.DeptID = D.DeptID AND E.Salary > 60000
);

SELECT EmpName, Salary
FROM Employees
WHERE Salary = (
    SELECT MAX(Salary)
    FROM Employees
);