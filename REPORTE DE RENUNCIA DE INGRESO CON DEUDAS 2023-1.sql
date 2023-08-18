-- REPORTE DE RENUNCIA DE INGRESO CON DEUDAS 2023-1

SELECT	
        sed.Sed_Sede,
		deu.NumDI Codigo, 
		cl.Cli_Paterno +' '+ cl.Cli_Materno +' '+ cl.Cli_Nombre as 'Apellidos y Nombres',
		case when ma.MAc_Id in ('01', '02', '04', '06', '07') then 'PREGRADO'
			else 'POSGRADO' 
		end 'Pregrado / Posgrado',
		fac.Fac_Facultad Facultad,
		car.Car_Carrera Carrera,
        '' Especialidad,
        nt.Nta_Nivel 'Ciclo Academico',
		-- especialidad
		-- clico academico
		deu.AñoAcad Año,
		deu.PeriAcad Periodo,
		deu.NumCuota 'Numero Cuota',
		
		deu.Importe * sga.SGA.FN_FactorMora(deu.FecVenc, deu.FecCarg, deu.TasaMora) as Mora,
		(select top 1 Mtr_CredMatric from DBCampusNet.dbo.Mtr_Matricula where Mtr_Anio = '2023' and Mtr_Periodo = '1' and Est_Id COLLATE Latin1_General_CI_AS = deu.NumDI COLLATE Latin1_General_CI_AS) AS Creditos
		--mt.Mtr_CredMatric Creditos

FROM SGA.dbo.Deudas deu
inner join SGA.dbo.Clientes cl on deu.NumDI = cl.Cli_NumDoc
inner join SGA.dbo.Sed_Sede sed on cl.sed_id = sed.Sed_Sede
inner join SGA.dbo.Car_Carrera car on car.CodEspe =  cl.CodEspe
inner join SGA.dbo.Fac_Facultad fac on car.Fac_Id = fac.Fac_Id
inner join SGA.dbo.MAc_ModAcademica ma on cl.MAC_id = ma.MAc_Id
inner join DBCampusNet.dbo.Nta_Nota nt on deu.NumDI COLLATE Latin1_General_CI_AS = nt.Est_Id COLLATE Latin1_General_CI_AS and nt.Mtr_Anio = '2023' and nt.Mtr_Periodo = '1'
WHERE   deu.AñoAcad = '2023' AND
		deu.PeriAcad = '01' AND
		deu.NumCuota in ('01', '02', '03', '04', '05') --AND
		--deu.CondDeud in (0, 9) and
        and deu.NumDI = 'C07120K'


select top 10 * from SGA.dbo.Clientes 

select top 100 * from Sga.dbo.Car_Carrera
select top 100 * from DBCampusNet.dbo.Car_Carrera
select top 100 * from DBCampusNet.dbo.Especi