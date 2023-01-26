-- Active: 1674719375177@@127.0.0.1@3306@my_app
show DATABASES;

show tables;

CREATE table tab1(
    name varchar(20),
    age dec(3),
    address varchar(30)
);

desc tab1;

ALTER table tab1 MODIFY age dec(3) not null;

insert into tab1 values('Himanshu',20,'Delhi',null);

insert into tab1 values("Vishal",17,"Mumbai",null);

insert into tab1 values("Vineet",25,"Pune",null);
insert into tab1 values("Sumit",23,"Hyderabd",null);
insert into tab1 values("Mayank",27,"Noida",null);
insert into tab1 values("Naqvi",17,"Noida",null);
insert into tab1 values("Christian",17,"Mumbai",null);
insert into tab1 values("Shubham",22,"Delhi",null);

insert into tab1(age, address) values(29,'Hodal');

select * from tab1;


delete from tab1 where address='Hodal';

alter table tab1 add COLUMN email VARCHAR(255);

alter table tab1 add COLUMN lastname VARCHAR(20);

alter table tab1 drop COLUMN lastname;


TRUNCATE tab1;


select * from tab1;


select count(DISTINCT(address)) from tab1;


