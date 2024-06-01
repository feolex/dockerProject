/*Create auto table*/
/*taxcar.Auto (
  ID_auto        numeric(19, 0) NOT NULL,
  ID_automark    numeric(19, 0) NOT NULL,
  ID_tariff      numeric(19, 0) NOT NULL,
  ID_autoservice numeric(19, 0) NOT NULL,
  ActualPos      Point,
  Rating         float4,
  PRIMARY KEY (ID_auto));*/
INSERT INTO taxcar.Auto (ID_automark, ID_tariff, ID_autoservice, ActualPos, Rating)
SELECT
    (SELECT ID_automark FROM taxcar.AutoMark ORDER BY RANDOM() LIMIT 1),
    (SELECT ID_tariff FROM taxcar.Tariff ORDER BY RANDOM() LIMIT 1),
    (SELECT ID_autoservice FROM taxcar.Autoservice ORDER BY RANDOM() LIMIT 1),
    (SELECT point(CAST(gs * 0.1 AS FLOAT), CAST(gs * 0.2 AS FLOAT))),
    random()::float4
FROM
    generate_series(1, 10000) AS gs;