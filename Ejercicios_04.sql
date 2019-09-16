/*#EJERCICIO 1#
select	concat('La empresa ', emp.razon_social,' abonó un total de $',sum(com.importe_comision),' en comisiones') as Comisiones
		from contratos as con
        inner join empresas as emp
        on con.cuit = emp.cuit
        inner join comisiones as com
        on con.nro_contrato = com.nro_contrato
        where emp.razon_social='Traigame Eso' and com.fecha_pago is not null*/

/*#EJERCICIO 2#
select	concat('La empresa ', emp.razon_social,' abonó un total de $',sum(com.importe_comision),' en comisiones') as Comisiones
		from contratos as con
        inner join empresas as emp
        on con.cuit = emp.cuit
        inner join comisiones as com
        on con.nro_contrato = com.nro_contrato
        where com.fecha_pago is not null 
        group by emp.razon_social*/

/*#EJERCICIO 3#
select	ent.nombre_entrevistador as Entrevistador,
		entev.cod_evaluacion as 'Evaluación',
		avg(entev.resultado) as 'Promedio',
        std(entev.resultado) as 'DesviaciónEstandar',
        var_pop(entev.resultado) as 'Varianza'
		from entrevistas as ent
        inner join entrevistas_evaluaciones as entev
        on ent.nro_entrevista = entev.nro_entrevista
        group by ent.nombre_entrevistador, entev.cod_evaluacion
        order by Promedio asc, DesviaciónEstandar desc*/
        
/*#EJERCICIO 4#
select	ent.nombre_entrevistador as Entrevistador,
		entev.cod_evaluacion as 'Evaluación',
		avg(entev.resultado) as 'Promedio',
        std(entev.resultado) as 'DesviaciónEstandar',
        var_pop(entev.resultado) as 'Varianza'
		from entrevistas as ent
        inner join entrevistas_evaluaciones as entev
        on ent.nro_entrevista = entev.nro_entrevista
        where ent.nombre_entrevistador = 'Angelica Doria'
        group by entev.cod_evaluacion
        having  Promedio > 71
        order by Evaluación*/

/*#EJERCICIO 5#
select	nombre_entrevistador as Entrevistador,
		count(nro_entrevista) as CantidadEntrevistas
		from entrevistas 
        where year(fecha_entrevista) = 2014 and month(fecha_entrevista) = 10
		group by nombre_entrevistador*/

/*#EJERCICIO 6#
select	ent.nombre_entrevistador as Entrevistador,
		entev.cod_evaluacion as 'Evaluación',
		avg(entev.resultado) as 'Promedio',
        std(entev.resultado) as 'DesviaciónEstandar',
        var_pop(entev.resultado) as 'Varianza'
		from entrevistas as ent
        inner join entrevistas_evaluaciones as entev
        on ent.nro_entrevista = entev.nro_entrevista
        group by ent.nombre_entrevistador, entev.cod_evaluacion
        having  Promedio > 71
        order by Evaluación*/

/*#EJERCICIO 7#
select	ent.nombre_entrevistador as Entrevistador,
		entev.cod_evaluacion as 'Evaluación',
        count(*) as Cantidad,
		avg(entev.resultado) as 'Promedio',
        std(entev.resultado) as 'DesviaciónEstandar',
        var_pop(entev.resultado) as 'Varianza'
		from entrevistas as ent
        inner join entrevistas_evaluaciones as entev
        on ent.nro_entrevista = entev.nro_entrevista
        group by ent.nombre_entrevistador, entev.cod_evaluacion
        having  Promedio > 71 and count(*) > 1
        order by Evaluación*/

/*#EJERCICIO 8#
select 	nro_contrato as NroContrato,
		count(*) as Total,
        count(fecha_pago) as Pagadas,
        count(*) - count(fecha_pago) as 'A pagar'
		from comisiones
        group by nro_contrato*/

/*#EJERCICIO 9#
select 	nro_contrato as NroContrato,
		count(*) as Total,
        count(fecha_pago) * 100 / count(*) as 'Porcentaje pagadas',
        (count(*) - count(fecha_pago)) * 100 / count(*) as ' Porcentaje a pagar'
		from comisiones
        group by nro_contrato*/

/*#EJERCICIO 10#
select	count(*) as 'Cantidad total de solicitudes',
		count(distinct cuit) 'Cantidad de empresas solicitantes',
		count(*) - count(distinct cuit) as 'Diferencia respecto al total de sol'
		from solicitudes_empresas*/
       
/*#EJERCICIO 11#
select	emp.cuit as CUIT,
		emp.razon_social as Empresa,
		count(*) as 'Cantidad de solicitudes'
		from solicitudes_empresas sol
        inner join empresas as emp
        on sol.cuit = emp.cuit
        group by sol.cuit*/

/*#EJERCICIO 12#
select	emp.cuit as CUIT,
		emp.razon_social as 'Razon Social',
        sol.cod_cargo as Cargo,
        car.desc_cargo as 'Descripción del cargo',
        count(*) as 'Cantidad de solicitudes'
		from solicitudes_empresas as sol
        inner join empresas as emp
        on sol.cuit = emp.cuit
        inner join cargos as car
        on sol.cod_cargo = car.cod_cargo
        group by emp.cuit, emp.razon_social, sol.cod_cargo, car.desc_cargo*/

/*#EJERCICIO 13#
select	emp.*,
		count(ant.cuit) as 'Cantidad personas antecedentes'
		from empresas as emp
        left join antecedentes as ant
        on emp.cuit = ant.cuit
        group by emp.cuit*/

/*#EJERCICIO 14#
select	car.cod_cargo as 'Código del cargo',
		car.desc_cargo as 'Descripción',
        count(sol.cod_cargo) as 'Cantidad de solicitudes'
		from cargos as car
        left join solicitudes_empresas as sol
        on car.cod_cargo = sol.cod_cargo
        group by car.cod_cargo, car.desc_cargo
        order by count(sol.cod_cargo) desc*/

/*#EJERCICIO 15#
select	car.cod_cargo as 'Código del cargo',
		car.desc_cargo as 'Descripción',
        count(sol.cod_cargo) as 'Cantidad de solicitudes'
		from cargos as car
        left join solicitudes_empresas as sol
        on car.cod_cargo = sol.cod_cargo
        group by car.cod_cargo, car.desc_cargo
        having count(sol.cod_cargo) < 2
        order by count(sol.cod_cargo) desc*/
