CREATE TABLE student
(
    id   BINARY(255) NOT NULL,
    age  INT NULL,
    name VARCHAR(255) NULL,
    CONSTRAINT PK_STUDENT PRIMARY KEY (id)
);