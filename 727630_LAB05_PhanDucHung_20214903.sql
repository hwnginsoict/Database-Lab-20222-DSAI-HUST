EX1
create table PhanDucHung_20214903()

create table customer(
CustomerID int primary key,
Name varchar(20),
Gender varchar(20))

create table owner(
OwnerID int primary key,
Name varchar(20))

create table room(
RoomID int primary key,
OwnerID int,
City varchar(20),
Price_per_day int,
foreign key(OwnerId) references owner(OwnerID))

create table booking(
CustomerID int,
RoomID int,
Start_date date,
End_date date,
primary key (CustomerID, RoomID, Start_date),
foreign key(CustomerID) references customer(CustomerID),
foreign key (RoomID) references room(RoomID))

insert into customer values (1, 'Hung', 'Male')

insert into owner values ('101', 'Ronaldo')
insert into owner values (102, 'Messi')

insert into room values (1, 102, 'Hanoi', 1000)
insert into room values (2, 102, 'Hanoi', 2000)

insert into booking values (1, 2, '2020-10-10', '2020-11-12')

Ex2

select o.OwnerID, Name, count(roomid) as number_of_rooms
from owner o join room r on o.ownerid = r.ownerid 
group by o.ownerid
order by number_of_rooms desc

Ex3:

select roomid, city, price_per_day
from room
where roomid not in (select room.roomid
					from (room r join booking b on r.roomid = b.roomid) as k join customer c on k.customerid = c.customerid
					 where c.gender = 'Female')

Ex4

select r.roomid, ownerid, city, price_per_day as price
from room r join booking b on r.roomid = b.roomid
group by r.roomid
having count(customerid) >= all (select count(customerid)
								from room r1 join booking b1 on r1.roomid = b1.roomid 
								group by r1.roomid)

Ex5
select o.ownerid, name, coalesce((end_date - start_date)::integer*price_per_day, 0) AS revenue
from owner o left join (room r join booking b on r.roomid = b.roomid) k on o.ownerid = k.ownerid
where date_part('year',end_date) = 2020
group by o.ownerid, revenue
order by revenue desc

Ex6

select *
from customer
where customerid in (select customerid
					from booking b join room r on b.roomid = r.roomid
					where price_per_day >= all(select price_per_day
											  from room)
					 group by customerid
					having count(start_date) >= all (select count(start_date)
												   from booking
												   group by customerid))

Ex7

select *
from owner
where ownerid in (select o.ownerid 
				 from owner o join room r on o.ownerid = r.ownerid
				 group by o.ownerid
				 having count(roomid) >= all(select count(roomid)
											 from owner o1 join room r1 on o1.ownerid = r1.ownerid 
											 group by o1.ownerid))

Ex8

select *
from owner
where ownerid not in (select ownerid
				 from room r join booking b on r.roomid = b.roomid
				 where date_part('year',start_date) = 2021
					  and date_part('month', start_date) in (10,11,12))

					  
Ex9

select * 
from room
where roomid in (select roomid
				from booking b join customer c on b.customerid = c.customerid
				 where roomid in (select roomid from booking b1 join customer c1 on b1.customerid = c1.customerid
								 where gender = 'Male')
				group by roomid
				having count(c.customerid) > 1)