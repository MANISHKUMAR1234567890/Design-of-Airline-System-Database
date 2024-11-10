use airline_system;

-- natural join 
select p.passenger_name, p.passport_number from passenger p join booking b on
 p.passenger_id=b.passenger_id where b.booking_date='2024-10-01 10:00:00';
 
 -- self join
 select c.crew_name from crew c join crew cr on 
 c.role=cr.role and c.flight_id<>cr.flight_id;
 
 -- inner join
 SELECT p.passenger_name, p.contact, p.email, b.seat_no, f.flight_number, a1.location 
AS departure_location, a2.location AS arrival_location
FROM Passenger p 
inner JOIN Booking b ON p.passenger_id = b.passenger_id
inner JOIN Flight f ON b.flight_id = f.flight_id
inner JOIN Airport a1 ON f.departure_airport_id = a1.airport_id
inner JOIN Airport a2 ON f.arrival_airport_id = a2.airport_id
WHERE f.flight_number='101' and
a1.location='London'
  AND b.class = 'Economy'
  AND f.departure_time = '2024-10-08 08:00:00';
  


-- left join 
SELECT f.flight_number, a.name as airline_name from flight f left join airline a on 
f.airline_id=a.airline_id;
  

-- right join 
SELECT a.airport_name, f.flight_number, f.departure_time
FROM Flight f 
RIGHT JOIN Airport a ON f.departure_airport_id = a.airport_id;


-- full outer join 

select f.flight_number,c.crew_name from flight f left join crew c on f.flight_id=c.flight_id
union 
select f.flight_number,c.crew_name from flight f right join crew c on f.flight_id=c.flight_id;











  

  
  


