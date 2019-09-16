/*#EJERCICIO 1#
drop view if exists vw_instructores;
CREATE VIEW `vw_instructores` AS
select 	concat(ins.nombre,' ',ins.apellido) AS 'Nombre y Apellido', 
		ins.tel as 'Teléfono', 
        ins.email as 'Mail'
		from instructores ins;

select * from vw_instructores;*/

/*#EJERCICIO 2#
drop view if exists vista_cursos2015;
create view `vista_cursos2015` as
select	pla.nom_plan as 'Plan',
		pla.desc_plan as 'Descripción Plan',
        cur.nro_curso as 'Nro Curso',
        cur.fecha_ini as 'Fecha Inicio',
        cur.fecha_fin as 'Fecha Fin',
        cur.salon as 'Salón',
        cur.cupo as 'Cupo',
        count(ins.dni) as 'Cantidad de alumnos'
		from cursos as cur
        inner join plan_capacitacion as pla
        on cur.nom_plan = pla.nom_plan
        inner join inscripciones as ins
        on cur.nro_curso = ins.nro_curso and cur.nom_plan = ins.nom_plan
        where year(cur.fecha_ini) = 2015
        group by cur.nom_plan, pla.desc_plan, cur.nro_curso, cur.fecha_ini, cur.fecha_fin, cur.salon, cur.cupo;
        
select * from vista_cursos2015;*/

/*#EJERCICIO 3#
drop temporary table if exists fec_act;
create temporary table fec_act
select	val.nom_plan as Plan,
		max(val.fecha_desde_plan) as Fecha
		from valores_plan as val
        group by val.nom_plan;

drop view if exists cursos_valores;
create view `cursos_valores` as
select	pla.nom_plan as 'Plan',
		pla.desc_plan as 'Descripción Plan',
        cur.nro_curso as 'Nro Curso',
        cur.fecha_ini as 'Fecha Inicio',
        cur.fecha_fin as 'Fecha Fin',
        cur.salon as 'Salón',
        cur.cupo as 'Cupo',
        count(ins.dni) as 'Cantidad de alumnos'
		from cursos as cur
        inner join plan_capacitacion as pla
        on cur.nom_plan = pla.nom_plan
        inner join inscripciones as ins
        on cur.nro_curso = ins.nro_curso and cur.nom_plan = ins.nom_plan
        where year(cur.fecha_ini) = 2015
        group by pla.nom_plan, pla.desc_plan, cur.nro_curso, cur.fecha_ini, cur.fecha_fin, cur.salon, cur.cupo;

select 	cursos_valores.*,
		val.valor_plan as 'Costo Actual'
		from cursos_valores
		inner join fec_act
        on cursos_valores.Plan = fec_act.Plan
        inner join valores_plan as val
        on cursos_valores.Plan = val.nom_plan and fec_act.Fecha = val.fecha_desde_plan;*/

/*#EJERCICIO 4#
drop view if exists cursos_alumnos;
create view `cursos_alumnos` as
select	alu.dni as DNI,
		concat(alu.nombre,' ',alu.apellido) as 'NombreApellido',
		ins.nom_plan as 'Plan',
        ins.nro_curso as 'NroCurso',
        avg(eva.nota) as 'Promedio'
		from alumnos as alu
        inner join inscripciones as ins
        on alu.dni = ins.dni
        inner join evaluaciones as eva
        on ins.nom_plan = eva.nom_plan and ins.nro_curso = eva.nro_curso and alu.dni = eva.dni
        group by 1,2,3,4;
        
DROP temporary table if exists impagos;
CREATE TEMPORARY TABLE impagos 
SELECT 	dni, 
		count( * ) as Cantidad
		FROM cuotas WHERE fecha_pago IS NULL 
        GROUP BY 1 ;

SELECT 	cu.NombreApellido, 
		cu.Plan, 
        cu.NroCurso, 
        cu.Promedio, 
        ifnull(im.Cantidad, 0) as Cantidad 
		FROM cursos_alumnos as cu
        LEFT JOIN impagos im
        ON cu.dni = im.dni*/
        
/*#EJERCICIO 5#
drop view if exists apuntes;
create view `apuntes` as
select	mat.cod_material,
		mat.desc_material,
        mat.autores,
        mat.fecha_creacion,
        mat.url_descarga,
        mat.tamanio
		from materiales as mat
        where mat.cod_material like 'AP%';

drop view if exists utiles;
create view `utiles` as
select	mat.cod_material,
		mat.desc_material,
        mat.cant_disponible,
        mat.punto_pedido,
        mat.cantidad_a_pedir
		from materiales as mat
        where mat.cod_material like 'UT%';

select 	pro.cuit,
		pro.razon_social,
        ut.*
		from utiles as ut
        inner join proveedores_materiales as pm
        on ut.cod_material = pm.cod_material
        inner join proveedores as pro
        on pm.cuit = pro.cuit;

select 	mp.nom_plan,
		cur.nro_curso,
        ap.*
		from apuntes as ap
        inner join materiales_plan as mp
        on ap.cod_material = mp.cod_material
        inner join cursos as cur
        on mp.nom_plan = cur.nom_plan
        where year(cur.fecha_ini) = 2015*/

