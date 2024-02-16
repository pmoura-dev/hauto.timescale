DROP FUNCTION IF EXISTS get_device_state(INTEGER);

CREATE FUNCTION get_device_state(
    p_device_id INTEGER
)
    RETURNS TABLE
            (
                state JSONB
            )
AS
$$
SELECT ds.state
FROM "DeviceState" ds
WHERE p_device_id = ds.device_id
$$ LANGUAGE sql;