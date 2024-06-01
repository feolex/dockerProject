CREATE TABLE IF NOT EXISTS taxcar.Auto
(
    ID_auto        numeric(19, 0) NOT NULL,
    ID_automark    numeric(19, 0) NOT NULL,
    ID_tariff      numeric(19, 0) NOT NULL,
    ID_autoservice numeric(19, 0) NOT NULL,
    ActualPos      Point,
    Rating         float4,
    PRIMARY KEY (ID_auto)
);
CREATE TABLE IF NOT EXISTS taxcar."User"
(
    ID_user      numeric(19, 0) NOT NULL,
    ID_tariff    numeric(19, 0) NOT NULL,
    ID_PayWay    numeric(19, 0) NOT NULL,
    PhoneNumber  int4           NOT NULL,
    Email        varchar(256),
    MainAccount  int4,
    BonusAccount int4,
    Rating       float4,
    PRIMARY KEY (ID_user)
);
CREATE TABLE IF NOT EXISTS taxcar."Order"
(
    ID_order    numeric(19, 0) NOT NULL,
    ID_auto     numeric(19, 0) NOT NULL,
    Comment     varchar(256),
    TimeOfOrder timestamp,
    ID_user     numeric(19, 0) NOT NULL,
    ID_mode     numeric(19, 0) NOT NULL,
    ID_status   numeric(19, 0) NOT NULL,
    PRIMARY KEY (ID_order)
);
CREATE TABLE IF NOT EXISTS taxcar.Autoservice
(
    ID_autoservice numeric(19, 0) NOT NULL,
    Address        varchar(256),
    PhoneNumber    int4,
    Email          varchar(256),
    PRIMARY KEY (ID_autoservice)
);
CREATE TABLE IF NOT EXISTS taxcar.Driver
(
    ID_driver   numeric(19, 0) NOT NULL,
    PhoneNumber int4,
    Rating      float4,
    PRIMARY KEY (ID_driver)
);
CREATE TABLE IF NOT EXISTS taxcar.Route
(
    "INDEX" SERIAL NOT NULL,
    Pos     Point,
    PRIMARY KEY ("INDEX")
);
COMMENT ON COLUMN taxcar.Route."INDEX" IS 'The ordering number of cortage';
CREATE TABLE IF NOT EXISTS taxcar.Tariff
(
    ID_tariff      numeric(19, 0) NOT NULL,
    Km_per_day_max numeric(10, 1),
    Price          int4,
    PRIMARY KEY (ID_tariff)
);
CREATE TABLE IF NOT EXISTS taxcar.Route_Order
(
    RouteINDEX    int4           NOT NULL,
    OrderID_Order numeric(19, 0) NOT NULL,
    PRIMARY KEY (RouteINDEX,
                 OrderID_Order)
);
CREATE TABLE IF NOT EXISTS taxcar.Tariff_Driver
(
    TariffID_tariff numeric(19, 0) NOT NULL,
    DriverID_Driver numeric(19, 0) NOT NULL,
    PRIMARY KEY (TariffID_tariff,
                 DriverID_Driver)
);
CREATE TABLE IF NOT EXISTS taxcar.Mode
(
    ID_mode numeric(19, 0) NOT NULL,
    Name    varchar(256),
    PRIMARY KEY (ID_mode)
);
CREATE TABLE IF NOT EXISTS taxcar.Status
(
    ID_status numeric(19, 0) NOT NULL,
    Name      varchar(256),
    PRIMARY KEY (ID_status)
);
CREATE TABLE IF NOT EXISTS taxcar.PayWay
(
    ID_payWay numeric(19, 0) NOT NULL,
    Name      varchar(256),
    PRIMARY KEY (ID_payWay)
);
CREATE TABLE IF NOT EXISTS taxcar.AutoMark
(
    ID_autoMark numeric(19, 0) NOT NULL,
    Name        varchar(256),
    PRIMARY KEY (ID_autoMark)
);

CREATE UNIQUE INDEX IF NOT EXISTS Driver_ID_driver
    ON taxcar.Driver (ID_driver);
CREATE INDEX IF NOT EXISTS Route_INDEX
    ON taxcar.Route ("INDEX");
CREATE INDEX IF NOT EXISTS Tariff_ID_tariff
    ON taxcar.Tariff (ID_tariff);

CREATE SEQUENCE IF NOT EXISTS driver_id_seq;
ALTER TABLE taxcar.Driver ALTER COLUMN ID_driver SET DEFAULT nextval('driver_id_seq');

CREATE SEQUENCE IF NOT EXISTS tariff_id_seq;
ALTER TABLE taxcar.Tariff ALTER COLUMN ID_tariff SET DEFAULT nextval('tariff_id_seq');

CREATE SEQUENCE IF NOT EXISTS mode_id_seq;
ALTER TABLE taxcar.Mode ALTER COLUMN ID_mode SET DEFAULT nextval('mode_id_seq');

CREATE SEQUENCE IF NOT EXISTS status_id_seq;
ALTER TABLE taxcar.Status ALTER COLUMN ID_status SET DEFAULT nextval('status_id_seq');

CREATE SEQUENCE IF NOT EXISTS payway_id_seq;
ALTER TABLE taxcar.PayWay ALTER COLUMN ID_payWay SET DEFAULT nextval('payway_id_seq');

CREATE SEQUENCE IF NOT EXISTS order_id_seq;
ALTER TABLE taxcar."Order" ALTER COLUMN ID_order SET DEFAULT nextval('order_id_seq');

CREATE SEQUENCE IF NOT EXISTS user_id_seq;
ALTER TABLE taxcar."User" ALTER COLUMN ID_user SET DEFAULT nextval('order_id_seq');

CREATE SEQUENCE IF NOT EXISTS auto_id_seq;
ALTER TABLE taxcar.Auto ALTER COLUMN ID_auto SET DEFAULT nextval('auto_id_seq');

ALTER TABLE taxcar.Auto
    ADD CONSTRAINT FKAuto162690 FOREIGN KEY (ID_autoservice) REFERENCES taxcar.Autoservice (ID_autoservice);
ALTER TABLE taxcar."Order"
    ADD CONSTRAINT FKOrder103340 FOREIGN KEY (ID_auto) REFERENCES taxcar.Auto (ID_auto);
ALTER TABLE taxcar."Order"
    ADD CONSTRAINT FKOrder883649 FOREIGN KEY (ID_user) REFERENCES taxcar."User" (ID_user);
ALTER TABLE taxcar."User"
    ADD CONSTRAINT FKUser402107 FOREIGN KEY (ID_tariff) REFERENCES taxcar.Tariff (ID_tariff);
ALTER TABLE taxcar.Route_Order
    ADD CONSTRAINT FKRoute_Orde29081 FOREIGN KEY (RouteINDEX) REFERENCES taxcar.Route ("INDEX");
ALTER TABLE taxcar.Route_Order
    ADD CONSTRAINT FKRoute_Orde41953 FOREIGN KEY (OrderID_Order) REFERENCES taxcar."Order" (ID_order);
ALTER TABLE taxcar.Tariff_Driver
    ADD CONSTRAINT FKTariff_Dri788888 FOREIGN KEY (TariffID_tariff) REFERENCES taxcar.Tariff (ID_tariff);
ALTER TABLE taxcar.Tariff_Driver
    ADD CONSTRAINT FKTariff_Dri119333 FOREIGN KEY (DriverID_Driver) REFERENCES taxcar.Driver (ID_driver);
ALTER TABLE taxcar.Auto
    ADD CONSTRAINT FKAuto808670 FOREIGN KEY (ID_tariff) REFERENCES taxcar.Tariff (ID_tariff);
ALTER TABLE taxcar."Order"
    ADD CONSTRAINT FKOrder157001 FOREIGN KEY (ID_mode) REFERENCES taxcar.Mode (ID_mode);
ALTER TABLE taxcar."Order"
    ADD CONSTRAINT FKOrder476879 FOREIGN KEY (ID_status) REFERENCES taxcar.Status (ID_status);
ALTER TABLE taxcar.Auto
    ADD CONSTRAINT FKAuto680877 FOREIGN KEY (ID_automark) REFERENCES taxcar.AutoMark (ID_autoMark);
ALTER TABLE taxcar."User"
    ADD CONSTRAINT FKUser708486 FOREIGN KEY (ID_PayWay) REFERENCES taxcar.PayWay (ID_payWay);