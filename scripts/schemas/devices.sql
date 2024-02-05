CREATE TABLE "Room"
(
    "id"   SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE "Controller"
(
    "id"   SERIAL PRIMARY KEY,
    "name" VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE "Device"
(
    "id"            SERIAL PRIMARY KEY,
    "natural_id"    VARCHAR(50) NOT NULL UNIQUE,
    "name"          VARCHAR(50) NOT NULL,
    "room_id"       INTEGER     NOT NULL,
    "controller_id" INTEGER     NOT NULL,

    CONSTRAINT fk_room_id
        FOREIGN KEY ("room_id")
            REFERENCES "Room" ("id"),
    CONSTRAINT fk_controller_id
        FOREIGN KEY ("controller_id")
            REFERENCES "Controller" ("id")
);

CREATE TABLE "DeviceStatus"
(
    "natural_id" VARCHAR(50) PRIMARY KEY,
    "timestamp"  TIMESTAMP NOT NULL,
    "state"      JSONB     NOT NULL,

    CONSTRAINT fk_natural_id
        FOREIGN KEY ("natural_id")
            REFERENCES "Device" ("natural_id")
);

CREATE TABLE "DeviceStatusLog"
(
    "id"         SERIAL PRIMARY KEY,
    "timestamp"  TIMESTAMP   NOT NULL,
    "natural_id" VARCHAR(50) NOT NULL,
    "state"      JSONB       NOT NULL,

    CONSTRAINT fk_natural_id
        FOREIGN KEY ("natural_id")
            REFERENCES "Device" ("natural_id")
);
