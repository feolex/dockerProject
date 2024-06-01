--Provided as references
CREATE UNIQUE INDEX IF NOT EXISTS User_id_user
    ON taxcar."User" (ID_user);

CREATE UNIQUE INDEX IF NOT EXISTS Order_id_order_and_user
    ON taxcar."Order" (ID_order);
CREATE INDEX IF NOT EXISTS Order_id_user
    ON taxcar."Order" (ID_user);
-- CREATE INDEX IF NOT EXISTS Order_id_auto
--     ON taxcar."Order" (ID_auto);

CREATE UNIQUE INDEX IF NOT EXISTS Auto_id_auto
    ON taxcar.Auto (ID_auto);
