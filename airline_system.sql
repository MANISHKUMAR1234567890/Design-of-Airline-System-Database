create database AIRLINE_SYSTEM;
use AIRLINE_SYSTEM;

CREATE TABLE Airport (
airport_id INT PRIMARY KEY,
airport_name VARCHAR(100),
location VARCHAR(50) NOT NULL,
country VARCHAR(50)
); 

CREATE TABLE Passenger (
    passenger_id INT PRIMARY KEY,
    passenger_name VARCHAR(50),
    email VARCHAR(100) unique,
    contact VARCHAR(20),
    passport_number VARCHAR(20) unique NOT NULL,
    gender varchar(1),
    age int
);

CREATE TABLE Airline (
    airline_id INT PRIMARY KEY,
    name VARCHAR(100)
);

CREATE TABLE Flight (
    flight_id INT PRIMARY KEY,
    flight_number VARCHAR(10) unique NOT NULL,
    departure_time DATETIME,
    available_seats int,
    arrival_time DATETIME,
    arrival_airport_id INT,
    departure_airport_id INT,
    airline_id INT,
    foreign key(airline_id) references Airline(airline_id),
    foreign key(arrival_airport_id) references Airport(airport_id),
    foreign key(departure_airport_id) references Airport(airport_id)
);

CREATE TABLE Booking (
    booking_id INT PRIMARY KEY,
    flight_id INT,
    passenger_id INT,
    booking_date DATETIME,
    seat_no VARCHAR(5),
    class VARCHAR(20),
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id),
    FOREIGN KEY (passenger_id) REFERENCES Passenger(passenger_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    booking_id INT,
    amount DECIMAL(10, 2),
    payment_date DATETIME,
    payment_method VARCHAR(20),
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Crew (
    crew_id INT PRIMARY KEY,
    crew_name VARCHAR(50),
    role VARCHAR(50),
    flight_id INT,
    FOREIGN KEY (flight_id) REFERENCES Flight(flight_id)
);

-- drop database AIRLINE_SYSTEM;