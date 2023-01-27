-- Active: 1674719375177@@127.0.0.1@3306@my_app
show DATABASES;

show tables;

CREATE table tab1(
    name varchar(20),
    age dec(3),
    address varchar(30)
);

desc Products;

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


create table info(react dnd beautiful
    N1 varchar(255),
    id1 int,
    city1 varchar(255),
    income int
);

insert into info values('Employee5',26,'Delhi',300000);

select * from info;


select * from info ORDER BY city1 Desc, income ASC;

show DATABASES;

use my_app;

show tables;


use my_app;

create table Products(
    Id int,
    Prod_Name VARCHAR(255),
    Prod_Price int,
    Prod_Type VARCHAR(255)
);

INSERT into Products values (1,'A',200,'Fruits & Vegetables');
INSERT into Products values (2,'B',100,'Beverages');
INSERT into Products values (3,'C',150,'Diary');
INSERT into Products values (4,'D',500,'Branded Food');

INSERT into Products values (5,'A',200,'Eggs Food');
INSERT into Products values (6,'D',300,'Chapati Food');
INSERT into Products values (7,'C',400,'Idli Food');
INSERT into Products values (8,'B',500,'Dosa Food');
INSERT into Products values (9,'A',600,'Gahtiya Food');

DELETE  from Products where id=1;
select * from Products;


create VIEW prices as 
select Prod_Price from Products;

select * from prices;

-- Windows Functions over ->
select * , sum(Prod_Price) over(PARTITION BY Prod_Name) as 'price with same prod name' from Products;

select * , ROW_NUMBER() over(PARTITION BY Prod_Name) as 'row_num' from Products;

select * , RANK() over(PARTITION BY Prod_Name order by Prod_Price DESC) as 'rank' from Products;

select * , DENSE_RANK() over(PARTITION BY Prod_Name order by Prod_Price DESC) as 'rank' from Products;

-- Transactions starts from MASTER_HEARTBEAT_PERIOD

SET autocommit =0;

select * from Products;

START TRANSACTION;

insert into Products values(004,'Himanshu',04011999,'Human');
COMMIT;

ROLLBACK;


insert into Products values(004,'Hims',04011999,'Human');
SAVEPOINT s1;

insert into Products values(004,'Himu',04011999,'Human');

SAVEPOINT s2;
commit;

ROLLBACK to s1;

select * from Products;


-- Rollups and Cubes


create table t1(
    continent_1 varchar(255),
    country_1 varchar(255),
    city_1 VARCHAR(255),
    units_1 int
);

insert into t1 values('NORTH AMERICA','USA','NEW YORK',23);

insert into t1 values('NORTH AMERICA','USA','NEW YORK',24);
insert into t1 values('NORTH AMERICA','USA','NEW YORK',29);
insert into t1 values('NORTH AMERICA','USA','NEW YORK',45);
insert into t1 values('NORTH AMERICA','USA','NEW YORK',99);

insert into t1 values('NORTH AMERICA','CANADA','OTTAWA',32);

insert into t1 values('NORTH AMERICA','CANADA','OTTAWA',78);
insert into t1 values('NORTH AMERICA','CANADA','OTTAWA',77);
insert into t1 values('NORTH AMERICA','CANADA','OTTAWA',89);
insert into t1 values('EUROPE','ENGLAND','LONDON',65);

insert into t1 values('EUROPE','ENGLAND','CARDIFF',90);

insert into t1 values('EUROPE','ENGLAND','LONDON',32);

insert into t1 values('ASIA','INDIA','DELHI',21);

insert into t1 values('ASIA','INDIA','DELHI',65);
insert into t1 values('ASIA','INDIA','DELHI',90);
insert into t1 values('ASIA','INDIA','DELHI',68);

insert into t1 values('ASIA','PAKISTAN','KARACHI',32);

insert into t1 values('ASIA','PAKISTAN','KARACHI',12);

insert into t1 values('ASIA','BANGLADESH','DHAKA',56);

insert into t1 values('ASIA','BANGLADESH','DHAKA',92);

insert into t1 values('AUSTRALIA','AUSTRALIA','SYDNEY',32);

insert into t1 values('AUSTRALIA','AUSTRALIA','SYDNEY',121);
insert into t1 values('AUSTRALIA','AUSTRALIA','SYDNEY',78);


insert into t1 values('AUSTRALIA','NEW ZEALAND','WELLINGTON',43);

insert into t1 values('AUSTRALIA','NEW ZEALAND','WELLINGTON',67);
insert into t1 values('AUSTRALIA','NEW ZEALAND','WELLINGTON',89);

insert into t1 values('AUSTRALIA','NEW ZEALAND','WELLINGTON',34);
select * from t1;


select continent_1,sum(units_1) from t1 group by city_1,country_1,continent_1;

select continent_1, country_1,city_1,sum(units_1)  from t1 group by continent_1,country_1,city_1 WITH ROLLUP;

-- in case of WITH CUBE all combinations it will return


-- Indexing

explain select * from t1 where units_1 >= 21 && units_1 <= 22;

create INDEX indx1 on t1(units_1);

drop INDEX indx1 on t1;