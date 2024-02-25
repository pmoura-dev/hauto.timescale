DROP FUNCTION IF EXISTS get_device_state(INTEGER);

CREATE FUNCTION get_device_state(
    p_device_id INTEGER
)
    RETURNS SETOF "DeviceState"
AS
$$
SELECT *
FROM "DeviceState" ds
WHERE p_device_id = ds.device_id
$$ LANGUAGE sql;