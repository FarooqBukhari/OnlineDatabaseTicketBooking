--create database OnlineTicketBookingSystem

use OnlineTicketBookingSystem

drop table [ADMIN]

drop table [TRAINBOOKING]
drop table [CINEMABOOKING]
drop table [FLIGHTBOOKING]
drop table [BOOKING]

drop table [FLIGHTINFO]
drop table [TRAININFO]
drop table [THEATRE]

drop table [RAILWAY]
drop table [CINEMAS]
drop table [AIRLINE]

drop table [CARDDETAILS]
drop table [USER]

create table [ADMIN]
(
admin_id int primary key not null,
email varchar(320) unique not null,
admin_fname varchar (15),
admin_lname varchar (15),
passphrase varchar (30),
login_status varchar(3) check (login_status = 'ON' or login_status = 'OFF'),
age int check (age >= 18),
phone bigint check (phone >= 100000000000 and phone <= 9999999999999),
gender char check (gender = 'M' or gender = 'F')
)

create table [USER]
(
user_id varchar(20) primary key not null,
email varchar(320) unique not null,
user_fname varchar (15),
user_lname varchar (15),
passphrase varchar (30),
login_status varchar(3) check (login_status = 'ON' or login_status = 'OFF'),
age int check (age >= 18),
phonenum bigint check (phonenum >= 100000000000 and phonenum <= 9999999999999),
gender char check(gender = 'M' or gender = 'F'),
card_provided char check (card_provided = 'Y' or card_provided = 'N')
)

create table [CARDDETAILS]
(
user_id varchar(20) foreign key references [USER](user_id) on update cascade on delete cascade default null,
card_number bigint check (card_number >= 1000000000000000 and card_number <= 9999999999999999),
card_type char check (card_type = 'D' or card_type = 'C'),
expiration_month int check (expiration_month <= 12 and expiration_month >= 1),
expiration_date int check (expiration_date <= 31 and expiration_date >= 1)
)

create table [CINEMAS]
(
cinema_id int primary key not null,
cinema_name varchar (30) not null,
location varchar(15),
)


create table [THEATRE]
(
theatre_id int primary key not null,
movie_name varchar(30) not null,
cinema_id int foreign key references CINEMAS(cinema_id) on update cascade on delete cascade default null ,
movie_date varchar(10),
totalseats int,
leftseats int,
price int
)

create table [AIRLINE]
(
air_id int primary key not null,
air_name varchar(30) not null,
)

create table [FLIGHTINFO]
(
flight_id int primary key not null,
air_id int foreign key references AIRLINE(air_id) on update cascade on delete cascade default null,
from_location varchar(15),
to_location varchar(15),
flight_date varchar(10),
totalseats int,
leftseats int,
price int
)

create table [RAILWAY]
(
railway_id int primary key not null,
railway_name varchar(30) not null,
)

create table [TRAININFO]
(
train_id int primary key not null,
train_date varchar(10),
railway_id int foreign key references [RAILWAY](railway_id) on update cascade on delete cascade default null,
departure varchar(15),
arrival varchar(15),
totalseats int,
leftseats int,
price int
)

create table [BOOKING]
(
booking_id int not null primary key, 
user_id varchar(20) foreign key references [USER](user_id) on update cascade on delete cascade default null,
booking_type int not null,  -- 1> movie 2> airline 3> railway
payment_method varchar(15) check (payment_method = 'cash' or payment_method = 'card')
)
--INSERT into [BOOKING] values(1,N'farouq',1,N'cash')
--INSERT into [CINEMAS] values(1,N'Cinestar',N'Township')
--INSERT into [THEATRE] values(1,N'Inception',1,'2018-05-28',50,50,600)
--INSERT into [CINEMABOOKING] values (1 , 1)
create table [TRAINBOOKING]
(
booking_id int foreign key references BOOKING(booking_id) on update cascade on delete cascade default null,
booking_idtrain int foreign key references [TRAININFO](train_id) on update cascade on delete cascade default null ,
)

create table [CINEMABOOKING]
(
booking_id int foreign key references BOOKING(booking_id) on update cascade on delete cascade default null,
booking_idcinema int foreign key references [THEATRE](theatre_id) on update cascade on delete cascade default null,
)

create table [FLIGHTBOOKING]
(
booking_id int foreign key references BOOKING(booking_id) on update cascade on delete cascade default null,
booking_idairline int  foreign key references [FLIGHTINFO](flight_id) on update cascade on delete cascade default null,

)


select * from [ADMIN]
select * from [USER]
--delete from [USER]
select * from [CARDDETAILS]
select * from [CINEMAS]
select * from [THEATRE]
select * from [AIRLINE]
--insert into [AIRLINE] Values (1, 'PIA')
--insert into [FLIGHTINFO] Values (1,1,'lahore','karachi','23-02-2018',25,21,60000)
 
select * from [FLIGHTINFO]
select * from [RAILWAY]
select * from [TRAININFO]
--Insert into RAILWAY values(1,'PakTrain')
--INSERT into TRAININFO Values(1,'23-5-18',1,'lahore','karachi',25,25,1200)
select * from [BOOKING]
select * from [CINEMABOOKING]
select * from [FLIGHTBOOKING]
select * from [TRAINBOOKING]
update [THEATRE] set movie_date = '2018-05-14' where theatre_id = 2

------------------------------------------------------PROCEDURES------------------------------------------------------


--LOGIN
drop procedure [Userlogin]
go
create procedure [Userlogin] @username varchar(20), @password varchar(30), @email varchar(320) output
as begin 
if exists ( select *  from [USER] where user_id=@username) 
begin 
select @email=email from [USER] where user_id=@username and passphrase=@password; 
update [USER] set login_status = 'ON' where email = @email; 
end 
else 
begin 
print 'login failed' 
end 
end

--LOGOUT
drop procedure [Userlogout]
go
create procedure [Userlogout] @email varchar(320)
as begin 
if exists ( select *  from [USER] where email = @email)
begin 
update [USER] set login_status = 'OFF' where email = @email; 
end 
else 
begin 
print 'logout failed' 
end 
end


--SignUp
drop procedure [signup]
go
create procedure signup @username varchar(20), @fname varchar(15), @lname varchar(15), @password varchar(30), @email varchar(320) , @age int , @phone bigint , @gender char , @card_provided char , @card_no bigint , @card_type char , @exp_month int , @exp_date int , @userType int
as begin
if(@userType = 0)
begin
if exists ( (select * from [USER] where user_id=@username) UNION (select * from [USER] where email=@email)) 
begin 
print 'this username or email is already taken. Use another one' 
end 
else 
begin 
if (@age >= 18 and @phone >= 100000000000 and @phone <= 9999999999999)
begin
if(@card_provided = 'Y')
begin
insert into [USER] values (@username,@email,@fname,@lname,@password,'OFF',@age,@phone,@gender,@card_provided);
insert into [CARDDETAILS] values (@username,@card_no,@card_type,@exp_month,@exp_date);
end
else
begin
insert into [USER] values (@username,@email,@fname,@lname,@password,'OFF',@age,@phone,@gender,@card_provided);
end
end
else
begin
print 'Requirements not Fulfilled'
end
if(@userType = 1)
begin
declare @admin_id int
select @admin_id = count(*) from [ADMIN]
set @admin_id = @admin_id + 1
insert into [ADMIN] ([admin_id] 
	  ,[email]
      ,[admin_fname]
      ,[admin_lname]
      ,[passphrase]
      ,[login_status]
	  ,[age]
      ,[phone]
      ,[gender]) values
 
  (@admin_id, @email, @fname, @lname, @password, 'OFF' , @age, @phone , @gender);
end
end
end
end

drop procedure adminsignup
go
create procedure adminsignup  @fname varchar(15), @lname varchar(15), @password varchar(30), @email varchar(320) , @age int , @phone bigint , @gender char , @userType int
as begin
if(@userType = 1)
begin
declare @admin_id int
select @admin_id = count(*) from [ADMIN]
set @admin_id = @admin_id + 1
insert into [ADMIN] ([admin_id] 
	  ,[email]
      ,[admin_fname]
      ,[admin_lname]
      ,[passphrase]
      ,[login_status]
	  ,[age]
      ,[phone]
      ,[gender]) values
 
  (@admin_id, @email, @fname, @lname, @password, 'OFF' , @age, @phone , @gender);
end
end



--ADMIN LOGIN
drop procedure [Adminlogin]
go
create procedure [Adminlogin] @admin_id int, @password varchar(30), @email varchar(320) output
as begin 
if exists ( select *  from [ADMIN] where admin_id=@admin_id) 
begin 
select @email=email from [ADMIN] where admin_id=@admin_id and passphrase=@password; 
update [ADMIN] set login_status = 'ON' where email = @email; 
end 
else 
begin 
print 'login failed' 
end 
end

--ADMIN LOGOUT
drop procedure [Adminlogout]
go
create procedure [Adminlogout] @email varchar(320)
as begin 
if exists ( select *  from [ADMIN] where email = @email)
begin 
update [ADMIN] set login_status = 'OFF' where email = @email; 
end 
else 
begin 
print 'logout failed' 
end 
end


------------FLIGHT INFO PROCEDURE
drop procedure showflightinfo
go
create procedure showflightinfo
@departure varchar(20) ,
@arrival varchar(20)   

as 
	begin
	declare @t table(flight_id int,air_id int ,from_location varchar(15),to_location varchar(15),flight_date varchar(10),totalseats int,leftseats int,price int)

	INSERT into @t
	Select  *
	from [FLIGHTINFO]
	where  from_location=@departure AND to_location = @arrival 


	Select *
	from @t

	end 

--------Train INFO PROCEDURE
drop procedure showtraininfo
go
create procedure showtraininfo
@departure varchar(20) ,
@arrival varchar(20)   

as 
	begin
	declare @t table(train_id int ,train_date varchar(10), railway_id int,departure varchar(15),arrival varchar(15),totalseats int,leftseats int,price int)

	INSERT into @t
	Select  *
	from [TRAININFO]
	where  departure=@departure AND arrival = @arrival 


	Select *
	from @t

	end 
-------------------- SHOW Showing times
drop procedure showmovietimes
go
create procedure showmovietimes
@moviename varchar(30)
as 
	begin

	declare @t table(info_cinema_id int, info_cinema_name varchar (30), info_location varchar (15) , info_theatre_id int ,info_movie_name varchar(30)  ,info_movie_date varchar(10),info_totalseats int,info_leftseats int,info_price int)
	INSERT into @t
	select [CINEMAS].cinema_id , cinema_name , location , theatre_id , movie_name , movie_date , totalseats , leftseats , price
	from [CINEMAS] join [THEATRE] on [CINEMAS].cinema_id = [THEATRE].cinema_id
	where movie_name = @moviename

	select * 
	from @t

	end


---------------------------BookTicket------------------------------------------
drop procedure bookSomething
go 

create procedure bookSomething
@bookingType int , @user_name varchar(20) , @item_id int , @payment varchar(4) 
as
	begin

	declare @book_id int
	select @book_id = count(booking_id) from [BOOKING]
	set @book_id = @book_id +  1
	insert into [BOOKING] ([booking_id] , [user_id] ,[booking_type] ,[payment_method]) values (@book_id , @user_name , @bookingType , @payment);
	if(@bookingType = 1)
		begin
		insert into [CINEMABOOKING]([booking_id] , [booking_idcinema]) values (@book_id,@item_id);
		end
		if(@bookingType = 2)
		begin
		insert into [FLIGHTBOOKING]([booking_id] , [booking_idairline]) values (@book_id,@item_id);
		end
		if(@bookingType = 3)
		begin
		insert into [TRAINBOOKING]([booking_id] , [booking_idtrain]) values (@book_id,@item_id);
		end
	end
go
-----------------------------------------------------------------------------
drop procedure cancelbooking

create procedure cancelbooking
@bookingType int , @user_name varchar(20) , @book_id int , @payment varchar(4) 
as
	begin

	
	
	if(@bookingType = 1)
		Delete from [CINEMABOOKING] where booking_id= @book_id
		Delete from [Booking] where [BOOKING].booking_id  = @book_id
		if(@bookingType = 2)
		Delete from [FLIGHTBOOKING] where booking_id= @book_id
		Delete from [Booking] where [BOOKING].booking_id  = @book_id
		if(@bookingType = 3)
		Delete from [TRAINBOOKING] where booking_id= @book_id
		Delete from [Booking] where [BOOKING].booking_id  = @book_id
	end
go





---------------------------------------------------------DisplayBookingInfo-------------------------
--drop procedure getbookinginfo
--go
create procedure getbookinginfo
@bookingid int 
as 
	begin
	declare @t table(booking_id int , user_id varchar(20) ,booking_type int ,   payment_method varchar(15) , booking_idMovie int , booking_idcinema int)  
	declare @t1 table(booking_id int , user_id varchar(20) ,booking_type int ,   payment_method varchar(15) , booking_id2 int , booking_idairline int)
	declare @t2 table(booking_id int , user_id varchar(20) ,booking_type int ,   payment_method varchar(15) , booking_idd int , booking_idtrain int)
	declare @var1 int

	select @var1 = booking_id from [BOOKING] where booking_id =@bookingid
	if(@var1 = 1)
	--movie
		begin
		Insert into @t
		select *
		from BOOKING join [CINEMABOOKING] on [BOOKING].booking_id = [CINEMABOOKING].booking_id
		where [BOOKING].booking_id = @bookingid
	end
	else if (@var1 = 2)
		begin
		insert into @t1
		select *
		from [BOOKING] join [FLIGHTBOOKING] on [BOOKING].booking_id = [FLIGHTBOOKING].booking_id
		where [BOOKING].booking_id = @bookingid
		end
	else
		begin
		insert into @t2
		select *
		from [BOOKING] join [TRAINBOOKING] on [BOOKING].booking_id = [TRAINBOOKING].booking_id
		where [BOOKING].booking_id = @bookingid
		end
	end
go

-----------------------------------showActiveUsers-------------------------
drop procedure showactiveusers
go
create procedure showactiveusers
as
	begin
	declare @t table(user_id varchar(20) ,email varchar(320) unique,user_fname varchar (15),user_lname varchar (15),passphrase varchar (30),login_status varchar(3) ,age int ,phonenum bigint ,gender char ,card_provided char )

	insert into @t
	select *
	from [USER]
	where login_status = 'ON'


	end
go

drop procedure addCinemaAdmin
go 
create procedure addCinemaAdmin
@cname varchar(30) , @loc varchar(30)
as
	begin
	declare @cid int
	Select @cid = count(*) from [CINEMAS]
	set @cid = @cid + 1
	if(@cid > 0 AND @cname != '' AND @loc != '')
	begin
		insert into [CINEMAS] values (@cid ,@cname,@loc);
	end
	end
go

drop procedure addMoviesAdmin
go 
create procedure addMoviesAdmin
@cid int, @tid int , @movieName varchar(30) , @movieDate varchar(10) , @tSeats int , @price int 
as
	begin
	declare @cidLimit int
	Select @cidLimit = count(*) from [CINEMAS]
	if(@cid > 0 AND @cid <= @cidLimit AND @movieName != '' AND @tSeats > 0 AND @price > 0  )
	begin
		insert into [THEATRE] values (@tid,@movieName,@cid,@movieDate,@tSeats,@tSeats,@price);
	end
	else
	begin
	insert into [THEATRE] values (0,0,0,N'2018-05-14',0,0,0);
	end
	end
go

drop procedure addRailwayAdmin
go 
create procedure addRailwayAdmin
@tname varchar(30)
as
	begin
	declare @rid int
	Select @rid = count(*) from [RAILWAY]
	set @rid = @rid + 1
	if(@rid > 0 AND @tname != '')
	begin
		insert into [RAILWAY] values (@rid ,@tname);
	end
	end
go

drop procedure addTrainAdmin
go 
create procedure addTrainAdmin
@rid int, @tid int , @arrival varchar(30) ,@departure varchar(30) , @tripDate varchar(10) , @tSeats int , @price int 
as
	begin
	declare @ridLimit int
	Select @ridLimit = count(*) from [RAILWAY]
	if(@rid > 0 AND @rid <= @ridLimit AND @arrival != '' AND @departure != '' AND @tSeats > 0 AND @price > 0  )
	begin
		insert into [TRAININFO] values (@tid,@tripDate,@rid,@departure,@arrival,@tSeats,@tSeats,@price);
	end
	else
	begin
	insert into [TRAININFO] values (0,0,0,N'2018-05-14',0,0,0,0);
	end
	end
go

drop procedure addAirlineAdmin
go 
create procedure addAirlineAdmin
@tname varchar(30)
as
	begin
	declare @rid int
	Select @rid = count(*) from [AIRLINE]
	set @rid = @rid + 1
	if(@rid > 0 AND @tname != '')
	begin
		insert into [AIRLINE] values (@rid ,@tname);
	end
	end
go

drop procedure addFlightAdmin
go 
create procedure addFlightAdmin
@rid int, @tid int , @arrival varchar(30) ,@departure varchar(30) , @tripDate varchar(10) , @tSeats int , @price int 
as
	begin
	declare @ridLimit int
	Select @ridLimit = count(*) from [AIRLINE]
	if(@rid > 0 AND @rid <= @ridLimit AND @arrival != '' AND @departure != '' AND @tSeats > 0 AND @price > 0  )
	begin
		insert into [FLIGHTINFO] values (@tid,@rid,@departure,@arrival,@tripDate,@tSeats,@tSeats,@price);
	end
	else
	begin
	insert into [TRAININFO] values (0,0,0,N'2018-05-14',0,0,0,0);
	end
	end
go


----------------------------------------------------------------------TRIGGERS-----------------------------------------------
----Add Admin 
drop trigger addAdmin
go
create trigger addAdmin
on [ADMIN]
instead of INSERT
AS
BEGIN
 
declare @email varchar(320); 
declare @fname varchar(15), @admin_id int, @lname varchar(15), @gn char, @ph bigint, @age int , @password varchar(30);
select @email = [email] from inserted;  
select @fname = [admin_fname] from inserted;
select @lname = [admin_lname] from inserted; 
select @gn = [gender] from inserted;
select @ph = [phone] from inserted;
select @password = [passphrase] from inserted;
select @age = [age] from inserted; 
if not exists (select * from [ADMIN] where email = @email)
begin
if (@age >= 18 and @ph >= 100000000000 and @ph <= 9999999999999)
begin
select @admin_id = count(*) from [ADMIN]
set @admin_id = @admin_id + 1
insert into [ADMIN] ([admin_id] 
	  ,[email]
      ,[admin_fname]
      ,[admin_lname]
      ,[passphrase]
      ,[login_status]
	  ,[age]
      ,[phone]
      ,[gender]) values
 
  (@admin_id, @email, @fname, @lname, @password, 'OFF' , @age, @ph , @gn);
   
end 
else
begin
print 'Age or Phone Number Requirements not fulfilled'
end
end
else
begin
print 'Admin not Added due to violation of requirements'
end 
END

go
create trigger cinemaseatsleft on [CINEMABOOKING]
after insert
as begin
declare @var3 int
select @var3 = booking_idcinema from inserted
update THEATRE set leftseats = leftseats - 1 where theatre_id = @var3
end

go
create trigger trainseatsleft on [TRAINBOOKING]
after insert
as begin
declare @var3 int
select @var3 = booking_idtrain from inserted
update TRAININFO set leftseats = leftseats - 1 where train_id = @var3
end

go
create trigger flightseatsleft on [FLIGHTBOOKING]
after insert
as begin
declare @var3 int
select @var3 = booking_idairline from inserted
update FLIGHTINFO set leftseats = leftseats - 1 where flight_id = @var3
end

drop trigger addflight
go
create trigger addflight
on [FLIGHTINFO]
instead of INSERT
AS
BEGIN
declare @flight_id int, @air_id int, @departure varchar(15),  @arrival varchar(15), @flight_date varchar(10), @totalseats int , @leftseats int ,@price int;
select @flight_id = flight_id from inserted;
select @air_id = [air_id] from inserted;  
select @departure = [from_location] from inserted;
select @arrival = [to_location] from inserted;
select @flight_date = [flight_date] from inserted;
select @totalseats = [totalseats] from inserted; 
select @leftseats = [leftseats] from inserted;
select @price = [price] from inserted;
if not exists (select * from [FLIGHTINFO] where flight_id = @flight_id)
begin
insert into [FLIGHTINFO] 
(
[flight_id],[air_id] ,[from_location] ,[to_location] ,[flight_date],[totalseats] ,[leftseats],[price] 
)
values(@flight_id, @air_id, @departure,  @arrival, @flight_date, @totalseats , @leftseats , @price);
end 
else
begin
print 'flight_id is already taken'
end
END

drop trigger addtraintrip
go
create trigger addtraintrip
on [TRAININFO]
instead of INSERT
AS
BEGIN
declare @train_id int, @train_date varchar(10), @railway_id int,  @departure varchar(15),@arrival varchar(15), @totalseats int , @leftseats int , @price int;
select @train_id  = [train_id]  from inserted;
select @train_date = [train_date] from inserted;  
select @railway_id = [railway_id] from inserted;
select @departure = [departure] from inserted;
select @arrival = [arrival] from inserted;
select @totalseats = [totalseats] from inserted; 
select @leftseats = [leftseats] from inserted;
select @price = [price] from inserted;
if not exists (select * from [TRAININFO] where train_id = @train_id)
begin
insert into [TRAININFO] 
(
[train_id],[train_date] ,[railway_id],[departure] ,[arrival] ,[totalseats] ,[leftseats] ,[price] 
)
values(@train_id, @train_date,@railway_id, @departure,  @arrival, @totalseats , @leftseats , @price);
end 
else
begin
print 'train_id is already taken'
end
END

go
create trigger addcinema
on [CINEMAS]
instead of INSERT
AS
BEGIN
declare @cinema_id int, @cinema_name varchar(30),  @location varchar(15);
select @cinema_id  = [cinema_id]  from inserted;
select  @cinema_name= [cinema_name] from inserted;  
select @location = [location] from inserted;
if not exists (select * from [CINEMAS] where cinema_id = @cinema_id)
begin
insert into [CINEMAS] 
(
[cinema_id],[cinema_name] ,[location]
)
values(@cinema_id, @cinema_name,  @location);
end 
else
begin
print 'cinema id is already taken'
end
END

drop trigger addtheatre
go
create trigger addtheatre
on [THEATRE]
instead of INSERT
AS
BEGIN
declare @theatre_id int, @movie_name varchar(30), @cinema_id int, @totalseats int , @leftseats int , @price int , @movie_date varchar(10);
select @theatre_id  = [theatre_id]  from inserted;
select @movie_name = [movie_name] from inserted;  
select @cinema_id = [cinema_id] from inserted;
select @totalseats = [totalseats] from inserted; 
select @leftseats = [leftseats] from inserted;
select @price = [price] from inserted;
select @movie_date = [movie_date] from inserted;
if not exists (select * from [THEATRE] where theatre_id = @theatre_id AND [cinema_id] = @cinema_id)
begin
if(@theatre_id != 0)
begin
insert into [THEATRE] 
(
[theatre_id],[movie_name] ,[cinema_id],[totalseats] ,[leftseats] , [price] ,[movie_date]
)
values(@theatre_id , @movie_name, @cinema_id, @totalseats , @leftseats , @price , @movie_date);
end
end 
else
begin
print 'theatre id is already taken'
end
END

go
create trigger addairline
on [AIRLINE]
instead of INSERT
AS
BEGIN
declare @air_id int, @air_name varchar(30);
select @air_id  = [air_id]  from inserted;
select @air_name = [air_name] from inserted;  
if not exists (select * from [AIRLINE] where air_id = @air_id)
begin
insert into [AIRLINE] 
(
[air_id], [air_name]  
)
values(@air_id , @air_name);
end 
else
begin
print 'airline id is already taken'
end
END

go
create trigger addrail
on [RAILWAY]
instead of INSERT
AS
BEGIN
declare @railway_id int, @railway_name varchar(30) ;
select @railway_id  = [railway_id]  from inserted;
select @railway_name = [railway_name] from inserted;  
if not exists (select * from [RAILWAY] where railway_id = @railway_id)
begin
insert into [RAILWAY] 
(
[railway_id], [railway_name] 
)
values(@railway_id , @railway_name);
end 
else
begin
print 'railway id is already taken'
end
END

go



--drop trigger deletedcinemaseatsleft
create trigger deletedcinemaseatsleft on [CINEMABOOKING]
after delete
as begin
declare @var3 int
select @var3 = booking_idcinema from deleted
update THEATRE set leftseats = leftseats + 1 where theatre_id = @var3
end

--drop trigger deletedtrainseatsleft
go
create trigger deletedtrainseatsleft on [TRAINBOOKING]
after delete
as begin
declare @var3 int
select @var3 = booking_idtrain from deleted
update TRAININFO set leftseats = leftseats + 1 where train_id = @var3
end

go
--drop trigger deletedflightseatsleft
create trigger deletedflightseatsleft on [FLIGHTBOOKING]
after delete
as begin
declare @var3 int
select @var3 = booking_idairline from deleted
update FLIGHTINFO set leftseats = leftseats + 1 where flight_id = @var3
end