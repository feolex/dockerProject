INSERT INTO taxcar."User" (ID_tariff, ID_payWay, PhoneNumber, Email, MainAccount, BonusAccount, Rating)
SELECT
    (SELECT ID_tariff FROM taxcar.Tariff ORDER BY RANDOM() LIMIT 1 ),
    (SELECT ID_payWay FROM taxcar.PayWay ORDER BY RANDOM() LIMIT 1 ),
    generate_series(1000000000, 1000000000 + 9999999999)::int4,
    'email' || gs || '@example.com',
    random() * 10000,
    random() * 1000,
    random() * 5
FROM
    generate_series(1, 1000) AS gs;