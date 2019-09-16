DROP TEMPORARY TABLE IF EXISTS max_fec;

CREATE TEMPORARY TABLE max_fec
SELECT v.nom_plan, max(v.fecha_desde_plan) FECHA_MAX
FROM valores_plan v 
WHERE v.fecha_desde_plan < current_date()
group by 1;

DROP TEMPORARY TABLE IF EXISTS actuales;

CREATE TEMPORARY TABLE actuales
SELECT vp.*
FROM plan_capacitacion pc

INNER JOIN valores_plan vp 
ON pc.nom_plan = vp.nom_plan

INNER JOIN max_fec mf
ON vp.nom_plan = mf.nom_plan and vp.fecha_desde_plan = mf.FECHA_MAX;

DROP TEMPORARY TABLE IF EXISTS fec_ant;

CREATE TEMPORARY TABLE fec_ant
select v.nom_plan, max(v.fecha_desde_plan) FECHA_ANT
from actuales a

inner join valores_plan v 
ON a.nom_plan = v.nom_plan
WHERE v.fecha_desde_plan < a.fecha_desde_plan
group by v.nom_plan;

DROP TEMPORARY TABLE IF EXISTS anteriores;

CREATE TEMPORARY TABLE anteriores
SELECT vp.*
FROM plan_capacitacion pc

INNER JOIN valores_plan vp 
ON pc.nom_plan = vp.nom_plan

INNER JOIN fec_ant fa
ON vp.nom_plan = fa.nom_plan and vp.fecha_desde_plan = fa.FECHA_ANT;

SELECT act.nom_plan NombrePlan, act.fecha_desde_plan MaxFecha, act.valor_plan ValorActual, ifnull(ante.fecha_desde_plan, 'No posee') AntFecha, ifnull(ante.valor_plan, 'No posee') ValorAnterior, ifnull((act.valor_plan - ante.valor_plan), 'No posee') Diferencia
FROM actuales act

LEFT JOIN anteriores ante 
ON act.nom_plan = ante.nom_plan

ORDER BY 1;
