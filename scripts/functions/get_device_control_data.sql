DROP FUNCTION IF EXISTS get_device_control_data(INTEGER);

CREATE FUNCTION get_device_control_data(
    device_id INTEGER
)
    RETURNS TABLE
            (
                natural_id VARCHAR(50),
                controller VARCHAR(50)
            )
AS
$$
BEGIN
    RETURN QUERY
        SELECT d.natural_id as "natural_id", c.name as "controller"
        FROM "Device" d
                 JOIN "Controller" c ON d.controller_id = c.id
        WHERE d.id = device_id;
END;
$$ LANGUAGE plpgsql;
