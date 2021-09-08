/*retrieve all employee has id=123123123*/
select *
from employee
where id=123123123;

/*retrieve all salary and name of employee and add 12% */
select p.fname,p.lname,e.salary,e.salary+0.12*salary as total_salary
from employee e,person p
where e.id=p.id;

/*Retrieve the first name and salary of all Employee whose salary between 5000 and 12000*/
select p.fname,p.lname,e.salary
from employee e natural join person p
where e.salary between 5000 and 12000;

/*change type_booking for passenger id=123454326 to round trip*/
update ticket
set type_booking='round trip'
where passenger_id=123454326;

/*delete the data for passenger id=1312423543*/
delete from passenger 
where id=1312423543;

/*Retrieve the max salary of all employee*/
select max(salary)
from employee;

/*Retrieve name and salary for employee has salary greater than 12000 */
select p.fname,e.salary
from employee e natural join person p
where salary in (
select salary
from employee
where salary>12000);

/*Retrieve name for employee has dependant more than or equal 3 */
select p.fname,p.lname
from employee e , person p
where e.id=p.id and (
select count(*)
from dependant d
where e.id=d.employee_id)>=3;

/*retrieve name of flight and sum of salary for each flight of employee */
select f.f_name,sum(e.salary) as sum_salary
from employee e,works_on w,flight f
where e.id=w.employee_id and w.flight_f_no=f.f_no
group by f.f_name;

/*retrieve name of employee where has less salary*/
select p.fname,e.salary
from employee e natural join person p
where salary=(
select min(salary)
from employee
);

/*retrieve name of passenger that booked in highclass*/
select p.fname,t.degree
from person p,passenger s,ticket t
where p.id=s.id and s.id=t.passenger_id and t.degree='highclass';

/*retrieve count of ticket has round trip and name of flight is cairo-982 */
select count(t.t_no)
from ticket t ,flight f
where t.flight_f_no=f.f_no  and t.type_booking='round trip' and f.f_name='cairo-982';

/*retrieve names and phone and phone contain 12 */
select p.fname,h.phone 
from person p,phone h
where p.id=h.person_id and h.phone like '%12%';

/*retrieve ticket number that not has date_back*/
select t_no
from ticket 
where date_back is null;

/*Retrieve and employee that his name contain the character ‘o’ as a second character*/
select *
from employee e natural join person p
where p.fname like '_o%';

/*Retrieve first_name of employee , his job and his salary of male employee*/
select P.fname, e.job, e.salary,p.sex
from employee e, person p
where p.ID=e.ID and sex='m';

/*Retrieve first_name and last_name for each employee who live in West*/
select P.fname, p.lname,p.address
from person p
where address like'% West%';

/*Retrieve first_name of employee , his job and his salary  that get salary between 12000 and 30000*/
select P.fname, e.job,e.salary
from employee e, person p
where p.ID=e.ID and (e.salary between 12000 and 30000);

/*Retrieve first_name of employee and his/her cousin*/
select P.fname, d.dname,d.relation
from employee e, person p, dependant d
where p.ID=e.ID and e.ID=d.employee_ID and d.relation='cousin';

/*Retrieve first_name of employee and name of flight who works on where his job is air host*/
select P.fname as Emp_name, f.f_name as Flight_name  ,e.job
from employee e, person p ,works_on w,flight f
where p.ID=e.ID and e.ID=w.employee_ID and w.flight_f_no=f.f_no and job='air host';

/*Retrieve name of flight and the number of employee that works on each flight according to flight name*/
select f.f_name ,count(w.employee_ID) as Emp_Num 
from works_on w,flight f
where w.flight_f_no=f.f_no
group by f.f_name;

/*Retrieve name of flight and sum of salaries for each flight that are paied to their employees*/
select f.f_name ,sum(e.salary) as Sum_Salary
from employee e,flight f,works_on w
where w.flight_f_no=f.f_no and e.ID=w.employee_ID
group by f.f_name
having sum(e.salary)>80000;






 