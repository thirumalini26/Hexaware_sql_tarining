use sisdb;
-- task 2
insert into students (first_name, last_name, date_of_birth, email, phone_number)
values ('john', 'd', '1995-08-15', 'john.d@example.com', '1234567890');

select * from students;

insert into enrollments (student_id, course_id, enrollment_date)
values (11, 1, '2025-03-10');

select * from enrollments;

update teacher
set email = 'raj.v@newmail.com'
where teacher_id = 3;

show create table payments;
show create table enrollments;

select constraint_name
from information_schema.key_column_usage
where table_name = 'payments' and table_schema = 'sisdb';

-- alter table payments drop foreign key payments_ibfk_1;
-- alter table enrollments drop foreign key enrollments_ibfk_1;  -- adjust the name if necessary


alter table payments 
add constraint fk_payments_student
foreign key (student_id) references students(student_id)
on delete cascade;

alter table enrollments 
add constraint fk_enroll_student
foreign key (student_id) references students(student_id)
on delete cascade;

delete from enrollments
where student_id = 11 and course_id = 1;

update courses
set teacher_id = 5
where course_id = 3;

delete from students where student_id = 3;

select * from enrollments;
select * from students;

update payments
set amount = 1350.00
where payment_id = 2;
