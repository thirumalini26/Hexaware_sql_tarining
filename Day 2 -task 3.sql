use sisdb;
-- task 3
select s.student_id, s.first_name, s.last_name, sum(p.amount) as total_payments
from students s
join payments p on s.student_id = p.student_id
where s.student_id = 4
group by s.student_id, s.first_name, s.last_name;


select c.course_id, c.course_name, count(e.student_id) as student_count
from courses c
join enrollments e on c.course_id = e.course_id
group by c.course_id, c.course_name
order by student_count ;



select s.student_id, s.first_name, s.last_name
from students s
left join enrollments e on s.student_id = e.student_id
where e.enrollment_id is null;

select s.first_name, s.last_name, c.course_name
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id;

select t.teacher_id,t.first_name, t.last_name, c.course_name
from teacher t
join courses c on t.teacher_id = c.teacher_id
order by t.teacher_id;

select s.first_name, s.last_name, c.course_name, e.enrollment_date
from students s
join enrollments e on s.student_id = e.student_id
join courses c on e.course_id = c.course_id
where c.course_id = 1;  

select s.student_id, s.first_name, s.last_name
from students s
left join payments p on s.student_id = p.student_id
where p.payment_id is null;

select c.course_id, c.course_name
from courses c
left join enrollments e on c.course_id = e.course_id
where e.enrollment_id is null;

select s.student_id, s.first_name, s.last_name, count(e.course_id) as course_count
from students s
join enrollments e on s.student_id = e.student_id
group by s.student_id, s.first_name, s.last_name
having count(e.course_id) > 1;

select t.teacher_id, t.first_name, t.last_name
from teacher t
left join courses c on t.teacher_id = c.teacher_id
where c.course_id is null;
