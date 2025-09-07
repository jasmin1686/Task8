create database task8
go
use task8
go

create table Doctors(
ID_doctors int primary key ,
name varchar(50),
email varchar(50),
phone_number varchar(50),
years_experience int,
specialty varchar(50)
)
create table patients(
UR_number int primary key ,
name varchar(50),
addresses varchar(50),
age int,
email varchar(50),
medicarecard_number int,
phone varchar(50),
ID_doctors int references Doctors (ID_doctors)
)
create table patients_Doctors(
UR_number int,
ID_doctors int ,
primary key (UR_number,ID_doctors),
foreign key (UR_number)references patients(UR_number),
foreign key (ID_doctors)references Doctors(ID_doctors),
)
create table pharmaceutical_company(
id_company int primary key ,
name varchar(50),
addresses varchar(50),
phone_number varchar(50)
)
create table prescription(
id_prescription int primary key ,
Date datetime2,
quantity int,
ID_doctors int references Doctors (ID_doctors),
UR_number int references patients (UR_number)
)
create table Drug(
id_drug int primary key ,
id_company int references pharmaceutical_company(id_company),
id_prescription int references prescription (id_prescription),
trade_name varchar(50),
drug_strength varchar(50)
) 
