--4
CREATE TABLE sponsor(
    id_sponsor NUMBER(4) NOT NULL,
    nume VARCHAR2(30) CONSTRAINT sp_nume NOT NULL,
    CONSTRAINT PK_sponsor PRIMARY KEY(id_sponsor)
);

CREATE TABLE tara(
    id_tara CHAR(2) NOT NULL,
    nume VARCHAR2(30) CONSTRAINT nume_tara NOT NULL,
    CONSTRAINT PK_tara PRIMARY KEY(id_tara)
);

CREATE TABLE adresa(
    id_adresa NUMBER(4) NOT NULL,
    strada VARCHAR2(30),
    oras VARCHAR2(30) CONSTRAINT nume_oras NOT NULL,
    id_tara CHAR(2),
    CONSTRAINT PK_adr PRIMARY KEY (id_adresa),
    CONSTRAINT FK_adr_tara FOREIGN KEY (id_tara) REFERENCES tara(id_tara)
);

CREATE TABLE ong(
    id_ong NUMBER(4) NOT NULL,
    nume VARCHAR2(30) CONSTRAINT ong_nume NOT NULL,
    id_adresa NUMBER(4),
    CONSTRAINT PK_ong PRIMARY KEY (id_ong),
    CONSTRAINT FK_ong_adr FOREIGN KEY (id_adresa) REFERENCES adresa(id_adresa)
);

CREATE TABLE membru(
    id_membru NUMBER(4) NOT NULL,
    id_ong NUMBER(4),
    nume VARCHAR2(30) CONSTRAINT mem_nume NOT NULL,
    prenume VARCHAR2(30) CONSTRAINT mem_prenume NOT NULL,
    email VARCHAR2(30),
    CONSTRAINT PK_mem PRIMARY KEY (id_membru),
    CONSTRAINT FK_membru_ong FOREIGN KEY (id_ong) REFERENCES ong(id_ong)
);

CREATE TABLE proiect(
    id_proiect NUMBER(4) NOT NULL,
    id_ong NUMBER(4),
    id_coord NUMBER(4),
    nume VARCHAR2(30) CONSTRAINT pro_nume NOT NULL,
    CONSTRAINT PK_pro PRIMARY KEY (id_proiect),
    CONSTRAINT FK_pro_ong FOREIGN KEY (id_ong) REFERENCES ong(id_ong),
    CONSTRAINT FK_pro_mem FOREIGN KEY (id_coord) REFERENCES membru(id_membru)
);

CREATE TABLE sponsorizeaza(
    id_sponsor NUMBER(4) REFERENCES sponsor(id_sponsor),
    id_proiect NUMBER(4) REFERENCES proiect(id_proiect),
    suma NUMBER(5) CONSTRAINT sp_suma NOT NULL,
    PRIMARY KEY(id_sponsor, id_proiect)    
);

CREATE TABLE task(
    id_task NUMBER(4) NOT NULL,
    id_proiect NUMBER(4),
    descriere VARCHAR2(30) CONSTRAINT task_desc NOT NULL,
    status VARCHAR2(30),
    CONSTRAINT PK_task PRIMARY KEY(id_task),
    CONSTRAINT FK_task_pro FOREIGN KEY(id_proiect) REFERENCES proiect(id_proiect)
);

CREATE TABLE indeplineste(
    id_membru NUMBER(4) REFERENCES membru(id_membru),
    id_task NUMBER(4) REFERENCES task(id_task),
    data_finalizare DATE,
    PRIMARY KEY(id_membru, id_task)
);

--Testare
SELECT * FROM USER_TABLES;

--5
INSERT INTO tara VALUES 
        ( 'JP'
        , 'Japonia' 
        );
        
INSERT INTO tara VALUES
        ( 'RO'
        , 'Romania'
        );       
        
INSERT INTO tara VALUES 
        ( 'US'
        , 'Statele Unite ale Americii'
        );

INSERT INTO tara VALUES 
        ( 'CN'
        , 'China'
        );

INSERT INTO tara VALUES 
        ( 'ZW'
        , 'Zimbabwe'
        );
        

INSERT INTO tara VALUES 
        ( 'UK'
        , 'Marea Britanite'
        );

INSERT INTO adresa VALUES
        (1 
        , 'Iuliu Maniu 160'
        , 'Bucuresti'
        , 'RO' 
        );
INSERT INTO adresa VALUES
        (2 
        , 'Iuliu Maniu 240'
        , 'Bucuresti'
        , 'RO' 
        );
INSERT INTO adresa VALUES
        (3 
        , 'Constantin Brancoveanu 144'
        , 'Bucuresti'
        , 'RO' 
        );
INSERT INTO adresa VALUES
        (4 
        , 'Mihail Lungeanu 16'
        , 'Pitesti'
        , 'RO' 
        );
INSERT INTO adresa VALUES
        (5 
        , 'Sakurada-dori 1'
        , 'Tokyo'
        , 'JP' 
        );
        

INSERT INTO ong VALUES
        ( 1 
        , 'Clubul cainilor utilitari'
        , 1 
        );
INSERT INTO ong VALUES
        (2 
        , 'Asociatia pt boli hemoragice'
        , 2 
        );
INSERT INTO ong VALUES
        (3
        , 'OPTAR'
        , 3 
        );
INSERT INTO ong VALUES
        (4 
        , 'Fundatia 1 si 1'
        , 4 
        );
INSERT INTO ong VALUES
        (5
        , 'Make IT'
        , 5 
        );


INSERT INTO membru VALUES
        (1
        , 3
        , 'Costel'
        , 'Alex'
        , 'a_c@gmail.com'
        );
INSERT INTO membru VALUES
        (2
        , 3
        , 'Constantin'
        , 'Gabriel'
        , 'g_c@gmail.com'
        );
INSERT INTO membru VALUES
        (3
        , 3
        , 'Ursache'
        , 'Mircea'
        , 'u_m@protonmail.com'
        );
INSERT INTO membru VALUES
        (4
        , 4
        , 'Codrescu'
        , 'Marcel'
        , 'c_m@gmail.com'
        );
INSERT INTO membru VALUES
        (5
        , 3
        , 'Matache'
        , 'Ion'
        , 'ion_m@protonmail.com'
        );
INSERT INTO membru VALUES
        (6
        , 1
        , 'Maxim'
        , 'Cristian'
        , 'cris_m@yahoo.com'
        );
INSERT INTO membru VALUES
        (7
        , 2
        , 'Aur'
        , 'Costel'
        , 'a_c@yahoo.com'
        );        

INSERT INTO proiect VALUES
        (1
        , 3
        , 2
        , 'Prima banda libera'
        );
INSERT INTO proiect VALUES
        (2
        , 3
        , 3
        , 'Responsabilizare soferi'
        );
INSERT INTO proiect VALUES
        (3
        , 2
        , 4
        , 'Preventie'
        );
INSERT INTO proiect VALUES
        (4
        , 2
        , 4
        , 'Tratament'
        );
INSERT INTO proiect VALUES
        (5
        , 1
        , 6
        , 'Importanta cainilor utilitari'
        );
INSERT INTO proiect VALUES
        (6
        , 4
        , 4
        , 'Donatie produse alimentare'
        );

INSERT INTO sponsor VALUES
        (1
        , 'BLM INC'
        );
INSERT INTO sponsor VALUES
        (2
        , 'SC Herman'
        );
INSERT INTO sponsor VALUES
        (3
        , 'Selea Mihai'
        );
INSERT INTO sponsor VALUES
        (4
        , 'Mihai Ion'
        );
        

INSERT INTO sponsorizeaza VALUES
        ( 1
        , 1
        , 200
        );
INSERT INTO sponsorizeaza VALUES
        ( 1
        , 2
        , 100
        );
INSERT INTO sponsorizeaza VALUES
        ( 1
        , 3
        , 220
        );
INSERT INTO sponsorizeaza VALUES
        ( 1
        , 4
        , 320
        );
INSERT INTO sponsorizeaza VALUES
        ( 2
        , 2
        , 440
        );
INSERT INTO sponsorizeaza VALUES
        ( 2
        , 3
        , 200
        );
INSERT INTO sponsorizeaza VALUES
        ( 2
        , 4
        , 100
        );
INSERT INTO sponsorizeaza VALUES
        ( 3
        , 1
        , 620
        );
INSERT INTO sponsorizeaza VALUES
        ( 3
        , 2
        , 300
        );
INSERT INTO sponsorizeaza VALUES
        ( 3
        , 3
        , 400
        );
INSERT INTO sponsorizeaza VALUES
        ( 3
        , 4
        , 700
        );
INSERT INTO sponsorizeaza VALUES
        ( 3
        , 4
        , 700
        );
INSERT INTO sponsorizeaza VALUES
        ( 4
        , 6
        , 100
        );
INSERT INTO sponsorizeaza VALUES
        ( 1
        , 6
        , 100
        );

INSERT INTO task VALUES       
        ( 1
        , 1
        , 'masure timpi intre statii'
        , 'NEFINALIZAT'
        );
INSERT INTO task VALUES       
        ( 2
        , 1
        , 'masure timpi blocat in trafic'
        , 'NEFINALIZAT'
        );
INSERT INTO task VALUES       
        ( 3
        , 1
        , 'impact restictionare banda'
        , 'NEFINALIZAT'
        );
INSERT INTO task VALUES       
        ( 4
        , 1
        , 'calcul timp mediu asteptare'
        , 'FINALIZAT'
        );
INSERT INTO task VALUES       
        ( 5
        , 2
        , 'tutorial resuscitare'
        , 'NEFINALIZAT'
        );

INSERT INTO task VALUES       
        ( 6
        , 1
        , 'viteza mijloace alternative'
        , 'NEFINALIZAT'
        );
INSERT INTO task VALUES       
        ( 7
        , 5
        , 'pliante si afise publicitare'
        , 'NEFINALIZAT'
        );


INSERT INTO indeplineste VALUES       
        ( 1
        , 2
        , '14-FEB-2021'
        );
INSERT INTO indeplineste VALUES       
        ( 1
        , 1
        , '14-JAN-2021'
        );
INSERT INTO indeplineste VALUES       
        ( 1
        , 3
        , '14-NOV-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 1
        , 4
        , '10-NOV-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 2
        , 1
        , '18-DEC-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 2
        , 2
        , '16-NOV-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 2
        , 3
        , '24-OCT-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 2
        , 4
        , '10-DEC-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 3
        , 1
        , '14-OCT-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 3
        , 2
        , '18-DEC-2020'
        );
INSERT INTO indeplineste VALUES       
        ( 5
        , 6
        , '11-FEB-2021'
        );        
INSERT INTO indeplineste VALUES       
        ( 6
        , 7
        , '20-FEB-2021'
        );

COMMIT;

--Testare
SELECT * FROM sponsorizeaza;
SELECT * FROM sponsor;
SELECT * FROM proiect;
SELECT * FROM ong;
SELECT * FROM membru;
SELECT * FROM adresa;
SELECT * FROM tara;
SELECT * FROM task;
SELECT * FROM indeplineste;


--6
--Un subprogram stocat care mentine intr-o colectie datele membrilor care coordoneaza cel putin un proiect si le afiseaza
CREATE OR REPLACE PROCEDURE p6
IS
TYPE date_membru IS TABLE OF membru%ROWTYPE INDEX BY BINARY_INTEGER;
t date_membru;
BEGIN
    SELECT *
    BULK COLLECT INTO t
    FROM membru
    WHERE id_membru IN (SELECT id_coord
                        FROM proiect
                        GROUP BY id_coord
                        HAVING COUNT(*)>=1);
    FOR i in t.FIRST..t.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('id membru: ' || t(i).id_membru || ', id ong: ' || t(i).id_ong || ', nume: ' || t(i).nume || ', prenume: ' || t(i).prenume || ', email: ' || t(i).email);
    END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20000, 'Nu exista membru care sa indeplineasca aceste criterii');
END p6;
/

--Apelare
BEGIN
    p6;
END;
/

--7
--Un subprogram stocat care utilizand cel putin un cursor realizeaza top 3 membrii 
--Acesta afiseaza datele membrilor din clasament pentru fiecare proiect, numele proiectului fiind afisat o singura data la inceput.
--Top-ul este constituit in functie de numarul de task-uri corespunzatoare fiecarui membru. 
--Daca exista mai multi membrii cu acelasi numar de task-uri, atunci acestia vor ocupa aceeasi pozitie in top.
--Se vor afisa mesaje corespunzatoare in cazul in care nu exista suficienti membrii pentru a popula top-ul sau nu exista membrii care sa indeplineasca task-uri
CREATE OR REPLACE PROCEDURE p7
IS
CURSOR p IS SELECT id_proiect, nume FROM proiect;
CURSOR m(PARAM NUMBER) IS SELECT i.id_membru, nume, COUNT(*) 
                          FROM indeplineste i JOIN task t ON(t.id_task=i.id_task)
                                              JOIN membru m ON(i.id_membru=m.id_membru)
                          WHERE id_proiect = PARAM
                          GROUP BY i.id_membru, nume
                          ORDER BY COUNT(*) DESC;
pr_id proiect.id_proiect%TYPE;
pr_nume proiect.nume%TYPE;
mb_id membru.id_membru%TYPE;
mb_nume membru.nume%TYPE;
t_nr NUMBER(5);
old_t_nr NUMBER(5);
nr NUMBER;
BEGIN
OPEN p;
LOOP
    FETCH p INTO pr_id, pr_nume;
    EXIT WHEN p%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE('Proiect: ' || pr_nume);
    nr := 0;
    OPEN m(pr_id);
    LOOP
        FETCH m INTO mb_id, mb_nume, t_nr;
        EXIT WHEN m%NOTFOUND OR nr=3;
        DBMS_OUTPUT.PUT_LINE('Membrul cu id-ul ' || mb_id ||' si numele '|| mb_nume ||' indeplineste '|| t_nr || ' task-uri');
        IF nr = 0 OR t_nr != old_t_nr THEN
            nr := nr + 1;
        END IF;
        old_t_nr := t_nr;
    END LOOP;
    IF m%ROWCOUNT = 0 THEN
        DBMS_OUTPUT.PUT_LINE(' Nu exista membrii care au indeplinit taskuri');
    ELSE IF nr < 3 THEN
        DBMS_OUTPUT.PUT_LINE('--membrii insuficienti pentru cele 3 pozitii');
        END IF;
    END IF;
    CLOSE m;
END LOOP;
CLOSE p;
END p7;
/

--Apelare
BEGIN
p7;
END;
/

--8
--Un subprogram stocat de tip functie care determina id-ul ONG-ului care are un anumit numar de mebrii dintr-un oras dat prin nume.
--Numarul de membrii si numele orasului vor fi date ca parametru. In cazul in care nu sunt specificate, se vor alege implicit valorile 2 si Bucuresti.
--Se trateaza cazurile in care numarul de membri introdus este negativ, exista mai multe ONG-uri sau nu exista un ONG care sa respecte criteriile date afisandu-se mesaje corespunzatoare si orpindu-se executia .
CREATE OR REPLACE FUNCTION f8
    (v_oras adresa.oras%TYPE DEFAULT 'Bucuresti',
    v_nr NUMBER DEFAULT 2)
RETURN NUMBER IS
    ONG_ID NUMBER(3);
    negative_nr EXCEPTION;
    BEGIN
        --verificare nr de membri introdus
        IF v_nr < 0 THEN
            RAISE negative_nr;
        END IF;
        SELECT id_ong
        INTO ONG_ID
        FROM ong o JOIN adresa a ON (o.id_adresa=a.id_adresa)
        WHERE UPPER(oras)=UPPER(v_oras) AND (SELECT COUNT(id_membru)
                                            FROM membru
                                            WHERE id_ong = o.id_ong)=v_nr;
        RETURN ONG_ID;
    EXCEPTION
        WHEN negative_nr THEN
            RAISE_APPLICATION_ERROR(-20003, 'Numarul de membri introdus este negativ!');
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Nu exista ONG care sa indeplineasca aceste criterii');
        WHEN TOO_MANY_ROWS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe ONG-uri care indeplinesc aceste criterii');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Alta eroare!');
END f8;
/
--Testare ex 8
--Exemplificare exceptie NO_DATA_FOUND
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||f8);
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||f8('Pitesti', 1));
END;
/
--Exemplificare exceptie TOO_MANY_ROWS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||f8('Bucuresti', 1));
END;
/
--Exemplificare exceptie numar negativ
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||f8('Bucuresti', -2));
END;
/

--9
--Un subprogram stocat de tip procedura care afiseaza suma donata si numele sponsorului care a donat in total cel mai mult pentru un ONG dintr-un oras dat ca parametru.
--Se vor trata exceptiile afisandu-se mesaje corespunzatoare si orpindu-se executia cand nu exista orasul dat, exista mai multi sponsori sau nu exista sponsor care sa indeplineasca criteriile date.
CREATE OR REPLACE PROCEDURE p9
    (v_oras adresa.oras%TYPE)
IS
    wrong_city EXCEPTION;
    v_nr NUMBER(5);
    v_nume sponsor.nume%TYPE;
    v_id_sponsor sponsor.id_sponsor%TYPE;
    v_id_ong ong.id_ong%TYPE;
    v_suma sponsorizeaza.suma%TYPE;
BEGIN
    v_nr := 0;
    --verificare daca exista in db orasul introdus
    SELECT COUNT(*)
    INTO v_nr
    FROM adresa
    WHERE UPPER(oras) = UPPER(v_oras);
    IF v_nr = 0 THEN
        RAISE wrong_city;
    END IF;
    SELECT SUM(suma), p.id_ong, s.id_sponsor, sp.nume
    INTO v_suma, v_id_ong, v_id_sponsor, v_nume
    FROM sponsorizeaza s JOIN proiect p ON (s.id_proiect = p.id_proiect)
                         JOIN sponsor sp ON (s.id_sponsor = sp.id_sponsor)
                         JOIN ong o ON (p.id_ong = o.id_ong)
                         JOIN adresa a ON (o.id_adresa = a.id_adresa)
    WHERE UPPER(a.oras)=UPPER(v_oras)
    GROUP BY p.id_ong, s.id_sponsor, sp.nume
    HAVING SUM(suma) IN (
                            SELECT MAX(SUM(suma))
                            FROM sponsorizeaza s JOIN proiect p ON (s.id_proiect = p.id_proiect)
                                                 JOIN sponsor sp ON (s.id_sponsor = sp.id_sponsor)
                                                 JOIN ong o ON (p.id_ong = o.id_ong)
                                                 JOIN adresa a ON (o.id_adresa = a.id_adresa)
                            WHERE UPPER(a.oras)=UPPER(v_oras)
                            GROUP BY p.id_ong, s.id_sponsor);
    DBMS_OUTPUT.PUT_LINE('Cel mai generos sponsor este ' || v_nume || ' cu suma totala de ' || v_suma);
EXCEPTION
    WHEN wrong_city THEN
        DBMS_OUTPUT.PUT_LINE('Orasul introdus nu se afla in baza de date');
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nu exista sponsorul cautat');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi sponsori care indeplinesc acest criteriu');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Alta eroare!');
END p9;
/

--Testare ex 9
BEGIN
    p9('bucuresti');
END;
/
--Exemplificare exceptie TOO_MANY_ROWS
BEGIN
    p9('pitesti');
END;
/
--Exemplificare exceptie NO_DATA_FOUND
BEGIN
    p9('tokyo');
END;
/
--Exemplificare exceptie wrong_city
BEGIN
    p9('budapest');
END;
/

--10
--trigger LMD la nivel de comanda care nu permite INSERT,UPDATE,DELETE pe tabela ONG in weekend (sambata si duminica) si in cursul saptamanii in afara orelor 6-22 
--Se vor afisa mesaje corespunzatoare pentru fiecare caz.
CREATE OR REPLACE TRIGGER t_late
BEFORE INSERT OR UPDATE OR DELETE ON ong
BEGIN
IF (TO_CHAR(SYSDATE, 'D')=6) OR (TO_CHAR(SYSDATE, 'D')=7) THEN
    RAISE_APPLICATION_ERROR(-20009, 'Tabela nu poate fi actualizata in weekend!');
ELSIF TO_CHAR(SYSDATE, 'HH24') NOT BETWEEN 6 AND 22 THEN
    RAISE_APPLICATION_ERROR(-20009, 'Tabela nu poate fi actualizata in acest interval orar!');
END IF;
END;
/

--Testare trigger 10
SELECT TO_CHAR(SYSDATE, 'D') FROM DUAL;
UPDATE ong
SET nume = 'makit'
WHERE id_ong = 5;

--11
--trigger LMD la nivel de linie care nu permite inserarea/actualizarea cu o suma negativa oferita de un sponsor
CREATE OR REPLACE TRIGGER t_suma
BEFORE INSERT OR UPDATE OF suma ON sponsorizeaza
FOR EACH ROW
BEGIN
IF (:NEW.suma <= 0) THEN
    RAISE_APPLICATION_ERROR(-20009, 'Suma donata trebuie sa fie un numar pozitiv!');
END IF;
END;
/

--Testare trigger 11
UPDATE sponsorizeaza
SET suma = suma - 500;


--12
----un trigger LDD care sa introduca date in tabela log_dbs care stocheaza informatii cu privire la operatiile LDD efectuate. Se va creea tabela pentru a stoca aceste date.
CREATE TABLE log_dbs 
    (dbs_user VARCHAR2(30),
    log_date DATE,
    event VARCHAR2(20),
    dbs_name VARCHAR2(50),
    target_name VARCHAR2(30) 
    );
    
CREATE OR REPLACE TRIGGER t_log 
AFTER CREATE OR DROP OR ALTER ON SCHEMA 
BEGIN 
INSERT INTO log_dbs VALUES (SYS.LOGIN_USER, 
                            SYSDATE,
                            SYS.SYSEVENT,
                            SYS.DATABASE_NAME,
                            SYS.DICTIONARY_OBJ_NAME
                            ); 
END; 
/

--Testare trigger 12
ALTER TABLE tara ADD membra_ue VARCHAR2(3);
ALTER TABLE adresa
DROP CONSTRAINT FK_ADR_TARA;
DROP TABLE tara;

SELECT * FROM log_dbs;

--13
CREATE OR REPLACE PACKAGE pachet13 AS
    PROCEDURE p6;
    PROCEDURE p7;
    FUNCTION f8(v_oras adresa.oras%TYPE DEFAULT 'Bucuresti', v_nr NUMBER DEFAULT 2) 
    RETURN NUMBER;
    PROCEDURE p9(v_oras adresa.oras%TYPE);
END pachet13;
/
CREATE OR REPLACE PACKAGE BODY pachet13 AS

--6
PROCEDURE p6
IS
TYPE date_membru IS TABLE OF membru%ROWTYPE INDEX BY BINARY_INTEGER;
t date_membru;
BEGIN
    SELECT *
    BULK COLLECT INTO t
    FROM membru
    WHERE id_membru IN (SELECT id_coord
                        FROM proiect
                        GROUP BY id_coord
                        HAVING COUNT(*)>=1);
    FOR i in t.FIRST..t.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('id membru: ' || t(i).id_membru || ', id ong: ' || t(i).id_ong || ', nume: ' || t(i).nume || ', prenume: ' || t(i).prenume || ', email: ' || t(i).email);
    END LOOP;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20000, 'Nu exista membru care sa indeplineasca aceste criterii');
END p6;

--7
PROCEDURE p7
IS
CURSOR p IS SELECT id_proiect, nume FROM proiect;
CURSOR m(PARAM NUMBER) IS SELECT i.id_membru, nume, COUNT(*) 
                          FROM indeplineste i JOIN task t ON(t.id_task=i.id_task)
                                              JOIN membru m ON(i.id_membru=m.id_membru)
                          WHERE id_proiect = PARAM
                          GROUP BY i.id_membru, nume
                          ORDER BY COUNT(*) DESC;
pr_id proiect.id_proiect%TYPE;
pr_nume proiect.nume%TYPE;
mb_id membru.id_membru%TYPE;
mb_nume membru.nume%TYPE;
t_nr NUMBER(5);
old_t_nr NUMBER(5);
nr NUMBER;
BEGIN
    OPEN p;
    LOOP
        FETCH p INTO pr_id, pr_nume;
        EXIT WHEN p%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Proiect: ' || pr_nume);
        nr := 0;
        OPEN m(pr_id);
        LOOP
            FETCH m INTO mb_id, mb_nume, t_nr;
            EXIT WHEN m%NOTFOUND OR nr=3;
            DBMS_OUTPUT.PUT_LINE('Membrul cu id-ul ' || mb_id ||' si numele '|| mb_nume ||' indeplineste '|| t_nr || ' task-uri');
            IF nr = 0 OR t_nr != old_t_nr THEN
                nr := nr + 1;
            END IF;
            old_t_nr := t_nr;
        END LOOP;
        IF m%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE(' Nu exista membrii care au indeplinit taskuri');
        ELSE IF nr < 3 THEN
            DBMS_OUTPUT.PUT_LINE('--membrii insuficienti pentru cele 3 pozitii');
            END IF;
        END IF;
        CLOSE m;
    END LOOP;
    CLOSE p;
END p7;

--8
FUNCTION f8
    (v_oras adresa.oras%TYPE DEFAULT 'Bucuresti',
    v_nr NUMBER DEFAULT 2)
RETURN NUMBER IS
    ONG_ID NUMBER(3);
    negative_nr EXCEPTION;
    BEGIN
        --verificare nr de membri introdus
        IF v_nr < 0 THEN
            RAISE negative_nr;
        END IF;
        SELECT id_ong
        INTO ONG_ID
        FROM ong o JOIN adresa a ON (o.id_adresa=a.id_adresa)
        WHERE UPPER(oras)=UPPER(v_oras) AND (SELECT COUNT(id_membru)
                                            FROM membru
                                            WHERE id_ong = o.id_ong)=v_nr;
        RETURN ONG_ID;
    EXCEPTION
        WHEN negative_nr THEN
            RAISE_APPLICATION_ERROR(-20003, 'Numarul de membri introdus este negativ!');
        WHEN NO_DATA_FOUND THEN
            RAISE_APPLICATION_ERROR(-20000, 'Nu exista ONG care sa indeplineasca aceste criterii');
        WHEN TOO_MANY_ROWS THEN
            RAISE_APPLICATION_ERROR(-20001, 'Exista mai multe ONG-uri care indeplinesc aceste criterii');
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20002, 'Alta eroare!');
END f8;

--9
PROCEDURE p9
    (v_oras adresa.oras%TYPE)
IS
    wrong_city EXCEPTION;
    v_nr NUMBER(5);
    v_nume sponsor.nume%TYPE;
    v_id_sponsor sponsor.id_sponsor%TYPE;
    v_id_ong ong.id_ong%TYPE;
    v_suma sponsorizeaza.suma%TYPE;
BEGIN
    v_nr := 0;
    --verificare daca exista in db orasul introdus
    SELECT COUNT(*)
    INTO v_nr
    FROM adresa
    WHERE UPPER(oras) = UPPER(v_oras);
    IF v_nr = 0 THEN
        RAISE wrong_city;
    END IF;
    SELECT SUM(suma), p.id_ong, s.id_sponsor, sp.nume
    INTO v_suma, v_id_ong, v_id_sponsor, v_nume
    FROM sponsorizeaza s JOIN proiect p ON (s.id_proiect = p.id_proiect)
                         JOIN sponsor sp ON (s.id_sponsor = sp.id_sponsor)
                         JOIN ong o ON (p.id_ong = o.id_ong)
                         JOIN adresa a ON (o.id_adresa = a.id_adresa)
    WHERE UPPER(a.oras)=UPPER(v_oras)
    GROUP BY p.id_ong, s.id_sponsor, sp.nume
    HAVING SUM(suma) IN (
                            SELECT MAX(SUM(suma))
                            FROM sponsorizeaza s JOIN proiect p ON (s.id_proiect = p.id_proiect)
                                                 JOIN sponsor sp ON (s.id_sponsor = sp.id_sponsor)
                                                 JOIN ong o ON (p.id_ong = o.id_ong)
                                                 JOIN adresa a ON (o.id_adresa = a.id_adresa)
                            WHERE UPPER(a.oras)=UPPER(v_oras)
                            GROUP BY p.id_ong, s.id_sponsor);
    DBMS_OUTPUT.PUT_LINE('Cel mai generos sponsor este ' || v_nume || ' cu suma totala de ' || v_suma);
EXCEPTION
    WHEN wrong_city THEN
        DBMS_OUTPUT.PUT_LINE('Orasul introdus nu se afla in baza de date');
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20000, 'Nu exista sponsorul cautat');
    WHEN TOO_MANY_ROWS THEN
        RAISE_APPLICATION_ERROR(-20001, 'Exista mai multi sponsori care indeplinesc acest criteriu');
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20002, 'Alta eroare!');
END p9;

END pachet13;
/

--Testare ex 9
BEGIN
    pachet13.p9('bucuresti');
END;
/
--Exemplificare exceptie TOO_MANY_ROWS
BEGIN
    pachet13.p9('pitesti');
END;
/
--Exemplificare exceptie NO_DATA_FOUND
BEGIN
    pachet13.p9('tokyo');
END;
/
--Exemplificare exceptie wrong_city
BEGIN
    pachet13.p9('budapest');
END;
/

--Testare ex 8
--Exemplificare exceptie NO_DATA_FOUND
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||pachet13.f8);
END;
/
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||pachet13.f8('Pitesti', 1));
END;
/
--Exemplificare exceptie TOO_MANY_ROWS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||pachet13.f8('Bucuresti', 1));
END;
/
--Exemplificare exceptie numar negativ
BEGIN
    DBMS_OUTPUT.PUT_LINE('Id-ul ONG-ului cautat este: '||pachet13.f8('Bucuresti', -2));
END;
/

--Testare ex 7
BEGIN
pachet13.p7;
END;
/

--Testare ex 6
BEGIN
pachet13.p6;
END;
/

--14
--Un pachet care utilizeaza un tip de date complex(vector de vectori) pentru a mentine si a afisa ONG-urile si numarul lor pentru fiecare oras.
--Astfel, vom avea un vector de perechi de tipul (v_o, v_ong), unde v_o este numele orasului si v_ong este vectorul ce contine ONG-urile din acel oras.
--Pachetul utilizeaza o functie ce returneaza vectorul de ong-uri dintr-un oras dat ca parametru.
--Aceasta functie este folosita apoi de o procedura pentru a popula vectorul de vectori, procedura care la randul ei ofera acest vector de vectori unei alte proceduri pentru afisare 
CREATE OR REPLACE PACKAGE pachet14 AS

TYPE ongs IS VARRAY(30) OF VARCHAR2(40);
TYPE tuple IS RECORD (city VARCHAR2(30), o ongs);
TYPE vector IS VARRAY(30) OF tuple;
FUNCTION f_ong_14(
    v_oras adresa.oras%TYPE
)
RETURN ongs;
PROCEDURE pop_14;
PROCEDURE display_14(vec vector);

END pachet14;
/

CREATE OR REPLACE PACKAGE BODY pachet14 AS

FUNCTION f_ong_14(
    v_oras adresa.oras%TYPE
)
RETURN ongs IS o ongs;
BEGIN
    SELECT nume
    BULK COLLECT INTO o
    FROM ong og JOIN adresa a ON (og.id_adresa = a.id_adresa)
    WHERE UPPER(v_oras) = UPPER(a.oras);
    RETURN o;
END;

PROCEDURE pop_14 IS 
TYPE veoras IS VARRAY(30) OF VARCHAR2(30);
vec vector := vector();
voras veoras;
BEGIN
    SELECT DISTINCT(oras)
    BULK COLLECT INTO voras
    FROM adresa;
    
    FOR i in voras.FIRST..voras.LAST LOOP
        vec.extend();
        vec(i).city := voras(i);
        vec(i).o := f_ong_14(voras(i));
    END LOOP;
    display_14(vec);
END;

PROCEDURE display_14 (vec vector) IS
BEGIN
    FOR i in vec.FIRST..vec.LAST LOOP
        DBMS_OUTPUT.PUT_LINE('-----ORAS: ' || vec(i).city || '-----');
        DBMS_OUTPUT.PUT_LINE('---numar ong-uri: ' || vec(i).o.LAST);
        FOR j in vec(i).o.FIRST..vec(i).o.LAST LOOP
            DBMS_OUTPUT.PUT_LINE(vec(i).o(j));
        END LOOP;
        DBMS_OUTPUT.PUT_LINE('');
    END LOOP;
END;

END pachet14;
/

--Testare pachet 14
BEGIN
    pachet14.pop_14;
END;
/
