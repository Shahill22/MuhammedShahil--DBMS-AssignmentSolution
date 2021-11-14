Create Database if not exists `TravelOnGo` ;
use `TravelOnGo`;


create table if not exists `passenger`(
`Passenger_name` varchar(50) NULL DEFAULT NULL,
`Category` varchar(10),
`Gender` char,
`Boarding_City` varchar(50), 
`Destination_City` varchar(50),
`Distance` int NOT NULL,
`Bus_Type` varchar(50)
);


create table if not exists `price`(
`Bus_Type` varchar(50),
`Distance` int NOT NULL,
`price` int  NULL DEFAULT NULL
);

insert into `passenger` values("Sejal","AC",'F',"Bengaluru","Chennai",350,"Sleeper");
insert into `passenger` values("Anmol","Non-AC",'M',"Mumbai","Hyderabad",700,"Sitting");
insert into `passenger` values("Pallavi","AC",'F',"Panaji","Bengaluru",600,"Sleeper");
insert into `passenger` values("Khusboo","AC",'F',"Chennai","Mumbai",1500,"Sleeper");
insert into `passenger` values("Udit","Non-AC",'M',"Trivandrum","Panaji",1000,"Sleeper");
insert into `passenger` values("Ankur","AC",'M',"Nagpur","Hyderabad",500,"Sitting");
insert into `passenger` values("Hemant","Non-AC",'M',"Panaji","Mumbai",700,"Sleeper");
insert into `passenger` values("Manish","Non-AC",'M',"Hyderabad","Bengaluru",500,"Sitting");
insert into `passenger` values("Piyush","AC",'M',"Pune","Nagpur",700,"Sitting");


insert into `price` values("Sleeper",350,770);
insert into `price` values("Sleeper",500,1100);
insert into `price` values("Sleeper",600,1320);
insert into `price` values("Sleeper",700,1540);
insert into `price` values("Sleeper",1000,2200);
insert into `price` values("Sleeper",1200,2640);
insert into `price` values("Sleeper",350,434);
insert into `price` values("Sitting",500,620);
insert into `price` values("Sitting",500,620);
insert into `price` values("Sitting",600,744);
insert into `price` values("Sitting",700,868);
insert into `price` values("Sitting",1000,1240);
insert into `price` values("Sitting",1200,1488);
insert into `price` values("Sitting",1500,1860);

select Gender,count(Gender) as Total from passenger where distance<=600 group by gender; 

select bus_type,min(price) from price where Bus_Type='sleeper';

select Passenger_name from passenger where passenger_name like 'S%' group by passenger_name;

select DISTINCT p.Passenger_name,p.Boarding_City,p.Destination_City,p.bus_type,pr.price from passenger p left join `price`pr on p.distance=pr.distance and p.bus_type=pr.bus_type;

select DISTINCT p.Passenger_name,pr.price from passenger p inner join `price` pr on p.distance =pr.distance where p.distance=1000 and p.bus_type='sitting';

select DISTINCT p.Passenger_name,pr.bus_type,pr.price from passenger p inner join `price` pr on p.distance=pr.distance where p.passenger_name='pallavi';

select DISTINCT distance from passenger order by distance desc;

select passenger_name,distance * 100.0 / (select sum(distance) from passenger) as percentage FROM passenger;

select price.distance,price.price,
Case
    when price.price> 1000 then 'Expensive'
    when price.price <1000 and price.price >500 then 'Average'
    Else 'Cheap'
End as category from price;







