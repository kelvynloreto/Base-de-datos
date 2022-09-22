CREATE TABLE "todos" (
  "id" uuid PRIMARY KEY,
  "name" varchar NOT NULL,
  "task" varchar,
  "description" varchar,
  "its_finished" bool DEFAULT false
);

-- crear task
insert into todos (
id, 
name, 
task, 
description,
its_finished
) values 
(
'2d7f3026-bd6c-40bb-9e7c-46563badd837', 
'Kelvyn' , 
'study', 
'read about related topics in class', 
true ),
(
'2a1fa62a-e432-4d91-81ec-3e589c32d11b', 
'Lenin' , 
'Cook the lunch', 
'prepare the roast chicken for 5 people at 12 noon', 
 false ),
 (
'35cd9ed5-4c52-48e5-9a17-587012287a25', 
'Wilmen' , 
'work at the vet', 
'serve customers and check what medicine or treatment the animal requires', 
true );

-- leer todas las tareas
select  * from todos ;
-- leer las tareas que esten finalizadas
select name, task, description from todos where its_finished  = true;
-- agregar una columna
alter table todos add column date date;
-- agregar datos a la nueva columna
update  todos 
set date = '2022/09/22'
where name = 'Kelvyn';
update  todos 
set date = '2022/06/15'
where name = 'Wilmen';

-- actualizar datos 
update toDos set task= 'practice database', description= 'practice the database topics seen in class'
where task ='study' and description= 'read about related topics in class';
-- eliminar datos que ya no sean necesarios
delete from todos where task = 'work at the vet';
