DROP FUNCTION IF EXISTS get_devices_mqtt_configuration();

CREATE FUNCTION get_devices_mqtt_configuration()
    RETURNS TABLE
            (
                device_id     INTEGER,
                controller    VARCHAR(20),
                consumer_type VARCHAR(10),
                name          VARCHAR(20),
                topic         VARCHAR(100)
            )
AS
$$
SELECT d.id AS device_id, d.controller, 'action' AS consumer_type, da.action AS name, da.topic
FROM "Device" d
         JOIN "DeviceActions" da ON d.id = da.device_id
UNION
SELECT d.id AS device_id, d.controller, 'listener' AS consumer_type, dl.property AS name, dl.topic
FROM "Device" d
         JOIN "DeviceListeners" dl on d.id = dl.device_id
$$ LANGUAGE sql;
