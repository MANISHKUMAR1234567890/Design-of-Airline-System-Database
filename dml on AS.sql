use AIRLINE_SYSTEM;

insert into airport (airport_id, airport_name, location, country) 
VALUES (1, 'John F. Kennedy International Airport', 'New York', 'USA'),
       (2, 'Heathrow Airport', 'London', 'UK'),
       (3, 'Indira Gandhi International Airport', 'Delhi', 'India');


insert into passenger (passenger_id, passenger_name, email, contact, passport_number, gender, age)
VALUES (1, 'John Doe', 'johndoe@example.com', '1234567890', '1234567', 'M', 30),
       (2, 'Jane Smith', 'janesmith@example.com', '0987654321', '7654321', 'F', 28),
       (3, 'Sam Patel', 'sampatel@example.com', '1122334455', '9876543', 'M', 35);
       
insert into airline (airline_id, name) 
VALUES (1, 'American Airlines'),
       (2, 'British Airways'),
       (3, 'Air India');
       
INSERT INTO flight (flight_id, flight_number, departure_time, available_seats, arrival_time, arrival_airport_id, departure_airport_id, airline_id) 
VALUES (1, '101', '2024-10-08 08:00:00', 150, '2024-10-08 12:00:00', 1, 2, 1),
       (2, '202', '2024-10-09 09:00:00', 180, '2024-10-09 13:00:00', 2, 3, 2),
       (3, '303', '2024-10-10 10:00:00', 200, '2024-10-10 14:00:00', 3, 1, 3);
       
INSERT INTO booking (booking_id, flight_id, passenger_id, booking_date, seat_no, class) 
VALUES (1, 1, 1, '2024-10-01 10:00:00', '12', 'Economy'),
       (2, 2, 2, '2024-10-02 11:00:00', '14', 'Business'),
       (3, 3, 3, '2024-10-03 12:00:00', '16', 'Economy');
       
INSERT INTO payment (payment_id, booking_id, amount, payment_date, payment_method) 
VALUES (1, 1, 500.00, '2024-10-01 12:00:00', 'Credit Card'),
       (2, 2, 700.00, '2024-10-02 13:00:00', 'Debit Card'),
       (3, 3, 600.00, '2024-10-03 14:00:00', 'PayPal');

INSERT INTO crew (crew_id, crew_name, role, flight_id) 
VALUES (1, 'Alice Johnson', 'Pilot', 1),
       (2, 'Bob Williams', 'Co-Pilot', 2),
       (3, 'Charlie Davis', 'Flight Attendant', 3);



desc flight  ;


alter table passenger modify passport_number varchar(10) not null;

desc passenger;

alter table flight modify flight_number varchar(50) not null;

select * from passenger;
update passenger set passport_number='A1234567' where passenger_id=1;
update passenger set passport_number='B7654321' where passenger_id=2;
update passenger set passport_number='C1634567' where passenger_id=3;

select * from passenger;

select * from booking;
delete from crew where crew_id=3;


select * from crew;
select * from passenger;
delete from passenger where passenger_id=3;
select * from payment;

delete from booking where booking_id=2; 


select * from booking;
