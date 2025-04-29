CREATE DATABASE stdb;
USE stdb; 



create table students (
    student_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date,
    email varchar(100) unique,
    phone_number varchar(15)
);


create table teacher (
    teacher_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) unique
);


create table courses (
    course_id int primary key auto_increment,
    course_name varchar(100) not null,
    credits int check (credits > 0),
    teacher_id int,
    foreign key (teacher_id) references teacher(teacher_id)
        on delete set null on update cascade
);


create table enrollments (
    enrollment_id int primary key auto_increment,
    student_id int,
    course_id int,
    enrollment_date date,
    foreign key (student_id) references students(student_id)
        on delete cascade on update cascade,
    foreign key (course_id) references courses(course_id)
        on delete cascade on update cascade
);


create table payments (
    payment_id int primary key auto_increment,
    student_id int,
    amount decimal(10, 2) check (amount > 0),
    payment_date date,
    foreign key (student_id) references students(student_id)
        on delete cascade on update cascade
);


insert into students (first_name, last_name, date_of_birth, email, phone_number) values
('alice', 'johnson', '2001-03-15', 'alice.johnson@example.com', '1234567890'),
('bob', 'smith', '2000-07-10', 'bob.smith@example.com', '2345678901'),
('charlie', 'lee', '2002-01-22', 'charlie.lee@example.com', '3456789012'),
('diana', 'brown', '1999-11-30', 'diana.brown@example.com', '4567890123'),
('ethan', 'taylor', '2001-05-05', 'ethan.taylor@example.com', '5678901234'),
('fiona', 'wilson', '2003-09-09', 'fiona.wilson@example.com', '6789012345'),
('george', 'martin', '2000-02-17', 'george.martin@example.com', '7890123456'),
('hannah', 'clark', '2002-08-12', 'hannah.clark@example.com', '8901234567'),
('ian', 'lewis', '1998-04-01', 'ian.lewis@example.com', '9012345678'),
('julia', 'walker', '2001-12-25', 'julia.walker@example.com', '0123456789');

desc students;

select * from students;

insert into teacher (first_name, last_name, email) values
('ram', 't', 'ram.t@example.com'),
('ravi', 'h', 'ravi.h@example.com'),
('raj', 'v', 'raj.v@example.com'),
('raji', 'l', 'raji.l@example.com'),
('ria', 'b', 'ria.b@example.com'),
('maya', 'k', 'maya.k@example.com'),
('mia', 't', 'mia.t@example.com'),
('ken', 'l', 'ken.l@example.com'),
('rita', 'r', 'rita.r@example.com'),
('sita', 'g', 'sita.g@example.com');

select * from teacher;

insert into courses (course_name, credits, teacher_id) values
('data structures', 4, 1),
('operating systems', 3, 2),
('databases', 3, 3),
('computer networks', 4, 4),
('algorithms', 4, 5),
('software engineering', 3, 6),
('machine learning', 3, 7),
('artificial intelligence', 4, 8),
('web development', 3, 9),
('mobile app development', 3, 10);

insert into enrollments (student_id, course_id, enrollment_date) values
(1, 1, '2024-01-10'),
(2, 2, '2024-01-11'),
(3, 3, '2024-01-12'),
(4, 4, '2024-01-13'),
(5, 5, '2024-01-14'),
(6, 6, '2024-01-15'),
(7, 7, '2024-01-16'),
(8, 8, '2024-01-17'),
(9, 9, '2024-01-18'),
(10, 10, '2024-01-19');

insert into payments (student_id, amount, payment_date) values
(1, 500.00, '2024-01-05'),
(2, 450.00, '2024-01-06'),
(3, 600.00, '2024-01-07'),
(4, 550.00, '2024-01-08'),
(5, 500.00, '2024-01-09'),
(6, 400.00, '2024-01-10'),
(7, 650.00, '2024-01-11'),
(8, 700.00, '2024-01-12'),
(9, 300.00, '2024-01-13'),
(10, 750.00, '2024-01-14');

