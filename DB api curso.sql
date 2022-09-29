CREATE TABLE "users" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "age" int NOT NULL,
  "rol_id" uuid NOT NULL
);

CREATE TABLE "roles" (
  "id" uuid PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "curses" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "level_id" uuid NOT NULL,
  "teacher_id" uuid NOT NULL,
  "category_id" uuid NOT NULL,
  "course_video_id" uuid NOT NULL
);

CREATE TABLE "levels" (
  "id" uuid PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "curse_videos" (
  "id" uuid PRIMARY KEY,
  "title" varchar NOT NULL,
  "url" varchar UNIQUE NOT NULL
);

CREATE TABLE "categories" (
  "id" uuid PRIMARY KEY,
  "name" varchar UNIQUE NOT NULL
);

CREATE TABLE "user_course_states" (
  "id" uuid PRIMARY KEY,
  "curse_id" uuid NOT NULL,
  "course_state_id" uuid NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "course_states" (
  "id" uuid PRIMARY KEY,
  "state" varchar NOT NULL
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY,
  "name_teacher" varchar NOT NULL
);

ALTER TABLE "users" ADD FOREIGN KEY ("rol_id") REFERENCES "roles" ("id");

ALTER TABLE "curses" ADD FOREIGN KEY ("category_id") REFERENCES "categories" ("id");

ALTER TABLE "user_course_states" ADD FOREIGN KEY ("course_state_id") REFERENCES "course_states" ("id");

ALTER TABLE "curses" ADD FOREIGN KEY ("teacher_id") REFERENCES "teachers" ("id");

ALTER TABLE "curses" ADD FOREIGN KEY ("level_id") REFERENCES "levels" ("id");

ALTER TABLE "user_course_states" ADD FOREIGN KEY ("curse_id") REFERENCES "curses" ("id");

ALTER TABLE "curses" ADD FOREIGN KEY ("course_video_id") REFERENCES "curse_videos" ("id");

ALTER TABLE "user_course_states" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");



-- crear roles 
insert into roles (
	id,
	name
) values 
(
	'5a6464d5-d527-4d83-8e12-d7b2f44bc730',
	'Admin'	
),
(
	'92ffcb8a-c8ec-4a06-a975-eef5f24c4b4e',
	'Teacher'	
),
(
	'd0a3797f-1ad8-41e2-921e-51d3908ca04d',
	'Student'	
);

-- crear estados del curso
insert into course_states (
id,
state)values(
'b068e952-1317-445a-af05-7fec61fd9c3f',
'not started'
),(
'b741627c-2893-40b2-8f40-145852431081',
'in process'
),(
'c1bb20e0-4433-4c8f-a8fb-d3c85c9b0067',
'finalized'
);

-- crear categorias del curso

insert into categories (
id,
name)values(
'930745ab-4ba0-4e4f-b943-8bf5bb733ac8',
'Free'
),(
'3a9d34a9-37d0-4a18-a37d-fec945b7f9a9',
'Paid'
);

-- crear profesores de los cursos
 insert into teachers (
id,
name_teacher)values(
'0a56cdd2-e3e9-445a-ad4e-da021dfb1d46',
'Brayan'
),(
'407b7131-0be5-402a-9823-b100da5277fa',
'Sahid'
);

-- crear niveles de los cursos
 insert into levels (
id,
name)values(
'4e607d5f-a0d1-4aff-a049-2650861e05ae',
'beginner'
),(
'5112b01a-e4bc-4811-8ae9-a3752c5b5f1c',
'intermediate'
),(
'1396a48b-1673-4378-a7df-76e1144ffa24',
'professional'
);

-- crear videos del curso
 insert into curse_videos (
id,
title,
url)values(
'188a82c9-5928-4245-91a2-e338d2c1a1f3',
'Consultas Insert into y Select, ejercicio en equipo',
'esto seria una url'
),(
'811bd1bd-e70d-47cc-8993-4f41b4ca2691',
'Consultas Update y Delete, Relaciones 1:1 1:M M:M',
'esto seria otra url'
),(
'29d00cf7-207d-4edd-8b2f-e1cb89dc78d0',
'Normalizacion de bases de datos, entregable 1',
'aqui va la otra url'
);


-- crear curso 
 insert into curses (
id,
title,
description,
level_id,
teacher_id,
category_id,
course_video_id)values(
'47da9c84-0cdf-4ad5-bf5b-fdaad78d5990',
'Fundamentos',
'incorporacion al mundo de la programacion enseñando los fundamentos basicos para el manejo de JS, HTML y CSS',
'4e607d5f-a0d1-4aff-a049-2650861e05ae',
'0a56cdd2-e3e9-445a-ad4e-da021dfb1d46',
'930745ab-4ba0-4e4f-b943-8bf5bb733ac8',
'188a82c9-5928-4245-91a2-e338d2c1a1f3'
),(
'011a84dc-6349-43ac-ad16-73709c05bb75',
'Base de datos',
'Es un curso enfocado a la creación de APIs REST (la mayoría de APIs que forman internet) y a la creación de servidores',
'5112b01a-e4bc-4811-8ae9-a3752c5b5f1c',
'407b7131-0be5-402a-9823-b100da5277fa',
'3a9d34a9-37d0-4a18-a37d-fec945b7f9a9',
'29d00cf7-207d-4edd-8b2f-e1cb89dc78d0'
);



--crear usuarios

insert into users (
	id,
	name,
	email,
	password,
	age,
	rol_id
) values 
(
	'e1146c43-e8a3-46f4-8c6e-075061f1945d',
	'Lenin',
	'lenin.k@example.com',
	'abcd',
	22,
	'5a6464d5-d527-4d83-8e12-d7b2f44bc730' -- admin
)
,
(
	'484a9c45-5f18-412b-ae83-c177b7e032d1',
	'Kelvyn',
	'kelvynL@academlo.com',
	'root123',
	25,
	'd0a3797f-1ad8-41e2-921e-51d3908ca04d'  -- student
)
,
(
	'f9d42278-44c1-4e00-8f01-49b838ba16d5',
	'Benjamin',
	'Benja@academlo.com',
	'123412',
	27,
	'92ffcb8a-c8ec-4a06-a975-eef5f24c4b4e'  -- teacher
 	)
;

-- crear relacion usuarios-cursos
insert into user_course_states (
  id,
  curse_id,
  course_state_id,
  user_id)
 values (
 'd4ba9912-0904-4d04-8117-06fa65a2c679',
 '47da9c84-0cdf-4ad5-bf5b-fdaad78d5990',
 'c1bb20e0-4433-4c8f-a8fb-d3c85c9b0067',
 '484a9c45-5f18-412b-ae83-c177b7e032d1'
 ),
 (
  '1bb34bb9-c2f2-4ecb-be07-9e38d071e849',
 '011a84dc-6349-43ac-ad16-73709c05bb75',
 'b741627c-2893-40b2-8f40-145852431081',
 '484a9c45-5f18-412b-ae83-c177b7e032d1'
 );


-- join con view
select 
	users.id, 
	users.name, 
	curses.title ,
	course_states.state
from users 
inner join 
	user_course_states
on
	users.id = user_course_states.user_id
inner join
	curses
on curses.id = user_course_states.curse_id
inner  join 
course_states 
on course_states.id =  user_course_states.course_state_id 
;


-- view
create  view v_courses_users as select 
	users.id, 
	users.name, 
	curses.title ,
	course_states.state
from users 
inner join 
	user_course_states
on
	users.id = user_course_states.user_id
inner join
	curses
on curses.id = user_course_states.curse_id
inner  join 
course_states 
on course_states.id =  user_course_states.course_state_id 
;




