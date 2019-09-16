/*#EJERCICIO 1#
drop temporary table if exists fechas;

create temporary table fechas
select 	vp.nom_plan, 
		max(vp.fecha_desde_plan) as ult_fecha
		from valores_plan vp
		group by vp.nom_plan;

start transaction;

insert into valores_plan( nom_plan, fecha_desde_plan, valor_plan)
select	val.nom_plan,'2009/06/01', val.valor_plan*1.2
		from valores_plan as val
		inner join fechas
		on val.nom_plan = fechas.nom_plan and val.fecha_desde_plan = fechas.ult_fecha;
        
commit;*/

/*#EJERCICIO 2#
drop temporary table if exists fechas_ultVal;
create temporary table fechas_ultVal
select 	val.nom_plan as Plan,
		max(val.fecha_desde_plan) as Fecha
		from valores_plan as val
        group by val.nom_plan;

start transaction;

insert into valores_plan(nom_plan,fecha_desde_plan,valor_plan)
select 	val.nom_plan,
		'2009/08/01',
        val.valor_plan * 1.12
		from valores_plan as val
        inner join fechas_ultVal as fec
        on val.nom_plan = fec.Plan and val.fecha_desde_plan = fec.Fecha
        where val.valor_plan >= 90;

insert into valores_plan(nom_plan,fecha_desde_plan,valor_plan)
select 	val.nom_plan,
		'2009/08/01',
        val.valor_plan * 1.20
		from valores_plan as val
        inner join fechas_ultVal as fec
        on val.nom_plan = fec.Plan and val.fecha_desde_plan = fec.Fecha
        where val.valor_plan < 90;

commit;*/

/*#EJERCICIO 3#
start transaction;

insert into plan_capacitacion
select	'Marketing 1 Presen', pla.desc_plan, pla.hs, 'Presencial'
		from plan_capacitacion as pla
        where pla.nom_plan = 'Marketing 1';

insert into plan_temas
select	'Marketing 1 Presen', pt.titulo, pt.detalle
		from plan_temas as pt
        where pt.nom_plan = 'Marketing 1';

insert into	materiales_plan
select	'Marketing 1 Presen', mp.cod_material, mp.cant_entrega
		from materiales_plan as mp
        where mp.nom_plan = 'Marketing 1';

insert into examenes
select	'Marketing 1 Presen', ex.nro_examen
		from examenes as ex
        where ex.nom_plan = 'Marketing 1';

insert into examenes_temas
select	'Marketing 1 Presen', et.titulo, et.nro_examen
		from examenes_temas as et
        where et.nom_plan = 'Marketing 1'; 
        
insert into valores_plan
select 	'Marketing 1 Presen', vp.fecha_desde_plan, vp.valor_plan * 1.5
		from valores_plan as vp
        where vp.nom_plan = 'Marketing 1' and year(vp.fecha_desde_plan) = 2015;

commit;*/

/*#EJERCICIO 4#
start transaction;

update 	instructores as ins 
		inner join cursos_instructores as ci
		on ci.cuil = ins.cuil
		set cuil_supervisor = '66-66666666-6'
		where ci.nom_plan = 'Reparac PC Avanzada';
        
commit;*/

/*#EJERCICIO 5#
start transaction;

update	cursos_horarios as ch
		inner join cursos_instructores as ci
        on ch.nro_curso = ci.nro_curso and ch.nom_plan = ci.nom_plan
        inner join cursos as cur
        on cur.nro_curso = ci.nro_curso and cur.nom_plan = ci.nom_plan
        set ch.hora_inicio = addtime(ch.hora_inicio,-010000), ch.hora_fin = addtime(ch.hora_fin,-010000)
        where ci.cuil = '66-66666666-6' and ch.hora_inicio = '160000' and year(cur.fecha_ini) = 2015;

commit;*/
         
/*#EJERCICIO 6#
drop temporary table if exists exam;
create temporary table exam
select	eva.nom_plan as Plan,
		eva.nro_examen as Exa,
        avg(eva.nota) as Prom
		from evaluaciones as eva
        group by eva.nom_plan, eva.nro_examen
        having avg(eva.nota) > 5.5;

start transaction;

delete	eva, tem 	
		from evaluaciones as eva
        inner join exam as exa
        on eva.nom_plan = exa.Plan and eva.nro_examen and exa.Exa
        inner join examenes_temas as tem
        on exa.Plan = tem.nom_plan and exa.Exa = tem.nro_examen;

commit;*/

/*#EJERCICIO 7#
start transaction;
delete 	insc
		from inscripciones insc inner join
		(	select distinct dni
			from cuotas
			where fecha_pago is null
			and anio=year(CURRENT_DATE)-1
		) as deudores
		on insc.dni = deudores.dni
where year(insc.fecha_inscripcion) = year(CURRENT_DATE);

commit;*/
