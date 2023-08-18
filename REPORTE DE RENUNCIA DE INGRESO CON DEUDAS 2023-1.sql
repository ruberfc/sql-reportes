-- REPORTE DE RENUNCIA DE INGRESO CON DEUDAS 2023-1

SELECT	
        s.Sed_Sede,
		deu.NumDI Codigo, 
		e.Est_Paterno +' '+ e.Est_Materno +' '+ e.Est_Nombre as 'Apellidos y Nombres',
		case when ma.MAc_Id in ('01', '02', '04', '06', '07') then 'PREGRADO'
			else 'POSGRADO' 
		end 'Pregrado / Posgrado',
		f.Fac_Facultad Facultad,
		c.Car_Carrera Carrera,
        fl.Esp_Id Especialidad,
        case when fl.Esp_Id = 'SX' then 'SIM ESPECIALIDAD'
			else '' 
		end 'Pregrado / Posgrado',

        (select top 1 Nta_Nivel from DBCampusNet.dbo.Nta_Nota where Mtr_Anio = '2023' and Mtr_Periodo = '1' and Est_Id = e.Est_Id) 'Ciclo Academico',
		deu.AñoAcad Año,
		deu.PeriAcad Periodo,
		deu.NumCuota 'Numero Cuota',
        deu.Importe,
        deu.Importe * sga.SGA.FN_FactorMora(deu.FecVenc, deu.FecCarg, deu.TasaMora) AS Mora,
        (deu.Importe * sga.SGA.FN_FactorMora(deu.FecVenc, deu.FecCarg, deu.TasaMora)) + importe,
        o.NroResol_Aux,
        fl.Observacion,
        fl.FechaReg_FutL

FROM SGA.dbo.Deudas deu
inner join DBCampusNet.dbo.Est_Estudiante e on deu.NumDI COLLATE Latin1_General_CI_AS = e.Est_Id COLLATE Latin1_General_CI_AS
inner join DBCampusNet.FutL.TM_FutEnLinea fl on e.Est_Id = fl.Est_Id and fl.Anio_FutL = '2023' and fl.Periodo_FutL='1' and fl.Cod_Tramite =  '20' and fl.Cod_Est in ('1', '4', '8')
inner join DBCampusNet.dbo.Sed_Sede s on fl.Sed_Id = s.Sed_id
inner join DBCampusNet.dbo.Car_Carrera c on fl.Car_Id = c.Car_Id
inner join DBCampusNet.dbo.Fac_Facultad f on c.Fac_Id = f.Fac_Id
inner join DBCampusNet.dbo.MAc_ModAcademica ma on fl.MAc_Id = ma.MAc_Id
left join DBCampusNet.dbo.Obs_Observaciones o on fl.Est_Id = o.Est_id and o.mtr_anio = '2023' and o.mtr_periodo = '1' and o.Tio_id in ('5', '20')
WHERE   deu.AñoAcad = '2023' AND
		deu.PeriAcad = '01' AND
		deu.NumCuota in ('01', '02', '03', '04', '05') AND
		deu.CondDeud in (0, 9) 

        --and deu.NumDI = 'C07120K'


select top 10 * from SGA.dbo.Clientes 

select top 100 * from Sga.dbo.Car_Carrera
select top 100 * from DBCampusNet.dbo.Car_Carrera


select * from DBCampusNet.dbo.TiO_TipoObservaciones where TiO_id = '5'

select top 1000 * from DBCampusNet.FutL.TM_Tramite where Desc_Tramite like '%Renuncia%'
select top 1000 * from DBCampusNet.FutL.TM_Estado 

select top 100 * from DBCampusNet.dbo.Est_Estudiante_Auxliar where Est_Id = 'f10102e'
select top 100 * from DBCampusNet.dbo.Car_Carrera 

select top 10 * from DBCampusNet.Futl.TM_FutEnLinea 
select top 10 * from DBCampusNet.dbo.Obs_Observaciones

select distinct cod_tramite from DBCampusNet.FutL.TM_FutEnLinea

select top 10 * from DBCampusNet.dbo.Car_Carrera where Fac_Id in ('11', 'MC', 'SS')
select top 100 * from DBCampusNet.dbo.Fac_Facultad where Fac_Facultad like '%Medicina%'


select a.Est_Id from DBCampusNet.FutL.TM_FutEnLinea a 
left join DBCampusNet.dbo.Obs_Observaciones b on a.Est_Id = b.Est_id and b.TiO_id = '5' and mtr_anio = '2023' and mtr_periodo = '1'
where a.Anio_FutL = '2023' and a.Periodo_FutL ='1' and a.Cod_Tramite = '1' and a.Cod_Est in ('1', '4', '8') and b.Est_id is null

select top 100 * from DBCampusNet.FutL.TM_FutEnLinea where Anio_FutL = '2023' and Periodo_FutL ='1' 


select top 100 * from DBCampusNet.FutL.TM_Tramite where Desc_tramite like '%Renuncia%'
select top 10 * from DBCampusNet.FutL.TM_Estado


select * from DBCampusNet.dbo.Obs_Observaciones where TiO_id = '5' and mtr_anio = '2023' and mtr_periodo = '1'
select * from DBCampusNet.dbo.TiO_TipoObservaciones where TiO_id = '5' and mtr_anio = '2023' and mtr_periodo = '1'


select * from DBCampusNet.dbo.Obs_Observaciones where TiO_id = '5' and mtr_anio = '2023' and mtr_periodo = '1'

--select * from DBCampusNet.FutL.TM_FutEnLinea where Cod_Tramite = '5' and Anio_FutL = '2023' and Periodo_FutL = '1'

select * from DBCampusNet.FutL.TM_FutEnLinea where Anio_FutL = '2023' and Periodo_FutL = '1' and Cod_Tramite = '20'  and Cod_Est in ('1', '4', '8')


select * from DBCampusNet.FutL.TM_FutEnLinea where Anio_FutL = '2023' and Periodo_FutL = '1' and Cod_Tramite = '5'  and Cod_Est in ('1', '4', '8') 


select * from DBCampusNet.FutL.TM_FutEnLinea a
WHERE  a.Anio_FutL = '2023' and a.Periodo_FutL ='1' and a.Cod_Tramite in ('05', '20') and a.Cod_Est in ('1', '4', '8') 


select DISTINCT cod_tramite from DBCampusNet.FutL.TM_FutEnLinea

select * from DBCampusNet.dbo.TiO_TipoObservaciones where TiO_TipoObservaciones like '%Renuncia%'

select * from DBCampusNet.dbo.TiO_TipoObservaciones


select * from DBCampusNet.FutL.TM_FutEnLinea a 
left join DBCampusNet.dbo.Obs_Observaciones b on a.Est_Id = b.Est_id and mtr_anio = '2023' and mtr_periodo = '1' and TiO_Id in('5')
where a.Anio_FutL = '2023' and a.Periodo_FutL ='1' and a.Cod_Tramite =  '20' and a.Cod_Est in ('1', '4', '8') and b.Est_id is null

-- 2023-04-25 22:13:00 S03218K
select * from DBCampusNet.FutL.TM_FutEnLinea a 
left join DBCampusNet.dbo.Obs_Observaciones b on a.Est_Id = b.Est_id and b.mtr_anio = '2023' and b.mtr_periodo = '1' and b.TiO_Id = '5'
where a.Anio_FutL = '2023' and a.Periodo_FutL ='1' and a.Cod_Tramite = '20' and a.Cod_Est in ('1', '4', '8') and b.Est_id is null
-- op tramite 0002-002033253 
-- op fut 0002-002033254

select top 10 * from SGa.dbo.Operacion where SeriOper+NumOper= '0002002033253'
select top 10 * from SGa.dbo.Operacion where SeriOper+NumOper= '0002002033254'


select * from DBCampusNet.dbo.Car_Carrera 

select  DISTINCT ESP from DBCampusNet.dbo.Car_Carrera 

select distinct Esp_Id from DBCampusNet.FutL.TM_FutEnLinea 
