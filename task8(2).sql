--1
select *
from Doctors;
--2
select *
from patients
order by age asc;
--3
select *
from patients
order by UR_number
offset 4 rows fetch
next 10 rows only;
--4
 select top(5)*
 from Doctors;
 --5
 select DISTINCT addresses 
 from patients;
 --6
 select *
 from patients
 where age = 25;
 --7
 select *
 from patients
 where email is null;
 --8
 select *
 from Doctors
 where years_experience > 5 and  specialty = 'Cardiology' ;
 
  select *
 from Doctors
 where   specialty = 'Dermatology'  or  specialty = 'Oncology' ;
 --9
 select *
 from Doctors
 where   specialty in( 'Dermatology' , 'Oncology') ;
 --10
 select *
 from patients
 where age between 18 and 30;
 --11
 select *
 from Doctors
 where  name like 'DR.%'
 --12
 select Doctors.name as DoctorName, Doctors.email as DoctorEmail
 from Doctors
 --13
 select patients.name,prescription.id_prescription,prescription.Date ,prescription.quantity
 from patients join prescription
 on prescription.UR_number = patients.UR_number
 --14
 select addresses ,count(*) numpatient
 from patients
 group by addresses
 --15
 select addresses ,count(*) numpatient
 from patients
 group by addresses
 having count(*)>3;

 --16
 select * 
from patients 
where exists (
select 1 
from prescription 
where prescription.UR_number = patients.UR_number
);
 --17
select name 
from Doctors
union
select name 
from patients;
 --18
 insert into Doctors(ID_doctors ,name ,email ,phone_number ,years_experience ,specialty )
 values(355,'marco','mar@hospital.com','99-000-888',8,'Cardiology')
 --19
 insert into patients(UR_number  ,name ,addresses ,age ,email ,medicarecard_number ,phone)
 values(108,'rose','26  Circle',20,'rose8@wikimedia.org',10,'200-09-99'),
 (187,'jassy','86 Westend ',30,'jassy23@wikimedia.org',14,'298-80-679'),
 (677,'roy','29 Michigan ',40,'roy7@wikimedia.org',50,'977-08-09')
 --20
 update Doctors
 set phone_number ='677-22-907'
 where ID_doctors =5;
 --21
 update patients
 set patients.addresses = 'cairo'
 from patients inner join  prescription
 on patients.UR_number=prescription.UR_number
 where prescription.ID_doctors =706;
 --22
 DELETE FROM prescription 
 WHERE UR_number = 2430;
 delete from patients
 where UR_number= 2430
 --23

begin transaction;
begin try

insert into Doctors (ID_doctors,name, Email,phone_number, years_experience ,specialty)
values (879,'Dr. Sahar ', 'sahar@hospital.com','900-99-233',50, 'Neurology');

insert into patients (UR_number,name, addresses,age, Email,medicarecard_number,phone)
values (487,'David ', '10 Seattle', 40,'david@email.com',60,'100-3004-99');

 COMMIT;

end try
begin catch
 rollback ;
end catch;



