create database Course
use Course

create table Educations(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50)
)

create table Rooms(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
  [Capacity] int
)
create table WeekDays(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50)
)

create table Seans(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50)
)

create table WeekDaySeans(
  [Id] int primary key identity(1,1),
  [WeekDayId] int foreign key references WeekDays(Id),
  [SeansId] int foreign key references Seans(Id)
)

create table Groups(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
  [EduactionId] int foreign key references Educations(Id),
  [RoomId] int foreign key references Rooms(Id),
  [WeekDaySeansId] int foreign key references WeekDaySeans(Id)
)

create table Countries(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50)
)

create table Cities(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
  [CountryId] int foreign key references Countries(Id)
)

create table Students(
  [Id] int primary key identity(1,1),
  [FullName] nvarchar(50),
  [Birthday] date,
  [Address] nvarchar(150),
  [CityId] int foreign key references Cities(Id)
)

create table GroupStudents(
  [Id] int primary key identity(1,1),
  [GroupId] int foreign key references Groups(Id),
  [StudentsId] int foreign key references Students(Id)
)

create table Teachers(
  [Id] int primary key identity(1,1),
  [FullName] nvarchar(50),
  [Email] nvarchar(100),
  [Address] nvarchar(150),
  [Salary] decimal,
  [CityId] int foreign key references Cities(Id)
)

create table GroupTeachers(
  [Id] int primary key identity(1,1),
  [GroupId] int foreign key references Groups(Id),
  [TeacherId] int foreign key references Teachers(Id)
)

create table StafMembers(
  [Id] int primary key identity(1,1),
  [FullName] nvarchar(50),
  [Salary] decimal,
  [CityId] int foreign key references Cities(Id)
)

create table Roles(
  [Id] int primary key identity(1,1),
  [Name] nvarchar(50),
)

create table RoleMembers(
  [Id] int primary key identity(1,1),
  [RoleId] int foreign key references Roles(Id),
  [MemberId] int foreign key references StafMembers(Id)
)


