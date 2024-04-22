-- DROP TABLE IF EXISTS taxcar.Auto;
-- DROP TABLE IF EXISTS taxcar."User";
-- DROP TABLE IF EXISTS taxcar."Order";
-- DROP TABLE IF EXISTS taxcar.Autoservice;
-- DROP TABLE IF EXISTS taxcar.Driver;
-- DROP TABLE IF EXISTS taxcar.Route;
-- DROP TABLE IF EXISTS taxcar.Tariff;
-- DROP TABLE IF EXISTS taxcar.Route_Order;
-- DROP TABLE IF EXISTS taxcar.Tariff_Driver;
-- DROP TABLE IF EXISTS taxcar.Mode;
-- DROP TABLE IF EXISTS taxcar.Status;
-- DROP TABLE IF EXISTS taxcar.PayWay;
-- DROP TABLE IF EXISTS taxcar.AutoMark;

DROP SCHEMA IF EXISTS taxcar CASCADE;

DROP SEQUENCE IF EXISTS driver_id_seq;

DROP SEQUENCE IF EXISTS tariff_id_seq;

DROP SEQUENCE IF EXISTS mode_id_seq;

DROP SEQUENCE IF EXISTS status_id_seq;

DROP SEQUENCE IF EXISTS payway_id_seq;

DROP SEQUENCE IF EXISTS order_id_seq;

DROP SEQUENCE IF EXISTS user_id_seq;

DROP SEQUENCE IF EXISTS auto_id_seq;
