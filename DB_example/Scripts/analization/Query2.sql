EXPLAIN ANALYSE
WITH cheapest_users AS (
    SELECT us.ID_user
    FROM taxcar."User" AS us
    WHERE ID_tariff IN (
        SELECT tar.ID_tariff
        FROM taxcar.Tariff AS tar
        ORDER BY tar.Price
        LIMIT 1
    )
),
     carsharing_orders AS (
         SELECT ord.ID_order, ord.ID_user
         FROM taxcar."Order" AS ord
         WHERE ID_mode IN (
             SELECT mode.ID_mode
             FROM taxcar.Mode AS mode
             WHERE mode.Name = 'CarsharingMode'
         )
     )
SELECT ID_order
FROM carsharing_orders
WHERE ID_user IN (SELECT ID_user FROM cheapest_users);