CREATE SCHEMA IF NOT EXISTS main

    CREATE TABLE IF NOT EXISTS main."Owner"
    (
        ID_owner numeric(19, 0) NOT NULL,
        PRIMARY KEY (ID_owner)
    );