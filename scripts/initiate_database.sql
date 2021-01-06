--CREATE DATABASE soundgood;

--\c soundgood

CREATE TABLE person (
    id                  SERIAL          PRIMARY KEY,
    person_number       VARCHAR(12)     NOT NULL,
    first_name          VARCHAR(300),
    surname             VARCHAR(300),
    street              VARCHAR(300),
    zip_code            VARCHAR(5),
    city                VARCHAR(200),
    phone_number        VARCHAR(20),
    email               VARCHAR(400)
);

CREATE TABLE location(
    id                  SERIAL          PRIMARY KEY,
    room_identifier     VARCHAR(100)    UNIQUE NOT NULL,
    building            VARCHAR(100),
    room                VARCHAR(100),
    street              VARCHAR(300),
    zip_code            VARCHAR(5),
    city                VARCHAR(200)
);


CREATE TABLE ensamble(
    id                          SERIAL          PRIMARY KEY,
    ensamble_name               VARCHAR(300)    UNIQUE NOT NULL,
    min_num_students            INTEGER,
    max_num_students            INTEGER
);

CREATE TABLE school(
    id                          SERIAL          PRIMARY KEY,
    name                        VARCHAR(300)    UNIQUE,
    student_min_age             INTEGER,
    max_num_student_admitted    INTEGER,
    street                      VARCHAR(300),
    zip_code                    VARCHAR(5),
    city                        VARCHAR(200)
);

CREATE TABLE extra_cost_day(
    id                  SERIAL,
    school_id           INTEGER             REFERENCES school (id) ON DELETE CASCADE,
    day                 VARCHAR(100)        UNIQUE NOT NULL,
    surcharge           INTEGER,
    PRIMARY KEY (id, school_id)
);

CREATE TABLE fee_scale(
    school_id                       INTEGER         REFERENCES school (id) ON DELETE CASCADE,
    discount_percent_per_sibling    INTEGER,
    base_price_per_student          INTEGER,
    extra_beginner                  INTEGER,
    extra_intermediate              INTEGER,
    extra_advanced                  INTEGER,
    extra_audition                  INTEGER,
    extra_individual_lesson         INTEGER,
    extra_group_lesson              INTEGER,
    extra_ensamble_lesson           INTEGER,
    PRIMARY KEY (school_id)
);

CREATE TABLE payment_scale(
    school_id                       INTEGER         REFERENCES school (id) ON DELETE CASCADE,
    base_pay                        INTEGER,
    extra_beginner                  INTEGER,
    extra_intermediate              INTEGER,
    extra_advanced                  INTEGER,
    extra_audition                  INTEGER,
    extra_individual_lesson         INTEGER,
    extra_group_lesson              INTEGER,
    extra_ensamble_lesson           INTEGER,
    PRIMARY KEY (school_id)
);

CREATE TABLE administrator(
    id              SERIAL          PRIMARY KEY,
    school_id       INTEGER         REFERENCES school (id),
    user_name       VARCHAR(800)    UNIQUE NOT NULL,
    password        VARCHAR(1000)   NOT NULL
);

CREATE TABLE student(
    id                          SERIAL          PRIMARY KEY,
    person_id                   INTEGER         UNIQUE REFERENCES person (id),
    user_name                   VARCHAR(800)    UNIQUE NOT NULL,
    password                    VARCHAR(1000)   NOT NULL,
    enrolled                    BOOLEAN,
    should_save_application     BOOLEAN,
    school_id                   INTEGER         REFERENCES school (id) ON DELETE CASCADE,
    date_enrolled               DATE
);

CREATE TABLE sibling(
    student_id                  INTEGER         REFERENCES student (id) ON DELETE CASCADE,
    person_number               CHAR(12)        NOT NULL,
    PRIMARY KEY (student_id, person_number)
);

CREATE TABLE parent(
    student_id                  INTEGER         REFERENCES student (id) ON DELETE CASCADE,
    phone_number                VARCHAR(20),
    email                       VARCHAR(400),
    PRIMARY KEY (student_id, phone_number, email)
);

CREATE TABLE instructor(
    id              SERIAL          PRIMARY KEY,
    person_id       INTEGER         UNIQUE REFERENCES person (id),
    user_name       VARCHAR(800)    UNIQUE NOT NULL,
    password        VARCHAR(1000)   NOT NULL,
    school_id       INTEGER         REFERENCES school (id) ON DELETE CASCADE
);

CREATE TABLE instrument_type(
    id              SERIAL          PRIMARY KEY,
    type            VARCHAR(300)    UNIQUE NOT NULL
);

CREATE DOMAIN SKILL_LEVEL as VARCHAR(20)
CHECK(
    VALUE ~ 'BEGINNER'
OR  VALUE ~ 'INTERMEDIATE'
OR  VALUE ~ 'ADVANCED'
);

CREATE TABLE student_skill(
    student_id          INTEGER         REFERENCES student (id),
    level               SKILL_LEVEL,
    instrument_type_id  INTEGER         REFERENCES instrument_type (id),
    PRIMARY KEY (student_id, level)
);

CREATE TABLE rental_instrument(
    id                  SERIAL          PRIMARY KEY,
    instrument_id       VARCHAR(200)    UNIQUE NOT NULL,
    brand               VARCHAR(200),
    instrument_type_id  INTEGER         REFERENCES instrument_type (id),
    monthly_fee         INTEGER,
    max_lease_in_days   INTEGER
);

CREATE TABLE rental(
    id                      SERIAL          PRIMARY KEY,
    student_id              INTEGER         REFERENCES student (id) ON DELETE SET NULL,
    rental_instrument_id    INTEGER         REFERENCES rental_instrument (id),
    start_date              DATE            NOT NULL,
    return_date             DATE
);

CREATE TABLE instructor_ensamble(
    ensamble_id         INTEGER     REFERENCES ensamble (id) ON DELETE CASCADE,
    instructor_id       INTEGER     REFERENCES instructor (id) ON DELETE CASCADE,
    PRIMARY KEY (ensamble_id, instructor_id)
);

CREATE TABLE instructor_instrument(
    instructor_id       INTEGER     REFERENCES instructor (id) ON DELETE CASCADE,
    instrument_type_id  INTEGER     REFERENCES instrument_type (id) ON DELETE CASCADE,
    PRIMARY KEY (instructor_id, instrument_type_id)
);

CREATE TABLE instructor_time_slot(
    id                      SERIAL          PRIMARY KEY,
    instructor_id           INTEGER         REFERENCES instructor (id) ON DELETE SET NULL,
    start_time              TIMESTAMP       NOT NULL,
    end_time                TIMESTAMP       NOT NULL
    -- time                    INTERVAL        NOT NULL
);

CREATE TABLE audition(
    id                      SERIAL          PRIMARY KEY,
    student_id              INTEGER         REFERENCES student (id) ON DELETE SET NULL,
    audition_passed         BOOLEAN,
    location_id             INTEGER         REFERENCES location (id) ON DELETE SET NULL,
    instrument_type_id      INTEGER         REFERENCES instrument_type (id),
    school_id               INTEGER         REFERENCES school (id) ON DELETE CASCADE,
    instructor_time_slot_id INTEGER         REFERENCES instructor_time_slot (id)
);

CREATE TABLE lesson(
    id                      SERIAL          PRIMARY KEY,
    location_id             INTEGER         REFERENCES location (id) ON DELETE SET NULL,
    school_id               INTEGER         REFERENCES school (id) ON DELETE CASCADE,
    instructor_id           INTEGER         REFERENCES instructor (id) ON DELETE SET NULL,
    skill_level             SKILL_LEVEL,
    instructor_time_slot_id INTEGER         REFERENCES instructor_time_slot (id)
);

CREATE TABLE group_lesson(
    id                      SERIAL          PRIMARY KEY,
    lesson_id               INTEGER         REFERENCES lesson (id) ON DELETE CASCADE,
    min_num_students        INTEGER         NOT NULL,
    max_num_students        INTEGER         NOT NULL,
    instrument_type_id      INTEGER         REFERENCES instrument_type (id)
);

CREATE TABLE group_lesson_student(
    student_id              INTEGER         REFERENCES student (id) ON DELETE CASCADE,
    group_lesson_id         INTEGER         REFERENCES group_lesson (id) ON DELETE CASCADE,
    PRIMARY KEY (student_id, group_lesson_id)
);

CREATE TABLE ensamble_lesson(
    id                      SERIAL          PRIMARY KEY,
    ensamble_id             INTEGER         REFERENCES ensamble (id),
    lesson_id               INTEGER         REFERENCES lesson (id) ON DELETE CASCADE
);

CREATE TABLE ensamble_lesson_student(
    student_id              INTEGER         REFERENCES student (id) ON DELETE CASCADE,
    ensamble_lesson_id      INTEGER         REFERENCES ensamble_lesson (id) ON DELETE CASCADE,
    PRIMARY KEY (student_id, ensamble_lesson_id)
);

CREATE TABLE individual_lesson(
    id                      SERIAL          PRIMARY KEY,
    lesson_id               INTEGER         REFERENCES lesson (id) ON DELETE CASCADE,
    student_id              INTEGER         REFERENCES student (id) ON DELETE SET NULL,
    instrument_type_id      INTEGER         REFERENCES instrument_type (id)
);

--\c postgres