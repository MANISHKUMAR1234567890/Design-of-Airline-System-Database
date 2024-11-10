use airline_system;


-- min function
SELECT MIN(age) AS min_age FROM passenger;
SELECT MIN(departure_time) AS earliest_departure FROM flight;

-- max function 
SELECT MAX(amount) AS max_amount FROM payment;
SELECT MAX(arrival_time) AS latest_arrival FROM flight;

-- count function
SELECT COUNT(*) AS total_passengers FROM passenger;
SELECT COUNT(*) AS economy_bookings 
FROM booking 
WHERE class = 'Economy';
 

-- avg function 
SELECT round(AVG(age),0) AS avg_age FROM passenger;
SELECT AVG(amount) AS avg_payment FROM payment;




SELECT 
    payment_method, 
    MAX(amount) AS max_payment, 
    MIN(amount) AS min_payment, 
    COUNT(payment_id) AS total_payments, 
    AVG(amount) AS avg_payment
FROM 
    payment
GROUP BY 
    payment_method;


SELECT 
    al.name AS AirlineName, 
    MIN(f.available_seats) AS MinSeats, 
    MAX(f.available_seats) AS MaxSeats, 
    AVG(f.available_seats) AS AvgSeats, 
    COUNT(f.flight_id) AS TotalFlights
FROM 
    Flight f
JOIN 
    Airline al ON f.airline_id = al.airline_id
GROUP BY 
    al.name
HAVING 
    AVG(f.available_seats) > 100;
