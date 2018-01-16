<<<<<<< HEAD
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
=======
{\rtf1\ansi\ansicpg1252\cocoartf1561\cocoasubrtf100
{\fonttbl\f0\fswiss\fcharset0 ArialMT;}
{\colortbl;\red255\green255\blue255;\red255\green255\blue255;\red0\green0\blue0;}
{\*\expandedcolortbl;;\cssrgb\c100000\c100000\c100000;\cssrgb\c0\c0\c0;}
\paperw11900\paperh16840\margl1440\margr1440\vieww10800\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\partightenfactor0

\f0\fs26 \cf0 \cb2 \expnd0\expndtw0\kerning0
SELECT MDMDNR,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0MDNAMN,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0MDFNMR, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0-- MDMDTY, -- Ta inte med medlemstyp
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0RTRIM(SUBSTR(CHAR(MDOPNR), 1, 8)) AS FDAT,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDAFDT,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDATDT, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDAUDT,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDMDST, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0--MDSTDT AS StatusDatum,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDSOKD, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0SONAMN,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0-- MDSODT AS StatusOrsaksdatum,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDSTAV, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDKNKD, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDSPKD, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDSBYT,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0MDSTOP, 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0AULAND,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0ASORT,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0ASPONR,
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 \'a0 \'a0 \'a0 \'a0PNKOMU
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 FROM mdldtap.mdlmdlpf 
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 LEFT OUTER JOIN (SELECT * FROM mdldtap.mdlstopf) orsakskod ON MDMDST=SOMDST AND MDSOKD=SOSOKD \'a0
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 left OUTER JOIN (SELECT ASMDNR, ASORT, ASPONR FROM mdldtap.mdladspf JOIN mdldtap.mdladrpf ON ASMDNR=ADMDNR AND ASADNR=ADADNR WHERE ADADTP='01') svenskadr ON MDMDNR=ASMDNR
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 LEFT OUTER JOIN (SELECT AUMDNR, AULAND FROM mdldtap.mdladupf JOIN mdldtap.mdladrpf ON AUMDNR=ADMDNR AND AUADNR=ADADNR WHERE ADADTP='01') utladr ON MDMDNR=AUMDNR
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 LEFT OUTER JOIN (SELECT PNPONR, PNKOMU FROM gemdtap.gempnrpf) komu ON ASPONR = PNPONR
\fs22\fsmilli11200 \cb1 \

\fs26 \cb2 WHERE MDMDTY = 1 -- Upphovsperson}
>>>>>>> parent of 8492fb9... Updated - old code
