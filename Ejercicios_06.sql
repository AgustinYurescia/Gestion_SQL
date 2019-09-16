/*#EJERCICIO 1#
select	emp.cuit as CUIT,
		emp.razon_social as RazonSocial,
        per.dni as Dni,
        per.apellido as Apellido,
        per.nombre as Nombre,
        con.cod_cargo as CodigoCargo,
        car.desc_cargo as Descripción,
        'Contrato-Empresa' as 'Contrato-Empresa'
		from empresas as emp
        inner join contratos as con
        on emp.cuit = con.cuit
        inner join personas as per
        on con.dni = per.dni
        inner join cargos as car
        on con.cod_cargo = car.cod_cargo
UNION
select 	emp.cuit as CUIT,
		emp.razon_social as RazonSocial,
        per.dni as Dni,
        per.apellido as Apellido,
        per.nombre as Nombre,
        ant.cod_cargo as CodigoCargo,
        car.desc_cargo as Descripción,
        'Antecedente' as 'Contrato-Empresa'
		from empresas as emp
        inner join antecedentes as ant
        on emp.cuit = ant.cuit
        inner join personas as per
        on ant.dni = per.dni
        inner join cargos as car
        on ant.cod_cargo = car.cod_cargo;*/
        
/*#EJERCICIO 2#
select	count(*) into @cantPersonas
		from personas;

select	emp.cuit as CUIT,
		emp.razon_social as 'Razon Social',
        count(con.nro_contrato) as Cantidad,
        count(con.nro_contrato) * 100 / @cantPersonas as '% Sobre el total'
		from empresas as emp
        left join contratos as con
        on emp.cuit = con.cuit
        group by emp.cuit, emp.razon_social
union
select	emp.cuit as CUIT,
		emp.razon_social as 'Razon Social',
        count(ant.dni) as Cantidad,
        count(ant.dni) * 100 / @cantPersonas as '% Sobre el total'
		from empresas as emp
        left join antecedentes as ant
        on emp.cuit = ant.cuit
        group by emp.cuit, emp.razon_social*/

/*#EJERCICIO 3#
select	emp.cuit,
		emp.razon_social,
        ifnull(sol.fecha_solicitud, 'Sin solicitudes') as 'Fecha Solicitud',
        ifnull(car.desc_cargo, 'Sin solicitudes') as Cargo
		from empresas as emp
        left join solicitudes_empresas as sol
        on emp.cuit = sol.cuit
        left join cargos as car
        on sol.cod_cargo = car.cod_cargo
union
select	'Cargo no solicitado' as cuit,
		'Cargo no solicitado' as razon_social,
        'Cargo no solicitado' as 'Fecha Solicitud',
        car.desc_cargo as Cargo
		from cargos as car
        left join solicitudes_empresas as sol
        on car.cod_cargo = sol.cod_cargo
        where sol.fecha_solicitud is null*/

/*#EJERCICIO 4#
select distinct	per.dni,
				per.nombre,
                per.apellido
				from personas as per
				inner join antecedentes as ant
                on per.dni = ant.dni
				where per.dni in (select distinct 	pe.dni
													from personas as pe
                                                    inner join contratos as con
                                                    on pe.dni = con.dni)*/
