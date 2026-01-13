BEGIN;

CREATE TABLE IF NOT EXISTS zip_codes (
    zip_code VARCHAR(20) PRIMARY KEY,
    city VARCHAR(100) NOT NULL
);

INSERT INTO zip_codes (zip_code, city)
SELECT DISTINCT zip_code, city 
FROM addresses
ON CONFLICT (zip_code) DO NOTHING;

ALTER TABLE addresses DROP COLUMN city;

ALTER TABLE addresses 
ADD CONSTRAINT fk_address_zip 
FOREIGN KEY (zip_code) REFERENCES zip_codes(zip_code);

SELECT * FROM zip_codes;

SELECT a.address_id, a.street, z.city 
FROM addresses a
JOIN zip_codes z ON a.zip_code = z.zip_code;

COMMIT;