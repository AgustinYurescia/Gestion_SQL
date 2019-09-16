/*#EJERCICIO 1#
start transaction;
insert into instructores
			values ('44-44444444-4','Daniel','Tapia','444-444444','dotapia@gmail.com','Ayacucho 4444', NULL);

commit;*/

/*#EJERCICIO 2#
start transaction;

insert into plan_capacitacion
values
('Administrador de BD','Instalación y confoguración MySQL. Lenguaje SQL. Usuarios y permisos.',300,'Presencial');

insert into plan_temas
values
('Administrador de BD','Instalación MySQL','Distintas configuraciones de instalación'),
('Administrador de BD','Configuración DBMS','Variables de entorno, su uso y configuración'),
('Administrador de BD','Lenguaje SQL','DML, DDL y TCL'),
('Administrador de BD','Usuarios y Permisos','Permisos de usuarios y DCL');

insert into examenes
values
('Administrador de BD',1),
('Administrador de BD',2),
('Administrador de BD',3),
('Administrador de BD',4);

insert into examenes_temas 
values
('Administrador de BD','Instalación MySQL',1),
('Administrador de BD','Configuración DBMS',2),
('Administrador de BD','Lenguaje SQL',3),
('Administrador de BD','Usuarios y Permisos',4);

insert into materiales
values
('AP-010','DBA en MySQL','www.afatse.com.ar/apuntes?AP=010','José Román',2,'2009/03/01',0,0,0),
('AP-011','SQL en MySQL','www.afatse.com.ar/apuntes?AP=011','Juan López',3,'2009/04/01',0,0,0);

insert into materiales_plan
values
('Administrador de BD','UT-001',0),
('Administrador de BD','UT-002',0),
('Administrador de BD','UT-003',0),
('Administrador de BD','UT-004',0),
('Administrador de BD','AP-010',0),
('Administrador de BD','AP-011',0);

insert into valores_plan
values ('Administrador de BD','2009/02/01',150);

commit;*/

/*#EJERCICIO 3#
start transaction;

update cursos
set cupo = cupo * 1.5
where cupo < 20;

update cursos
set cupo = cupo * 1.25
where cupo >= 20;

commit;*/

/*#EJERCICIO 4y5#

select	ins.cuil into @cuil_sup
		from instructores as ins
        where ins.nombre = 'Daniel' and ins.apellido = 'Tapia';
        
        select	ins.cuil into @cuil_ins1
		from instructores as ins
        where ins.nombre = 'Henri' and ins.apellido = 'Amiel';
        
        select	ins.cuil into @cuil_ins2
		from instructores as ins
        where ins.nombre = 'Franz' and ins.apellido = 'Kafka';

start transaction;

update instructores
set cuil_supervisor = @cuil_sup
where cuil in (@cuil_ins1, @cuil_ins2);

commit;*/

/*#EJERCICIO 6#
start transaction;

update alumnos
set direccion = 'Italia 2323', tel = '23232323'
where dni='23232323';

commit;*/

/*#EJERCICIO 7#
start transaction;

delete from valores_plan where nom_plan='Administrador de BD';
delete from materiales_plan where nom_plan='Administrador de BD';
delete from examenes_temas where nom_plan='Administrador de BD';
delete from examenes where nom_plan='Administrador de BD';
delete from plan_temas where nom_plan='Administrador de BD';
delete from plan_capacitacion where nom_plan='Administrador de BD';

commit;*/

/*#EJERCICIO 8#
SELECT 	* 
		FROM materiales_plan 
        WHERE cod_material IN ( "AP-008", "AP-009"); #VERIFICO QUE EL MATERIAL NO SE USE EN NINGÚN PLAN#

start transaction;

delete from materiales 
			where cod_material IN ( "AP-008", "AP-009");

commit;*/

/*#EJERCICIO 9#

select 	*
		from cursos_instructores as ci
        where ci.cuil = '44-44444444-4'; #Miro que el instructor no tenga ningun curso#

select 	*
		from evaluaciones as eva
        where eva.cuil = '44-44444444-4'; #Miro que el instructor no tenga ninguna evaluación#

select 	*
		from instructores as ins
		where ins.cuil_supervisor = '44-44444444-4'; #Miro de que instructores el instructor a eliminar es supervisor#

start transaction;

update	instructores
set cuil_supervisor = null
where cuil in ('55-55555555-5','66-66666666-6'); #Pongo null en el cuil del supervisor de los instructores que tienen al instructor a borrar como supervisor#

delete from instructores where cuil = '44-44444444-4';

commit;*/
        
/*#EJERCICIO 10#
start transaction;

delete from inscripciones 
where nom_plan='Marketing 3' and nro_curso=1;

commit;*/

/*#EJERCICIO 11#

start transaction;

delete from instructores
where cuil_supervisor = '99-99999999-9';

rollback;*/

/*#EJERCICIO 12#
select	ins.cuil into @cuil_ins
		from instructores as ins
        where ins.nombre = 'Elias' and ins.apellido = 'Yanes';

start transaction;

delete from instructores
where cuil_supervisor = @cuil_ins;

commit;*/

/*#EJERCICIO 13#
select	*
		from materiales
        where autores like '%Erica de Forifregoro%';

select 	*
		from materiales_plan
        where cod_material = 'AP-006';

start transaction;

delete from materiales_plan
where cod_material = 'AP-006';

delete from materiales
where cod_material = 'AP-006';

commit;*/

