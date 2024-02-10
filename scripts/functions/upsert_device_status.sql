DROP FUNCTION IF EXISTS upsert_device_status(VARCHAR(50), JSONB);

CREATE FUNCTION upsert_device_status(
    p_device_id INTEGER,
    p_state JSONB
)
    RETURNS void
AS
$$
DECLARE
    state_time TIMESTAMP := now();
BEGIN
    INSERT INTO "DeviceState" ("device_id", "timestamp", "state")
    VALUES (p_device_id, state_time, p_state)
    ON CONFLICT("device_id")
        DO UPDATE SET "timestamp" = state_time,
                      "state"     = p_state;

    INSERT INTO "DeviceStateLog" ("device_id", "timestamp", "state")
    VALUES (p_device_id, state_time, p_state);
END;
$$ LANGUAGE plpgsql;