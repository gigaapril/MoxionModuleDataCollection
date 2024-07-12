

-- Disable next two lines if executor of this script is not a super user.
DO $$
BEGIN
    CREATE USER ignitionadmin WITH SUPERUSER CREATEDB CREATEROLE ENCRYPTED PASSWORD 'Moxion2023';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER moudule_user WITH ENCRYPTED PASSWORD 'MoxionUser';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER readonly WITH ENCRYPTED PASSWORD 'MoxionRead';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

CREATE SCHEMA IF NOT EXISTS moduleline AUTHORIZATION ignitionadmin;

ALTER SCHEMA moduleline OWNER TO ignitionadmin;

-- Create the table op_010_cell_pick without uuid column
CREATE TABLE IF NOT EXISTS moduleline.op_010_cell_pick
(
    mfg_facility VARCHAR(36) NOT NULL DEFAULT '',
    mfg_line VARCHAR(36) NOT NULL DEFAULT '',
    mfg_cell VARCHAR(36) NOT NULL DEFAULT '',
    mfg_station VARCHAR(36) NOT NULL DEFAULT '',
    sub_station VARCHAR(36) NOT NULL DEFAULT '',
    lot_id VARCHAR(18) NOT NULL DEFAULT '',
    "timestamp" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT '1000-01-01 00:00:00.000',
    box_number INTEGER NOT NULL DEFAULT 0,   
    pallet_id INTEGER NOT NULL DEFAULT 0,
    camera_id INTEGER NOT NULL DEFAULT 0,
    pick_index INTEGER NOT NULL DEFAULT 0,           
    vision_found_cell_01 BOOL DEFAULT FALSE,
    vision_found_cell_02 BOOL DEFAULT FALSE,
    vision_found_cell_03 BOOL DEFAULT FALSE,
    vision_found_cell_04 BOOL DEFAULT FALSE,
    vision_found_cell_05 BOOL DEFAULT FALSE,
    vision_found_cell_06 BOOL DEFAULT FALSE,
    vision_found_cell_07 BOOL DEFAULT FALSE,
    vision_found_cell_08 BOOL DEFAULT FALSE,
    vision_found_cell_09 BOOL DEFAULT FALSE,
    robot_picked_cell_01 BOOL DEFAULT FALSE,
    robot_picked_cell_02 BOOL DEFAULT FALSE,
    robot_picked_cell_03 BOOL DEFAULT FALSE,
    robot_picked_cell_04 BOOL DEFAULT FALSE,
    robot_picked_cell_05 BOOL DEFAULT FALSE,
    robot_picked_cell_06 BOOL DEFAULT FALSE,
    robot_picked_cell_07 BOOL DEFAULT FALSE,
    robot_picked_cell_08 BOOL DEFAULT FALSE,
    robot_picked_cell_09 BOOL DEFAULT FALSE,
    vision_x REAL NOT NULL DEFAULT 0.0,
    vision_y REAL NOT NULL DEFAULT 0.0,
    vision_r REAL NOT NULL DEFAULT 0.0
);

ALTER TABLE moduleline.op_010_cell_pick OWNER TO ignitionadmin;

-- Create index on relevant columns
CREATE INDEX IF NOT EXISTS op_010_cell_pick ON moduleline.op_010_cell_pick (mfg_facility, mfg_line, mfg_cell, mfg_station,sub_station);





-- Disable next two lines if executor of this script is not a super user.
DO $$
BEGIN
    CREATE USER ignitionadmin WITH SUPERUSER CREATEDB CREATEROLE ENCRYPTED PASSWORD 'Moxion2023';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER moudule_user WITH ENCRYPTED PASSWORD 'MoxionUser';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER readonly WITH ENCRYPTED PASSWORD 'MoxionRead';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

CREATE SCHEMA IF NOT EXISTS moduleline AUTHORIZATION ignitionadmin;

ALTER SCHEMA moduleline OWNER TO ignitionadmin;

-- Create the table op_020_echeck without uuid column
CREATE TABLE IF NOT EXISTS moduleline.op_020_echeck
(
    mfg_facility VARCHAR(36) NOT NULL DEFAULT '',
    mfg_line VARCHAR(36) NOT NULL DEFAULT '',
    mfg_cell VARCHAR(36) NOT NULL DEFAULT '',
    mfg_station VARCHAR(36) NOT NULL DEFAULT '',
    sub_station VARCHAR(36) NOT NULL DEFAULT '',
    lot_id VARCHAR(18) NOT NULL DEFAULT '',
    "timestamp" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT '1000-01-01 00:00:00.000',
    puck_id INTEGER NOT NULL DEFAULT 0,
    lane_id INTEGER NOT NULL DEFAULT 0,
    cell_position INTEGER NOT NULL DEFAULT 0,
    cell_ocv REAL NOT NULL DEFAULT 0.0,
    cell_acir REAL NOT NULL DEFAULT 0.0,
    reject_code INTEGER NOT NULL DEFAULT 999,
    reject_reason VARCHAR(64) NOT NULL DEFAULT ''
);

ALTER TABLE moduleline.op_020_echeck OWNER TO ignitionadmin;

-- Create index on relevant columns
CREATE INDEX IF NOT EXISTS op_020_echeck_index ON moduleline.op_020_echeck (mfg_facility, mfg_line, mfg_cell, mfg_station,sub_station);





-- Disable next two lines if executor of this script is not a super user.
DO $$
BEGIN
    CREATE USER ignitionadmin WITH SUPERUSER CREATEDB CREATEROLE ENCRYPTED PASSWORD 'Moxion2023';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER moudule_user WITH ENCRYPTED PASSWORD 'MoxionUser';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER readonly WITH ENCRYPTED PASSWORD 'MoxionRead';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

CREATE SCHEMA IF NOT EXISTS moduleline AUTHORIZATION ignitionadmin;

ALTER SCHEMA moduleline OWNER TO ignitionadmin;

-- Create the table op_060_module_build without uuid column
CREATE TABLE IF NOT EXISTS moduleline.op_060_module_build
(
    mfg_facility VARCHAR(36) NOT NULL DEFAULT '',
    mfg_line VARCHAR(36) NOT NULL DEFAULT '',
    mfg_cell VARCHAR(36) NOT NULL DEFAULT '',
    mfg_station VARCHAR(36) NOT NULL DEFAULT '',
    sub_station VARCHAR(36) NOT NULL DEFAULT '',
    lot_id VARCHAR(18) NOT NULL DEFAULT '',
    "timestamp" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT '1000-01-01 00:00:00.000',
    serial_number VARCHAR(64) NOT NULL DEFAULT '',
    cell_position INTEGER DEFAULT 0,
    pallet_id INTEGER DEFAULT 0
);

ALTER TABLE moduleline.op_060_module_build OWNER TO ignitionadmin;

-- Create index on relevant columns
CREATE INDEX IF NOT EXISTS op_060_module_build ON moduleline.op_060_module_build (mfg_facility, mfg_line, mfg_cell, mfg_station,sub_station);




-- Disable next two lines if executor of this script is not a super user.
DO $$
BEGIN
    CREATE USER ignitionadmin WITH SUPERUSER CREATEDB CREATEROLE ENCRYPTED PASSWORD 'Moxion2023';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER moudule_user WITH ENCRYPTED PASSWORD 'MoxionUser';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

DO $$
BEGIN
    CREATE USER readonly WITH ENCRYPTED PASSWORD 'MoxionRead';
EXCEPTION
    WHEN duplicate_object THEN RAISE NOTICE '%, skipping', SQLERRM USING ERRCODE = SQLSTATE;
END $$;

CREATE SCHEMA IF NOT EXISTS moduleline AUTHORIZATION ignitionadmin;

ALTER SCHEMA moduleline OWNER TO ignitionadmin;

-- Create the table op_160_robot_load without uuid column
CREATE TABLE IF NOT EXISTS moduleline.op_160_robot_load
(
    mfg_facility VARCHAR(36) DEFAULT '',
    mfg_line VARCHAR(36) DEFAULT '',
    mfg_cell VARCHAR(36) DEFAULT '',
    mfg_station VARCHAR(36) DEFAULT '',
    sub_station VARCHAR(36) DEFAULT '',
    lot_id VARCHAR(18) DEFAULT '',
    "timestamp" TIMESTAMP WITH TIME ZONE DEFAULT '1000-01-01 00:00:00.000',
    serial_number VARCHAR(64) DEFAULT '',
    pallet_id INTEGER DEFAULT 0,
    dunnage_id INTEGER DEFAULT 0,
    dunnage_slot INTEGER DEFAULT 0,
    op_040_pass BOOL DEFAULT FALSE,
    op_040_fail BOOL DEFAULT FALSE,
    op_040_complete BOOL DEFAULT FALSE,
    op_040_timestamp VARCHAR(36) DEFAULT '',
    op_050_dispense_pass BOOL DEFAULT FALSE,
    op_050_dispense_fail BOOL DEFAULT FALSE,
    op_050_dispense_complete BOOL DEFAULT FALSE,
    op_050_inspect_pass BOOL DEFAULT FALSE,
    op_050_inspect_fail BOOL DEFAULT FALSE,
    op_050_inspect_complete BOOL DEFAULT FALSE,
    op_050_dispect_timestamp VARCHAR(36) DEFAULT '',
    op_050_inspect_timestamp VARCHAR(36) DEFAULT '',
    op_050_adhesive_exposed_time INTEGER DEFAULT 0,
    op_060_pass BOOL DEFAULT FALSE,
    op_060_fail BOOL DEFAULT FALSE,
    op_060_complete BOOL DEFAULT FALSE,
    op_060_timestamp VARCHAR(36) DEFAULT '',
    op_070A_pass BOOL DEFAULT FALSE,
    op_070A_fail BOOL DEFAULT FALSE,
    op_070A_complete BOOL DEFAULT FALSE,
    op_070A_timestamp VARCHAR(36) DEFAULT '',
    op_070A_carrier_adhesive_exposed_time INTEGER DEFAULT 0,
    op_070A_front_plate_laser_pass BOOL DEFAULT FALSE,
    op_070A_front_plate_laser_fail BOOL DEFAULT FALSE,
    op_070A_front_plate_laser_complete BOOL DEFAULT FALSE,
    op_070B_pass BOOL DEFAULT FALSE,
    op_070B_fail BOOL DEFAULT FALSE,
    op_070B_complete BOOL DEFAULT FALSE,
    op_070B_timestamp VARCHAR(36) DEFAULT '',
    op_080_pass BOOL DEFAULT FALSE,
    op_080_fail BOOL DEFAULT FALSE,
    op_080_complete BOOL DEFAULT FALSE,
    op_080_timestamp VARCHAR(36) DEFAULT '',
    op_090A_pass BOOL DEFAULT FALSE,
    op_090A_fail BOOL DEFAULT FALSE,
    op_090A_complete BOOL DEFAULT FALSE,
    op_090A_timestamp VARCHAR(36) DEFAULT '',
    op_090B_pass BOOL DEFAULT FALSE,
    op_090B_fail BOOL DEFAULT FALSE,
    op_090B_complete BOOL DEFAULT FALSE,
    op_090B_timestamp VARCHAR(36) DEFAULT '',
    op_100_pass BOOL DEFAULT FALSE,
    op_100_fail BOOL DEFAULT FALSE,
    op_100_complete BOOL DEFAULT FALSE,
    op_100_timestamp VARCHAR(36) DEFAULT '',
    op_100_retry_count INTEGER DEFAULT 0,
    op_100_welder_number INTEGER DEFAULT 0,
    op_110A_pass BOOL DEFAULT FALSE,
    op_110A_fail BOOL DEFAULT FALSE,
    op_110A_complete BOOL DEFAULT FALSE,
    op_110A_timestamp VARCHAR(36) DEFAULT '',
    op_120_pass BOOL DEFAULT FALSE,
    op_120_fail BOOL DEFAULT FALSE,
    op_120_complete BOOL DEFAULT FALSE,
    op_120_timestamp VARCHAR(36) DEFAULT '',
    op_130A_pass BOOL DEFAULT FALSE,
    op_130A_fail BOOL DEFAULT FALSE,
    op_130A_complete BOOL DEFAULT FALSE,
    op_130A_timestamp VARCHAR(36) DEFAULT '',
    op_130B_pass BOOL DEFAULT FALSE,
    op_130B_fail BOOL DEFAULT FALSE,
    op_130B_complete BOOL DEFAULT FALSE,
    op_130B_timestamp VARCHAR(36) DEFAULT '',
    op_140_pass BOOL DEFAULT FALSE,
    op_140_fail BOOL DEFAULT FALSE,
    op_140_complete BOOL DEFAULT FALSE,
    op_140_timestamp VARCHAR(36) DEFAULT '',
    op_140_retry_count INTEGER DEFAULT 0,
    op_140_welder_number INTEGER DEFAULT 0,    
    op_150A_pass BOOL DEFAULT FALSE,
    op_150A_fail BOOL DEFAULT FALSE,
    op_150A_complete BOOL DEFAULT FALSE,
    op_150A_timestamp VARCHAR(36) DEFAULT '',
    op_150B_pass BOOL DEFAULT FALSE,
    op_150B_fail BOOL DEFAULT FALSE,
    op_150B_complete BOOL DEFAULT FALSE,
    op_150B_timestamp VARCHAR(36) DEFAULT '',
    op_150C_pass BOOL DEFAULT FALSE,
    op_150C_fail BOOL DEFAULT FALSE,
    op_150C_complete BOOL DEFAULT FALSE,
    op_150C_timestamp VARCHAR(36) DEFAULT '',
    op_160A_pass BOOL DEFAULT FALSE,
    op_160A_fail BOOL DEFAULT FALSE,
    op_160A_complete BOOL DEFAULT FALSE,
    op_160A_timestamp VARCHAR(36) DEFAULT '',
    op_160B_status_pass BOOL DEFAULT FALSE,
    op_160B_status_fail BOOL DEFAULT FALSE,
    op_160B_status_complete BOOL DEFAULT FALSE,
    op_160B_timestamp VARCHAR(36) DEFAULT ''
);

ALTER TABLE moduleline.op_160_robot_load OWNER TO ignitionadmin;

-- Create index on relevant columns
CREATE INDEX IF NOT EXISTS op_160_robot_load_index ON moduleline.op_160_robot_load (mfg_facility, mfg_line, mfg_cell, mfg_station);