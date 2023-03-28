Create Database Course

use Course

CREATE TABLE Students(
[Id] int primary key identity(1,1),
[Name] nvarchar (50) not null,
[Surname] nvarchar (50),
[Age] int,
[Email] nvarchar(50) unique,
[Address] nvarchar(50) 
)


INSERT INTO Students VALUES
('Mirze','Beshirzade',27,'mirze@gmail.com','BulBule'),
('Samir','Guneshli',28,'same@gmail.com','Razin'),
('Coshqun','Ehmedli',25,'cowi@mail.ru','Neftciler'),
('Vusal','Isgenderli',29,'vusal@bk.ru','Yasamal'),
('Celal','Haciyev',20,'ceka@gmail.com','Merdekan'),
('Xalid','Qubadov',22,'xalid@list.ru','Emircan')

select* from Students



CREATE TABLE StudentArchives(
[Id] int primary key identity(1,1),
[StudentID] int,
[Operation] nvarchar(50),
[Date] datetime

)

select * from StudentArchives



CREATE PROCEDURE usp_deleteStudent
@id int
as 
BEGIN 
  delete from Students where Id = @id
  select * from Students
END

exec usp_deleteStudent 6




CREATE TRIGGER trg_deleteStudents on Students
after delete 
as 
BEGIN 
  insert into StudentArchives([StudentID],[Operation],[Date])
  select Id,'Delete',GETDATE() from deleted
END

delete from Students where Id = 5

select * from StudentArchives