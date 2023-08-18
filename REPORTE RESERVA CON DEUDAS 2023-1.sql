-- REPORTE RESERVA CON DEUDAS 2023-1
SELECT	
        s.Sed_Sede SEDE,
		deu.NumDI CODIGO, 
		e.Est_Paterno +' '+ e.Est_Materno +' '+ e.Est_Nombre as 'APELLIDOS Y NOMBRES',
		case when ma.MAc_Id in ('01', '02', '04', '06', '07') then 'PREGRADO'
			else 'POSGRADO' 
		end 'PREGRADO / POSGRADO',
		f.Fac_Facultad FACULTAD,
		c.Car_Carrera CARRERA,
        '' ESPECIALIDAD,
        (select top 1 Nta_Nivel from DBCampusNet.dbo.Nta_Nota where Mtr_Anio = '2023' and Mtr_Periodo = '1' and Est_Id = e.Est_Id) 'CICLO ACADEMICO',
		deu.AñoAcad AÑO,
		deu.PeriAcad PERIODO,
		deu.NumCuota 'NUMERO CUOTAS',
        deu.Importe PENSION,
        deu.Importe * sga.SGA.FN_FactorMora(deu.FecVenc, deu.FecCarg, deu.TasaMora) AS MORA,
        ((deu.Importe * sga.SGA.FN_FactorMora(deu.FecVenc, deu.FecCarg, deu.TasaMora)) + importe ) TOTAL,
        ISNULL(o.NroResol_Aux, '') RESOLUCION,
        ISNULL(fl.Observacion, '')  OBSERVACION,
        case    when  o.Est_id is null  then 'faltante'
                else  'Atendido'
        end ATENCION

FROM SGA.dbo.Deudas deu
inner join DBCampusNet.dbo.Est_Estudiante e on deu.NumDI COLLATE Latin1_General_CI_AS = e.Est_Id COLLATE Latin1_General_CI_AS
inner join DBCampusNet.FutL.TM_FutEnLinea fl on e.Est_Id = fl.Est_Id and fl.Anio_FutL = '2023' and fl.Periodo_FutL='1' and fl.Cod_Tramite =  '6' and fl.Cod_Est in ('1', '4', '8')
left join DBCampusNet.dbo.Obs_Observaciones o on fl.Est_Id = o.Est_id and o.mtr_anio = '2023' and o.mtr_periodo = '1' and o.Tio_id = '8'
inner join DBCampusNet.dbo.Sed_Sede s on fl.Sed_Id = s.Sed_id
inner join DBCampusNet.dbo.Car_Carrera c on fl.Car_Id = c.Car_Id
inner join DBCampusNet.dbo.Fac_Facultad f on c.Fac_Id = f.Fac_Id
inner join DBCampusNet.dbo.MAc_ModAcademica ma on fl.MAc_Id = ma.MAc_Id
WHERE   deu.AñoAcad = '2023' AND
		deu.PeriAcad = '01' AND
		deu.NumCuota in ('01', '02', '03', '04', '05') AND
		deu.CondDeud in (0, 9)

/* */

select * from DBCampusNet.FutL.TM_FutEnLinea a 
left join DBCampusNet.dbo.Obs_Observaciones b on a.Est_Id = b.Est_id and mtr_anio = '2023' and mtr_periodo = '1' and TiO_Id = '8'
where a.Anio_FutL = '2023' and a.Periodo_FutL ='1' and a.Cod_Tramite = '6' and a.Cod_Est in ('1', '4', '8') and b.Est_id is null


select * from  DBCampusNet.FutL.TM_FutEnLinea
where Anio_FutL = '2023' and Periodo_FutL = '1' and Cod_Tramite = '6' and Cod_Est in ('1', '4', '8')


select * from  DBCampusNet.dbo.Obs_Observaciones o
where o.mtr_anio = '2023' and o.mtr_periodo = '1' and TiO_id = '8'


select * from DBCampusNet.FutL.TM_Tramite

select top 10 * from DBCampusNet.dbo.TiO_TipoObservaciones where TiO_Id = '8'
select top 10 * from DBCampusNet.FutL.TM_Tramite where TiO_Id = '8'


SELECT * from DBCampusNet.FutL.TM_Estado

-- R01817J, P02087C, R02362C, R01817J, R02362C

select top 10 * from sga.dbo.Deudas deu
    where   deu.AñoAcad = '2023' AND
            deu.PeriAcad = '01' AND
            deu.NumCuota in ('01', '02', '03', '04', '05') AND
            deu.CondDeud in (0, 9) AND
            deu.NumDI in (
                'P02087C',
                'N01593H',
                'Q04330A',
                'S02357D',
                'M02279E',
                'S01895F',
                'R01817J',
                'R00514A',
                'P00624K',
                'H11569E',
                'S03445E',
                'S03438G',
                'S03122E',
                'H11272E',
                'N00701E',
                'K06376C',
                'S02064A',
                'H07262A',
                'S01341C',
                'N04430G',
                'R02362C',
                'S03143G',
                'H11480B',
                'R00423G',
                'D00199I',
                'N04096B',
                'K00949C',
                'R04338F',
                'S00342C',
                'H02333F',
                'K07263G',
                'P00016F',
                'M03528G',
                'N00967K',
                'G01521J',
                'J01223D',
                'Q02550F',
                'S02206G',
                'S02516H',
                'S01006F',
                'J09016J',
                'K05990G',
                'S03389G',
                'C09300B',
                'R00835C',
                'Q04543A',
                'S03364A',
                'P02436D',
                'S01311B',
                'R03042F',
                'H01224B',
                'G01289J',
                'H02651H',
                'M05870J',
                'J08880K',
                'H11755A',
                'M04149G',
                'E06705H',
                'M03488C',
                'R04161C',
                'B93190A',
                'H00656C'
            )

select top 10 * from sga.dbo.Deudas deu
    where   deu.AñoAcad = '2023' AND
            deu.PeriAcad = '01' AND
            deu.NumCuota in ('01', '02', '03', '04', '05') AND
            deu.CondDeud in (0, 9) AND
            deu.NumDI = 'R02362C' --- R01817J R02362C

-- No tiene deuda y reservo matricula y no tiene resolucion y tine pension cargada del 2023-02
select top 10 * from DBCampusNet.FutL.TM_FutEnLinea
WHERE Est_Id = 'R02362C' and Anio_FutL = '2023' and Periodo_FutL = '1' and Cod_Tramite = '6'

select top 10 * from DBCampusNet.dbo.Obs_Observaciones
WHERE Est_Id = 'R01817J' and mtr_anio = '2023' and mtr_periodo = '1'

select * from DBCampusNet.dbo.TiO_TipoObservaciones

