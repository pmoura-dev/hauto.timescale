CREATE TABLE "Room"
(
    "id"   SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE "Controller"
(
    "name"        VARCHAR(20) PRIMARY KEY,
    "description" TEXT
);

CREATE TABLE "Device"
(
    "id"           SERIAL PRIMARY KEY,
    "natural_id"   VARCHAR(50) NOT NULL UNIQUE,
    "name"         VARCHAR(50) NOT NULL,
    "manufacturer" VARCHAR(30),
    "model"        VARCHAR(30),
    "room_id"      INTEGER     NOT NULL,
    "controller"   VARCHAR(20) NOT NULL,

    CONSTRAINT fk_room_id
        FOREIGN KEY ("room_id")
            REFERENCES "Room" ("id"),
    CONSTRAINT fk_controller
        FOREIGN KEY ("controller")
            REFERENCES "Controller" ("name")
);


CREATE TABLE "Property"
(
    "name"        VARCHAR(20) PRIMARY KEY,
    "description" TEXT
);

CREATE TABLE "DeviceListeners"
(
    "id"        SERIAL PRIMARY KEY,
    "device_id" INTEGER      NOT NULL,
    "property"  VARCHAR(20)  NOT NULL,
    "topic"     VARCHAR(100) NOT NULL,

    CONSTRAINT fk_device_id
        FOREIGN KEY ("device_id")
            REFERENCES "Device" ("id"),

    CONSTRAINT fk_property
        FOREIGN KEY ("property")
            REFERENCES "Property" ("name")
);

CREATE TABLE "Action"
(
    "name"        VARCHAR(20) PRIMARY KEY,
    "description" TEXT
);

CREATE TABLE "DeviceActions"
(
    "id"        SERIAL PRIMARY KEY,
    "device_id" INTEGER      NOT NULL,
    "action"    VARCHAR(20)  NOT NULL,
    "topic"     VARCHAR(100) NOT NULL,

    CONSTRAINT fk_device_id
        FOREIGN KEY ("device_id")
            REFERENCES "Device" ("id"),

    CONSTRAINT fk_property
        FOREIGN KEY ("action")
            REFERENCES "Action" ("name")
);


CREATE TABLE "DeviceState"
(
    "device_id" INTEGER PRIMARY KEY,
    "timestamp" TIMESTAMP NOT NULL,
    "state"     JSONB     NOT NULL,

    CONSTRAINT fk_natural_id
        FOREIGN KEY ("device_id")
            REFERENCES "Device" ("id")
);

CREATE TABLE "DeviceStateLog"
(
    "id"        SERIAL PRIMARY KEY,
    "device_id" INTEGER   NOT NULL,
    "timestamp" TIMESTAMP NOT NULL,
    "state"     JSONB     NOT NULL,

    CONSTRAINT fk_natural_id
        FOREIGN KEY ("device_id")
            REFERENCES "Device" ("id")
);
