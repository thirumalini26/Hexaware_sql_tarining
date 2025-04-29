create database sisdb;
use sisdb;

create table students (
    student_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    date_of_birth date not null,
    email varchar(100) not null,
    phone_number varchar(20)
);
create table teacher (
    teacher_id int primary key auto_increment,
    first_name varchar(50) not null,
    last_name varchar(50) not null,
    email varchar(100) not null
);
create table courses (
    course_id int primary key auto_increment,
    course_name varchar(100) not null,
    credits int check (credits > 0),
    teacher_id int,
    foreign key (teacher_id) references teacher(teacher_id)
);
create table enrollments (
    enrollment_id int primary key auto_increment,
    student_id int,
    course_id int,
    enrollment_date date,
    foreign key (student_id) references students(student_id),
    foreign key (course_id) references courses(course_id)
);
create table payments (
    payment_id int primary key auto_increment,
    student_id int,
    amount decimal(10,2) not null,
    payment_date date,
    foreign key (student_id) references students(student_id)
);
insert into students (first_name, last_name, date_of_birth, email, phone_number) values
('john', 'd', '2000-01-15', 'john.d@example.com', '1234567890'),
('alice', 's', '2001-03-22', 'alice.s@example.com', '2345678901'),
('bob', 't', '1999-07-10', 'bob.t@example.com', '3456789012'),
('carol', 'm', '2000-11-30', 'carol.m@example.com', '4567890123'),
('dave', 'r', '2002-05-05', 'dave.r@example.com', '5678901234'),
('eve', 'k', '2001-08-25', 'eve.k@example.com', '6789012345'),
('frank', 'p', '1998-12-14', 'frank.p@example.com', '7890123456'),
('grace', 'b', '2000-04-09', 'grace.b@example.com', '8901234567'),
('heidi', 'f', '2003-02-02', 'heidi.f@example.com', '9012345678'),
('ivan', 'g', '1999-09-17', 'ivan.g@example.com', '0123456789');
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
('mathematics', 4, 1),
('physics', 3, 2),
('chemistry', 4, 3),
('biology', 3, 4),
('english', 2, 5),
('history', 3, 6),
('geography', 2, 7),
('computer science', 4, 8),
('economics', 3, 9),
('philosophy', 2, 10);

select * from courses;
insert into enrollments (student_id, course_id, enrollment_date) values
(1, 1, '2025-01-10'),
(2, 2, '2025-01-11'),
(3, 3, '2025-01-12'),
(4, 4, '2025-01-13'),
(5, 5, '2025-01-14'),
(6, 6, '2025-01-15'),
(7, 7, '2025-01-16'),
(8, 8, '2025-01-17'),
(9, 9, '2025-01-18'),
(10, 10, '2025-01-19');

select * from enrollments;
insert into payments (student_id, amount, payment_date) values
(1, 1000.00, '2025-02-01'),
(2, 1200.00, '2025-02-02'),
(3, 1100.00, '2025-02-03'),
(4, 950.00, '2025-02-04'),
(5, 1050.00, '2025-02-05'),
(6, 980.00, '2025-02-06'),
(7, 1020.00, '2025-02-07'),
(8, 970.00, '2025-02-08'),
(9, 1150.00, '2025-02-09'),
(10, 1080.00, '2025-02-10');
select * from payments;