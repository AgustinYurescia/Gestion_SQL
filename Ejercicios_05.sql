/*#Ejercicio 1#
drop temporary table if exists cont_sl;
create temporary table cont_sl
select	con.cuit
		from contratos as con
        inner join personas as per
        on con.dni = per.dni
        where per.nombre = 'Stefania' and per.apellido = 'Lopez';

select	distinct per.dni,
		per.apellido,
        per.nombre
		from contratos as con
        inner join cont_sl
        on con.cuit = cont_sl.cuit
        inner join personas as per
        on con.dni = per.dni*/

/*#Ejercicio 2#
select 	max(con.sueldo) into @sueldoMaximo
		from contratos as con
        inner join empresas as emp
        on con.cuit = emp.cuit
        where emp.razon_social = 'Viejos amigos';

select	per.dni,
		per.apellido,
        per.nombre,
        con.sueldo
		from contratos as con
        inner join personas as per
        on con.dni = per.dni
        where con.sueldo < @sueldoMaximo*/

/*#Ejercicio 3#
select 	avg(com.importe_comision) into @promedioTE
		from comisiones as com
        inner join contratos as con
        on com.nro_contrato = con.nro_contrato
        inner join empresas as emp
        on con.cuit = emp.cuit
        where emp.razon_social = 'Traigame eso';

select 	emp.cuit,
		emp.razon_social,
		avg(com.importe_comision) as 'Promedio comisiones'
		from comisiones as com
        inner join contratos as con
        on com.nro_contrato = con.nro_contrato
        inner join empresas as emp
        on con.cuit = emp.cuit
        group by emp.cuit, emp.razon_social
        having avg(com.importe_comision) > @promedioTE*/

/*#Ejercicio 4#
select	avg(importe_comision) into @promedioCom
		from comisiones;

select	emp.razon_social,
		per.nombre,
        per.apellido,
        con.nro_contrato,
        com.mes_contrato,
        com.anio_contrato,
        com.importe_comision
		from comisiones as com
        inner join contratos as con
        on com.nro_contrato = con.nro_contrato
        inner join empresas as emp
        on con.cuit = emp.cuit
        inner join personas as per
        on con.dni = per.dni
        where com.importe_comision < @promedioCom and com.fecha_pago is not null*/
        
/*#Ejercicio 5#
select max(com.importe_comision), min(com.importe_comision) into @maxCom, @minCom
from comisiones as com;

select emp.razon_social, avg(com.importe_comision) as PromedioComision
from empresas as emp
inner join contratos as con
on emp.cuit = con.cuit
inner join comisiones as com
on con.nro_contrato = com.nro_contrato
group by 1
having avg(com.importe_comision) in (@maxCom,@minCom);*/

/*#Ejercicio 6#
select	per.dni,
	per.apellido,
        per.nombre
	from personas as per
        where per.dni not in (select 	pt.dni
					from personas_titulos as pt
                                        inner join titulos as tit
					on pt.cod_titulo = tit.cod_titulo
                                        where tit.tipo_titulo in ('Educacion no formal','Terciario'))*/

/*#Ejercicio 7#
drop temporary table if exists promedios;

create temporary table promedios
select	con.cuit,
		avg(con.sueldo) as prom
		from contratos as con
		group by con.cuit;

select	per.dni,
		per.nombre,
		per.apellido,
        con.sueldo,
        promedios.prom
		from personas as per
        inner join contratos as con
        on per.dni = con.dni
        inner join promedios
        on con.cuit = promedios.cuit
        where con.sueldo > promedios.prom*/

/*#Ejercicio 8#
select max(com.importe_comision), min(com.importe_comision) into @maxcom, @mincom
from comisiones as com;

select emp.razon_social, avg(com.importe_comision) as PromedioComisiones
from empresas as emp
inner join contratos as con
on emp.cuit = con.cuit
inner join comisiones as com
on con.nro_contrato = com.nro_contrato
group by 1
having avg(com.importe_comision) in (@maxcom,@mincom)*/

/*#Ejercicio 9#
select 	count(*) into @cant_ins
		from inscripciones as ins
        inner join alumnos as alu
        on ins.dni = alu.dni
        where alu.nombre = 'Antoine de' and alu.apellido = 'Saint-Exupery';

select	alu.*,
		count(*) as 'Cantiadad de inscripciones',
		count(*) - @cant_ins as 'Diferencia con Antoine'
		from inscripciones as ins
        inner join alumnos as alu
        on ins.dni = alu.dni
        group by alu.dni
        having count(*) > @cant_ins*/
        
/*#Ejercicio 10#
select	count(*) into @total_ins
		from plan_capacitacion as pla
        inner join inscripciones as ins
        on pla.nom_plan = ins.nom_plan
        where year(ins.fecha_inscripcion) = 2014;

select	pla.nom_plan as Plan,
		count(*) as 'Cantidad de inscriptos',
        @total_ins,
        count(*) * 100 / @total_ins as '% Sobre el total'
		from plan_capacitacion as pla
        inner join inscripciones as ins
        on pla.nom_plan = ins.nom_plan
        where year(ins.fecha_inscripcion) = 2014
        group by pla.nom_plan*/

/*#Ejercicio 11#
drop temporary table if exists valores;
create temporary table valores
select	val.nom_plan as Plan,
		max(val.fecha_desde_plan) as Fecha
		from valores_plan as val
        group by val.nom_plan;

select	val.nom_plan,
		val.fecha_desde_plan,
        val.valor_plan
		from valores_plan as val
        inner join valores
        on val.nom_plan = valores.Plan
        where val.fecha_desde_plan >= valores.Fecha*/

/*#Ejercicio 12#
drop temporary table if exists valores;
create temporary table valores
select	val.nom_plan as Plan,
		max(val.fecha_desde_plan) as Fecha
		from valores_plan as val
        group by val.nom_plan;

select	min(val.valor_plan) into @minValor
		from valores_plan as val
        inner join valores
        on val.nom_plan = valores.Plan
        where val.fecha_desde_plan >= valores.Fecha;

select	pla.*,
		val.fecha_desde_plan,
        val.valor_plan
		from valores_plan as val
        inner join valores
        on val.nom_plan = valores.Plan
        inner join plan_capacitacion as pla
        on val.nom_plan = pla.nom_plan
        where val.fecha_desde_plan >= valores.Fecha and val.valor_plan = @minValor*/

/*#Ejercicio 13#
drop temporary table if exists inst;

create temporary table inst
select 	curi.cuil as cuil
		from cursos_instructores as curi
        inner join cursos as cur
        on curi.nom_plan = cur.nom_plan and curi.nro_curso = cur.nro_curso
        where cur.nom_plan = 'Marketing 1' and year(cur.fecha_ini) = 2015;

select 	curi.cuil
		from cursos_instructores as curi
        inner join cursos as cur
        on curi.nom_plan = cur.nom_plan and curi.nro_curso = cur.nro_curso
        where cur.nom_plan = 'Marketing 1' and year(cur.fecha_ini) = 2014 and curi.cuil not in (select inst.cuil from inst)*/

/*#Ejercicio 14#
select	*
	from alumnos 
        where dni not in (select cuo.dni
				 from inscripciones as ins
                                 inner join cuotas as cuo
                                 on ins.nom_plan=cuo.nom_plan and ins.nro_curso = cuo.nro_curso and ins.dni = cuo.dni
                                 where cuo.fecha_pago is null)*/

/*#Ejercicio 15#
drop temporary table if exists promediosCursos;

create temporary table promediosCursos
select	eval.nro_curso,
        avg(eval.nota) as prom
		from evaluaciones as eval
        group by eval.nro_curso;

select	alu.nombre,
		alu.apellido,
        avg(eval.nota),
		promediosCursos.prom
		from alumnos as alu
        inner join evaluaciones as eval
        on alu.dni = eval.dni
        inner join promediosCursos
        on eval.nro_curso = promediosCursos.nro_curso
        group by alu.nombre, alu.apellido
        having avg(eval.nota) >= promediosCursos.prom*/

/*#Ejercicio 16 Dudas#
drop temporary table if exists cur_ins;
create temporary table cur_ins
select 	cur.nro_curso as Curso,
		cur.nom_plan as Plan,
		count(ins.dni) as Cantidad
		from cursos as cur
        inner join inscripciones as ins
        on cur.nro_curso = ins.nro_curso and cur.nom_plan = ins.nom_plan
        where cur.fecha_ini >= '2014-04-01' 
        group by cur.nro_curso, cur.nom_plan;
        
select 	cur.nom_plan,
		cur.nro_curso,
        cur.fecha_ini,
        cur.salon,
        cur.cupo,
        cur_ins.Cantidad,
        cur.cupo - cur_ins.Cantidad
		from cursos as cur
        inner join cur_ins
        on cur.nro_curso = cur_ins.Curso and cur.nom_plan = cur_ins.Plan
        where (cur_ins.Cantidad / cur.cupo * 100) < 80*/

/*#Ejercicio 17 Muchas dudas#
drop temporary table if exists ult_inc;
create temporary table ult_inc
select	val.nom_plan as Plan,
		max(val.fecha_desde_plan) as FechaUlt
		from valores_plan as val
        group by val.nom_plan;

drop temporary table if exists anteult_inc;
create temporary table anteult_inc
select	val.nom_plan as Plan,
		max(val.fecha_desde_plan) as FechaAnteul
		from valores_plan as val
        inner join ult_inc
        on val.nom_plan = ult_inc.Plan
        where val.fecha_desde_plan < ult_inc.FechaUlt
        group by val.nom_plan;

drop temporary table if exists ultVal;
create temporary table ultVal
select	val.nom_plan,
		val.fecha_desde_plan,
        val.valor_plan
		from valores_plan as val
        inner join ult_inc as ult
        on val.nom_plan = ult.Plan and val.fecha_desde_plan = ult.FechaUlt;

drop temporary table if exists anteultVal;
create temporary table anteultVal
select	val.nom_plan,
		val.fecha_desde_plan,
        val.valor_plan
		from valores_plan as val
        inner join anteult_inc as ant
        on val.nom_plan = ant.Plan and val.fecha_desde_plan = ant.FechaAnteul;

select 	ult.nom_plan as Plan,
		ult.fecha_desde_plan as FechaDesdeActual,
        ult.valor_plan as ValorActual,
        ifnull(ant.fecha_desde_plan, '-') as FechaDesdeAnterior,
        ifnull(ant.valor_plan,'-') as ValorAnterior,
        ifnull((ult.valor_plan - ant.valor_plan),'-') as Diferencia
		from ultVal as ult
        left join anteultVal as ant
		on ult.nom_plan = ant.nom_plan*/

	
        

