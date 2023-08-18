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
	CONVERT(VARCHAR(10), fl.FechaReg_FutL, 103)  'Fecha Tramite' ,
	ISNULL(CONVERT(VARCHAR(10), o.Fecha, 103), '') 'Fecha cargo resoluci�n',
	case when cl.PagMatr in ('1', '0') then 'Si'
		else 'No' 
	end Condicion,
	case when o.Est_id IS null then 'FALTANTE'
		else 'ATENDIDO'
	end TRAMITE,
	case	when fl.Cod_Est = '1' then 'REGISTRADO'
			--when fl.Cod_Est = '2' then 'A PLAZO'
			--when fl.Cod_Est = '3' then 'IMPROCEDENTE'
			when fl.Cod_Est = '4' then 'ATENDIDO'
			--when fl.Cod_Est = '5' then 'ANULADO'
			--when fl.Cod_Est = '6' then 'DESISTIDO'
			--when fl.Cod_Est = '7' then 'CADUCADO'
			when fl.Cod_Est = '8' then 'GRATUITO'
			else '' 
	end Estado

FROM DBCampusNet.dbo.Est_Estudiante e
inner join DBCampusNet.dbo.Est_Estudiante_Auxliar ea on e.Est_id = ea.Est_Id
inner join DBCampusNet.dbo.Sed_Sede s on ea.Sed_Id = s.Sed_Id
inner join DBCampusNet.dbo.Car_Carrera c on ea.Car_Id = c.Car_Id
inner join DBCampusNet.dbo.Fac_Facultad f on c.Fac_Id = f.Fac_Id
inner join DBCampusNet.dbo.MAc_ModAcademica ma on ea.MAc_Id = ma.MAc_Id
inner join DBCampusNet.FutL.TM_FutEnLinea fl on e.Est_Id = fl.Est_Id
left join DBCampusNet.dbo.Obs_Observaciones o on fl.Est_Id = o.Est_id and o.TiO_id = '6' and o.mtr_anio = '2023' and o.mtr_periodo = '2'
inner join SGA.dbo.Clientes cl on e.Est_Id COLLATE Latin1_General_CI_AS = cl.Cli_NumDoc COLLATE Latin1_General_CI_AS
where
		fl.Anio_FutL = '2023' and
		fl.Periodo_FutL='2' and
		fl.Cod_Tramite = '1' and
		fl.Cod_Est in ('1', '4', '8')
order by o.Fecha asc

/**/

SELECT
	s.Sed_Sede Sede,
	e.Est_Id Codigo,
	e.Est_Paterno + ' ' + e.Est_Paterno + ' ' + e.Est_Nombre as 'Apellidos y Nombres',
	case when ma.MAc_Id in ('01', '02', '04', '06', '07') then 'PREGRADO'
		else 'POSGRADO' 
	end 'Pregrado / Posgrado',
	f.Fac_Facultad Facultad,
	c.Car_Carrera Carrera,
	CONVERT(VARCHAR(10), fl.FechaReg_FutL, 103)  'Fecha Tramite' ,
	ISNULL(CONVERT(VARCHAR(10), o.Fecha, 103), '') 'Fecha cargo resoluci�n',
	case when cl.PagMatr in ('1', '0') then 'Si'
		else 'No' 
	end Condicion,
	case	when fl.Cod_Est = '1' then 'REGISTRADO'
			when fl.Cod_Est = '4' then 'ATENDIDO'
			when fl.Cod_Est = '8' then 'GRATUITO'
			else '' 
	end Estado

FROM DBCampusNet.dbo.Est_Estudiante e
inner join DBCampusNet.dbo.Est_Estudiante_Auxliar ea on e.Est_id = ea.Est_Id
inner join DBCampusNet.dbo.Sed_Sede s on ea.Sed_Id = s.Sed_Id
inner join DBCampusNet.dbo.Car_Carrera c on ea.Car_Id = c.Car_Id
inner join DBCampusNet.dbo.Fac_Facultad f on c.Fac_Id = f.Fac_Id
inner join DBCampusNet.dbo.Obs_Observaciones o on e.Est_Id = o.Est_id
inner join DBCampusNet.dbo.MAc_ModAcademica ma on ea.MAc_Id = ma.MAc_Id
inner join DBCampusNet.FutL.TM_FutEnLinea fl on e.Est_Id = fl.Est_Id
inner join SGA.dbo.Clientes cl on e.Est_Id COLLATE Latin1_General_CI_AS = cl.Cli_NumDoc COLLATE Latin1_General_CI_AS
where	o.TiO_id = '6' and
		o.mtr_anio = '2023' and
		o.mtr_periodo = '2' and
		fl.Anio_FutL = '2023' and
		fl.Periodo_FutL='2' and
		fl.Cod_Tramite = '1' and
		fl.Cod_Est in ('1', '4', '8')
order by o.Fecha asc

/*  */

select top 10 * from DBCampusNet.dbo.Est_Estudiante_Auxliar
select top 10 * from DBCampusNet.dbo.Est_Estudiante
select top 10 * from DBCampusNet.dbo.MAc_ModAcademica

select * from DBCampusNet.dbo.Obs_Observaciones where TiO_id = '6' and mtr_anio = '2023' and mtr_periodo = '2'
select * from DBCampusNet.dbo.TiO_TipoObservaciones where TiO_id = '6'
select top 10 * from SGA.dbo.Clientes where PagMatr in('1', '0')

select * from DBCampusNet.FutL.TM_FutEnLinea WHERE EsT_Id = 'P02105A' AND Anio_FutL = '2023' AND Periodo_FutL='2' AND Cod_Tramite = '1'
select top 10 * from DBCampusNet.FutL.TM_Tramite
select top 10 * from DBCampusNet.FutL.TM_Estado -- 1, 4, 8

select * from DBCampusNet.dbo.TiO_TipoObservaciones order by TiO_Id asc 
select * from DBCampusNet.FutL.TM_FutEnLinea WHERE EsT_Id = 'P02105A' AND Anio_FutL = '2023' AND Periodo_FutL='2' AND Cod_Tramite = '1'

select * from DBCampusNet.FutL.TM_FutEnLinea WHERE EsT_Id = 'P02105A' AND Anio_FutL = '2023' AND Periodo_FutL='2' AND Cod_Tramite = '1'


select top 10 * from DBCampusNet.dbo.Obs_Observaciones
select top 10 * from DBCampusNet.FutL.TM_FutEnLinea

select * from DBCampusNet.dbo.Obs_Observaciones where NroResol_Aux = null or NroResol_Aux =  ''

select * from DBCampusNet.FutL.TM_FutEnLinea a 
left join DBCampusNet.dbo.Obs_Observaciones b on a.Est_Id = b.Est_id and b.TiO_id = '6' and mtr_anio = '2023' and mtr_periodo = '2'
where a.Anio_FutL = '2023' and a.Periodo_FutL ='2' and a.Cod_Tramite = '1' and a.Cod_Est in ('1', '4', '8') and b.Est_id is null

SELECT ORIGINAL_LOGIN() AS UsuarioConsulta;
