create database insurence_1BM23CS075;

use insurence_1BM23CS075;
show tables;
create table person(
	driver_id varchar(10),
	name varchar(20),
    address varchar(30), 
    primary key(driver_id));
    
desc person;
insert into person values('A01','Richard' ,'Srinivasa nagar');
insert into person values('A02' , 'Pradeep' ,'Rajaj Nagar');
insert into person values('A03' ,'Smith' , 'Ashok Nagar');
insert into person values('A04' ,'Venu' , 'N R Colony');
insert into person values('A05','Jhon' , 'Hnumanth nagar');

select * from person;


create table car(
	reg_num varchar(10),
	model varchar(10),
    year int, 
    primary key(reg_num))
    ;
    
insert into car values('KA052250' , 'Indica',1990);
insert into car values('KA031181','Lancer',1957);
insert into car values('KA095477','Toyota',1998);
insert into car values('KA053408','Honda',2008);
insert into car values('KA041702','Audi',2005);

select * from car;


create table accident(
 report_num int,
 accident_date date,
 location varchar(20),
 primary key(report_num)
 );

desc accident;
delete from accident;
insert into accident values (11 ,'2001-01-03' ,'Mysore Road');
insert into accident values (12 ,'2002-02-04' ,'South end Circle');
insert into accident values (13 ,'2021-01-03' ,'Bull temple Road');
insert into accident values (14 ,'2017-02-08' ,'Mysore Road');
insert into accident values (15 ,'2004-03-05' ,'Kanakpura Road');

select * from accident;
insert into accident values(16,'2008-03-15' ,'Domulur');
select * from accident;

create table owns(
	driver_id varchar(10),
    reg_num varchar(10),
	primary key(driver_id, reg_num),
	foreign key(driver_id) references person(driver_id),
	foreign key(reg_num) references car(reg_num));

desc owns;

insert into owns values ('A01','KA052250'),('A02','KA053408'),('A03','KA031181'),('A04','KA095477'),('A05','KA041702');
select * from owns;

create table participated(
driver_id varchar(10),
 reg_num varchar(10),
report_num int,
damage_amount int,
primary key(driver_id, reg_num, report_num),
foreign key(driver_id) references person(driver_id),
foreign key(reg_num) references car(reg_num),
foreign key(report_num) references accident(report_num));

desc participated;
insert into participated values ('A01'	,'KA052250',	11,	10000) , ('A02'	,'KA053408',	12,	50000) ,('A03',	'KA095477',13,	25000) ,('A04',	'KA031181',	14	,3000) ,('A05'	,'KA041702'	,15	,5000);
select * from participated;

select accident_date, location
from ACCIDENT;

update participated set damage_amount=25000 where reg_num="KA053408"  and report_num =12;

select driver_id
from PARTICIPATED
where damage_amount >=25000;
