use airline_system;
show tables;
-- single table view
create view flight_detail as 
select flight_number , departure_time, arrival_time
from flight;

select * from flight_detail;

-- multi lable view
create view boarding_pass as
select P.passenger_name as Name, P.passport_number, F.flight_number, A1.location as
 from_location, A1.country as from_country,
A2.location as to_location  , A2.country as to_country, B.class, B.seat_no, F.departure_time 
as Time
from passenger P join booking B on P.passenger_id=B.passenger_id
join flight F on B.flight_id=F.flight_id 
join airport A1 on F.departure_airport_id=A1.airport_id
join airport A2 on F.arrival_airport_id=A2.airport_id;

select * from boarding_pass;
select * from flight;

