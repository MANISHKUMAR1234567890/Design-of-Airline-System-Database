use airline_system;

-- trigger before insert 
delimiter $$ 
CREATE TRIGGER validate_passenger_age
BEFORE INSERT ON passenger
FOR EACH ROW
BEGIN
    IF NEW.age < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Passenger age cannot be negative.';
    END IF;
END ;



-- before update
DELIMITER $$ 
CREATE TRIGGER before_passenger_update
BEFORE UPDATE ON passenger
FOR EACH ROW
BEGIN
    IF NEW.age < 0 THEN
        SIGNAL SQLSTATE '45000' 
        SET MESSAGE_TEXT = 'Passenger age cannot be negative.';
    END IF;
END;

-- triger after update 
DELIMITER $$ 
CREATE TRIGGER after_passenger_update
AFTER UPDATE ON passenger
FOR EACH ROW
BEGIN
    IF OLD.passenger_name <> NEW.passenger_name THEN
        INSERT INTO passenger_log (passenger_id, log_message, log_time)
        VALUES (
            NEW.passenger_id, 
            CONCAT('Passenger name changed from ', OLD.passenger_name, ' to ', NEW.passenger_name, ' (ID: ', NEW.passenger_id, ')'),
            NOW()
        );
    END IF;
END;


-- trigger after insert 
DELIMITER $$ 
CREATE TRIGGER after_passenger_insert
AFTER INSERT ON passenger
FOR EACH ROW
BEGIN
    INSERT INTO passenger_log (passenger_id, log_message, log_time)
    VALUES (NEW.passenger_id, 
            CONCAT('New passenger added with ID: ', NEW.passenger_id), 
            NOW());
END ;

-- trigger before delete 
DELIMITER $$  
CREATE TRIGGER before_passenger_delete
BEFORE DELETE ON passenger
FOR EACH ROW
BEGIN
    INSERT INTO passenger_log (passenger_id, log_message, log_time)
    VALUES (OLD.passenger_id, 
            CONCAT('Passenger with ID: ', OLD.passenger_id, ' is about to be deleted.'), 
            NOW());
END;

-- trigger after delete 
DELIMITER $$ 
CREATE TRIGGER after_passenger_delete
AFTER DELETE ON passenger
FOR EACH ROW
BEGIN
    INSERT INTO passenger_log (passenger_id, log_message, log_time)
    VALUES (OLD.passenger_id, 
            CONCAT('Passenger with ID: ', OLD.passenger_id, ' has been deleted.'), 
            NOW());
END;



delimitter $$
CREATE TABLE login_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    passenger_id INT,
    action ENUM('login', 'logout'),
    log_time DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (passenger_id) REFERENCES passenger(passenger_id) ON DELETE CASCADE
);
-- login trigger 
DELIMITER $$

CREATE TRIGGER after_login
AFTER INSERT ON login_log
FOR EACH ROW
BEGIN
    INSERT INTO login_log (passenger_id, action)
    VALUES (NEW.passenger_id, 'login');
END;

-- logout trigger 
DELIMITER $$

CREATE TRIGGER after_logout
AFTER DELETE ON login_log
FOR EACH ROW
BEGIN
    INSERT INTO login_log (passenger_id, action)
    VALUES (OLD.passenger_id, 'logout');
END;

delimitter $$ 
show triggers;


