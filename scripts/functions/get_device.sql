DROP FUNCTION IF EXISTS get_device(INTEGER);

CREATE FUNCTION get_device(
    p_device_id INTEGER
)
    RETURNS SETOF "Device"
AS
$$
SELECT *
FROM "Device" d
WHERE p_device_id = d.id
$$ LANGUAGE sql;