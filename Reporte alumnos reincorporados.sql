-- Cada lunes enviar este reporte hasta fin de matricula 2023 II
SELECT
	s.Sed_Sede Sede,
	e.Est_Id Codigo,
	e.Est_Paterno + ' ' + e.Est_Paterno + ' ' + e.Est_Nombre as 'Apellidos y Nombres',
	case when ma.MAc_Id in ('01', '02', '04', '06', '07') then 'PREGRADO'
		else 'POSGRADO' 
	end 'Pregrado / Posgrado',
	f.Fac_Facultad Facultad,
	c.Car_Carrera Carrera,
	o.Fecha,
	isnull(o.Fech_documento, '') 'Fecha Cargo',
	case when cl.PagMatr in ('1', '0') then 'Si'
		else 'No' 
	end Condicion

FROM DBCampusNet.dbo.Est_Estudiante e
inner join DBCampusNet.dbo.Est_Estudiante_Auxliar ea on e.Est_id = ea.Est_Id
inner join DBCampusNet.dbo.Sed_Sede s on ea.Sed_Id = s.Sed_Id
inner join DBCampusNet.dbo.Car_Carrera c on ea.Car_Id = c.Car_Id
inner join DBCampusNet.dbo.Fac_Facultad f on c.Fac_Id = f.Fac_Id
inner join DBCampusNet.dbo.Obs_Observaciones o on e.Est_Id = o.Est_id
inner join DBCampusNet.dbo.MAc_ModAcademica ma on ea.MAc_Id = ma.MAc_Id
inner join SGA.dbo.Clientes cl on e.Est_Id COLLATE Latin1_General_CI_AS = cl.Cli_NumDoc COLLATE Latin1_General_CI_AS
where	o.TiO_id = '6' and
		o.mtr_anio = '2023' and
		o.mtr_periodo = '2'
order by o.Fecha asc

/*
select top 10 * from DBCampusNet.dbo.Est_Estudiante_Auxliar
select top 10 * from DBCampusNet.dbo.Est_Estudiante
select top 10 * from DBCampusNet.dbo.MAc_ModAcademica

select * from DBCampusNet.dbo.Obs_Observaciones where TiO_id = '6' and mtr_anio = '2023' and mtr_periodo = '2'
select * from DBCampusNet.dbo.TiO_TipoObservaciones where TiO_id = '6'
select top 10 * from SGA.dbo.Clientes where PagMatr in('1', '0')
*/