
select *from Students

create view getStudentById
as
select *from Customers where Id=1

select * from getStudentById





create function SayHelloWorld()
returns nvarchar (50)
as
BEGIN
     return 'Hello World'
END

select dbo.SayHelloWorld()



create function dbo.writeWord (@word nvarchar(20))
returns nvarchar (50)
as
BEGIN
     return @word
END


declare @word nvarchar (20) = 'P135'
select dbo.writeWord('P135')




create function dbo.SumOfNumbers (@num1 int, @num2 int)
returns int
as
BEGIN
     return @num1 + @num2
END

select dbo.SumOfNumbers (2,5)





create function dbo.getEmployeesCount ()
returns int
as
BEGIN
      declare @count int
	  select @count = Count (*) from Employees
     return @count
END

select dbo.getEmployeesCount()




create function dbo.getEmployeesAvarageAgeById (@id int)
returns int
as
BEGIN
      declare @avgAge int
	  select @avgAge = AVG (Age) from Employees where Id > @Id
     return @avgAge
END

select * from Employees

select dbo.getEmployeesAvarageAgeById (4)





create procedure usp_SayHelloWorld
as 
BEGIN
     print 'Hello World'
END


usp_SayHelloWorld

exec usp_SayHelloWorld




create procedure usp_sumOfNums
@num1 int,
@num2 int
as
BEGIN
     print @num1 + @num2
END

exec usp_sumOfNums 5,8





create procedure usp_addEmployees
@name nvarchar (50),
@surname nvarchar (50),
@age int
as
BEGIN
      insert Employees([Name],[Surname],[Age])
	  values (@name,@surname,@age)
END

select * from Employees

exec usp_addEmployees 'Ali','Taliov',21




create procedure usp_deleteEmployeesAndShowDatas
@id int
as
BEGIN
    delete from Employees where Id = @id
	select * from Employees
END

exec usp_deleteEmployeesAndShowDatas 6

