/*#EJERCICIO 1#
describe empresas;
select * from empresas
*/
 
 /*#EJERCICIO 2#
 DESCRIBE personas;
 SELECT per.apellido, per.nombre, per.fecha_registro_agencia FROM personas as Per
 */

 /*#EJERCICIO 3#
 SELECT tit.cod_titulo as Codigo, tit.desc_titulo as Descripcion, tit.tipo_titulo as Tipo FROM titulos as tit
 */
 
 /*#EJERCICIO 4#
 SELECT CONCAT(per.nombre,' ',per.apellido) as 'Nombre y Apellido',
		per.fecha_nacimiento as 'Fecha Nac.',
        per.Telefono as 'Teléfono',
        per.direccion as 'Dirección'
		FROM personas as per
		WHERE per.dni = 28675888 */

/*#EjERCICIO 5#
SELECT CONCAT(per.nombre,' ',per.apellido) as 'Nombre y Apellido',
		per.fecha_nacimiento as 'Fecha Nac.',
        per.Telefono as 'Teléfono',
        per.direccion as 'Dirección'
		FROM personas as per
		WHERE per.dni IN (27890765, 29345777, 31345778)
        ORDER BY per.fecha_nacimiento*/

/*#EJERCICIO 6#
SELECT * FROM personas as per
WHERE per.apellido LIKE 'G%'*/

/*#EJERCICIO 7#
SELECT  per.apellido as Apellido,
		per.nombre as Nombre,
        per.fecha_nacimiento as FechaNacimiento
		FROM personas as per
        WHERE year(per.fecha_nacimiento) > 1980 and year(per.fecha_nacimiento) < 2000*/

/*#Ejercicio 8#
SELECT * FROM solicitudes_empresas as sol
order by sol.fecha_solicitud*/

/*#EJERCICIO 9#
select * from antecedentes as ant
where ant.fecha_hasta is null
order by ant.fecha_desde*/

/*#EJERCICIO 10#
select ant.dni, ant.cod_cargo, ant.fecha_desde, ant.fecha_hasta, ant.persona_contacto 
from antecedentes as ant
where ant.fecha_hasta is not null and (ant.fecha_hasta < '2013-06-01' or ant.fecha_hasta > '2013-12-31')
order by ant.dni*/

/*#EJERCICIO 11#
select 	cont.nro_contrato as 'Nro. Contrato',
		cont.dni as DNI,
        cont.sueldo as Salario,
        cont.cuit as CUIT
		from contratos as cont
        WHERE cont.sueldo > 2000 and cont.cuit in ('30-10504876-5','30-21098732-4')*/

/*#EJERCICIO 12#
select * from titulos
where desc_titulo like 'Tecnico%'*/

/*#EJERCICIO 13#
select * from solicitudes_empresas as sol
		where (sol.fecha_solicitud > '2013-09-21' and sol.cod_cargo = 6) or sol.sexo = 'Femenino'*/

/*#EJERCICIO 14#
select * from contratos as cont
		where cont.sueldo > 2000 and cont.fecha_caducidad is null*/


        



