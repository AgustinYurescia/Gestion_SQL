/*#EJERCICIO 1#
select 	concat(per.apellido,', ',per.nombre) as 'Apellido y Nombre',
		cont.sueldo,
        per.dni
		from personas as per
        inner join contratos as cont
        on per.dni = cont.dni
        where cont.nro_contrato = 5*/

/*#EJERCICIO 2#
select 	con.dni as DNI,
		con.nro_contrato as 'Nro. Contrato',
        con.fecha_incorporacion as 'Fecha de Incorporación',
        con.fecha_solicitud as 'Fecha de Solicitud',
        ifnull(con.fecha_caducidad, 'Sin fecha') as 'Fecha Caducidad',
        emp.razon_social as Empresa
		from contratos as con
		inner join empresas as emp
		on con.cuit = emp.cuit
        where emp.razon_social in ('Viejos Amigos','Tráigame Eso')
        order by con.fecha_incorporacion, emp.razon_social*/
        
/*#EJERCICIO 3#
select 	emp.razon_social,
		emp.direccion,
        emp.e_mail,
        car.desc_cargo,
        sol.anios_experiencia
		from empresas as emp
        inner join solicitudes_empresas as sol
        on emp.cuit = sol.cuit
        inner join cargos as car
        on sol.cod_cargo = car.cod_cargo
		order by sol.fecha_solicitud, car.desc_cargo*/

/*#EJERCICIO 4#
select	per.dni,
		per.apellido,
		per.nombre,
        tit.desc_titulo
		from personas as per
        inner join personas_titulos as pt
        on per.dni = pt.dni
        inner join titulos as tit
        on pt.cod_titulo = tit.cod_titulo
        where tit.tipo_titulo = 'Educacion no formal' or tit.desc_titulo = 'Bachiller'*/
        
/*#EJERCICIO 5#
select	per.apellido,
		per.nombre,
        tit.desc_titulo
		from personas as per
        inner join personas_titulos as pt
        on per.dni = pt.dni
        inner join titulos as tit
        on pt.cod_titulo = tit.cod_titulo*/
        
/*#EJERCICIO 6#
select 	distinct concat(per.apellido,', ',per.nombre,' tiene como referencia a ',ifnull(ant.persona_contacto, 'NO TIENE CONTACTO'),' cuando trabajó en ',emp.razon_social) as Referencias
		from personas as per
        inner join antecedentes as ant
        on per.dni = ant.dni
        inner join empresas as emp
        on ant.cuit = emp.cuit
        where ant.persona_contacto is null or ant.persona_contacto in ('Armando Esteban Quito','Felipe Rojas')*/
        
/*#EJERCICIO 7#
select	emp.razon_social as Empresa,
		sol.fecha_solicitud as 'Fecha Solicitud',
        car.desc_cargo as Cargo,
        ifnull(sol.edad_minima,'Sin especificar') as 'Edad Mínima',
        ifnull(sol.edad_maxima,'Sin especificar') as 'Edad Máxima',
        ent.resultado_final as Puntaje
		from solicitudes_empresas as sol
        inner join empresas as emp
        on sol.cuit = emp.cuit
        inner join cargos as car
        on sol.cod_cargo = car.cod_cargo
        inner join entrevistas as ent
        on sol.cuit = ent.cuit and sol.cod_cargo = ent.cod_cargo and sol.fecha_solicitud = ent.fecha_solicitud
        where emp.razon_social = 'Viejos Amigos'*/

/*#EJERCICIO 8#
select	distinct
		concat(per.nombre,' ',per.apellido) as Postulante,
        car.desc_cargo as Cargo
		from personas as per
        inner join antecedentes as ant
        on per.dni = ant.dni
        inner join cargos as car
        on ant.cod_cargo = car.cod_cargo*/

/*#EJERCICIO 9#
select	emp.razon_social as Empresa,
		car.desc_cargo as Cargo,
        eval.desc_evaluacion as Evaluación,
        entev.resultado as Resultado
		from empresas as emp
        inner join solicitudes_empresas as sol
        on emp.cuit = sol.cuit
        inner join cargos as car
        on sol.cod_cargo = car.cod_cargo
        inner join entrevistas as ent
        on sol.cuit = ent.cuit and sol.cod_cargo = ent.cod_cargo and sol.fecha_solicitud = ent.fecha_solicitud
        inner join entrevistas_evaluaciones as entev
        on ent.nro_entrevista = entev.nro_entrevista
        inner join evaluaciones as eval
        on entev.cod_evaluacion = eval.cod_evaluacion
        order by emp.razon_social asc, car.desc_cargo desc*/

/*#EJERCICIO 10#
select	emp.cuit as CUIT,
		emp.razon_social as 'Razon Social',
        ifnull(sol.fecha_solicitud, 'Sin Solicitud') as 'Fecha Solicitud',
        ifnull(car.desc_cargo, 'Sin Solicitud') as Cargo
		from empresas as emp
        left join solicitudes_empresas as sol
        on emp.cuit = sol.cuit
        left join cargos as car
        on sol.cod_cargo = car.cod_cargo*/

/*#EJERCICIO 11#
select	emp.cuit as CUIT,
		emp.razon_social as 'Razon Social',
        car.desc_cargo as Cargo,
        sol.fecha_solicitud as 'Fecha Sol',
        ifnull(per.dni,'Sin contrato') as DNI,
        ifnull(per.nombre,'Sin contrato') as Nombre,
        ifnull(per.apellido,'Sin contrato') as Apellido
		from empresas as emp
        inner join solicitudes_empresas as sol
        on emp.cuit = sol.cuit
        inner join cargos as car
        on sol.cod_cargo = car.cod_cargo
        left join contratos as cont
        on sol.cuit = cont.cuit and sol.cod_cargo = cont.cod_cargo and sol.fecha_solicitud = cont.fecha_solicitud
        left join personas as per
        on cont.dni = per.dni
		order by emp.razon_social*/
        
/*#EJERCICIO 12#
select	emp.cuit,
		emp.razon_social,
		car.desc_cargo
		from solicitudes_empresas as sol
        inner join empresas as emp
        on sol.cuit = emp.cuit
		inner join cargos as car
        on sol.cod_cargo = car.cod_cargo
		left join contratos as cont
        on sol.cuit = cont.cuit and sol.cod_cargo = cont.cod_cargo and sol.fecha_solicitud = cont.fecha_solicitud
        where cont.nro_contrato is null*/
        
/*#EJERCICIO 13#
select	car.desc_cargo as Cargo,
		ifnull(per.dni, 'Sin antecedente') as DNI,
        ifnull(concat(per.nombre, ' ',per.apellido), 'Sin antecedente') as Persona,
        ifnull(emp.razon_social, 'Sin antecedente') as Empresa
		from cargos as car
        left join antecedentes as ant
        on car.cod_cargo = ant.cod_cargo
        left join personas as per
        on ant.dni = per.dni
        left join empresas as emp
        on ant.cuit = emp.cuit*/
        
/*#EJERCICIO 14#
select	ins.cuil as CuilInstructor,
		ins.nombre as NombreInstructor,
		ins.apellido as ApellidoInstructor,
        sup.cuil as CuilSupervisor,
        sup.nombre as NombreSupervisor,
        sup.apellido as ApellidoSupervisor
		from instructores as ins
        inner join instructores as sup
        on ins.cuil_supervisor = sup.cuil*/

/*#EJERCICIO 15#
select	ins.cuil as CuilInstructor,
		ins.nombre as NombreInstructor,
		ins.apellido as ApellidoInstructor,
        ifnull(sup.cuil, ' ') as CuilSupervisor,
        ifnull(sup.nombre, ' ') as NombreSupervisor,
        ifnull(sup.apellido,' ') as ApellidoSupervisor
		from instructores as ins
        left join instructores as sup
        on ins.cuil_supervisor = sup.cuil*/

/*#EJERCICIO 16#
select	ifnull(sup.cuil,' ') as CuilSupervisor,
		ifnull(sup.nombre,' ') as NombreSupervisor,
        ifnull(sup.apellido,' ') as ApellidoSup,
        ins.nombre,
        ins.apellido,
        eval.nom_plan,
        eval.nro_curso,
        alu.nombre,
        alu.apellido,
        eval.nro_examen,
        eval.fecha_evaluacion,
        eval.nota
		from instructores as ins
        left join instructores as sup
        on ins.cuil_supervisor = sup.cuil
        inner join evaluaciones as eval
        on ins.cuil = eval.cuil
        inner join alumnos as alu
        on eval.dni = alu.dni
        where year(eval.fecha_evaluacion) = 2014
        order by sup.nombre asc, sup.apellido asc, eval.fecha_evaluacion desc*/
