
-- Välj distkeys och kör - detta är en inkrementell alddning som ska läggas till de redan befintliga raderna i avstämningstabellen datamarts.udd_troy_true_amounts_by_distkey
-- Detta eftersom det tar ett tag att köra SQL:en nedan för många distkeys
-- Kopiera allt med Copy as SQL Insert Values
-- Klistra in i SQL Server management studio och byt namn på tabellen till datamarts.udd_troy_true_amounts_by_distkey 
-- Kör INSERT-satserna

SELECT idn.distkey, SUM(fordistbel) AS TROYAmountAfterComissionTotal, SUM(combel) AS TROYCommissionAmountTotal, SUM(dedbel) AS TROYDeductAmountTotal, SUM(distedbel) AS TROYAmountDistributed, SUM(resbel) AS TROYAmountReserved, SUM(apsrows) AS TROYApsRows, SUM(resrows) AS TROYResRows
FROM dstdtap.dstidn idn 
INNER JOIN (SELECT distkey, SUM(distributionamount) AS fordistbel, SUM(commissionamount) AS combel FROM dstdtap.dstdam GROUP BY distkey) s ON s.distkey = idn.distkey
INNER JOIN (SELECT distkey, COUNT(*) as apsrows, SUM(amount) AS distedbel, SUM(deductamount) AS dedbel FROM dstdtap.dstaps GROUP BY distkey) aps ON aps.distkey = idn.distkey AND aps.distkey = s.distkey
LEFT JOIN (SELECT distkey, COUNT(*) as resrows, SUM(CASE WHEN approvedfordistribution IN (0,1,2,5,6,7,8,9) THEN reservedamount ELSE 0 END) AS resbel FROM dstdtap.dstres group by distkey) res ON res.distkey = idn.distkey AND res.distkey = s.distkey AND res.distkey = aps.distkey 
WHERE ((idn.distkey in (1169, 1170, 1173, 1174, 1175, 1176, 1177, 1178)) OR (idn.distkey >= 1188 AND idn.distkey <= 1193)) AND idn.distkey IN (SELECT DISTINCT distkey FROM dstdtap.dstdcg WHERE distphase = 'D7' AND diststatus = '+') 
GROUP BY idn.distkey
ORDER BY idn.distkey

