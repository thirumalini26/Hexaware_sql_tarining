-- Task 4 

use sisdb;

insert into payments (student_id, amount, payment_date) values
(1, 1000.00, '2025-06-01'),
(2, 1200.00, '2025-12-02'),
(8, 1100.00, '2025-05-03'),
(4, 950.00, '2025-03-04');

select avg(student_count) as avg_enrollment
from (
    select course_id, count(*) as student_count
    from enrollments
    group by course_id
) as sub;


select s.student_id, s.first_name, s.last_name, p.amount
from payments p
join students s on p.student_id = s.student_id
where p.amount = (
    select max(amount) from payments
);


select c.course_id, c.course_name, count(e.enrollment_id) as enrollment_count
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name
having count(e.enrollment_id) = (
    select max(course_count)
    from (
        select count(*) as course_count
        from enrollments
        group by course_id
    ) as sub
);



select t.teacher_id, t.first_name, t.last_name,
       (
           select sum(p.amount)
           from payments p
           join enrollments e on p.student_id = e.student_id
           join courses c2 on e.course_id = c2.course_id
           where c2.teacher_id = t.teacher_id
       ) as total_payments
from teacher t;



select student_id, first_name, last_name
from students
where student_id in (
    select student_id
    from enrollments
    group by student_id
    having count(distinct course_id) = (select count(*) from courses)
);



select teacher_id, first_name, last_name
from teacher
where teacher_id not in (
    select distinct teacher_id
    from courses
    where teacher_id is not null
);



select avg(age) as avg_age
from (
    select timestampdiff(year, date_of_birth, curdate()) as age
    from students
) as sub;




select course_id, course_name
from courses
where course_id not in (
    select distinct course_id from enrollments
);



select e.student_id, e.course_id, sum(p.amount) as total_payment
from enrollments e
join payments p on e.student_id = p.student_id
group by e.student_id, e.course_id;



select student_id, count(*) as payment_count
from payments
group by student_id
having count(*) > 1;



select s.student_id, s.first_name, s.last_name, sum(p.amount) as total_payment
from students s
join payments p on s.student_id = p.student_id
group by s.student_id, s.first_name, s.last_name;



select c.course_name, count(e.student_id) as student_count
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_name;



select avg(p.amount) as average_payment
from payments p
join students s on p.student_id = s.student_id;