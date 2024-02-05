DROP FUNCTION IF EXISTS upsert_device_status(VARCHAR(50), JSONB);

CREATE FUNCTION upsert_device_status(
    p_natural_id VARCHAR(50),
    p_state JSONB
)
    RETURNS void
AS
$$
DECLARE
    state_time TIMESTAMP := now();
BEGIN
    INSERT INTO DeviceStatus ("natural_id", "timestamp", "state")
    VALUES (p_natural_id, state_time, p_state)
    ON CONFLICT("natural_id")
        DO UPDATE SET "timestamp" = state_time,
                      "state"     = p_state;

    INSERT INTO DeviceStatusLog ("natural_id", "timestamp", "state")
    VALUES (p_natural_id, state_time, p_state);
END;
$$ LANGUAGE plpgsql;