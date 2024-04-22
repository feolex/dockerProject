INSERT INTO taxcar.Route (Pos)
SELECT
    point( (random() * 180 - 90), (random() * 360 - 180) )
FROM
     generate_series(1, 500);