create database Company
use Company
create table Countries(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50)
)

create table Cities(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
  [CountryId] int foreign key references Countries(Id)
)

create table Employees(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
  [Surname] nvarchar(50),
  [Age] int,
  [Salary] decimal,
  [Position] nvarchar(150),
  [IsDeleted] bit NOT NULL DEFAULT 0,
  [CityId] int foreign key references Cities(Id)
)

insert into Countries([Name])
values('Azerbaijan'),
      ('Turkiye'),
	  ('Swedan'),
	  ('Norway')

insert into Cities([Name],[CountryId])
values('Baku',1),
      ('Oslo',4),
	  ('Izmir',2),
	  ('Stockholm',3)

insert into Employees([Name],[Surname],[Age],[Salary],[Position],[IsDeleted],[CityId])
values('Roya','Meherremova',27,1500,'Reception',1,1)

insert into Employees([Name],[Surname],[Age],[Salary],[Position],[CityId])
values('Earling','Haland',23,3000,'Front-End-Developer',3)



select Employees.[Name],Employees.[Surname],Cities.[Name],Countries.[Name] from Employees
inner join  Cities
on Employees.CityId = Cities.Id
inner join Countries
on Cities.CountryId = Countries.Id




select Employees.[Name],Countries.[Name] from Employees
inner join  Cities
on Employees.CityId = Cities.Id
inner join Countries
on Cities.CountryId = Countries.Id
where Employees.Salary > 2000


Select Cities.[Name],Countries.[Name] from Cities 
inner join Countries
on Cities.CountryId = Countries.Id



select Employees.[Name],Employees.[Surname],Employees.[Age],Employees.[Salary],Employees.Position,Employees.IsDeleted,Cities.[Name],Countries.[Name] from Employees
inner join  Cities
on Employees.CityId = Cities.Id
inner join Countries
on Cities.CountryId = Countries.Id
where Employees.Position = 'Reception'




select Employees.[Name],Employees.[Surname],Cities.[Name],Countries.[Name] from Employees
inner join  Cities
on Employees.CityId = Cities.Id
inner join Countries
on Cities.CountryId = Countries.Id
where Employees.IsDeleted = 0