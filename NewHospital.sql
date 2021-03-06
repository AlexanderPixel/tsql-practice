--create database NewHospital
use NewHospital
go

--create table Departments
--(
--	id int primary key identity(1, 1),
--	building int not null,
--	financing money default 0 not null,
--	[name] nvarchar(100) not null unique,

--	constraint CK_Building_Range check (building >= 1 and building <= 5),
--	constraint CK_Financing_Value check (financing >= 0),
--	constraint CK_Department_Name_Not_Empty check ([name] != N'')
--)

--create table Diseases
--(
--	id int primary key identity(1, 1),
--	[name] nvarchar(100) not null unique,
--	severity int default 1 not null,

--	constraint CK_Disease_Name_Not_Empty check ([name] != N''),
--	constraint CK_Disease_Severity_MoreThan_0 check (severity >= 1),
--)

--create table Doctors
--(
--	id int primary key identity(1, 1),
--	[name] nvarchar(max) not null,
--	phone char(10) not null,
--	salary money not null,
--	surname nvarchar(max) not null,

--	constraint CK_Doctor_Name_Not_Empty check ([name] != N''),
--	constraint CK_Doctor_Salary_MoreOrNotEqual_0 check (salary > 0),
--	constraint CK_Doctor_Surname_Not_Empty check (surname != N''),
--)

--create table Examinations
--(
--	id int primary key identity(1, 1),
--	[dayOfWeek] int not null,
--	endTime time not null,
--	startTime time not null,
--	[name] nvarchar(100) not null,

--	constraint CK_Examination_Day_Of_Week check ([dayOfWeek] >= 1 and [dayOfWeek] <= 7),
--	constraint CK_Examination_StartTime_Value check (startTime >= '8:00:00' and startTime <= '18:00:00'),
--	constraint CK_Examination_EndTime_MoreThan_StartTime check (endTime > startTime),
--	constraint CK_Examination_Name_Not_Empty check ([name] != N'')
--)

--insert into Departments (building, financing, name) values (2, 25000, 'Building_2');
--insert into Departments (building, financing, name) values (2, 50000, 'Building_3');

--insert into Diseases ([name], severity) values ('Disease_1', 2);
--insert into Diseases ([name], severity) values ('Disease_2', 5);
--insert into Diseases ([name], severity) values ('Disease_3', 3);

--insert into Doctors ([name], phone, salary, surname) values ('Name_1', '+380-50-99', 20000, 'Surname_1');
--insert into Doctors ([name], phone, salary, surname) values ('Name_2', '+380-50-77', 20000, 'Surname_2');
--insert into Doctors ([name], phone, salary, surname) values ('Name_3', '+380-50-99', 20000, 'Surname_3');
--insert into Doctors ([name], phone, salary, surname) values ('Name_4', '+380-50-22', 20000, 'Surname_4');

--insert into Examinations (dayOfWeek, startTime, endTime, [name]) values (2, '9:35:00', '10:00:00', 'Examination_1');
--insert into Examinations (dayOfWeek, startTime, endTime, [name]) values (5, '10:40:00', '11:00:00', 'Examination_2');
--insert into Examinations (dayOfWeek, startTime, endTime, [name]) values (3, '17:35:00', '20:10:00', 'Examination_3');
--insert into Examinations (dayOfWeek, startTime, endTime, [name]) values (2, '11:00:00', '12:00:00', 'Examination_4');
--insert into Examinations (dayOfWeek, startTime, endTime, [name]) values (1, '11:10:00', '12:00:00', 'Examination_5');

--alter table Doctors
--alter column phone nchar(10) not null