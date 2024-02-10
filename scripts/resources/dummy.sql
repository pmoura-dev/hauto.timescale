INSERT INTO "Room"
VALUES (1, 'Sala'),
       (2, 'Escritório'),
       (3, 'Quarto Marlon');


INSERT INTO "Controller"
VALUES ('hisense_ac', 'Controller for Hisense Air Conditioners'),
       ('shelly_bulb', 'Controller for Shelly Bulbs (Gen 1)'),
       ('yeelight', 'Controller for Yeelight lights');


INSERT INTO "Device"
VALUES (1, 'ca2c4f94ffd2', 'Ar Condicionado - Sala', 'Hisense', NULL, 1, 'hisense_ac'),
       (2, 'ca2c4f956004', 'Ar Condicionado - Escritório', 'Hisense', NULL, 2, 'hisense_ac'),
       (3, 'shellycolorbulb-3494546B2CAD', 'Shelly RGBW Bulb', 'Shelly', '9W E27', 1, 'shelly_bulb'),
       (4, '0x00000000154c9a34', 'Yeelight - Marlon', NULL, NULL, 3, 'yeelight');


INSERT INTO "Property"
VALUES ('state', 'Represents the state of the device'),
       ('energy', 'Energy consumption (Watt/minute)'),
       ('power', 'Power consumption rate (Watts)');


INSERT INTO "DeviceListeners"
VALUES (1, 3, 'state', 'shellies.shellycolorbulb-3494546B2CAD.color.0.status');


INSERT INTO "Action"
VALUES ('turn_on', 'Turns a device on'),
       ('turn_off', 'Turns a device off');


INSERT INTO "DeviceActions"
VALUES (1, 3, 'turn_on', 'shellies.shellycolorbulb-3494546B2CAD.color.0.command'),
       (2, 3, 'turn_off', 'shellies.shellycolorbulb-3494546B2CAD.color.0.command');