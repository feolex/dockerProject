INSERT INTO taxcar."Order" (ID_auto, Comment, TimeOfOrder, ID_user, ID_mode, ID_status)
SELECT
    (SELECT ID_auto FROM taxcar.Auto ORDER BY RANDOM() LIMIT 1),
    'Comment ' || gs,
    NOW() - interval '1 day' * gs,  -- Generate random timestamps within the last day
    (SELECT ID_user FROM taxcar."User" ORDER BY RANDOM() LIMIT 1),
    (SELECT ID_mode FROM taxcar.Mode ORDER BY RANDOM() LIMIT 1),
    (SELECT ID_status FROM taxcar.Status ORDER BY RANDOM() LIMIT 1)
FROM
    generate_series(1, 50000) AS gs;