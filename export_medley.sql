-- MEDLEY (5)
SELECT * FROM mdldtap.mdladrpf 
SELECT * FROM mdldtap.mdladspf 
SELECT * FROM mdldtap.mdladupf 
SELECT * FROM mdldtap.mdlstopf
SELECT * FROM mdldtap.mdlmdlpf

--------------------------

-- Old code
SELECT MDMDNR,
	  MDNAMN,
	  MDFNMR, 
	  -- MDMDTY, -- Ta inte med medlemstyp
	  RTRIM(SUBSTR(CHAR(MDOPNR), 1, 8)) AS FDAT,
       MDAFDT,
       MDATDT, 
       MDAUDT,
       MDMDST, 
       --MDSTDT AS StatusDatum,
       MDSOKD, 
       SONAMN,
       -- MDSODT AS StatusOrsaksdatum,
       MDSTAV, 
       MDKNKD, 
       MDSPKD, 
       MDSBYT,
       MDSTOP, 
       AULAND,
       ASORT,
       ASPONR,
       PNKOMU
FROM mdldtap.mdlmdlpf 
LEFT OUTER JOIN (SELECT * FROM mdldtap.mdlstopf) orsakskod ON MDMDST=SOMDST AND MDSOKD=SOSOKD  
left OUTER JOIN (SELECT ASMDNR, ASORT, ASPONR FROM mdldtap.mdladspf JOIN mdldtap.mdladrpf ON ASMDNR=ADMDNR AND ASADNR=ADADNR WHERE ADADTP='01') svenskadr ON MDMDNR=ASMDNR
LEFT OUTER JOIN (SELECT AUMDNR, AULAND FROM mdldtap.mdladupf JOIN mdldtap.mdladrpf ON AUMDNR=ADMDNR AND AUADNR=ADADNR WHERE ADADTP='01') utladr ON MDMDNR=AUMDNR
LEFT OUTER JOIN (SELECT PNPONR, PNKOMU FROM gemdtap.gempnrpf) komu ON ASPONR = PNPONR
WHERE MDMDTY = 1 -- Upphovsperson 

