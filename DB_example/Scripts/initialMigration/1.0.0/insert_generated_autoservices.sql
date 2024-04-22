INSERT INTO taxcar.Autoservice (ID_autoservice, Address, PhoneNumber, Email)
SELECT gs, 'Address ' || gs, gs * 111, 'email' || gs || '@example.com'
FROM generate_series(0, 9) AS gs;