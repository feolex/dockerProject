EXPLAIN ANALYZE
WITH honda_orders AS (SELECT DISTINCT ord.ID_user
                      FROM taxcar."Order" AS ord
                      WHERE ord.ID_mode IN (SELECT mode.ID_mode
                                            FROM taxcar.Mode AS mode
                                            WHERE mode.Name = 'UsualTaxiMode')
                        AND ord.ID_status IN (SELECT status.ID_status
                                              FROM taxcar.Status AS status
                                              WHERE status.Name = 'Done')
                        AND ord.ID_auto IN (SELECT auto.ID_auto
                                            FROM taxcar.Auto AS auto
                                            WHERE auto.ID_automark IN (SELECT automark.ID_autoMark
                                                                       FROM taxcar.AutoMark AS automark
                                                                       WHERE automark.Name = 'Honda'))),
     spb_users AS (SELECT us.ID_user
                   FROM taxcar."User" AS us
                   WHERE us.ID_payWay IN (SELECT pay.ID_payWay
                                          FROM taxcar.PayWay AS pay
                                          WHERE pay.Name = 'SbpAccount'))
SELECT spb_users.ID_user
FROM spb_users
WHERE spb_users.ID_user IN (SELECT honda_orders.ID_user FROM honda_orders);