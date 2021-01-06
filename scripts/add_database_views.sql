--\c soundgood

---------------------------------------------------------------------------------------------------
--\echo QUERY 1 IMPROVED: V2.0
---------------------------------------------------------------------------------------------------
-- Show the number of instruments rented per month during a specified year. It shall be possible to 
-- retrieve the total number of rented instruments (just one number) and rented instruments of each
-- kind (one number per kind, guitar, trumpet, etc). The latter list shall be sorted by number of 
-- entals. This query is expected to be performed a few times per week.
---------------------------------------------------------------------------------------------------
CREATE VIEW rented_instruments_per_month_2020_view AS
    SELECT 
    COALESCE(it.type, 'all')         AS instrument_type,
    DATE_PART('month', r.start_date) AS month,
    COUNT(*)                         AS instruments_rented
    
    FROM rental AS r
    INNER JOIN rental_instrument AS ri
    ON ri.id=r.rental_instrument_id
    INNER JOIN instrument_type AS it
    ON it.id=ri.instrument_type_id
    WHERE date_part('year', r.start_date)=2020
    GROUP BY GROUPING sets((it.type, month), month)
    ORDER BY CASE
        WHEN GROUPING(it.type)=1 THEN 1
        ELSE 0
    END
    ,month ASC, count(*) DESC;
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
--\echo QUERY 2
---------------------------------------------------------------------------------------------------
-- The same as above, but retrieve the average number of rentals per month during the entire year, 
-- instead of the total for each month.
---------------------------------------------------------------------------------------------------
CREATE VIEW average_rented_instruments_per_month_2020_view AS
    SELECT 
      instrument_type,
      SUM(instruments_rented)/12.0 AS average_rentals_per_month
    FROM rented_instruments_per_month_2020_view
    GROUP BY instrument_type
    ORDER BY CASE
        WHEN instrument_type='all' THEN 1
        ELSE 0
    END
    ,average_rentals_per_month DESC, instrument_type ASC;
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
--\echo QUERY 3
---------------------------------------------------------------------------------------------------
-- Show the number of lessons given per month during a specified year. It shall be possible to
-- retrieve the total number of lessons (just one number) and the specific number of individual
-- lessons, group lessons and ensembles. This query is expected to be performed a few times per
-- week.
---------------------------------------------------------------------------------------------------
CREATE VIEW lessons_per_month_2020_view AS
    WITH lessons AS (
    SELECT 
    CASE
        WHEN EXISTS (SELECT il.id FROM individual_lesson AS il WHERE il.lesson_id=l.id) THEN 'Individual Lesson'
        WHEN EXISTS (SELECT gl.id FROM group_lesson AS gl WHERE gl.lesson_id=l.id) THEN 'Group Lesson'
        WHEN EXISTS (SELECT el.id FROM ensamble_lesson AS el WHERE el.lesson_id=l.id) THEN 'Ensamble Lesson'
    END                                  AS lesson_type,
    date_part('month', its.start_time)   AS month,
    count(*)                             AS number_of_lessons
    FROM lesson AS l
    INNER JOIN instructor_time_slot AS its
    ON l.instructor_time_slot_id=its.id
    WHERE date_part('year', its.start_time)=2020
    GROUP BY grouping sets ((lesson_type, month), month)
    )
    SELECT 
    COALESCE(lesson_type, 'All')   AS lesson_type,
    month                          AS month,
    number_of_lessons              AS number_of_lessons
    FROM lessons
    ORDER BY CASE
        WHEN lesson_type IS NULL THEN 1
        ELSE 0
    END
    , month ASC, number_of_lessons DESC;
---------------------------------------------------------------------------------------------------


---------------------------------------------------------------------------------------------------
--\echo QUERY 4
---------------------------------------------------------------------------------------------------
-- The same as above, but retrieve the average number of lessons per month during the entire year,
-- instead of the total for each month.
---------------------------------------------------------------------------------------------------
CREATE VIEW average_lessons_per_month_2020_view AS
    SELECT 
    lesson_type,
    SUM (number_of_lessons) / 12.0 AS average_number_of_lessons_per_month
    FROM lessons_per_month_2020_view
    group by lesson_type
        ORDER BY CASE
            WHEN lesson_type='All' THEN 1
            ELSE 0
        END
        , average_number_of_lessons_per_month DESC;
---------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------
--\echo QUERY 5
---------------------------------------------------------------------------------------------------
-- List all instructors who has given more than a specific number of lessons during the current
-- month. Sum all lessons, independent of type. Also list the three instructors having given most
-- lessons (independent of lesson type) during the last month, sorted by number of given lessons.
-- This query will be used to find instructors risking to work too much, and will be executed daily.
---------------------------------------------------------------------------------------------------
CREATE VIEW instructors_at_risk_view AS
    select 
    i.id               AS instructor_id,
    p.first_name       AS first_name,
    p.surname          AS surname,
    p.person_number    AS person_number,
    COUNT(*)           AS number_of_lessons,
    'last 30 days'     AS time_period
    FROM lesson AS l
    INNER JOIN instructor AS i
    ON l.instructor_id=i.id
    INNER JOIN person AS p
    ON p.id=i.person_id
    INNER JOIN instructor_time_slot AS its
    ON its.id=l.instructor_time_slot_id
    WHERE its.start_time >= NOW() - (INTERVAL '30 day')
    GROUP BY (i.id, p.first_name, p.surname, person_number, time_period)
    HAVING COUNT(*)>=2                                                   --  count bigger than num

    UNION

    (
    SELECT
    i.id               AS instructor_id,
    p.first_name       AS first_name,
    p.surname          AS surname,
    p.person_number    AS person_number,
    COUNT(*)           AS number_of_lessons,
    'last 30-60 days'  AS time_period
    FROM lesson AS l
    INNER JOIN instructor AS i
    ON l.instructor_id=i.id
    INNER JOIN person AS p
    ON p.id=i.person_id
    INNER JOIN instructor_time_slot AS its
    ON its.id=l.instructor_time_slot_id
    WHERE its.start_time BETWEEN NOW() - (INTERVAL '60 day') AND NOW() - (INTERVAL '30 day')
    GROUP BY (i.id, p.first_name, p.surname, person_number, time_period)
    ORDER BY number_of_lessons DESC
    LIMIT 3
    )

    ORDER BY time_period DESC, number_of_lessons DESC;
---------------------------------------------------------------------------------------------------



---------------------------------------------------------------------------------------------------
--\echo QUERY 6
---------------------------------------------------------------------------------------------------
-- List all ensembles held during the next week, sorted by music genre and weekday. For each
-- ensemble tell whether it's full booked, has 1-2 seats left or has more seats left.
---------------------------------------------------------------------------------------------------
CREATE VIEW ensambles_next_week_view AS
    SELECT 
    e.ensamble_name,
    CASE 
        WHEN date_part('DOW', its.start_time) = 1 THEN 'Monday'
        WHEN date_part('DOW', its.start_time) = 2 THEN 'Tuesday'
        WHEN date_part('DOW', its.start_time) = 3 THEN 'Wednesday'
        WHEN date_part('DOW', its.start_time) = 4 THEN 'Thursday'
        WHEN date_part('DOW', its.start_time) = 5 THEN 'Friday'
        WHEN date_part('DOW', its.start_time) = 6 THEN 'Saturday'
        WHEN date_part('DOW', its.start_time) = 0 THEN 'Sunday'
    END AS day_of_week,
    its.start_time,
    --  count (*) as students_signed_up,
    CASE
        WHEN   count(*) >= e.max_num_students THEN 'Fully booked'
        WHEN   count(*) BETWEEN e.max_num_students - 1 AND e.max_num_students - 2 THEN '1-2 places left'
        ELSE   'Several places left'
    END AS booking_status
    FROM ensamble AS e
    INNER JOIN ensamble_lesson AS el
    ON e.id=el.ensamble_id
    INNER JOIN lesson AS l
    ON l.id=el.lesson_id
    INNER JOIN instructor_time_slot AS its
    ON its.id=l.instructor_time_slot_id
    INNER JOIN ensamble_lesson_student AS els
    ON el.id=els.ensamble_lesson_id
    WHERE DATE_PART('week', its.start_time)=DATE_PART('week', NOW() + INTERVAL '1 week')
    GROUP BY 
    e.ensamble_name,
    e.max_num_students,
    its.start_time
    ORDER BY 
    e.ensamble_name, 
        CASE
        WHEN date_part('DOW', its.start_time)=0 THEN 1
        ELSE 0
        END,
    DATE_PART('DOW', its.start_time), 
    its.start_time;

---------------------------------------------------------------------------------------------------
--\echo QUERY 7
---------------------------------------------------------------------------------------------------
-- List the three instruments with the lowest monthly rental fee. For each instrument tell whether
-- it is rented or available to rent. Also tell when the next group lesson for each listed
-- instrument is scheduled.
---------------------------------------------------------------------------------------------------
CREATE VIEW cheapest_rental_instruments_view AS
    WITH cheap_instruments AS (
    -- the three cheapest instruments
    SELECT 
    ri.instrument_id,
    it.type              AS instrument_type,
    it.id                AS instrument_type_id,
    CASE
        WHEN MAX(r.start_date) IS NULL THEN 'Available'
        WHEN MAX(r.start_date) + INTERVAL '30 day' < NOW() THEN 'Available'
        ELSE 'Rented out'
    END                  AS rental_status,
    MAX(r.start_date)    AS start_date_last_rental,
    ri.monthly_fee       AS monthly_fee
    
    FROM rental_instrument AS ri
    LEFT JOIN rental AS r
    ON r.rental_instrument_id=ri.id
    INNER JOIN instrument_type AS it
    ON ri.instrument_type_id=it.id
    GROUP BY (ri.instrument_id, it.type, it.id, ri.monthly_fee)
    ORDER BY monthly_fee ASC
    LIMIT 3
    )
    SELECT 
    ci.instrument_type, 
    ci.instrument_id, 
    ci.rental_status, 
    ci.monthly_fee, 
    min(its.start_time) AS start_next_group_lesson, 
    l.skill_level
    
    FROM group_lesson AS gl
    INNER JOIN cheap_instruments AS ci
    ON gl.instrument_type_id=ci.instrument_type_id
    INNER JOIN lesson AS l
    ON l.id=gl.lesson_id
    INNER JOIN instructor_time_slot AS its
    ON its.id=l.instructor_time_slot_id
    WHERE its.start_time > now()
    GROUP BY 
    ci.instrument_type, 
    ci.instrument_id, 
    ci.rental_status, 
    ci.monthly_fee, 
    l.skill_level
    ORDER BY monthly_fee ASC;

---------------------------------------------------------------------------------------------------
-- NON TASK VIEWS
---------------------------------------------------------------------------------------------------
CREATE VIEW available_rental_instruments AS
    with rental_instrument_info as (
        select
            ri.id as rental_instrument_id,
            instrument_id,
            brand,
            it.type,
            monthly_fee,
            max_lease_in_days,
            r.start_date as start_date,
            r.return_date,
            instrument_type_id,
            rank() over (partition by instrument_id order by start_date DESC) as rank
        from rental_instrument as ri
            full join rental as r
            on ri.id=r.rental_instrument_id
            inner join instrument_type as it
            on it.id=ri.instrument_type_id
    )
    select * from rental_instrument_info
    where   rank=1
            AND (
                (start_date IS NULL AND return_date IS NULL)
                OR return_date IS NOT NULL
                );
---------------------------------------------------------------------------------------------------