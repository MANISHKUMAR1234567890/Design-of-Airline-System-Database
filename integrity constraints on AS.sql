create database AIRLINE_SYSTEM;
use AIRLINE_SYSTEM;

CREATE TABLE airport (
airport_id INT,
airport_name VARCHAR(100),
location VARCHAR(50),
country VARCHAR(50)
); 
desc airport;
CREATE TABLE passenger (
    passenger_id INT,
    passenger_name VARCHAR(50),
    email VARCHAR(100),
    contact VARCHAR(20),
    passport_number VARCHAR(20),
    gender varchar(1),
    age int
);
desc passenger;
CREATE TABLE airline (
    airline_id INT,
    name VARCHAR(100)
);
desc airline;
CREATE TABLE Flight (
    flight_id INT,
    flight_number VARCHAR(10),
    departure_time DATETIME,
    available_seats int,
    arrival_time DATETIME,
    arrival_airport_id INT,
    departure_airport_id INT,
    airline_id INT
);
desc flight;
CREATE TABLE booking (
    booking_id INT,
    flight_id INT,
    passenger_id INT,
    booking_date DATETIME,
    seat_no VARCHAR(5),
    class VARCHAR(20)
);
desc booking;
CREATE TABLE Payment (
    payment_id INT,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_date DATETIME,
    payment_method VARCHAR(20)
);
desc payment;
CREATE TABLE crew (
    crew_id INT,
    crew_name VARCHAR(50),
    role VARCHAR(50),
    flight_id INT
);
desc crew; 
alter table airport add primary key(airport_id);
alter table airport modify location varchar(50) not null;
desc airport;

alter table passenger add primary key(passenger_id);
alter table passenger add unique(email);
alter table passenger add unique(passport_number);
alter table passenger modify passport_number int not null;
desc passenger; 

alter table airline add primary key(airline_id);
desc airline;

alter table flight add primary key(flight_id);
alter table flight add unique(flight_number);
alter table flight modify flight_number int not null;
alter table flight add foreign key(airline_id) references airline(airline_id) on delete cascade;
alter table flight add foreign key(arrival_airport_id) references airport(airport_id) on delete cascade;
alter table flight add foreign key(departure_airport_id) references airport(airport_id) on delete cascade;
desc flight; 
alter table booking add primary key(booking_id);
alter table booking add foreign key(flight_id) references flight(flight_id) on delete cascade;
alter table booking add foreign key(passenger_id) references passenger(passenger_id)on delete cascade;
desc booking;
alter table payment add primary key(payment_id);
alter table payment add foreign key(booking_id) references booking(booking_id) on delete cascade;
desc payment;
alter table crew add primary key(crew_id);
alter table crew add foreign key(flight_id) references flight(flight_id) on delete cascade;
desc crew;


-- drop database airline_system;
