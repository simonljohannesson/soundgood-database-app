--\c soundgood

INSERT INTO school  (name,	                    student_min_age,	max_num_student_admitted,   street,                     zip_code,   city)
VALUES              ('Soundgood Stockholm',	    16,	                24,                         'Karlbergs Slottsväg 12',	'17173',	'Solna');


INSERT INTO person (person_number,	    first_name,	surname,	    phone_number,	email,	            street,	                zip_code,	city)
VALUES              ('199008083326',	'Maria',	'Hansson',	    '0703112374',	'2882@gmail.com',	'Kåkbrinken 14',	    '11127',	'Stockholm'),
                    ('199008093327',	'Karl',	    'Jansson',	    '0703112375',	'1134@gmail.com',	'Folkungagatan 63',	    '11622',	'Stockholm'),
                    ('199008103328',	'Nils',	    'Gustafsson',   '0703112376',	'2667@gmail.com',	'Åsögatan 95',	        '11829',	'Stockholm'),
                    ('199008113329',	'Olof',	    'Persson',	    '0703112377',	'1284@gmail.com',	'Barnängs Tvärgränd 5',	'11643',	'Stockholm'),
                    ('199008123330',	'Yvonne',	'Olofsson',	    '0703112378',	'1769@gmail.com',	'Fregattvägen 83',	    '11768',	'Stockholm'),
                    ('199008133331',	'Mikael',	'Axelsson',	    '0703112379',	'1588@gmail.com',	'Vattugatan 4',	        '17273',	'Sundbyberg'),
                    ('199008143332',	'Marie',	'Ström',	    '0703112380',	'2365@gmail.com',	'Näckrosvägen 17',	    '16937',	'Solna'),
                    ('199008153333',	'Agneta',	'Lindström',    '0703112381',	'1829@gmail.com',	'Karlbergsvägen 65A',	'11335',	'Stockholm'),
                    ('199008233341',	'Anton',	'Lundin',	    '0703112382',	'1373@gmail.com',	'Tomtebogatan 14',	    '11339',	'Stockholm'),
                    ('199008263344',	'Sofie',	'Bergman',	    '0703112383',	'2532@gmail.com',	'Starrängsringen 22',	'11550',	'Stockholm'),
                    ('199008273345',	'Gun',	    'Nilsson',	    '0703112384',	'1942@gmail.com',	'Hornsgatan 63',	    '11849',	'Stockholm'),
                    ('199008283346',	'Ebba',	    'Björk',	    '0703112385',	'2162@gmail.com',	'Krukmakargatan 8',	    '11851',	'Stockholm'),
                    ('199008163334',	'Christian','Åberg',	    '0703112386',	'2057@gmail.com',	'Tjärhovsgatan 44',	    '11628',	'Stockholm'),
                    ('199008173335',	'Oscar',	'Sjögren',	    '0703112387',	'1342@gmail.com',	'Skånegatan 107',	    '11635',	'Stockholm'),
                    ('199008183336',	'Caroline',	'Hellström',    '0703112374',	'2133@gmail.com',	'Assessorsgatan 6',	    '11857',	'Stockholm'),
                    ('199008193337',	'Marianne',	'Sandberg',	    '0703112375',	'1152@gmail.com',	'Vindragarvägen 16',	'11750',	'Stockholm'),
                    ('199008203338',	'Ingrid',	'Lundgren',	    '0703112376',	'1085@gmail.com',	'Gröndalshamnen 3',	    '11766',	'Stockholm'),
                    ('199008213339',	'Hans',	    'Lindström',    '0703112377',	'2144@gmail.com',	'Alviksvägen 79',	    '16753',	'Bromma'),
                    ('199008243342',	'Charlotte','Svensson',	    '0703112378',	'1253@gmail.com',	'Baggensgatan 21',	    '11131',	'Stockholm');


INSERT INTO instructor
(   user_name,	
    password,
    person_id, 
    school_id
)
VALUES
(
    'bibby',
    'monkey123',
    (SELECT id FROM person WHERE person_number='199008163334'),
    (SELECT id FROM school WHERE name='Soundgood Stockholm')
),
(
    'shipper',
    'boat90',
    (SELECT id FROM person WHERE person_number='199008173335'),
    (SELECT id FROM school WHERE name='Soundgood Stockholm')
),
(
    'mana',	
    'waves59',
    (SELECT id FROM person WHERE person_number='199008183336'),
    (SELECT id FROM school WHERE name='Soundgood Stockholm')
),
(
    'goober',
    'carnival88',
    (SELECT id FROM person WHERE person_number='199008193337'), -- 199008193337
    (SELECT id FROM school WHERE name='Soundgood Stockholm') 
),
(
    'ladd',
    'bard5',
    (SELECT id FROM person WHERE person_number='199008203338'),
    (SELECT id FROM school WHERE name='Soundgood Stockholm')
),
(
    'mars',
    'space11',
    (SELECT id FROM person WHERE person_number='199008213339'),
    (SELECT id FROM school WHERE name='Soundgood Stockholm')
);


INSERT INTO student 
(
    user_name,	
    password,	
    enrolled,	
    should_save_application,	
    person_id,	
    school_id
)
VALUES
('musa',	    'horse23',	'yes',	'no',	(SELECT id FROM person WHERE person_number='199008083326'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('master',	    'car22',	'yes',	'no',	(SELECT id FROM person WHERE person_number='199008093327'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('crazydrums',	'formula98','yes',	'no',	(SELECT id FROM person WHERE person_number='199008103328'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('singer',	    'open43',	'no',	'yes',	(SELECT id FROM person WHERE person_number='199008113329'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('donut',	    'danger88',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008123330'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('maker',	    'logo02',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008133331'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('lag', 	    'banned32',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008143332'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('driver',	    'bottle12',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008153333'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('runner',	    'nike99',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008233341'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('painter',	    'paint32',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008263344'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('jumper',	    'sand34',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008273345'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('eater',	    'kebab44',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008283346'),	(SELECT id FROM school WHERE name='Soundgood Stockholm')),
('drinker',	    'coffe77',	'yes',	'yes',	(SELECT id FROM person WHERE person_number='199008243342'),	(SELECT id FROM school WHERE name='Soundgood Stockholm'));


INSERT INTO ensamble
(
        ensamble_name,	min_num_students,	max_num_students
)
VALUES  ('rock',	    4,	                9),
        ('classical',	4,	                9),
        ('funk',	    4,	                9);

INSERT INTO fee_scale
(discount_percent_per_sibling,	base_price_per_student,	extra_beginner,	extra_intermediate,	extra_advanced,	extra_audition,	extra_individual_lesson, extra_group_lesson, extra_ensamble_lesson, school_id)
VALUES
(5,	200,	0,	75,	125,	0,	200,	0,	0, (SELECT id FROM school WHERE name='Soundgood Stockholm'));

INSERT INTO payment_scale
(base_pay,	extra_beginner,	extra_intermediate,	extra_advanced,	extra_audition,	extra_individual_lesson,	extra_group_lesson,	extra_ensamble_lesson, school_id)
VALUES
(300,	0,	50,	100,	0,	0,	200,	200, (SELECT id FROM school WHERE name='Soundgood Stockholm'));


INSERT INTO instrument_type
(
    type
)
VALUES
    ('guitar'),
    ('drums'),
    ('recorder'),
    ('banjo');


INSERT INTO extra_cost_day
(
    day,
    surcharge,
    school_id
)
VALUES
('saturday',	        50,     (SELECT id FROM school WHERE name='Soundgood Stockholm')),
('sunday',	            50,     (SELECT id FROM school WHERE name='Soundgood Stockholm')),
('holiday',	            100,    (SELECT id FROM school WHERE name='Soundgood Stockholm')),
('daybeforeholiday',	25,     (SELECT id FROM school WHERE name='Soundgood Stockholm'));


INSERT INTO rental_instrument
(
    instrument_id,
    monthly_fee,
    brand,
    max_lease_in_days,
    instrument_type_id
)
VALUES
('guitarr1',   500,	    'Fender',   30,	(SELECT id FROM instrument_type WHERE type='guitar')),
('guitarr2',   750, 	'Fender',   30,	(SELECT id FROM instrument_type WHERE type='guitar')),
('drums1',     1500,	'Yamaha',   30,	(SELECT id FROM instrument_type WHERE type='drums')),
('recorder1',  200,	    'Yamaha',   30,	(SELECT id FROM instrument_type WHERE type='recorder')),
('recorder2',  230,	    'Yamaha',   30,	(SELECT id FROM instrument_type WHERE type='recorder')),
('recorder3',  180,	    'Windy',    30,	(SELECT id FROM instrument_type WHERE type='recorder')),
('recorder4',  210,	    'Windy',    30,	(SELECT id FROM instrument_type WHERE type='recorder'));



INSERT INTO student_skill
(
    student_id,
    level,
    instrument_type_id
)
VALUES
((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008083326'),	
'BEGINNER',	
(SELECT id FROM instrument_type WHERE type='guitar')),

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008093327'),	
'BEGINNER',	
(SELECT id FROM instrument_type WHERE type='guitar')),
	
((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008103328'),	
'BEGINNER',	
(SELECT id FROM instrument_type WHERE type='guitar')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008113329'),	
'ADVANCED',	
(SELECT id FROM instrument_type WHERE type='guitar')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008123330'),	
'BEGINNER',	
(SELECT id FROM instrument_type WHERE type='guitar')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008133331'),	
'BEGINNER',	
(SELECT id FROM instrument_type WHERE type='recorder')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008143332'),	
'INTERMEDIATE',	
(SELECT id FROM instrument_type WHERE type='recorder')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008153333'),	
'INTERMEDIATE',	
(SELECT id FROM instrument_type WHERE type='recorder')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008233341'),	
'INTERMEDIATE',	
(SELECT id FROM instrument_type WHERE type='recorder')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008263344'),	
'INTERMEDIATE',	
(SELECT id FROM instrument_type WHERE type='guitar')),			

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008273345'),	
'INTERMEDIATE',	
(SELECT id FROM instrument_type WHERE type='drums')),		

((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008283346'),	
'INTERMEDIATE',	
(SELECT id FROM instrument_type WHERE type='guitar')),		
	
((select s.id
from person as p
inner join student as s on p.id=s.person_id
and p.person_number='199008243342'),	
'ADVANCED',	
(SELECT id FROM instrument_type WHERE type='guitar'));		


INSERT INTO instructor_time_slot
(
    instructor_id,
    start_time,
    end_time
)
VALUES
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008163334'),'2020-12-05 08:00:00','2020-12-05 09:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008163334'),'2020-12-05 10:00:00','2020-12-05 11:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008173335'),'2020-12-05 11:00:00','2020-12-05 12:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008173335'),'2020-12-05 13:00:00','2020-12-05 14:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-12-05 14:00:00','2020-12-05 15:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-12-05 15:00:00','2020-12-05 16:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008193337'),'2020-12-05 16:00:00','2020-12-05 17:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008193337'),'2020-12-05 17:00:00','2020-12-05 18:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-12-23 10:00:00','2020-12-23 11:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-12-23 13:00:00','2020-12-23 14:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2021-03-23 13:00:00','2020-03-23 14:00:00'
)
;



INSERT INTO instructor_instrument
(
    instructor_id,
    instrument_type_id
)
VALUES
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008163334'),
    (SELECT id FROM instrument_type WHERE type='guitar')
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008173335'),
    (SELECT id FROM instrument_type WHERE type='guitar')
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008173335'),
    (SELECT id FROM instrument_type WHERE type='drums')
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008173335'),
    (SELECT id FROM instrument_type WHERE type='recorder')
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),
    (SELECT id FROM instrument_type WHERE type='recorder')
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008163334'),
    (SELECT id FROM instrument_type WHERE type='recorder')
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008193337'),
    (SELECT id FROM instrument_type WHERE type='recorder')
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);

INSERT INTO sibling
(
    student_id,
    person_number
)
VALUES
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008233341'),
    '199008263344'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008263344'),
    '199008233341'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008103328'),
    '200501011010'
);

INSERT INTO parent
(
    student_id,
    phone_number,
    email
)
VALUES
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008263344'),
    '0703801183', '33@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008083326'),
    '0234464566', '22@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008093327'),
    '0324432656', '11@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008103328'),
    '4524523453', '00@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008113329'),
    '5634565645', '9@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008123330'),
    '6353456346', '8@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008133331'),
    '5672452345', '7@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008143332'),
    '2345234554', '6@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008153333'),
    '6567893434', '5@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008233341'),
    '3456789042', '4@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008273345'),
    '5678903244', '3@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008283346'),
    '324', '1@gmail.com'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008243342'),
    '863', '2@gmail.com'
);


INSERT INTO rental
(
    student_id,
    rental_instrument_id,
    start_date
)
VALUES
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM rental_instrument WHERE instrument_id='guitarr1'),
    '2020-12-03'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008153333'),
    (SELECT id FROM rental_instrument WHERE instrument_id='recorder3'),
    '2020-12-04'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008143332'),
    (SELECT id FROM rental_instrument WHERE instrument_id='recorder4'),
    '2020-12-01'
),
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008263344'),
    (SELECT id FROM rental_instrument WHERE instrument_id='guitarr2'),
    '2020-11-22'
);

INSERT INTO rental
(
    student_id,
    rental_instrument_id,
    start_date,
    return_date
)
VALUES
(
    (SELECT s.id FROM person as p INNER JOIN student as s ON p.id=s.person_id where p.person_number='199008263344'),
    (SELECT id FROM rental_instrument WHERE instrument_id='guitarr2'),
    '2020-10-14',
    '2020-11-08'
);

INSERT INTO instructor_ensamble
(
    instructor_id,
    ensamble_id
)
VALUES
(
    (select i.id from instructor as i 
    inner join person as p on p.id=i.person_id 
    where p.person_number='199008183336'),
    (select id from ensamble
    where ensamble_name='funk')
),
(
    (select i.id from instructor as i 
    inner join person as p on p.id=i.person_id 
    where p.person_number='199008203338'),
    (select id from ensamble
    where ensamble_name='rock')
),
(
    (select i.id from instructor as i 
    inner join person as p on p.id=i.person_id 
    where p.person_number='199008213339'),
    (select id from ensamble
    where ensamble_name='classical')
);

INSERT INTO location( room_identifier )
VALUES
('ga-208'),
('ga-209'),
('ga-308'),
('ga-309');



-- group lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-208'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008163334'),
    'BEGINNER',
    1
)
RETURNING id
)
, last_g_lesson as( -- with continue
INSERT INTO group_lesson 
(
    lesson_id,
    min_num_students,
    max_num_students,
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    2,
    4,
    (SELECT id FROM instrument_type WHERE type='guitar')
)
RETURNING id
)
INSERT INTO group_lesson_student
(
    student_id,
    group_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_g_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_g_lesson)
);



-- group lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-208'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'INTERMEDIATE',
    6
)
RETURNING id
)
, last_g_lesson as( -- with continue
INSERT INTO group_lesson 
(
    lesson_id,
    min_num_students,
    max_num_students,
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    2,
    4,
    (SELECT id FROM instrument_type WHERE type='recorder')
)
RETURNING id
)
INSERT INTO group_lesson_student
(
    student_id,
    group_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008143332'),
    (SELECT id FROM last_g_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008153333'),
    (SELECT id FROM last_g_lesson)
);



-- group lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-208'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'INTERMEDIATE',
    11
)
RETURNING id
)
, last_g_lesson as( -- with continue
INSERT INTO group_lesson 
(
    lesson_id,
    min_num_students,
    max_num_students,
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    2,
    4,
    (SELECT id FROM instrument_type WHERE type='recorder')
)
RETURNING id
)
INSERT INTO group_lesson_student
(
    student_id,
    group_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008143332'),
    (SELECT id FROM last_g_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008153333'),
    (SELECT id FROM last_g_lesson)
);




-- ensamble lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008173335'),
    'BEGINNER',
    3
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='funk'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);


INSERT INTO audition
(
    student_id,             
    audition_passed,        
    location_id,            
    instrument_type_id,     
    school_id,              
    instructor_time_slot_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008113329'),
    FALSE,
    (SELECT id FROM location where room_identifier='ga-309'),
    (SELECT id FROM instrument_type WHERE type='guitar'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    2
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008243342'),
    TRUE,
    (SELECT id FROM location where room_identifier='ga-309'),
    (SELECT id FROM instrument_type WHERE type='guitar'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    4
);



-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008193337'),
    'INTERMEDIATE',
    7
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008143332'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);


-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008193337'),
    'INTERMEDIATE',
    8
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008153333'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);


-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'INTERMEDIATE',
    5
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008233341'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);

-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################
-- ################################ TIME SENSITIVE TEST DATA ############################################
-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################
INSERT INTO instructor_time_slot
(
    instructor_id,
    start_time,
    end_time
)
VALUES
-- func instructor
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-12-21 14:00:00','2020-12-21 15:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-12-23 14:00:00','2020-12-23 15:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-12-27 14:00:00','2020-12-27 15:00:00'
),

-- classical instructor
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008213339'),'2020-12-21 15:00:00','2020-12-21 16:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008213339'),'2020-12-22 15:00:00','2020-12-22 16:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008213339'),'2020-12-27 15:00:00','2020-12-27 16:00:00'
),
-- rock instructor
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-12-21 10:00:00','2020-12-21 11:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-12-22 10:00:00','2020-12-22 11:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-12-27 10:00:00','2020-12-27 11:00:00'
);



-- funk ensambles 
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'BEGINNER',
    12 -- 2020-12-21 14:00:00	2020-12-21 15:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='funk'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);

with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'BEGINNER',
    13 -- 2020-12-23 14:00:00	2020-12-23 15:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='funk'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);

with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'BEGINNER',
    14 -- 2020-12-27 14:00:00	2020-12-27 15:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='funk'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);

-- classical ensambles 
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008213339'),
    'BEGINNER',
    15 -- 2020-12-21 15:00:00	2020-12-21 16:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='classical'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);

with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008213339'),
    'BEGINNER',
    16 -- 2020-12-22 15:00:00	2020-12-22 16:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='classical'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);

with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008213339'),
    'BEGINNER',
    17 -- 2020-12-27 15:00:00	2020-12-27 16:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='classical'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);


-- rock ensambles
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008203338'),
    'BEGINNER',
    18 -- 2020-12-21 10:00:00	2020-12-21 11:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='rock'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008203338'),
    'BEGINNER',
    19 -- 2020-12-22 10:00:00	2020-12-22 11:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='rock'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008203338'),
    'BEGINNER',
    20 -- 2020-12-27 10:00:00	2020-12-27 11:00:00
)
RETURNING id
)
, last_e_lesson as( -- with continue
INSERT INTO ensamble_lesson 
(
    ensamble_id,
    lesson_id
)
VALUES
(
    (SELECT id FROM ensamble WHERE ensamble_name='rock'),
    (select id from last_lesson)
)
RETURNING id
)
INSERT INTO ensamble_lesson_student
(
    student_id,
    ensamble_lesson_id
)
VALUES
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008103328'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008133331'),
    (SELECT id FROM last_e_lesson)
),
(
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM last_e_lesson)
);

-- time slots to test query no 5

INSERT INTO instructor_time_slot
(
    instructor_id,
    start_time,
    end_time
)
VALUES
-- new instructor
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-11-10 14:00:00','2020-11-10 15:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-11-12 14:00:00','2020-11-12 15:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008183336'),'2020-11-14 14:00:00','2020-11-14 15:00:00'
),

-- new instructor
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008213339'),'2020-11-10 15:00:00','2020-11-10 16:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008213339'),'2020-11-12 15:00:00','2020-11-12 16:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008213339'),'2020-11-14 15:00:00','2020-11-14 16:00:00'
),
-- new instructor
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-11-10 10:00:00','2020-11-10 11:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-11-12 10:00:00','2020-11-12 11:00:00'
),
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008203338'),'2020-11-14 10:00:00','2020-11-14 11:00:00'
),
-- new instructor
(
    (select i.id
    from person as p
    inner join instructor as i on p.id=i.person_id
    and p.person_number='199008163334'),'2020-11-10 10:00:00','2020-11-10 11:00:00'
);

-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'INTERMEDIATE',
    21
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);



-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'INTERMEDIATE',
    22
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);




-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008183336'),
    'INTERMEDIATE',
    23
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008093327'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);





-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008213339'),
    'INTERMEDIATE',
    24
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008113329'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);


-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008213339'),
    'INTERMEDIATE',
    25
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008113329'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);



-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008203338'),
    'INTERMEDIATE',
    27
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008143332'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);




-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008203338'),
    'INTERMEDIATE',
    28
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008143332'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);


-- individual_lesson
with last_lesson as (
INSERT INTO lesson 
(
    location_id,            
    school_id,              
    instructor_id,          
    skill_level,            
    instructor_time_slot_id
)
VALUES
(
    (SELECT id FROM location where room_identifier='ga-308'),
    (SELECT id FROM school where name='Soundgood Stockholm'),
    (SELECT i.id FROM instructor as i 
     INNER JOIN person as p ON p.id=i.person_id
     WHERE p.person_number='199008163334'),
    'INTERMEDIATE',
    30
)
RETURNING id
)
INSERT INTO individual_lesson 
(
    lesson_id,         
    student_id,        
    instrument_type_id
)
VALUES
(
    (select id from last_lesson),
    (SELECT s.id from student as s inner join person as p on p.id=s.person_id where p.person_number='199008083326'),
    (SELECT id FROM instrument_type WHERE type='recorder')
);

-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################
-- ########################################   END    ####################################################
-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################
-- ######################################################################################################


