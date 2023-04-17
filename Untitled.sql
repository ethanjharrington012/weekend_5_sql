SELECT *
FROM customer;

Ethan Harrington

CREATE OR REPLACE FUNCTION insert_customer(
	user_firstname VARCHAR(50),
	user_lastname VARCHAR(50),
	user_phone BIGINT,
	user_email VARCHAR(150),
	user_address VARCHAR(150),
	user_city VARCHAR(50),
	user_state VARCHAR(50),
	user_zipcode INTEGER,
	user_birthday DATE,
	user_gender VARCHAR(10)
)
RETURNS VOID AS $$
BEGIN
	INSERT INTO customer(firstname,lastname,phone_number,email,address,city,"state",zipcode,birthdate,gender)VALUES(user_firstname,user_lastname,user_phone,user_email,user_address,user_city,user_state,user_zipcode,user_birthday,user_gender);
END;
$$ LANGUAGE plpgsql;

SELECT insert_customer('Ethan', 'Harrington', 2076923180, 'ethanjharrington012@gmail.com', '64 river road', 'Benton', 'Maine', 04901, TO_DATE('2001-10-22', 'YYYY-MM-DD'), 'male');


SELECT *
FROM car;

CREATE OR REPLACE FUNCTION insert_car(
	user_make VARCHAR(25),
	user_model VARCHAR(25),
	user_year INTEGER,
	user_vin VARCHAR(50),
	user_color VARCHAR(15),
	user_price NUMERIC(10,2)
	
)
RETURNS VOID AS $$
BEGIN 
	INSERT INTO car(make,model,"year",vin,color,price)VALUES(user_make,user_model,user_year,user_vin,user_color,user_price);
	
END;
$$ LANGUAGE plpgsql;

SELECT insert_car('Honda','Civic',2001,'12df3j4j123','Black',800000);

SELECT *
FROM invoice;

CREATE OR REPLACE FUNCTION user_invoice(
	user_invoice_date DATE,
	user_total_amount NUMERIC(10,2),
	user_tax NUMERIC(8,2),
	user_dicount NUMERIC(8,2),
	user_mrp_car NUMERIC(10,2)
	
)

RETURNS VOID AS $$
BEGIN
	INSERT INTO invoice(invoice_date,total_amount,tax,discount,mrp_car)VALUES(user_invoice_date,user_total_amount,user_tax,user_dicount,user_mrp_car);
END;
$$ LANGUAGE plpgsql;

SELECT user_invoice(TO_DATE('2007-11-11', 'YYYY-MM-DD'),1000,12,100,100);

SELECT *
FROM mechanic;

CREATE OR REPLACE FUNCTION user_mechanic(
	user_firstname VARCHAR(50),
	user_lastname VARCHAR(50),
	user_phone BIGINT,
	user_email VARCHAR(150),
	user_address VARCHAR(150),
	user_city VARCHAR(50),
	user_state VARCHAR(50),
	user_zipcode INTEGER,
	user_hiredate DATE,
	user_hourly_rate NUMERIC(5,2),
	user_specialization VARCHAR(150)
)
RETURNS VOID AS $$
BEGIN
	INSERT INTO mechanic(firstname,lastname,phone_number,email,address,city,"state",zipcode,hiredate,hourly_rate,specialization)VALUES(user_firstname,user_lastname,user_phone,user_email,user_address,user_city,user_state,user_zipcode,user_hiredate,user_hourly_rate,user_specialization);
END;
$$ LANGUAGE plpgsql;

SELECT 	user_mechanic('Joe','Dirt',1458763434,'dirtem@yourmom.com','123 yes dirt ST','Smalls','Kansas',12453,TO_DATE('2007-11-11', 'YYYY-MM-DD'), 100,'Tires');


SELECT *
FROM mechanic;


SELECT 	user_mechanic('Jhone','Sponge',14587634523,'fifty@gmail.com','12 fort road','Bond','New Hampshire',12383,TO_DATE('2022-10-13', 'YYYY-MM-DD'), 50,'Gas');

ALTER TABLE car ADD COLUMN is_served BOOLEAN DEFAULT false;

SELECT *
FROM car;


CREATE OR REPLACE PROCEDURE update_service_status(purchase_date DATE, oil_change_date DATE) AS
$$
BEGIN
    UPDATE car SET is_served = true WHERE purchase_date <= oil_change_date AND is_served = false;
END;
$$
LANGUAGE plpgsql;

CALL update_service_status('2022-01-01', '2023-04-14');

SELECT *
FROM parts;


