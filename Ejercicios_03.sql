/*#EJERCICIO 1#
select	con.nro_contrato as NroContrato,
		con.fecha_incorporacion as FechaIncorporación,
        con.fecha_finalizacion_contrato as FechaFinalización,
        ifnull(con.fecha_caducidad, adddate(con.fecha_solicitud,30)) as FechaCaducidad
		from contratos as con
        where con.fecha_caducidad is null*/

/*#EJERCICIO 2#
select	con.nro_contrato as NroContrato,
		emp.razon_social as Empresa,
        per.apellido as Apellido,
        per.nombre as Nombre,
        con.fecha_incorporacion as FechaIncorporación,
        ifnull(con.fecha_caducidad, 'Contrato Vigente') as FinContrato
		from contratos as con
        inner join empresas as emp
        on con.cuit = emp.cuit
        inner join personas as per
        on con.dni = per.dni*/

/*#EJERCICIO 3#
select	con.nro_contrato as NroContrato,
		con.fecha_incorporacion as FechaIncorporación,
		con.fecha_finalizacion_contrato as FechaFinalizacion,
        con.sueldo as Sueldo,
        con.porcentaje_comision as Comisión,
        con.dni as DNI,
        con.cuit as CUIT,
        con.cod_cargo as CodigoCargo,
        con.fecha_solicitud as FechaSolicitud,
        datediff(con.fecha_finalizacion_contrato, fecha_caducidad) as DiasAntes
		from contratos as con
		where con.fecha_caducidad < con.fecha_finalizacion_contrato*/

/*#EJERCICIO 4#
select	emp.cuit as CUIT,
		emp.razon_social as RazonSocial,
        emp.direccion as Dirección,
        com.anio_contrato as AñoContrato,
        com.mes_contrato as MesContrato,
        com.importe_comision as ImporteComisión,
        adddate(curdate(), interval 2 MONTH) as FechaVencimiento
		from comisiones as com
        inner join contratos as con
        on com.nro_contrato = con.nro_contrato
        inner join empresas as emp
        on con.cuit = emp.cuit
        where com.fecha_pago is null*/

/*#EJERCICIO 5#
select 	concat(per.nombre, ' ', per.apellido) as 'Nombre y Apellido',
		day(per.fecha_nacimiento) as DiaNacimiento,
        month(per.fecha_nacimiento) as MesNacimiento,
        year(per.fecha_nacimiento) as AñoNacimiento
		from personas as per*/