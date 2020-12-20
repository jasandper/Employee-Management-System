DROP DATABASE IF EXISTS EmployeeTracker_DB;

CREATE DATABASE EmployeeTracker_DB;

USE EmployeeTracker_DB;

CREATE TABLE department (
  id INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) not null,
  PRIMARY KEY (id)
);

CREATE TABLE role (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(30) NOT NULL,
    salary decimal NOT NULL,
    department_id INT not null,
    PRIMARY KEY (id),
    FOREIGN KEY  (department_id) references department (id)
);

CREATE TABLE employee (
    id INT AUTO_INCREMENT NOT NULL,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    role_id INT NOT NULL,
    manager_id INT,
    FOREIGN KEY (role_id) references role (id),
    FOREIGN KEY (manager_id) references employee (id),
    PRIMARY KEY (id),
);

INSERT INTO department (name)
VALUES ("Sales"),("Engineering"),("Finance"),("Legal");

INSERT INTO role (title,salary,department_id)
VALUES ("Sales Lead", 100000, 1), ("Salesperson", 80000, 1), ("Lead Engineer", 150000, 2), ("Software Engineer", 120000, 2);

INSERT INTO employee (first_name, last_name, role_id, manager_id)
VALUES ("John", "Doe", 1, null), ("Mike", "Chan", 2, 1), ("Ashley", "Rodriguez", 3,null ), ("Kevin", "Tupik", 4, 3);