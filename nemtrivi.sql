--1.
CREATE OR REPLACE PROCEDURE listSzakmak30(username IN allaskereso.felh_nev%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT CEG.nev as cegnev, varos.nev as varosnev, szakma.megnevezes as szakmanev, allas.munkakor as munkakor, allas.leiras as leiras, allas.ber as ber, allas.feladas_datuma as feladas
    FROM CEG, VAROS, SZAKMA, ALLAS WHERE varos.id=allas.varos_id AND ceg.id=allas.ceg_id AND szakma.id=allas.szakma_id
    AND allas.szakma_id IN (SELECT allaskeresoszakma.szakma_id FROM ALLASKERESOSZAKMA WHERE allaskeresoszakma.allaskereso_id=(SELECT allaskereso.id FROM allaskereso where allaskereso.felh_nev=username));
END;
/
--2.
CREATE OR REPLACE PROCEDURE listAKErtByUserId(allaskid IN allaskereso.id%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT ALLASKERESO.NEV, CEG.NEV, SZAKMA.megnevezes, ALLASKERESOERT.ertekeles, allaskeresoert.datum
    FROM allaskereso, ceg, szakma, allaskeresoert, allas WHERE ALLASKERESO.id=allaskeresoert.allaskereso_id 
    AND allaskeresoert.allas_id=ALLAS.ID and allas.szakma_id=szakma.id and ceg.id=allas.ceg_id
    AND allaskereso.felh_nev=(SELECT felh_nev from allaskereso WHERE id=allaskid);
END;
/
--3.
CREATE OR REPLACE PROCEDURE listAllasErtByCegId(cegid IN ceg.id%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN RET FOR SELECT ALLASKERESO.NEV, CEG.NEV, SZAKMA.megnevezes, ALLASERT.szoveg, allasert.datum, allasert.ertek
    FROM allaskereso, ceg, szakma, allasert, allas WHERE ALLASKERESO.id=allasert.allaskereso_id 
    AND allasert.allas_id=ALLAS.ID and allas.szakma_id=szakma.id and ceg.id=allas.ceg_id
    AND ceg.felh_nev=(SELECT felh_nev from ceg WHERE id=cegid);
END;
/
--4.
CREATE OR REPLACE PROCEDURE listJelentkezesekByCegId(cegid IN ceg.id%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT ALLASKERESO.NEV, szakma.megnevezes, ALLAPOT.MEGNEVEZES, JELENTKEZES.DATUM
    FROM ALLASKERESO, SZAKMA, JELENTKEZES, ALLAS, CEG, ALLAPOT
    WHERE jelentkezes.allaskereso_id=allaskereso.id
    AND SZAKMA.ID=allas.szakma_id AND JELENTKEZES.ALLAS_ID=ALLAS.ID
    AND CEG.ID=ALLAS.CEG_ID AND JELENTKEZES.ALLAPOT_ID=ALLAPOT.ID
    AND ceg.felh_nev=(SELECT ceg.felh_nev FROM CEG WHERE CEG.ID=cegid);
END;
/

--5.
CREATE OR REPLACE PROCEDURE atlagFizetesSzakmankent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT AVG(ALLAS.BER) as value,SZAKMA.MEGNEVEZES as megnevezes FROM ALLAS, SZAKMA
    WHERE SZAKMA.ID=ALLAS.SZAKMA_ID
    GROUP BY SZAKMA.MEGNEVEZES;
END;
/

--6.
CREATE OR REPLACE PROCEDURE legkeresettebbSzakmak(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT SZAKMA.megnevezes as megnevezes,COUNT(*)AS value 
    FROM SZAKMA, ALLAS
    WHERE SZAKMA.ID=ALLAS.SZAKMA_ID AND ROWNUM<11
    GROUP BY szakma.megnevezes
    ORDER BY value DESC;
END;
/

--7.
CREATE OR REPLACE PROCEDURE maxFizetesSzakmankent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT MAX(ALLAS.BER) as value,SZAKMA.MEGNEVEZES as megnevezes FROM ALLAS, SZAKMA
    WHERE SZAKMA.ID=ALLAS.SZAKMA_ID
    GROUP BY SZAKMA.MEGNEVEZES
	ORDER BY value DESC;
END;
/

--8.
CREATE OR REPLACE PROCEDURE allasokDarabszamOrszagonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, VAROS.nev as megnevezes FROM ALLAS, VAROS
    WHERE VAROS.ID=allas.varos_id
    GROUP BY VAROS.nev
	ORDER BY value DESC;
END;
/
--9.
CREATE OR REPLACE PROCEDURE allaskeresokDarabszamVarosonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, VAROS.nev as megnevezes FROM ALLASKERESO, VAROS
    WHERE VAROS.ID=allaskereso.varos_id
    GROUP BY VAROS.nev
	ORDER BY value DESC;
END;
/
--10.
CREATE OR REPLACE PROCEDURE cegekDarabszamVarosonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, VAROS.nev as megnevezes FROM CEG, VAROS
    WHERE VAROS.ID=ceg.varos_id
    GROUP BY VAROS.nev
	ORDER BY value DESC;
END;
/
--11.
CREATE OR REPLACE PROCEDURE allasjelentkezesekDarabszamAllapotokszerint(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, allapot.megnevezes as megnevezes FROM JELENTKEZES, ALLAPOT
    WHERE jelentkezes.allapot_id=allapot.id
    GROUP BY allapot.megnevezes
	ORDER BY value DESC;
END;
/
--12.
CREATE OR REPLACE PROCEDURE allaskeresokDarabszamStatuszokszerint(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, statusz.megnevezes  as megnevezes FROM statusz, allaskereso
    WHERE allaskereso.statusz_id=statusz.id
    GROUP BY statusz.megnevezes
	ORDER BY value DESC;
END;
/
--13.
CREATE OR REPLACE PROCEDURE atlagFizetesVarosonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT AVG(allas.ber) as value, varos.nev  as megnevezes FROM varos, allas
    WHERE allas.varos_id=varos.id
    GROUP BY varos.nev
	ORDER BY value DESC;
END;
/