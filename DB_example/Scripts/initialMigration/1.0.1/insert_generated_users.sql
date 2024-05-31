INSERT INTO taxcar."User" (ID_tariff, ID_payWay, PhoneNumber, Email, MainAccount, BonusAccount, Rating)
SELECT
    (SELECT ID_tariff FROM taxcar.Tariff ORDER BY RANDOM() LIMIT 1 ),
    (SELECT ID_payWay FROM taxcar.PayWay ORDER BY RANDOM() LIMIT 1 ),
    generate_series(1000, 1000 + 999)::int4,
    'email' || gs || '@example.com',
    random() * 10000,
    random() * 1000,
    random() * 5
FROM
    generate_series(1, 100) AS gs;