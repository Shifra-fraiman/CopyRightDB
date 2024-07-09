create database CopyRight
go
use CopyRight
CREATE TABLE RoleCode(
 Id INT PRIMARY KEY IDENTITY(1,1),
 Description VARCHAR(100) NOT NULL,
);
CREATE TABLE StatusCodeProject(
 Id INT PRIMARY KEY IDENTITY(1,1),
 Description VARCHAR(100) NOT NULL,
);
CREATE TABLE StatusCodeUser(
 Id INT PRIMARY KEY IDENTITY(1,1),
 Description VARCHAR(100) NOT NULL,
);
CREATE TABLE PriorityCode(
 Id INT PRIMARY KEY IDENTITY(1,1),
 Description VARCHAR(100) NOT NULL,
);
CREATE TABLE Leads (
    lead_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(100),
    source VARCHAR(100),
    created_date DATETIME DEFAULT GETDATE(),
    last_contacted_date DATETIME,
    business_name VARCHAR(100),
    notes TEXT
);

CREATE TABLE Users(
 user_id INT PRIMARY KEY IDENTITY(1,1),
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 email VARCHAR(100) NOT NULL UNIQUE,
 role int NOT NULL,
 password VARCHAR(250) NOT NULL,
 created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (role) REFERENCES RoleCode(id)
);

CREATE TABLE Communications(
 communication_id INT PRIMARY KEY IDENTITY(1,1),
 type VARCHAR(20) NOT NULL,
 date DATETIME DEFAULT CURRENT_TIMESTAMP,
 details TEXT,
 related_to VARCHAR(20) NOT NULL,
 related_id INT NOT NULL,
 user_id INT,
 FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Customers(
 customer_id INT PRIMARY KEY IDENTITY(1,1),
 first_name VARCHAR(50) NOT NULL,
 last_name VARCHAR(50) NOT NULL,
 phone VARCHAR(20),
 email VARCHAR(100) NOT NULL,
 business_name VARCHAR(100),
 source VARCHAR(100),
 status int,
 created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (status) REFERENCES StatusCodeUser(id)

);

CREATE TABLE Projects(
 project_id INT PRIMARY KEY IDENTITY(1,1),
 name VARCHAR(100) NOT NULL,
 description TEXT,
 start_date DATE,
 end_date DATE,
 status int,
 customer_id INT,
 created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
 FOREIGN KEY (status) REFERENCES StatusCodeProject(id)
);


CREATE TABLE Tasks(
 task_id INT PRIMARY KEY IDENTITY(1,1),
 title VARCHAR(100) NOT NULL,
 description TEXT,
 status int NOT NULL,
 priority int ,
 due_date DATE,
 assigned_to INT,
 project_id INT,
 created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
 FOREIGN KEY (assigned_to) REFERENCES Users(user_id),
 FOREIGN KEY (project_id) REFERENCES Projects(project_id),
 FOREIGN KEY (priority) REFERENCES PriorityCode(Id),
 FOREIGN KEY (status) REFERENCES StatusCodeProject(Id)
);

CREATE TABLE Documents(
 document_id INT PRIMARY KEY IDENTITY(1,1),
 title VARCHAR(100) NOT NULL,
 description TEXT,
 file_path VARCHAR(255) NOT NULL,
 related_to VARCHAR(20) NOT NULL,
 related_id INT NOT NULL,
 created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
);

