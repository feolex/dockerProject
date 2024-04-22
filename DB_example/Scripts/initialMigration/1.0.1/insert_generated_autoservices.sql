INSERT INTO taxcar.Autoservice (ID_autoservice, Address, PhoneNumber, Email)
SELECT gs, 'Address ' || gs, gs * 1111111111, 'email' || gs || '@example.com'
FROM generate_series(0, 15) AS gs;