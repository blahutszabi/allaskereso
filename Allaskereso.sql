 DROP TABLE JELENTKEZES;
DROP TABLE ALLASERT;
DROP TABLE ALLASKERESOERT;
DROP TABLE ONELETRAJZ;
DROP TABLE ALLASKERESOSZAKMA;
DROP TABLE ALLASKERESO;
DROP TABLE ALLAS;
DROP TABLE CEG;
DROP TABLE KAPCSOLATTARTO;
DROP TABLE MODERATOR;
DROP TABLE ALLAPOT;
DROP TABLE VAROS;
DROP TABLE SZAKMA;
DROP TABLE STATUSZ;
DROP TABLE LOGOLAS;

CREATE TABLE STATUSZ(
	id NUMBER(1) NOT NULL,
	megnevezes VARCHAR2(30) UNIQUE NOT NULL,
	PRIMARY KEY(id)
);

CREATE TABLE SZAKMA(
	id INTEGER NOT NULL,
	megnevezes VARCHAR2(65)UNIQUE NOT NULL,
	PRIMARY KEY(id)	
);

CREATE TABLE VAROS(
	id INTEGER NOT NULL,
	nev VARCHAR2(30) UNIQUE NOT NULL,
	PRIMARY KEY(id)	
);

CREATE TABLE ALLAPOT(
	id NUMBER(1) NOT NULL,
	megnevezes VARCHAR2(30) UNIQUE NOT NULL,
	PRIMARY KEY(id)	
);

CREATE TABLE MODERATOR(
	id INTEGER NOT NULL,
	nev VARCHAR2(30) NOT NULL,
	felh_nev VARCHAR2(30) UNIQUE NOT NULL,
	jelszo VARCHAR2(30) NOT NULL,
	PRIMARY KEY(id)	
);

CREATE TABLE KAPCSOLATTARTO(
	id INTEGER NOT NULL,
	nev VARCHAR2(30) NOT NULL,
	email VARCHAR2(40) UNIQUE NOT NULL,
	telefonszam VARCHAR2(20) UNIQUE NOT NULL,
	PRIMARY KEY(id)	
);

CREATE TABLE CEG(
	id INTEGER NOT NULL,
	nev VARCHAR2(50) NOT NULL,
	varos_id INTEGER NOT NULL,
	utca VARCHAR2(30) NOT NULL,
	hazszam VARCHAR2(30) NOT NULL,
	felh_nev VARCHAR2(30) UNIQUE NOT NULL,
	jelszo VARCHAR2(30) NOT NULL,
	kapcsolattarto_id INTEGER NOT NULL,
	FOREIGN KEY(varos_id) REFERENCES VAROS(id),
	PRIMARY KEY(id)	
);

CREATE TABLE ALLAS(
	id INTEGER NOT NULL,
	ceg_id INTEGER NOT NULL,
	varos_id INTEGER NOT NULL,
	szakma_id INTEGER NOT NULL,
	munkakor VARCHAR2(65) NOT NULL,
	leiras VARCHAR2(512) NOT NULL,
	ber INTEGER NOT NULL,
	feladas_datuma TIMESTAMP NOT NULL,
	FOREIGN KEY(varos_id) REFERENCES VAROS(id),
	FOREIGN KEY(ceg_id) REFERENCES CEG(id),
	FOREIGN KEY(szakma_id) REFERENCES SZAKMA(id),
	PRIMARY KEY(id)	
);



CREATE TABLE ALLASKERESO(
	id INTEGER NOT NULL,
	nev VARCHAR2(30) NOT NULL,
	szul_ido DATE NOT NULL,
	email VARCHAR2(40) UNIQUE NOT NULL,
	varos_id INTEGER NOT NULL,
	utca VARCHAR2(30) NOT NULL,
	hazszam VARCHAR2(30) NOT NULL,
	statusz_id NUMBER(1) NOT NULL,
	felh_nev VARCHAR2(30) UNIQUE NOT NULL,
	jelszo VARCHAR2(30) NOT NULL,
	utolso_belepes TIMESTAMP NOT NULL,
	FOREIGN KEY(statusz_id) REFERENCES STATUSZ(id),
	FOREIGN KEY(varos_id) REFERENCES VAROS(id),
	PRIMARY KEY(id)
);

CREATE TABLE ALLASKERESOSZAKMA(
	szakma_id INTEGER NOT NULL,
	allaskereso_id INTEGER NOT NULL,
	FOREIGN KEY(allaskereso_id) REFERENCES ALLASKERESO(id),
	FOREIGN KEY(szakma_id) REFERENCES SZAKMA(id),	
	PRIMARY KEY(allaskereso_id,szakma_id)
);

CREATE TABLE ONELETRAJZ(
	id INTEGER NOT NULL,
	allaskereso_id INTEGER NOT NULL,
	oneletrajz BLOB NOT NULL,
	FOREIGN KEY(allaskereso_id) REFERENCES ALLASKERESO(id),
	PRIMARY KEY(id)	
);

CREATE TABLE ALLASKERESOERT(
	allaskereso_id INTEGER NOT NULL,
	allas_id INTEGER NOT NULL,
	ertekeles VARCHAR2(512) NOT NULL,
	datum TIMESTAMP NOT NULL,
	FOREIGN KEY(allaskereso_id) REFERENCES ALLASKERESO(id),
	FOREIGN KEY(allas_id) REFERENCES ALLAS(id),
	PRIMARY KEY(allas_id,allaskereso_id)	
);

CREATE TABLE JELENTKEZES(
	allaskereso_id INTEGER NOT NULL,
	allas_id INTEGER NOT NULL,
	allapot_id NUMBER(1) NOT NULL,
	datum TIMESTAMP NOT NULL,
	FOREIGN KEY(allaskereso_id) REFERENCES ALLASKERESO(id),
	FOREIGN KEY(allas_id) REFERENCES ALLAS(id),
	FOREIGN KEY(allapot_id) REFERENCES ALLAPOT(id),
	PRIMARY KEY(allas_id,allaskereso_id)	
);

CREATE TABLE ALLASERT(
	id INTEGER NOT NULL,
	allaskereso_id INTEGER NOT NULL,
	allas_id INTEGER NOT NULL,
	szoveg VARCHAR2(512) NOT NULL,
	ertek NUMBER(1) NOT NULL,
	datum TIMESTAMP NOT NULL,
	FOREIGN KEY(allaskereso_id) REFERENCES ALLASKERESO(id),
	FOREIGN KEY(allas_id) REFERENCES ALLAS(id),
	PRIMARY KEY(id)	
);

CREATE TABLE LOGOLAS(   
	NEV VARCHAR(40),   
	DATUM TIMESTAMP 
);



INSERT INTO STATUSZ(id,megnevezes) VALUES (1,'aktív');
INSERT INTO STATUSZ(id,megnevezes) VALUES (2,'szüneteltetve');
INSERT INTO STATUSZ(id,megnevezes) VALUES (3,'passzív');


INSERT INTO SZAKMA(id,megnevezes) VALUES (1,'Ács, állványozó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (2,'Alkalmazott grafikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (3,'Alkalmazott fotográfus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (4,'Általános asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (5,'Általános rendszergazda');
INSERT INTO SZAKMA(id,megnevezes) VALUES (6,'Általános vegyipari laboratóriumi technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (7,'Ápolási asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (8,'Ápoló');
INSERT INTO SZAKMA(id,megnevezes) VALUES (9,'Aranyműves');
INSERT INTO SZAKMA(id,megnevezes) VALUES (10,'Audiovizuális szakasszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (11,'Autóelektronikai műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (12,'Automatikai műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (13,'Autószerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (14,'Autótechnikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (15,'Banki szakügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (16,'Belsőépítési szerkezet- és burkolatszerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (17,'Biztonsági őr');
INSERT INTO SZAKMA(id,megnevezes) VALUES (18,'Borász');
INSERT INTO SZAKMA(id,megnevezes) VALUES (19,'Borpincér');
INSERT INTO SZAKMA(id,megnevezes) VALUES (20,'Bőrdíszműves');
INSERT INTO SZAKMA(id,megnevezes) VALUES (21,'Bőrműves');
INSERT INTO SZAKMA(id,megnevezes) VALUES (22,'Burkoló');
INSERT INTO SZAKMA(id,megnevezes) VALUES (23,'Bútorasztalos');
INSERT INTO SZAKMA(id,megnevezes) VALUES (24,'Bútoripari technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (25,'Bútorműves');
INSERT INTO SZAKMA(id,megnevezes) VALUES (26,'CAD-CAM informatikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (27,'Cukrász');
INSERT INTO SZAKMA(id,megnevezes) VALUES (28,'Csecsemő- és gyermekápoló');
INSERT INTO SZAKMA(id,megnevezes) VALUES (29,'Dekoratőr');
INSERT INTO SZAKMA(id,megnevezes) VALUES (30,'Diétás szakács');
INSERT INTO SZAKMA(id,megnevezes) VALUES (31,'Díszítő festő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (32,'Díszítő szobrász');
INSERT INTO SZAKMA(id,megnevezes) VALUES (33,'Díszlet- és jelmeztervező asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (34,'Dísznövénykertész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (35,'Divat- és stílustervező');
INSERT INTO SZAKMA(id,megnevezes) VALUES (36,'Dízelmotoros vasúti jármű szerelője');
INSERT INTO SZAKMA(id,megnevezes) VALUES (37,'Drog és toxikológiai laboratóriumi technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (38,'Édesipari termékgyártó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (39,'Ékszer becsüs');
INSERT INTO SZAKMA(id,megnevezes) VALUES (40,'Elektromechanikai műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (41,'Elektromos gép- és készülékszerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (42,'Elektronikai műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (43,'Elektronikai technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (44,'Élelmiszer- és vegyiáru-eladó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (45,'Élelmiszer-higiénikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (46,'Energiahasznosító berendezés szerelője');
INSERT INTO SZAKMA(id,megnevezes) VALUES (47,'Épület- és építménybádogos');
INSERT INTO SZAKMA(id,megnevezes) VALUES (48,'Épületasztalos');
INSERT INTO SZAKMA(id,megnevezes) VALUES (49,'Épületgépész technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (50,'Erősáramú eletrotechnikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (51,'Fémműves');
INSERT INTO SZAKMA(id,megnevezes) VALUES (52,'Értékpapírpiaci szakügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (53,'Fényképész- és fotótermék kereskedő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (54,'Férfiszabó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (55,'Festő, mázoló és tapétázó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (56,'Finommechanikai műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (57,'Fitness-wellness asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (58,'Fodrász');
INSERT INTO SZAKMA(id,megnevezes) VALUES (59,'Fogászati asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (60,'Fogtechnikus (rész: fülilleszték készítő)');
INSERT INTO SZAKMA(id,megnevezes) VALUES (61,'Forgalmi szolgálattevő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (62,'Fűszernövény-termesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (63,'Gazdasági informatikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (64,'Gázfogyasztásberendezés- és csőhálózat-szerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (65,'Gépgyártástechnológiai technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (66,'Gépi forgácsoló');
INSERT INTO SZAKMA(id,megnevezes) VALUES (67,'Géplakatos');
INSERT INTO SZAKMA(id,megnevezes) VALUES (68,'Gombatermesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (69,'Grafológus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (70,'Gyógymasszőr');
INSERT INTO SZAKMA(id,megnevezes) VALUES (71,'Gyógynövénytermesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (72,'Gyógypedagógiai asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (73,'Gyógyszertári asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (74,'Gyorséttermi- és ételeladó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (75,'Hajózási technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (76,'Hangtechnikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (77,'Hegesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (78,'Hídépítő és -fenntartó technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (79,'Hulladékgazdálkodó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (80,'Hűtő- és klímaberendezés-szerelő, karbantartó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (81,'Idegenforgalmi szakmenedzser');
INSERT INTO SZAKMA(id,megnevezes) VALUES (82,'Idegennyelvi titkár');
INSERT INTO SZAKMA(id,megnevezes) VALUES (83,'Idegenvezető');
INSERT INTO SZAKMA(id,megnevezes) VALUES (84,'Ifjúságsegítő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (85,'Informatikai hálózattelepítő és -üzemeltető');
INSERT INTO SZAKMA(id,megnevezes) VALUES (86,'Informatikai statisztikus és gazdasági tervező');
INSERT INTO SZAKMA(id,megnevezes) VALUES (87,'Internetes alkalmazásfejlesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (88,'Intézményi kommunikátor');
INSERT INTO SZAKMA(id,megnevezes) VALUES (89,'Irodai asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (90,'Iskolatitkár');
INSERT INTO SZAKMA(id,megnevezes) VALUES (91,'Jazzénekes');
INSERT INTO SZAKMA(id,megnevezes) VALUES (92,'Járműfényező');
INSERT INTO SZAKMA(id,megnevezes) VALUES (93,'Jogi asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (94,'Karosszérialakatos');
INSERT INTO SZAKMA(id,megnevezes) VALUES (95,'Kárpitos');
INSERT INTO SZAKMA(id,megnevezes) VALUES (96,'Képzési szakasszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (97,'Keramikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (98,'Kerékpárszerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (99,'Kereskedelmi ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (100,'Kereskedelmi, háztartási és vendéglátóipari gépszerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (101,'Kereskedelmi szakmenedzser');
INSERT INTO SZAKMA(id,megnevezes) VALUES (102,'Kereskedő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (103,'Kerti munkás');
INSERT INTO SZAKMA(id,megnevezes) VALUES (104,'Kéményseprő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (105,'Képgrafikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (106,'Kiadványszerkesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (107,'Kisgyermekgondozó, -nevelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (108,'Konyhai kisegítő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (109,'Kozmetikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (110,'Kőfaragó, műköves és épületszobrász');
INSERT INTO SZAKMA(id,megnevezes) VALUES (111,'Kőműves');
INSERT INTO SZAKMA(id,megnevezes) VALUES (112,'Könyvkötő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (113,'Környezetvédelmi méréstechnikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (114,'Kőszobrász');
INSERT INTO SZAKMA(id,megnevezes) VALUES (115,'Közlekedésautomatikai műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (116,'Közúti közlekedésüzemvitel-ellátó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (117,'Központifűtés- és csőhálózat-szerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (118,'Külkereskedelmi üzletkötő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (119,'Lakberendező');
INSERT INTO SZAKMA(id,megnevezes) VALUES (120,'Látszerész és fotocikk-kereskedő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (121,'Légiutas-kísérő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (122,'Logisztikai ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (123,'Magasépítő technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (124,'Magánénekes');
INSERT INTO SZAKMA(id,megnevezes) VALUES (125,'Marketing- és reklámügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (126,'Másoló- és irodagép műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (127,'Mechatronikai műszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (128,'Médiatechnológus asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (129,'Mélyépítő technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (130,'Mentőápoló');
INSERT INTO SZAKMA(id,megnevezes) VALUES (131,'Mixer');
INSERT INTO SZAKMA(id,megnevezes) VALUES (132,'Moderátor');
INSERT INTO SZAKMA(id,megnevezes) VALUES (133,'Multimédiafejlesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (134,'Műszaki Informatikai mérnökasszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (135,'Műszaki informatikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (136,'Műszakicikk eladó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (137,'Nemzetk. szállítmányozási és logisztikai szakügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (138,'Női szabó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (139,'Nyomdai gépmester');
INSERT INTO SZAKMA(id,megnevezes) VALUES (140,'Nyomdaipari technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (141,'Orvosi elektronikai technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (142,'Órás');
INSERT INTO SZAKMA(id,megnevezes) VALUES (143,'Óvodai dajka');
INSERT INTO SZAKMA(id,megnevezes) VALUES (144,'Parképítő és -fenntartó technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (145,'Parkgondozó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (146,'Pék');
INSERT INTO SZAKMA(id,megnevezes) VALUES (147,'Pék-cukrász');
INSERT INTO SZAKMA(id,megnevezes) VALUES (148,'Pénzügyi-számviteli ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (149,'Pincér');
INSERT INTO SZAKMA(id,megnevezes) VALUES (150,'Porcelánfestő és -tervező asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (151,'Postai ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (152,'Protokoll ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (153,'Pszichiátriai gondozó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (154,'Radiográfus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (155,'Rehabilitációs nevelő, segítő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (156,'Rehabilitációs tevékenység terapeuta');
INSERT INTO SZAKMA(id,megnevezes) VALUES (157,'Reklámszervező szakmenedzser');
INSERT INTO SZAKMA(id,megnevezes) VALUES (158,'Rendészeti asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (159,'Repülőgépműszerész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (160,'Repülőgép-szerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (161,'Ruházati eladó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (162,'Sportmasszőr');
INSERT INTO SZAKMA(id,megnevezes) VALUES (163,'Sajtótechnikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (164,'Sportkommunikátor');
INSERT INTO SZAKMA(id,megnevezes) VALUES (165,'Sportszervező menedzser');
INSERT INTO SZAKMA(id,megnevezes) VALUES (166,'Sütő- és cukrászipari technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (167,'Szakács');
INSERT INTO SZAKMA(id,megnevezes) VALUES (168,'Szállítmányozási ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (169,'Számítógép -szerelő, -karbantartó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (170,'Szenvedélybeteg gondozó');
INSERT INTO SZAKMA(id,megnevezes) VALUES (171,'Színházi táncos');
INSERT INTO SZAKMA(id,megnevezes) VALUES (172,'Színházi és filmszínész');
INSERT INTO SZAKMA(id,megnevezes) VALUES (173,'Személyes ügyfélszolgálati asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (174,'Szociális asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (175,'Szociális gondozó és ápoló');
INSERT INTO SZAKMA(id,megnevezes) VALUES (176,'Szociális gondozó, szervező');
INSERT INTO SZAKMA(id,megnevezes) VALUES (177,'Szociális, gyermek- és ifjúságvédelmi ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (178,'Szoftverfejlesztő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (179,'Távközlési és Informatikai hálózatszerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (180,'Távközlési informatikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (181,'Telefonos és elektr. ügyfélkapcsolati asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (182,'Települési környezetvédelmi technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (183,'Televízióműsor-gyártó szakasszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (184,'Tetőfedő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (185,'Textilrajzoló és modelltervező asszisztens');
INSERT INTO SZAKMA(id,megnevezes) VALUES (186,'Újságíró I.');
INSERT INTO SZAKMA(id,megnevezes) VALUES (187,'Utazásügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (188,'Útépítő és -fenntartó technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (189,'Üvegműves');
INSERT INTO SZAKMA(id,megnevezes) VALUES (190,'Vállalkozási ügyintéző');
INSERT INTO SZAKMA(id,megnevezes) VALUES (191,'Vasútépítő és -fenntartó technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (192,'Vasúti villamos jármű szerelője');
INSERT INTO SZAKMA(id,megnevezes) VALUES (193,'Vegyipari technikus');
INSERT INTO SZAKMA(id,megnevezes) VALUES (194,'Vendéglős');
INSERT INTO SZAKMA(id,megnevezes) VALUES (195,'Villanyszerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (196,'Virágkötő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (197,'Virágkötő, -berendező, virágkereskedő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (198,'Vízvezeték- és vízkészülék-szerelő');
INSERT INTO SZAKMA(id,megnevezes) VALUES (199,'Webmester');
INSERT INTO SZAKMA(id,megnevezes) VALUES (200,'Web-programozó');


INSERT INTO VAROS(id,nev) VALUES (1,'Aba');
INSERT INTO VAROS(id,nev) VALUES (2,'Abádszalók');
INSERT INTO VAROS(id,nev) VALUES (3,'Abaliget');
INSERT INTO VAROS(id,nev) VALUES (4,'Abasár');
INSERT INTO VAROS(id,nev) VALUES (5,'Abaújalpár');
INSERT INTO VAROS(id,nev) VALUES (6,'Abaújkér');
INSERT INTO VAROS(id,nev) VALUES (7,'Abaújlak');
INSERT INTO VAROS(id,nev) VALUES (8,'Abaújszántó');
INSERT INTO VAROS(id,nev) VALUES (9,'Abaújszolnok');
INSERT INTO VAROS(id,nev) VALUES (10,'Abaújvár');
INSERT INTO VAROS(id,nev) VALUES (11,'Abda');
INSERT INTO VAROS(id,nev) VALUES (12,'Abod');
INSERT INTO VAROS(id,nev) VALUES (13,'Abony');
INSERT INTO VAROS(id,nev) VALUES (14,'Ábrahámhegy');
INSERT INTO VAROS(id,nev) VALUES (15,'Ács');
INSERT INTO VAROS(id,nev) VALUES (16,'Acsa');
INSERT INTO VAROS(id,nev) VALUES (17,'Acsád');
INSERT INTO VAROS(id,nev) VALUES (18,'Acsalag');
INSERT INTO VAROS(id,nev) VALUES (19,'Ácsteszér');
INSERT INTO VAROS(id,nev) VALUES (20,'Adács');
INSERT INTO VAROS(id,nev) VALUES (21,'Ádánd');
INSERT INTO VAROS(id,nev) VALUES (22,'Adásztevel');
INSERT INTO VAROS(id,nev) VALUES (23,'Adony');
INSERT INTO VAROS(id,nev) VALUES (24,'Adorjánháza');
INSERT INTO VAROS(id,nev) VALUES (25,'Adorjás');
INSERT INTO VAROS(id,nev) VALUES (26,'Ág');
INSERT INTO VAROS(id,nev) VALUES (27,'Ágasegyháza');
INSERT INTO VAROS(id,nev) VALUES (28,'Ágfalva');
INSERT INTO VAROS(id,nev) VALUES (29,'Aggtelek');
INSERT INTO VAROS(id,nev) VALUES (30,'Agyagosszergény');
INSERT INTO VAROS(id,nev) VALUES (31,'Ajak');
INSERT INTO VAROS(id,nev) VALUES (32,'Ajka');
INSERT INTO VAROS(id,nev) VALUES (33,'Aka');
INSERT INTO VAROS(id,nev) VALUES (34,'Akasztó');
INSERT INTO VAROS(id,nev) VALUES (35,'Alacska');
INSERT INTO VAROS(id,nev) VALUES (36,'Alap');
INSERT INTO VAROS(id,nev) VALUES (37,'Alattyán');
INSERT INTO VAROS(id,nev) VALUES (38,'Albertirsa');
INSERT INTO VAROS(id,nev) VALUES (39,'Alcsútdoboz');
INSERT INTO VAROS(id,nev) VALUES (40,'Aldebrő');
INSERT INTO VAROS(id,nev) VALUES (41,'Algyő');
INSERT INTO VAROS(id,nev) VALUES (42,'Alibánfa');
INSERT INTO VAROS(id,nev) VALUES (43,'Almamellék');
INSERT INTO VAROS(id,nev) VALUES (44,'Almásfüzitő');
INSERT INTO VAROS(id,nev) VALUES (45,'Almásháza');
INSERT INTO VAROS(id,nev) VALUES (46,'Almáskamarás');
INSERT INTO VAROS(id,nev) VALUES (47,'Almáskeresztúr');
INSERT INTO VAROS(id,nev) VALUES (48,'Álmosd');
INSERT INTO VAROS(id,nev) VALUES (49,'Alsóberecki');
INSERT INTO VAROS(id,nev) VALUES (50,'Alsóbogát');
INSERT INTO VAROS(id,nev) VALUES (51,'Alsódobsza');
INSERT INTO VAROS(id,nev) VALUES (52,'Alsógagy');
INSERT INTO VAROS(id,nev) VALUES (53,'Alsómocsolád');
INSERT INTO VAROS(id,nev) VALUES (54,'Alsónána');
INSERT INTO VAROS(id,nev) VALUES (55,'Alsónémedi');
INSERT INTO VAROS(id,nev) VALUES (56,'Alsónemesapáti');
INSERT INTO VAROS(id,nev) VALUES (57,'Alsónyék');
INSERT INTO VAROS(id,nev) VALUES (58,'Alsóörs');
INSERT INTO VAROS(id,nev) VALUES (59,'Alsópáhok');
INSERT INTO VAROS(id,nev) VALUES (60,'Alsópetény');
INSERT INTO VAROS(id,nev) VALUES (61,'Alsórajk');
INSERT INTO VAROS(id,nev) VALUES (62,'Alsóregmec');
INSERT INTO VAROS(id,nev) VALUES (63,'Alsószenterzsébet');
INSERT INTO VAROS(id,nev) VALUES (64,'Alsószentiván');
INSERT INTO VAROS(id,nev) VALUES (65,'Alsószentmárton');
INSERT INTO VAROS(id,nev) VALUES (66,'Alsószölnök');
INSERT INTO VAROS(id,nev) VALUES (67,'Alsószuha');
INSERT INTO VAROS(id,nev) VALUES (68,'Alsótelekes');
INSERT INTO VAROS(id,nev) VALUES (69,'Alsótold');
INSERT INTO VAROS(id,nev) VALUES (70,'Alsóújlak');
INSERT INTO VAROS(id,nev) VALUES (71,'Alsóvadász');
INSERT INTO VAROS(id,nev) VALUES (72,'Alsózsolca');
INSERT INTO VAROS(id,nev) VALUES (73,'Ambrózfalva');
INSERT INTO VAROS(id,nev) VALUES (74,'Anarcs');
INSERT INTO VAROS(id,nev) VALUES (75,'Andocs');
INSERT INTO VAROS(id,nev) VALUES (76,'Andornaktálya');
INSERT INTO VAROS(id,nev) VALUES (77,'Andrásfa');
INSERT INTO VAROS(id,nev) VALUES (78,'Annavölgy');
INSERT INTO VAROS(id,nev) VALUES (79,'Apácatorna');
INSERT INTO VAROS(id,nev) VALUES (80,'Apagy');
INSERT INTO VAROS(id,nev) VALUES (81,'Apaj');
INSERT INTO VAROS(id,nev) VALUES (82,'Aparhant');
INSERT INTO VAROS(id,nev) VALUES (83,'Apátfalva');
INSERT INTO VAROS(id,nev) VALUES (84,'Apátistvánfalva');
INSERT INTO VAROS(id,nev) VALUES (85,'Apátvarasd');
INSERT INTO VAROS(id,nev) VALUES (86,'Apc');
INSERT INTO VAROS(id,nev) VALUES (87,'Áporka');
INSERT INTO VAROS(id,nev) VALUES (88,'Apostag');
INSERT INTO VAROS(id,nev) VALUES (89,'Aranyosapáti');
INSERT INTO VAROS(id,nev) VALUES (90,'Aranyosgadány');
INSERT INTO VAROS(id,nev) VALUES (91,'Arka');
INSERT INTO VAROS(id,nev) VALUES (92,'Arló');
INSERT INTO VAROS(id,nev) VALUES (93,'Arnót');
INSERT INTO VAROS(id,nev) VALUES (94,'Ároktő');
INSERT INTO VAROS(id,nev) VALUES (95,'Árpádhalom');
INSERT INTO VAROS(id,nev) VALUES (96,'Árpás');
INSERT INTO VAROS(id,nev) VALUES (97,'Ártánd');
INSERT INTO VAROS(id,nev) VALUES (98,'Ásotthalom');
INSERT INTO VAROS(id,nev) VALUES (99,'Ásványráró');
INSERT INTO VAROS(id,nev) VALUES (100,'Aszaló');
INSERT INTO VAROS(id,nev) VALUES (101,'Ászár');
INSERT INTO VAROS(id,nev) VALUES (102,'Aszód');
INSERT INTO VAROS(id,nev) VALUES (103,'Aszófő');
INSERT INTO VAROS(id,nev) VALUES (104,'Áta');
INSERT INTO VAROS(id,nev) VALUES (105,'Átány');
INSERT INTO VAROS(id,nev) VALUES (106,'Atkár');
INSERT INTO VAROS(id,nev) VALUES (107,'Attala');
INSERT INTO VAROS(id,nev) VALUES (108,'Babarc');
INSERT INTO VAROS(id,nev) VALUES (109,'Babarcszőlős');
INSERT INTO VAROS(id,nev) VALUES (110,'Babócsa');
INSERT INTO VAROS(id,nev) VALUES (111,'Bábolna');
INSERT INTO VAROS(id,nev) VALUES (112,'Bábonymegyer');
INSERT INTO VAROS(id,nev) VALUES (113,'Babosdöbréte');
INSERT INTO VAROS(id,nev) VALUES (114,'Babót');
INSERT INTO VAROS(id,nev) VALUES (115,'Bácsalmás');
INSERT INTO VAROS(id,nev) VALUES (116,'Bácsbokod');
INSERT INTO VAROS(id,nev) VALUES (117,'Bácsborsód');
INSERT INTO VAROS(id,nev) VALUES (118,'Bácsszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (119,'Bácsszőlős');
INSERT INTO VAROS(id,nev) VALUES (120,'Badacsonytomaj');
INSERT INTO VAROS(id,nev) VALUES (121,'Badacsonytördemic');
INSERT INTO VAROS(id,nev) VALUES (122,'Bag');
INSERT INTO VAROS(id,nev) VALUES (123,'Bagamér');
INSERT INTO VAROS(id,nev) VALUES (124,'Baglad');
INSERT INTO VAROS(id,nev) VALUES (125,'Bagod');
INSERT INTO VAROS(id,nev) VALUES (126,'Bágyogszovát');
INSERT INTO VAROS(id,nev) VALUES (127,'Baj');
INSERT INTO VAROS(id,nev) VALUES (128,'Baja');
INSERT INTO VAROS(id,nev) VALUES (129,'Bajánsenye');
INSERT INTO VAROS(id,nev) VALUES (130,'Bajna');
INSERT INTO VAROS(id,nev) VALUES (131,'Bajót');
INSERT INTO VAROS(id,nev) VALUES (132,'Bak');
INSERT INTO VAROS(id,nev) VALUES (133,'Bakháza');
INSERT INTO VAROS(id,nev) VALUES (134,'Bakóca');
INSERT INTO VAROS(id,nev) VALUES (135,'Bakonszeg');
INSERT INTO VAROS(id,nev) VALUES (136,'Bakonya');
INSERT INTO VAROS(id,nev) VALUES (137,'Bakonybánk');
INSERT INTO VAROS(id,nev) VALUES (138,'Bakonybél');
INSERT INTO VAROS(id,nev) VALUES (139,'Bakonycsernye');
INSERT INTO VAROS(id,nev) VALUES (140,'Bakonygyirót');
INSERT INTO VAROS(id,nev) VALUES (141,'Bakonyjákó');
INSERT INTO VAROS(id,nev) VALUES (142,'Bakonykoppány');
INSERT INTO VAROS(id,nev) VALUES (143,'Bakonykúti');
INSERT INTO VAROS(id,nev) VALUES (144,'Bakonynána');
INSERT INTO VAROS(id,nev) VALUES (145,'Bakonyoszlop');
INSERT INTO VAROS(id,nev) VALUES (146,'Bakonypéterd');
INSERT INTO VAROS(id,nev) VALUES (147,'Bakonypölöske');
INSERT INTO VAROS(id,nev) VALUES (148,'Bakonyság');
INSERT INTO VAROS(id,nev) VALUES (149,'Bakonysárkány');
INSERT INTO VAROS(id,nev) VALUES (150,'Bakonyszentiván');
INSERT INTO VAROS(id,nev) VALUES (151,'Bakonyszentkirály');
INSERT INTO VAROS(id,nev) VALUES (152,'Bakonyszentlászló');
INSERT INTO VAROS(id,nev) VALUES (153,'Bakonyszombathely');
INSERT INTO VAROS(id,nev) VALUES (154,'Bakonyszücs');
INSERT INTO VAROS(id,nev) VALUES (155,'Bakonytamási');
INSERT INTO VAROS(id,nev) VALUES (156,'Baks');
INSERT INTO VAROS(id,nev) VALUES (157,'Baksa');
INSERT INTO VAROS(id,nev) VALUES (158,'Baktakék');
INSERT INTO VAROS(id,nev) VALUES (159,'Baktalórántháza');
INSERT INTO VAROS(id,nev) VALUES (160,'Baktüttös');
INSERT INTO VAROS(id,nev) VALUES (161,'Balajt');
INSERT INTO VAROS(id,nev) VALUES (162,'Balassagyarmat');
INSERT INTO VAROS(id,nev) VALUES (163,'Balástya');
INSERT INTO VAROS(id,nev) VALUES (164,'Balaton');
INSERT INTO VAROS(id,nev) VALUES (165,'Balatonakali');
INSERT INTO VAROS(id,nev) VALUES (166,'Balatonalmádi');
INSERT INTO VAROS(id,nev) VALUES (167,'Balatonberény');
INSERT INTO VAROS(id,nev) VALUES (168,'Balatonboglár');
INSERT INTO VAROS(id,nev) VALUES (169,'Balatoncsicsó');
INSERT INTO VAROS(id,nev) VALUES (170,'Balatonederics');
INSERT INTO VAROS(id,nev) VALUES (171,'Balatonendréd');
INSERT INTO VAROS(id,nev) VALUES (172,'Balatonfenyves');
INSERT INTO VAROS(id,nev) VALUES (173,'Balatonfőkajár');
INSERT INTO VAROS(id,nev) VALUES (174,'Balatonföldvár');
INSERT INTO VAROS(id,nev) VALUES (175,'Balatonfüred');
INSERT INTO VAROS(id,nev) VALUES (176,'Balatonfűzfő');
INSERT INTO VAROS(id,nev) VALUES (177,'Balatongyörök');
INSERT INTO VAROS(id,nev) VALUES (178,'Balatonhenye');
INSERT INTO VAROS(id,nev) VALUES (179,'Balatonkenese');
INSERT INTO VAROS(id,nev) VALUES (180,'Balatonkeresztúr');
INSERT INTO VAROS(id,nev) VALUES (181,'Balatonlelle');
INSERT INTO VAROS(id,nev) VALUES (182,'Balatonmagyaród');
INSERT INTO VAROS(id,nev) VALUES (183,'Balatonmáriafürdő');
INSERT INTO VAROS(id,nev) VALUES (184,'Balatonőszöd');
INSERT INTO VAROS(id,nev) VALUES (185,'Balatonrendes');
INSERT INTO VAROS(id,nev) VALUES (186,'Balatonszabadi');
INSERT INTO VAROS(id,nev) VALUES (187,'Balatonszárszó');
INSERT INTO VAROS(id,nev) VALUES (188,'Balatonszemes');
INSERT INTO VAROS(id,nev) VALUES (189,'Balatonszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (190,'Balatonszepezd');
INSERT INTO VAROS(id,nev) VALUES (191,'Balatonszőlős');
INSERT INTO VAROS(id,nev) VALUES (192,'Balatonudvari');
INSERT INTO VAROS(id,nev) VALUES (193,'Balatonújlak');
INSERT INTO VAROS(id,nev) VALUES (194,'Balatonvilágos');
INSERT INTO VAROS(id,nev) VALUES (195,'Balinka');
INSERT INTO VAROS(id,nev) VALUES (196,'Balkány');
INSERT INTO VAROS(id,nev) VALUES (197,'Ballószög');
INSERT INTO VAROS(id,nev) VALUES (198,'Balmazújváros');
INSERT INTO VAROS(id,nev) VALUES (199,'Balogunyom');
INSERT INTO VAROS(id,nev) VALUES (200,'Balotaszállás');
INSERT INTO VAROS(id,nev) VALUES (201,'Balsa');
INSERT INTO VAROS(id,nev) VALUES (202,'Bálványos');
INSERT INTO VAROS(id,nev) VALUES (203,'Bana');
INSERT INTO VAROS(id,nev) VALUES (204,'Bánd');
INSERT INTO VAROS(id,nev) VALUES (205,'Bánfa');
INSERT INTO VAROS(id,nev) VALUES (206,'Bánhorváti');
INSERT INTO VAROS(id,nev) VALUES (207,'Bánk');
INSERT INTO VAROS(id,nev) VALUES (208,'Bánokszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (209,'Bánréve');
INSERT INTO VAROS(id,nev) VALUES (210,'Bár');
INSERT INTO VAROS(id,nev) VALUES (211,'Barabás');
INSERT INTO VAROS(id,nev) VALUES (212,'Baracs');
INSERT INTO VAROS(id,nev) VALUES (213,'Baracska');
INSERT INTO VAROS(id,nev) VALUES (214,'Báránd');
INSERT INTO VAROS(id,nev) VALUES (215,'Baranyahídvég');
INSERT INTO VAROS(id,nev) VALUES (216,'Baranyajenő');
INSERT INTO VAROS(id,nev) VALUES (217,'Baranyaszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (218,'Barbacs');
INSERT INTO VAROS(id,nev) VALUES (219,'Barcs');
INSERT INTO VAROS(id,nev) VALUES (220,'Bárdudvarnok');
INSERT INTO VAROS(id,nev) VALUES (221,'Barlahida');
INSERT INTO VAROS(id,nev) VALUES (222,'Bárna');
INSERT INTO VAROS(id,nev) VALUES (223,'Barnag');
INSERT INTO VAROS(id,nev) VALUES (224,'Bársonyos');
INSERT INTO VAROS(id,nev) VALUES (225,'Basal');
INSERT INTO VAROS(id,nev) VALUES (226,'Baskó');
INSERT INTO VAROS(id,nev) VALUES (227,'Báta');
INSERT INTO VAROS(id,nev) VALUES (228,'Bátaapáti');
INSERT INTO VAROS(id,nev) VALUES (229,'Bátaszék');
INSERT INTO VAROS(id,nev) VALUES (230,'Baté');
INSERT INTO VAROS(id,nev) VALUES (231,'Bátmonostor');
INSERT INTO VAROS(id,nev) VALUES (232,'Bátonyterenye');
INSERT INTO VAROS(id,nev) VALUES (233,'Bátor');
INSERT INTO VAROS(id,nev) VALUES (234,'Bátorliget');
INSERT INTO VAROS(id,nev) VALUES (235,'Battonya');
INSERT INTO VAROS(id,nev) VALUES (236,'Bátya');
INSERT INTO VAROS(id,nev) VALUES (237,'Batyk');
INSERT INTO VAROS(id,nev) VALUES (238,'Bázakerettye');
INSERT INTO VAROS(id,nev) VALUES (239,'Bazsi');
INSERT INTO VAROS(id,nev) VALUES (240,'Béb');
INSERT INTO VAROS(id,nev) VALUES (241,'Becsehely');
INSERT INTO VAROS(id,nev) VALUES (242,'Becske');
INSERT INTO VAROS(id,nev) VALUES (243,'Becskeháza');
INSERT INTO VAROS(id,nev) VALUES (244,'Becsvölgye');
INSERT INTO VAROS(id,nev) VALUES (245,'Bedegkér');
INSERT INTO VAROS(id,nev) VALUES (246,'Bedő');
INSERT INTO VAROS(id,nev) VALUES (247,'Bejcgyertyános');
INSERT INTO VAROS(id,nev) VALUES (248,'Békás');
INSERT INTO VAROS(id,nev) VALUES (249,'Bekecs');
INSERT INTO VAROS(id,nev) VALUES (250,'Békés');
INSERT INTO VAROS(id,nev) VALUES (251,'Békéscsaba');
INSERT INTO VAROS(id,nev) VALUES (252,'Békéssámson');
INSERT INTO VAROS(id,nev) VALUES (253,'Békésszentandrás');
INSERT INTO VAROS(id,nev) VALUES (254,'Bekölce');
INSERT INTO VAROS(id,nev) VALUES (255,'Bélapátfalva');
INSERT INTO VAROS(id,nev) VALUES (256,'Bélavár');
INSERT INTO VAROS(id,nev) VALUES (257,'Belecska');
INSERT INTO VAROS(id,nev) VALUES (258,'Beled');
INSERT INTO VAROS(id,nev) VALUES (259,'Beleg');
INSERT INTO VAROS(id,nev) VALUES (260,'Belezna');
INSERT INTO VAROS(id,nev) VALUES (261,'Bélmegyer');
INSERT INTO VAROS(id,nev) VALUES (262,'Beloiannisz');
INSERT INTO VAROS(id,nev) VALUES (263,'Belsősárd');
INSERT INTO VAROS(id,nev) VALUES (264,'Belvárdgyula');
INSERT INTO VAROS(id,nev) VALUES (265,'Benk');
INSERT INTO VAROS(id,nev) VALUES (266,'Bénye');
INSERT INTO VAROS(id,nev) VALUES (267,'Bér');
INSERT INTO VAROS(id,nev) VALUES (268,'Bérbaltavár');
INSERT INTO VAROS(id,nev) VALUES (269,'Bercel');
INSERT INTO VAROS(id,nev) VALUES (270,'Beregdaróc');
INSERT INTO VAROS(id,nev) VALUES (271,'Beregsurány');
INSERT INTO VAROS(id,nev) VALUES (272,'Berekböszörmény');
INSERT INTO VAROS(id,nev) VALUES (273,'Berekfürdő');
INSERT INTO VAROS(id,nev) VALUES (274,'Beremend');
INSERT INTO VAROS(id,nev) VALUES (275,'Berente');
INSERT INTO VAROS(id,nev) VALUES (276,'Beret');
INSERT INTO VAROS(id,nev) VALUES (277,'Berettyóújfalu');
INSERT INTO VAROS(id,nev) VALUES (278,'Berhida');
INSERT INTO VAROS(id,nev) VALUES (279,'Berkenye');
INSERT INTO VAROS(id,nev) VALUES (280,'Berkesd');
INSERT INTO VAROS(id,nev) VALUES (281,'Berkesz');
INSERT INTO VAROS(id,nev) VALUES (282,'Bernecebaráti');
INSERT INTO VAROS(id,nev) VALUES (283,'Berzék');
INSERT INTO VAROS(id,nev) VALUES (284,'Berzence');
INSERT INTO VAROS(id,nev) VALUES (285,'Besence');
INSERT INTO VAROS(id,nev) VALUES (286,'Besenyőd');
INSERT INTO VAROS(id,nev) VALUES (287,'Besenyőtelek');
INSERT INTO VAROS(id,nev) VALUES (288,'Besenyszög');
INSERT INTO VAROS(id,nev) VALUES (289,'Besnyő');
INSERT INTO VAROS(id,nev) VALUES (290,'Beszterec');
INSERT INTO VAROS(id,nev) VALUES (291,'Bezedek');
INSERT INTO VAROS(id,nev) VALUES (292,'Bezenye');
INSERT INTO VAROS(id,nev) VALUES (293,'Bezeréd');
INSERT INTO VAROS(id,nev) VALUES (294,'Bezi');
INSERT INTO VAROS(id,nev) VALUES (295,'Biatorbágy');
INSERT INTO VAROS(id,nev) VALUES (296,'Bicsérd');
INSERT INTO VAROS(id,nev) VALUES (297,'Bicske');
INSERT INTO VAROS(id,nev) VALUES (298,'Bihardancsháza');
INSERT INTO VAROS(id,nev) VALUES (299,'Biharkeresztes');
INSERT INTO VAROS(id,nev) VALUES (300,'Biharnagybajom');
INSERT INTO VAROS(id,nev) VALUES (301,'Bihartorda');
INSERT INTO VAROS(id,nev) VALUES (302,'Biharugra');
INSERT INTO VAROS(id,nev) VALUES (303,'Bikács');
INSERT INTO VAROS(id,nev) VALUES (304,'Bikal');
INSERT INTO VAROS(id,nev) VALUES (305,'Biri');
INSERT INTO VAROS(id,nev) VALUES (306,'Birján');
INSERT INTO VAROS(id,nev) VALUES (307,'Bisse');
INSERT INTO VAROS(id,nev) VALUES (308,'Boba');
INSERT INTO VAROS(id,nev) VALUES (309,'Bocfölde');
INSERT INTO VAROS(id,nev) VALUES (310,'Boconád');
INSERT INTO VAROS(id,nev) VALUES (311,'Bócsa');
INSERT INTO VAROS(id,nev) VALUES (312,'Bocska');
INSERT INTO VAROS(id,nev) VALUES (313,'Bocskaikert');
INSERT INTO VAROS(id,nev) VALUES (314,'Boda');
INSERT INTO VAROS(id,nev) VALUES (315,'Bodajk');
INSERT INTO VAROS(id,nev) VALUES (316,'Bodmér');
INSERT INTO VAROS(id,nev) VALUES (317,'Bodolyabér');
INSERT INTO VAROS(id,nev) VALUES (318,'Bodonhely');
INSERT INTO VAROS(id,nev) VALUES (319,'Bodony');
INSERT INTO VAROS(id,nev) VALUES (320,'Bodorfa');
INSERT INTO VAROS(id,nev) VALUES (321,'Bodrog');
INSERT INTO VAROS(id,nev) VALUES (322,'Bodroghalom');
INSERT INTO VAROS(id,nev) VALUES (323,'Bodrogkeresztúr');
INSERT INTO VAROS(id,nev) VALUES (324,'Bodrogkisfalud');
INSERT INTO VAROS(id,nev) VALUES (325,'Bodrogolaszi');
INSERT INTO VAROS(id,nev) VALUES (326,'Bódvalenke');
INSERT INTO VAROS(id,nev) VALUES (327,'Bódvarákó');
INSERT INTO VAROS(id,nev) VALUES (328,'Bódvaszilas');
INSERT INTO VAROS(id,nev) VALUES (329,'Bogács');
INSERT INTO VAROS(id,nev) VALUES (330,'Bogád');
INSERT INTO VAROS(id,nev) VALUES (331,'Bogádmindszent');
INSERT INTO VAROS(id,nev) VALUES (332,'Bogdása');
INSERT INTO VAROS(id,nev) VALUES (333,'Bogyiszló');
INSERT INTO VAROS(id,nev) VALUES (334,'Bogyoszló');
INSERT INTO VAROS(id,nev) VALUES (335,'Bojt');
INSERT INTO VAROS(id,nev) VALUES (336,'Bókaháza');
INSERT INTO VAROS(id,nev) VALUES (337,'Bokod');
INSERT INTO VAROS(id,nev) VALUES (338,'Bokor');
INSERT INTO VAROS(id,nev) VALUES (339,'Boldog');
INSERT INTO VAROS(id,nev) VALUES (340,'Boldogasszonyfa');
INSERT INTO VAROS(id,nev) VALUES (341,'Boldogkőújfalu');
INSERT INTO VAROS(id,nev) VALUES (342,'Boldogkőváralja');
INSERT INTO VAROS(id,nev) VALUES (343,'Boldva');
INSERT INTO VAROS(id,nev) VALUES (344,'Bolhás');
INSERT INTO VAROS(id,nev) VALUES (345,'Bolhó');
INSERT INTO VAROS(id,nev) VALUES (346,'Bóly');
INSERT INTO VAROS(id,nev) VALUES (347,'Boncodfölde');
INSERT INTO VAROS(id,nev) VALUES (348,'Bonyhád');
INSERT INTO VAROS(id,nev) VALUES (349,'Bonyhádvarasd');
INSERT INTO VAROS(id,nev) VALUES (350,'Bonnya');
INSERT INTO VAROS(id,nev) VALUES (351,'Bordány');
INSERT INTO VAROS(id,nev) VALUES (352,'Borgáta');
INSERT INTO VAROS(id,nev) VALUES (353,'Borjád');
INSERT INTO VAROS(id,nev) VALUES (354,'Borota');
INSERT INTO VAROS(id,nev) VALUES (355,'Borsfa');
INSERT INTO VAROS(id,nev) VALUES (356,'Borsodbóta');
INSERT INTO VAROS(id,nev) VALUES (357,'Borsodgeszt');
INSERT INTO VAROS(id,nev) VALUES (358,'Borsodivánka');
INSERT INTO VAROS(id,nev) VALUES (359,'Borsodnádasd');
INSERT INTO VAROS(id,nev) VALUES (360,'Borsodszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (361,'Borsodszirák');
INSERT INTO VAROS(id,nev) VALUES (362,'Borsosberény');
INSERT INTO VAROS(id,nev) VALUES (363,'Borszörcsök');
INSERT INTO VAROS(id,nev) VALUES (364,'Borzavár');
INSERT INTO VAROS(id,nev) VALUES (365,'Bosta');
INSERT INTO VAROS(id,nev) VALUES (366,'Botpalád');
INSERT INTO VAROS(id,nev) VALUES (367,'Botykapeterd');
INSERT INTO VAROS(id,nev) VALUES (368,'Bozzai');
INSERT INTO VAROS(id,nev) VALUES (369,'Bozsok');
INSERT INTO VAROS(id,nev) VALUES (370,'Bózsva');
INSERT INTO VAROS(id,nev) VALUES (371,'Bő');
INSERT INTO VAROS(id,nev) VALUES (372,'Bőcs');
INSERT INTO VAROS(id,nev) VALUES (373,'Böde');
INSERT INTO VAROS(id,nev) VALUES (374,'Bödeháza');
INSERT INTO VAROS(id,nev) VALUES (375,'Bögöt');
INSERT INTO VAROS(id,nev) VALUES (376,'Bögöte');
INSERT INTO VAROS(id,nev) VALUES (377,'Böhönye');
INSERT INTO VAROS(id,nev) VALUES (378,'Bököny');
INSERT INTO VAROS(id,nev) VALUES (379,'Bölcske');
INSERT INTO VAROS(id,nev) VALUES (380,'Bőny');
INSERT INTO VAROS(id,nev) VALUES (381,'Börcs');
INSERT INTO VAROS(id,nev) VALUES (382,'Börzönce');
INSERT INTO VAROS(id,nev) VALUES (383,'Bősárkány');
INSERT INTO VAROS(id,nev) VALUES (384,'Bőszénfa');
INSERT INTO VAROS(id,nev) VALUES (385,'Bucsa');
INSERT INTO VAROS(id,nev) VALUES (386,'Bucsu');
INSERT INTO VAROS(id,nev) VALUES (387,'Búcsúszentlászló');
INSERT INTO VAROS(id,nev) VALUES (388,'Bucsuta');
INSERT INTO VAROS(id,nev) VALUES (389,'Budajenő');
INSERT INTO VAROS(id,nev) VALUES (390,'Budakalász');
INSERT INTO VAROS(id,nev) VALUES (391,'Budakeszi');
INSERT INTO VAROS(id,nev) VALUES (392,'Budaörs');
INSERT INTO VAROS(id,nev) VALUES (393,'Budapest');
INSERT INTO VAROS(id,nev) VALUES (394,'Bugac');
INSERT INTO VAROS(id,nev) VALUES (395,'Bugacpusztaháza');
INSERT INTO VAROS(id,nev) VALUES (396,'Bugyi');
INSERT INTO VAROS(id,nev) VALUES (397,'Buj');
INSERT INTO VAROS(id,nev) VALUES (398,'Buják');
INSERT INTO VAROS(id,nev) VALUES (399,'Buzsák');
INSERT INTO VAROS(id,nev) VALUES (400,'Bük');
INSERT INTO VAROS(id,nev) VALUES (401,'Bükkábrány');
INSERT INTO VAROS(id,nev) VALUES (402,'Bükkaranyos');
INSERT INTO VAROS(id,nev) VALUES (403,'Bükkmogyorósd');
INSERT INTO VAROS(id,nev) VALUES (404,'Bükkösd');
INSERT INTO VAROS(id,nev) VALUES (405,'Bükkszék');
INSERT INTO VAROS(id,nev) VALUES (406,'Bükkszenterzsébet');
INSERT INTO VAROS(id,nev) VALUES (407,'Bükkszentkereszt');
INSERT INTO VAROS(id,nev) VALUES (408,'Bükkszentmárton');
INSERT INTO VAROS(id,nev) VALUES (409,'Bükkzsérc');
INSERT INTO VAROS(id,nev) VALUES (410,'Bürüs');
INSERT INTO VAROS(id,nev) VALUES (411,'Büssü');
INSERT INTO VAROS(id,nev) VALUES (412,'Büttös');
INSERT INTO VAROS(id,nev) VALUES (413,'Cák');
INSERT INTO VAROS(id,nev) VALUES (414,'Cakóháza');
INSERT INTO VAROS(id,nev) VALUES (415,'Cece');
INSERT INTO VAROS(id,nev) VALUES (416,'Cégénydányád');
INSERT INTO VAROS(id,nev) VALUES (417,'Cegléd');
INSERT INTO VAROS(id,nev) VALUES (418,'Ceglédbercel');
INSERT INTO VAROS(id,nev) VALUES (419,'Celldömölk');
INSERT INTO VAROS(id,nev) VALUES (420,'Cered');
INSERT INTO VAROS(id,nev) VALUES (421,'Chernelházadamonya');
INSERT INTO VAROS(id,nev) VALUES (422,'Cibakháza');
INSERT INTO VAROS(id,nev) VALUES (423,'Cigánd');
INSERT INTO VAROS(id,nev) VALUES (424,'Cikó');
INSERT INTO VAROS(id,nev) VALUES (425,'Cirák');
INSERT INTO VAROS(id,nev) VALUES (426,'Cún');
INSERT INTO VAROS(id,nev) VALUES (427,'Csabacsűd');
INSERT INTO VAROS(id,nev) VALUES (428,'Csabaszabadi');
INSERT INTO VAROS(id,nev) VALUES (429,'Csabdi');
INSERT INTO VAROS(id,nev) VALUES (430,'Csabrendek');
INSERT INTO VAROS(id,nev) VALUES (431,'Csáfordjánosfa');
INSERT INTO VAROS(id,nev) VALUES (432,'Csaholc');
INSERT INTO VAROS(id,nev) VALUES (433,'Csajág');
INSERT INTO VAROS(id,nev) VALUES (434,'Csákány');
INSERT INTO VAROS(id,nev) VALUES (435,'Csákánydoroszló');
INSERT INTO VAROS(id,nev) VALUES (436,'Csákberény');
INSERT INTO VAROS(id,nev) VALUES (437,'Csákvár');
INSERT INTO VAROS(id,nev) VALUES (438,'Csanádalberti');
INSERT INTO VAROS(id,nev) VALUES (439,'Csanádapáca');
INSERT INTO VAROS(id,nev) VALUES (440,'Csanádpalota');
INSERT INTO VAROS(id,nev) VALUES (441,'Csánig');
INSERT INTO VAROS(id,nev) VALUES (442,'Csány');
INSERT INTO VAROS(id,nev) VALUES (443,'Csányoszró');
INSERT INTO VAROS(id,nev) VALUES (444,'Csanytelek');
INSERT INTO VAROS(id,nev) VALUES (445,'Csapi');
INSERT INTO VAROS(id,nev) VALUES (446,'Csapod');
INSERT INTO VAROS(id,nev) VALUES (447,'Csárdaszállás');
INSERT INTO VAROS(id,nev) VALUES (448,'Csarnóta');
INSERT INTO VAROS(id,nev) VALUES (449,'Csaroda');
INSERT INTO VAROS(id,nev) VALUES (450,'Császár');
INSERT INTO VAROS(id,nev) VALUES (451,'Császártöltés');
INSERT INTO VAROS(id,nev) VALUES (452,'Császló');
INSERT INTO VAROS(id,nev) VALUES (453,'Csátalja');
INSERT INTO VAROS(id,nev) VALUES (454,'Csatár');
INSERT INTO VAROS(id,nev) VALUES (455,'Csataszög');
INSERT INTO VAROS(id,nev) VALUES (456,'Csatka');
INSERT INTO VAROS(id,nev) VALUES (457,'Csávoly');
INSERT INTO VAROS(id,nev) VALUES (458,'Csebény');
INSERT INTO VAROS(id,nev) VALUES (459,'Csécse');
INSERT INTO VAROS(id,nev) VALUES (460,'Csegöld');
INSERT INTO VAROS(id,nev) VALUES (461,'Csehbánya');
INSERT INTO VAROS(id,nev) VALUES (462,'Csehi');
INSERT INTO VAROS(id,nev) VALUES (463,'Csehimindszent');
INSERT INTO VAROS(id,nev) VALUES (464,'Csém');
INSERT INTO VAROS(id,nev) VALUES (465,'Csemő');
INSERT INTO VAROS(id,nev) VALUES (466,'Csempeszkopács');
INSERT INTO VAROS(id,nev) VALUES (467,'Csengele');
INSERT INTO VAROS(id,nev) VALUES (468,'Csenger');
INSERT INTO VAROS(id,nev) VALUES (469,'Csengersima');
INSERT INTO VAROS(id,nev) VALUES (470,'Csengerújfalu');
INSERT INTO VAROS(id,nev) VALUES (471,'Csengőd');
INSERT INTO VAROS(id,nev) VALUES (472,'Csénye');
INSERT INTO VAROS(id,nev) VALUES (473,'Csenyéte');
INSERT INTO VAROS(id,nev) VALUES (474,'Csép');
INSERT INTO VAROS(id,nev) VALUES (475,'Csépa');
INSERT INTO VAROS(id,nev) VALUES (476,'Csepreg');
INSERT INTO VAROS(id,nev) VALUES (477,'Csér');
INSERT INTO VAROS(id,nev) VALUES (478,'Cserdi');
INSERT INTO VAROS(id,nev) VALUES (479,'Cserénfa');
INSERT INTO VAROS(id,nev) VALUES (480,'Cserépfalu');
INSERT INTO VAROS(id,nev) VALUES (481,'Cserépváralja');
INSERT INTO VAROS(id,nev) VALUES (482,'Cserháthaláp');
INSERT INTO VAROS(id,nev) VALUES (483,'Cserhátsurány');
INSERT INTO VAROS(id,nev) VALUES (484,'Cserhátszentiván');
INSERT INTO VAROS(id,nev) VALUES (485,'Cserkeszőlő');
INSERT INTO VAROS(id,nev) VALUES (486,'Cserkút');
INSERT INTO VAROS(id,nev) VALUES (487,'Csernely');
INSERT INTO VAROS(id,nev) VALUES (488,'Cserszegtomaj');
INSERT INTO VAROS(id,nev) VALUES (489,'Csertalakos');
INSERT INTO VAROS(id,nev) VALUES (490,'Csertő');
INSERT INTO VAROS(id,nev) VALUES (491,'Csesznek');
INSERT INTO VAROS(id,nev) VALUES (492,'Csesztreg');
INSERT INTO VAROS(id,nev) VALUES (493,'Csesztve');
INSERT INTO VAROS(id,nev) VALUES (494,'Csetény');
INSERT INTO VAROS(id,nev) VALUES (495,'Csévharaszt');
INSERT INTO VAROS(id,nev) VALUES (496,'Csibrák');
INSERT INTO VAROS(id,nev) VALUES (497,'Csikéria');
INSERT INTO VAROS(id,nev) VALUES (498,'Csikóstőttős');
INSERT INTO VAROS(id,nev) VALUES (499,'Csikvánd');
INSERT INTO VAROS(id,nev) VALUES (500,'Csincse');
INSERT INTO VAROS(id,nev) VALUES (501,'Csipkerek');
INSERT INTO VAROS(id,nev) VALUES (502,'Csitár');
INSERT INTO VAROS(id,nev) VALUES (503,'Csobád');
INSERT INTO VAROS(id,nev) VALUES (504,'Csobaj');
INSERT INTO VAROS(id,nev) VALUES (505,'Csobánka');
INSERT INTO VAROS(id,nev) VALUES (506,'Csókakő');
INSERT INTO VAROS(id,nev) VALUES (507,'Csokonyavisonta');
INSERT INTO VAROS(id,nev) VALUES (508,'Csokvaomány');
INSERT INTO VAROS(id,nev) VALUES (509,'Csolnok');
INSERT INTO VAROS(id,nev) VALUES (510,'Csólyospálos');
INSERT INTO VAROS(id,nev) VALUES (511,'Csoma');
INSERT INTO VAROS(id,nev) VALUES (512,'Csomád');
INSERT INTO VAROS(id,nev) VALUES (513,'Csombárd');
INSERT INTO VAROS(id,nev) VALUES (514,'Csongrád');
INSERT INTO VAROS(id,nev) VALUES (515,'Csonkahegyhát');
INSERT INTO VAROS(id,nev) VALUES (516,'Csonkamindszent');
INSERT INTO VAROS(id,nev) VALUES (517,'Csopak');
INSERT INTO VAROS(id,nev) VALUES (518,'Csór');
INSERT INTO VAROS(id,nev) VALUES (519,'Csorna');
INSERT INTO VAROS(id,nev) VALUES (520,'Csorvás');
INSERT INTO VAROS(id,nev) VALUES (521,'Csót');
INSERT INTO VAROS(id,nev) VALUES (522,'Csöde');
INSERT INTO VAROS(id,nev) VALUES (523,'Csögle');
INSERT INTO VAROS(id,nev) VALUES (524,'Csökmő');
INSERT INTO VAROS(id,nev) VALUES (525,'Csököly');
INSERT INTO VAROS(id,nev) VALUES (526,'Csömend');
INSERT INTO VAROS(id,nev) VALUES (527,'Csömödér');
INSERT INTO VAROS(id,nev) VALUES (528,'Csömör');
INSERT INTO VAROS(id,nev) VALUES (529,'Csönge');
INSERT INTO VAROS(id,nev) VALUES (530,'Csörnyeföld');
INSERT INTO VAROS(id,nev) VALUES (531,'Csörög');
INSERT INTO VAROS(id,nev) VALUES (532,'Csörötnek');
INSERT INTO VAROS(id,nev) VALUES (533,'Csősz');
INSERT INTO VAROS(id,nev) VALUES (534,'Csővár');
INSERT INTO VAROS(id,nev) VALUES (535,'Csurgó');
INSERT INTO VAROS(id,nev) VALUES (536,'Csurgónagymarton');
INSERT INTO VAROS(id,nev) VALUES (537,'Dabas');
INSERT INTO VAROS(id,nev) VALUES (538,'Dabronc');
INSERT INTO VAROS(id,nev) VALUES (539,'Dabrony');
INSERT INTO VAROS(id,nev) VALUES (540,'Dad');
INSERT INTO VAROS(id,nev) VALUES (541,'Dág');
INSERT INTO VAROS(id,nev) VALUES (542,'Dáka');
INSERT INTO VAROS(id,nev) VALUES (543,'Dalmand');
INSERT INTO VAROS(id,nev) VALUES (544,'Damak');
INSERT INTO VAROS(id,nev) VALUES (545,'Dámóc');
INSERT INTO VAROS(id,nev) VALUES (546,'Dánszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (547,'Dány');
INSERT INTO VAROS(id,nev) VALUES (548,'Daraboshegy');
INSERT INTO VAROS(id,nev) VALUES (549,'Darány');
INSERT INTO VAROS(id,nev) VALUES (550,'Darnó');
INSERT INTO VAROS(id,nev) VALUES (551,'Darnózseli');
INSERT INTO VAROS(id,nev) VALUES (552,'Daruszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (553,'Darvas');
INSERT INTO VAROS(id,nev) VALUES (554,'Dávod');
INSERT INTO VAROS(id,nev) VALUES (555,'Debercsény');
INSERT INTO VAROS(id,nev) VALUES (556,'Debrecen');
INSERT INTO VAROS(id,nev) VALUES (557,'Debréte');
INSERT INTO VAROS(id,nev) VALUES (558,'Decs');
INSERT INTO VAROS(id,nev) VALUES (559,'Dédestapolcsány');
INSERT INTO VAROS(id,nev) VALUES (560,'Dég');
INSERT INTO VAROS(id,nev) VALUES (561,'Dejtár');
INSERT INTO VAROS(id,nev) VALUES (562,'Délegyháza');
INSERT INTO VAROS(id,nev) VALUES (563,'Demecser');
INSERT INTO VAROS(id,nev) VALUES (564,'Demjén');
INSERT INTO VAROS(id,nev) VALUES (565,'Dencsháza');
INSERT INTO VAROS(id,nev) VALUES (566,'Dénesfa');
INSERT INTO VAROS(id,nev) VALUES (567,'Derecske');
INSERT INTO VAROS(id,nev) VALUES (568,'Derekegyház');
INSERT INTO VAROS(id,nev) VALUES (569,'Deszk');
INSERT INTO VAROS(id,nev) VALUES (570,'Detek');
INSERT INTO VAROS(id,nev) VALUES (571,'Detk');
INSERT INTO VAROS(id,nev) VALUES (572,'Dévaványa');
INSERT INTO VAROS(id,nev) VALUES (573,'Devecser');
INSERT INTO VAROS(id,nev) VALUES (574,'Dinnyeberki');
INSERT INTO VAROS(id,nev) VALUES (575,'Diósberény');
INSERT INTO VAROS(id,nev) VALUES (576,'Diósd');
INSERT INTO VAROS(id,nev) VALUES (577,'Diósjenő');
INSERT INTO VAROS(id,nev) VALUES (578,'Dióskál');
INSERT INTO VAROS(id,nev) VALUES (579,'Diósviszló');
INSERT INTO VAROS(id,nev) VALUES (580,'Doba');
INSERT INTO VAROS(id,nev) VALUES (581,'Doboz');
INSERT INTO VAROS(id,nev) VALUES (582,'Dobri');
INSERT INTO VAROS(id,nev) VALUES (583,'Dobronhegy');
INSERT INTO VAROS(id,nev) VALUES (584,'Dóc');
INSERT INTO VAROS(id,nev) VALUES (585,'Domaháza');
INSERT INTO VAROS(id,nev) VALUES (586,'Domaszék');
INSERT INTO VAROS(id,nev) VALUES (587,'Dombegyház');
INSERT INTO VAROS(id,nev) VALUES (588,'Dombiratos');
INSERT INTO VAROS(id,nev) VALUES (589,'Dombóvár');
INSERT INTO VAROS(id,nev) VALUES (590,'Dombrád');
INSERT INTO VAROS(id,nev) VALUES (591,'Domony');
INSERT INTO VAROS(id,nev) VALUES (592,'Domoszló');
INSERT INTO VAROS(id,nev) VALUES (593,'Dormánd');
INSERT INTO VAROS(id,nev) VALUES (594,'Dorog');
INSERT INTO VAROS(id,nev) VALUES (595,'Dorogháza');
INSERT INTO VAROS(id,nev) VALUES (596,'Dozmat');
INSERT INTO VAROS(id,nev) VALUES (597,'Döbörhegy');
INSERT INTO VAROS(id,nev) VALUES (598,'Döbröce');
INSERT INTO VAROS(id,nev) VALUES (599,'Döbrököz');
INSERT INTO VAROS(id,nev) VALUES (600,'Döbrönte');
INSERT INTO VAROS(id,nev) VALUES (601,'Döge');
INSERT INTO VAROS(id,nev) VALUES (602,'Dömös');
INSERT INTO VAROS(id,nev) VALUES (603,'Dömsöd');
INSERT INTO VAROS(id,nev) VALUES (604,'Dör');
INSERT INTO VAROS(id,nev) VALUES (605,'Dörgicse');
INSERT INTO VAROS(id,nev) VALUES (606,'Döröske');
INSERT INTO VAROS(id,nev) VALUES (607,'Dötk');
INSERT INTO VAROS(id,nev) VALUES (608,'Dövény');
INSERT INTO VAROS(id,nev) VALUES (609,'Drágszél');
INSERT INTO VAROS(id,nev) VALUES (610,'Drávacsehi');
INSERT INTO VAROS(id,nev) VALUES (611,'Drávacsepely');
INSERT INTO VAROS(id,nev) VALUES (612,'Drávafok');
INSERT INTO VAROS(id,nev) VALUES (613,'Drávagárdony');
INSERT INTO VAROS(id,nev) VALUES (614,'Drávaiványi');
INSERT INTO VAROS(id,nev) VALUES (615,'Drávakeresztúr');
INSERT INTO VAROS(id,nev) VALUES (616,'Drávapalkonya');
INSERT INTO VAROS(id,nev) VALUES (617,'Drávapiski');
INSERT INTO VAROS(id,nev) VALUES (618,'Drávaszabolcs');
INSERT INTO VAROS(id,nev) VALUES (619,'Drávaszerdahely');
INSERT INTO VAROS(id,nev) VALUES (620,'Drávasztára');
INSERT INTO VAROS(id,nev) VALUES (621,'Drávatamási');
INSERT INTO VAROS(id,nev) VALUES (622,'Drégelypalánk');
INSERT INTO VAROS(id,nev) VALUES (623,'Dubicsány');
INSERT INTO VAROS(id,nev) VALUES (624,'Dudar');
INSERT INTO VAROS(id,nev) VALUES (625,'Duka');
INSERT INTO VAROS(id,nev) VALUES (626,'Dunaalmás');
INSERT INTO VAROS(id,nev) VALUES (627,'Dunabogdány');
INSERT INTO VAROS(id,nev) VALUES (628,'Dunaegyháza');
INSERT INTO VAROS(id,nev) VALUES (629,'Dunafalva');
INSERT INTO VAROS(id,nev) VALUES (630,'Dunaföldvár');
INSERT INTO VAROS(id,nev) VALUES (631,'Dunaharaszti');
INSERT INTO VAROS(id,nev) VALUES (632,'Dunakeszi');
INSERT INTO VAROS(id,nev) VALUES (633,'Dunakiliti');
INSERT INTO VAROS(id,nev) VALUES (634,'Dunapataj');
INSERT INTO VAROS(id,nev) VALUES (635,'Dunaremete');
INSERT INTO VAROS(id,nev) VALUES (636,'Dunaszeg');
INSERT INTO VAROS(id,nev) VALUES (637,'Dunaszekcső');
INSERT INTO VAROS(id,nev) VALUES (638,'Dunaszentbenedek');
INSERT INTO VAROS(id,nev) VALUES (639,'Dunaszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (640,'Dunaszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (641,'Dunaszentpál');
INSERT INTO VAROS(id,nev) VALUES (642,'Dunasziget');
INSERT INTO VAROS(id,nev) VALUES (643,'Dunatetétlen');
INSERT INTO VAROS(id,nev) VALUES (644,'Dunaújváros');
INSERT INTO VAROS(id,nev) VALUES (645,'Dunavarsány');
INSERT INTO VAROS(id,nev) VALUES (646,'Dunavecse');
INSERT INTO VAROS(id,nev) VALUES (647,'Dusnok');
INSERT INTO VAROS(id,nev) VALUES (648,'Dúzs');
INSERT INTO VAROS(id,nev) VALUES (649,'Ebergőc');
INSERT INTO VAROS(id,nev) VALUES (650,'Ebes');
INSERT INTO VAROS(id,nev) VALUES (651,'Écs');
INSERT INTO VAROS(id,nev) VALUES (652,'Ecséd');
INSERT INTO VAROS(id,nev) VALUES (653,'Ecseg');
INSERT INTO VAROS(id,nev) VALUES (654,'Ecsegfalva');
INSERT INTO VAROS(id,nev) VALUES (655,'Ecseny');
INSERT INTO VAROS(id,nev) VALUES (656,'Ecser');
INSERT INTO VAROS(id,nev) VALUES (657,'Edde');
INSERT INTO VAROS(id,nev) VALUES (658,'Edelény');
INSERT INTO VAROS(id,nev) VALUES (659,'Edve');
INSERT INTO VAROS(id,nev) VALUES (660,'Eger');
INSERT INTO VAROS(id,nev) VALUES (661,'Egerág');
INSERT INTO VAROS(id,nev) VALUES (662,'Egeralja');
INSERT INTO VAROS(id,nev) VALUES (663,'Egeraracsa');
INSERT INTO VAROS(id,nev) VALUES (664,'Egerbakta');
INSERT INTO VAROS(id,nev) VALUES (665,'Egerbocs');
INSERT INTO VAROS(id,nev) VALUES (666,'Egercsehi');
INSERT INTO VAROS(id,nev) VALUES (667,'Egerfarmos');
INSERT INTO VAROS(id,nev) VALUES (668,'Egerlövő');
INSERT INTO VAROS(id,nev) VALUES (669,'Egerszalók');
INSERT INTO VAROS(id,nev) VALUES (670,'Egerszólát');
INSERT INTO VAROS(id,nev) VALUES (671,'Égerszög');
INSERT INTO VAROS(id,nev) VALUES (672,'Egervár');
INSERT INTO VAROS(id,nev) VALUES (673,'Egervölgy');
INSERT INTO VAROS(id,nev) VALUES (674,'Egyed');
INSERT INTO VAROS(id,nev) VALUES (675,'Egyek');
INSERT INTO VAROS(id,nev) VALUES (676,'Egyházasdengeleg');
INSERT INTO VAROS(id,nev) VALUES (677,'Egyházasfalu');
INSERT INTO VAROS(id,nev) VALUES (678,'Egyházasgerge');
INSERT INTO VAROS(id,nev) VALUES (679,'Egyházasharaszti');
INSERT INTO VAROS(id,nev) VALUES (680,'Egyházashetye');
INSERT INTO VAROS(id,nev) VALUES (681,'Egyházashollós');
INSERT INTO VAROS(id,nev) VALUES (682,'Egyházaskesző');
INSERT INTO VAROS(id,nev) VALUES (683,'Egyházaskozár');
INSERT INTO VAROS(id,nev) VALUES (684,'Egyházasrádóc');
INSERT INTO VAROS(id,nev) VALUES (685,'Elek');
INSERT INTO VAROS(id,nev) VALUES (686,'Ellend');
INSERT INTO VAROS(id,nev) VALUES (687,'Előszállás');
INSERT INTO VAROS(id,nev) VALUES (688,'Emőd');
INSERT INTO VAROS(id,nev) VALUES (689,'Encs');
INSERT INTO VAROS(id,nev) VALUES (690,'Encsencs');
INSERT INTO VAROS(id,nev) VALUES (691,'Endrefalva');
INSERT INTO VAROS(id,nev) VALUES (692,'Endrőc');
INSERT INTO VAROS(id,nev) VALUES (693,'Enese');
INSERT INTO VAROS(id,nev) VALUES (694,'Enying');
INSERT INTO VAROS(id,nev) VALUES (695,'Eperjes');
INSERT INTO VAROS(id,nev) VALUES (696,'Eperjeske');
INSERT INTO VAROS(id,nev) VALUES (697,'Eplény');
INSERT INTO VAROS(id,nev) VALUES (698,'Epöl');
INSERT INTO VAROS(id,nev) VALUES (699,'Ercsi');
INSERT INTO VAROS(id,nev) VALUES (700,'Érd');
INSERT INTO VAROS(id,nev) VALUES (701,'Erdőbénye');
INSERT INTO VAROS(id,nev) VALUES (702,'Erdőhorváti');
INSERT INTO VAROS(id,nev) VALUES (703,'Erdőkertes');
INSERT INTO VAROS(id,nev) VALUES (704,'Erdőkövesd');
INSERT INTO VAROS(id,nev) VALUES (705,'Erdőkürt');
INSERT INTO VAROS(id,nev) VALUES (706,'Erdősmárok');
INSERT INTO VAROS(id,nev) VALUES (707,'Erdősmecske');
INSERT INTO VAROS(id,nev) VALUES (708,'Erdőtarcsa');
INSERT INTO VAROS(id,nev) VALUES (709,'Erdőtelek');
INSERT INTO VAROS(id,nev) VALUES (710,'Erk');
INSERT INTO VAROS(id,nev) VALUES (711,'Érpatak');
INSERT INTO VAROS(id,nev) VALUES (712,'Érsekcsanád');
INSERT INTO VAROS(id,nev) VALUES (713,'Érsekhalma');
INSERT INTO VAROS(id,nev) VALUES (714,'Érsekvadkert');
INSERT INTO VAROS(id,nev) VALUES (715,'Értény');
INSERT INTO VAROS(id,nev) VALUES (716,'Erzsébet');
INSERT INTO VAROS(id,nev) VALUES (717,'Esztár');
INSERT INTO VAROS(id,nev) VALUES (718,'Eszteregnye');
INSERT INTO VAROS(id,nev) VALUES (719,'Esztergályhorváti');
INSERT INTO VAROS(id,nev) VALUES (720,'Esztergom');
INSERT INTO VAROS(id,nev) VALUES (721,'Ete');
INSERT INTO VAROS(id,nev) VALUES (722,'Etes');
INSERT INTO VAROS(id,nev) VALUES (723,'Etyek');
INSERT INTO VAROS(id,nev) VALUES (724,'Fábiánháza');
INSERT INTO VAROS(id,nev) VALUES (725,'Fábiánsebestyén');
INSERT INTO VAROS(id,nev) VALUES (726,'Fácánkert');
INSERT INTO VAROS(id,nev) VALUES (727,'Fadd');
INSERT INTO VAROS(id,nev) VALUES (728,'Fáj');
INSERT INTO VAROS(id,nev) VALUES (729,'Fajsz');
INSERT INTO VAROS(id,nev) VALUES (730,'Fancsal');
INSERT INTO VAROS(id,nev) VALUES (731,'Farád');
INSERT INTO VAROS(id,nev) VALUES (732,'Farkasgyepű');
INSERT INTO VAROS(id,nev) VALUES (733,'Farkaslyuk');
INSERT INTO VAROS(id,nev) VALUES (734,'Farmos');
INSERT INTO VAROS(id,nev) VALUES (735,'Fazekasboda');
INSERT INTO VAROS(id,nev) VALUES (736,'Fedémes');
INSERT INTO VAROS(id,nev) VALUES (737,'Fegyvernek');
INSERT INTO VAROS(id,nev) VALUES (738,'Fehérgyarmat');
INSERT INTO VAROS(id,nev) VALUES (739,'Fehértó');
INSERT INTO VAROS(id,nev) VALUES (740,'Fehérvárcsurgó');
INSERT INTO VAROS(id,nev) VALUES (741,'Feked');
INSERT INTO VAROS(id,nev) VALUES (742,'Feketeerdő');
INSERT INTO VAROS(id,nev) VALUES (743,'Felcsút');
INSERT INTO VAROS(id,nev) VALUES (744,'Feldebrő');
INSERT INTO VAROS(id,nev) VALUES (745,'Felgyő');
INSERT INTO VAROS(id,nev) VALUES (746,'Felpéc');
INSERT INTO VAROS(id,nev) VALUES (747,'Felsőberecki');
INSERT INTO VAROS(id,nev) VALUES (748,'Felsőcsatár');
INSERT INTO VAROS(id,nev) VALUES (749,'Felsődobsza');
INSERT INTO VAROS(id,nev) VALUES (750,'Felsőegerszeg');
INSERT INTO VAROS(id,nev) VALUES (751,'Felsőgagy');
INSERT INTO VAROS(id,nev) VALUES (752,'Felsőjánosfa');
INSERT INTO VAROS(id,nev) VALUES (753,'Felsőkelecsény');
INSERT INTO VAROS(id,nev) VALUES (754,'Felsőlajos');
INSERT INTO VAROS(id,nev) VALUES (755,'Felsőmarác');
INSERT INTO VAROS(id,nev) VALUES (756,'Felsőmocsolád');
INSERT INTO VAROS(id,nev) VALUES (757,'Felsőnána');
INSERT INTO VAROS(id,nev) VALUES (758,'Felsőnyárád');
INSERT INTO VAROS(id,nev) VALUES (759,'Felsőnyék');
INSERT INTO VAROS(id,nev) VALUES (760,'Felsőörs');
INSERT INTO VAROS(id,nev) VALUES (761,'Felsőpáhok');
INSERT INTO VAROS(id,nev) VALUES (762,'Felsőpakony');
INSERT INTO VAROS(id,nev) VALUES (763,'Felsőpetény');
INSERT INTO VAROS(id,nev) VALUES (764,'Felsőrajk');
INSERT INTO VAROS(id,nev) VALUES (765,'Felsőregmec');
INSERT INTO VAROS(id,nev) VALUES (766,'Felsőszenterzsébet');
INSERT INTO VAROS(id,nev) VALUES (767,'Felsőszentiván');
INSERT INTO VAROS(id,nev) VALUES (768,'Felsőszentmárton');
INSERT INTO VAROS(id,nev) VALUES (769,'Felsőszölnök');
INSERT INTO VAROS(id,nev) VALUES (770,'Felsőtárkány');
INSERT INTO VAROS(id,nev) VALUES (771,'Felsőtelekes');
INSERT INTO VAROS(id,nev) VALUES (772,'Felsőtold');
INSERT INTO VAROS(id,nev) VALUES (773,'Felsővadász');
INSERT INTO VAROS(id,nev) VALUES (774,'Felsőzsolca');
INSERT INTO VAROS(id,nev) VALUES (775,'Fényeslitke');
INSERT INTO VAROS(id,nev) VALUES (776,'Fenyőfő');
INSERT INTO VAROS(id,nev) VALUES (777,'Ferencszállás');
INSERT INTO VAROS(id,nev) VALUES (778,'Fertőboz');
INSERT INTO VAROS(id,nev) VALUES (779,'Fertőd');
INSERT INTO VAROS(id,nev) VALUES (780,'Fertőendréd');
INSERT INTO VAROS(id,nev) VALUES (781,'Fertőhomok');
INSERT INTO VAROS(id,nev) VALUES (782,'Fertőrákos');
INSERT INTO VAROS(id,nev) VALUES (783,'Fertőszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (784,'Fertőszéplak');
INSERT INTO VAROS(id,nev) VALUES (785,'Fiad');
INSERT INTO VAROS(id,nev) VALUES (786,'Filkeháza');
INSERT INTO VAROS(id,nev) VALUES (787,'Fityeház');
INSERT INTO VAROS(id,nev) VALUES (788,'Foktő');
INSERT INTO VAROS(id,nev) VALUES (789,'Folyás');
INSERT INTO VAROS(id,nev) VALUES (790,'Fonó');
INSERT INTO VAROS(id,nev) VALUES (791,'Fony');
INSERT INTO VAROS(id,nev) VALUES (792,'Fonyód');
INSERT INTO VAROS(id,nev) VALUES (793,'Forráskút');
INSERT INTO VAROS(id,nev) VALUES (794,'Forró');
INSERT INTO VAROS(id,nev) VALUES (795,'Fót');
INSERT INTO VAROS(id,nev) VALUES (796,'Földeák');
INSERT INTO VAROS(id,nev) VALUES (797,'Földes');
INSERT INTO VAROS(id,nev) VALUES (798,'Főnyed');
INSERT INTO VAROS(id,nev) VALUES (799,'Fulókércs');
INSERT INTO VAROS(id,nev) VALUES (800,'Furta');
INSERT INTO VAROS(id,nev) VALUES (801,'Füle');
INSERT INTO VAROS(id,nev) VALUES (802,'Fülesd');
INSERT INTO VAROS(id,nev) VALUES (803,'Fülöp');
INSERT INTO VAROS(id,nev) VALUES (804,'Fülöpháza');
INSERT INTO VAROS(id,nev) VALUES (805,'Fülöpjakab');
INSERT INTO VAROS(id,nev) VALUES (806,'Fülöpszállás');
INSERT INTO VAROS(id,nev) VALUES (807,'Fülpösdaróc');
INSERT INTO VAROS(id,nev) VALUES (808,'Fürged');
INSERT INTO VAROS(id,nev) VALUES (809,'Füzér');
INSERT INTO VAROS(id,nev) VALUES (810,'Füzérkajata');
INSERT INTO VAROS(id,nev) VALUES (811,'Füzérkomlós');
INSERT INTO VAROS(id,nev) VALUES (812,'Füzérradvány');
INSERT INTO VAROS(id,nev) VALUES (813,'Füzesabony');
INSERT INTO VAROS(id,nev) VALUES (814,'Füzesgyarmat');
INSERT INTO VAROS(id,nev) VALUES (815,'Fűzvölgy');
INSERT INTO VAROS(id,nev) VALUES (816,'Gáborján');
INSERT INTO VAROS(id,nev) VALUES (817,'Gáborjánháza');
INSERT INTO VAROS(id,nev) VALUES (818,'Gacsály');
INSERT INTO VAROS(id,nev) VALUES (819,'Gadács');
INSERT INTO VAROS(id,nev) VALUES (820,'Gadány');
INSERT INTO VAROS(id,nev) VALUES (821,'Gadna');
INSERT INTO VAROS(id,nev) VALUES (822,'Gádoros');
INSERT INTO VAROS(id,nev) VALUES (823,'Gagyapáti');
INSERT INTO VAROS(id,nev) VALUES (824,'Gagybátor');
INSERT INTO VAROS(id,nev) VALUES (825,'Gagyvendégi');
INSERT INTO VAROS(id,nev) VALUES (826,'Galambok');
INSERT INTO VAROS(id,nev) VALUES (827,'Galgaguta');
INSERT INTO VAROS(id,nev) VALUES (828,'Galgagyörk');
INSERT INTO VAROS(id,nev) VALUES (829,'Galgahévíz');
INSERT INTO VAROS(id,nev) VALUES (830,'Galgamácsa');
INSERT INTO VAROS(id,nev) VALUES (831,'Gálosfa');
INSERT INTO VAROS(id,nev) VALUES (832,'Galvács');
INSERT INTO VAROS(id,nev) VALUES (833,'Gamás');
INSERT INTO VAROS(id,nev) VALUES (834,'Ganna');
INSERT INTO VAROS(id,nev) VALUES (835,'Gánt');
INSERT INTO VAROS(id,nev) VALUES (836,'Gara');
INSERT INTO VAROS(id,nev) VALUES (837,'Garáb');
INSERT INTO VAROS(id,nev) VALUES (838,'Garabonc');
INSERT INTO VAROS(id,nev) VALUES (839,'Garadna');
INSERT INTO VAROS(id,nev) VALUES (840,'Garbolc');
INSERT INTO VAROS(id,nev) VALUES (841,'Gárdony');
INSERT INTO VAROS(id,nev) VALUES (842,'Garé');
INSERT INTO VAROS(id,nev) VALUES (843,'Gasztony');
INSERT INTO VAROS(id,nev) VALUES (844,'Gátér');
INSERT INTO VAROS(id,nev) VALUES (845,'Gávavencsellő');
INSERT INTO VAROS(id,nev) VALUES (846,'Géberjén');
INSERT INTO VAROS(id,nev) VALUES (847,'Gecse');
INSERT INTO VAROS(id,nev) VALUES (848,'Géderlak');
INSERT INTO VAROS(id,nev) VALUES (849,'Gégény');
INSERT INTO VAROS(id,nev) VALUES (850,'Gelej');
INSERT INTO VAROS(id,nev) VALUES (851,'Gelénes');
INSERT INTO VAROS(id,nev) VALUES (852,'Gellénháza');
INSERT INTO VAROS(id,nev) VALUES (853,'Gelse');
INSERT INTO VAROS(id,nev) VALUES (854,'Gelsesziget');
INSERT INTO VAROS(id,nev) VALUES (855,'Gemzse');
INSERT INTO VAROS(id,nev) VALUES (856,'Gencsapáti');
INSERT INTO VAROS(id,nev) VALUES (857,'Gérce');
INSERT INTO VAROS(id,nev) VALUES (858,'Gerde');
INSERT INTO VAROS(id,nev) VALUES (859,'Gerendás');
INSERT INTO VAROS(id,nev) VALUES (860,'Gerényes');
INSERT INTO VAROS(id,nev) VALUES (861,'Geresdlak');
INSERT INTO VAROS(id,nev) VALUES (862,'Gerjen');
INSERT INTO VAROS(id,nev) VALUES (863,'Gersekarát');
INSERT INTO VAROS(id,nev) VALUES (864,'Geszt');
INSERT INTO VAROS(id,nev) VALUES (865,'Gesztely');
INSERT INTO VAROS(id,nev) VALUES (866,'Geszteréd');
INSERT INTO VAROS(id,nev) VALUES (867,'Gétye');
INSERT INTO VAROS(id,nev) VALUES (868,'Gibárt');
INSERT INTO VAROS(id,nev) VALUES (869,'Gic');
INSERT INTO VAROS(id,nev) VALUES (870,'Gige');
INSERT INTO VAROS(id,nev) VALUES (871,'Gilvánfa');
INSERT INTO VAROS(id,nev) VALUES (872,'Girincs');
INSERT INTO VAROS(id,nev) VALUES (873,'Gógánfa');
INSERT INTO VAROS(id,nev) VALUES (874,'Golop');
INSERT INTO VAROS(id,nev) VALUES (875,'Gomba');
INSERT INTO VAROS(id,nev) VALUES (876,'Gombosszeg');
INSERT INTO VAROS(id,nev) VALUES (877,'Gór');
INSERT INTO VAROS(id,nev) VALUES (878,'Gordisa');
INSERT INTO VAROS(id,nev) VALUES (879,'Gosztola');
INSERT INTO VAROS(id,nev) VALUES (880,'Göd');
INSERT INTO VAROS(id,nev) VALUES (881,'Gödöllő');
INSERT INTO VAROS(id,nev) VALUES (882,'Gödre');
INSERT INTO VAROS(id,nev) VALUES (883,'Gölle');
INSERT INTO VAROS(id,nev) VALUES (884,'Gömörszőlős');
INSERT INTO VAROS(id,nev) VALUES (885,'Gönc');
INSERT INTO VAROS(id,nev) VALUES (886,'Göncruszka');
INSERT INTO VAROS(id,nev) VALUES (887,'Gönyű');
INSERT INTO VAROS(id,nev) VALUES (888,'Görbeháza');
INSERT INTO VAROS(id,nev) VALUES (889,'Görcsöny');
INSERT INTO VAROS(id,nev) VALUES (890,'Görcsönydoboka');
INSERT INTO VAROS(id,nev) VALUES (891,'Görgeteg');
INSERT INTO VAROS(id,nev) VALUES (892,'Gősfa');
INSERT INTO VAROS(id,nev) VALUES (893,'Grábóc');
INSERT INTO VAROS(id,nev) VALUES (894,'Gulács');
INSERT INTO VAROS(id,nev) VALUES (895,'Gutorfölde');
INSERT INTO VAROS(id,nev) VALUES (896,'Gyál');
INSERT INTO VAROS(id,nev) VALUES (897,'Gyalóka');
INSERT INTO VAROS(id,nev) VALUES (898,'Gyanógeregye');
INSERT INTO VAROS(id,nev) VALUES (899,'Gyarmat');
INSERT INTO VAROS(id,nev) VALUES (900,'Gyékényes');
INSERT INTO VAROS(id,nev) VALUES (901,'Gyenesdiás');
INSERT INTO VAROS(id,nev) VALUES (902,'Gyepükaján');
INSERT INTO VAROS(id,nev) VALUES (903,'Gyermely');
INSERT INTO VAROS(id,nev) VALUES (904,'Gyód');
INSERT INTO VAROS(id,nev) VALUES (905,'Gyomaendrőd');
INSERT INTO VAROS(id,nev) VALUES (906,'Gyóró');
INSERT INTO VAROS(id,nev) VALUES (907,'Gyömöre');
INSERT INTO VAROS(id,nev) VALUES (908,'Gyömrő');
INSERT INTO VAROS(id,nev) VALUES (909,'Gyöngyfa');
INSERT INTO VAROS(id,nev) VALUES (910,'Gyöngyös');
INSERT INTO VAROS(id,nev) VALUES (911,'Gyöngyösfalu');
INSERT INTO VAROS(id,nev) VALUES (912,'Gyöngyöshalász');
INSERT INTO VAROS(id,nev) VALUES (913,'Gyöngyösmellék');
INSERT INTO VAROS(id,nev) VALUES (914,'Gyöngyösoroszi');
INSERT INTO VAROS(id,nev) VALUES (915,'Gyöngyöspata');
INSERT INTO VAROS(id,nev) VALUES (916,'Gyöngyössolymos');
INSERT INTO VAROS(id,nev) VALUES (917,'Gyöngyöstarján');
INSERT INTO VAROS(id,nev) VALUES (918,'Gyönk');
INSERT INTO VAROS(id,nev) VALUES (919,'Győr');
INSERT INTO VAROS(id,nev) VALUES (920,'Győrasszonyfa');
INSERT INTO VAROS(id,nev) VALUES (921,'Györe');
INSERT INTO VAROS(id,nev) VALUES (922,'Györgytarló');
INSERT INTO VAROS(id,nev) VALUES (923,'Györköny');
INSERT INTO VAROS(id,nev) VALUES (924,'Győrladamér');
INSERT INTO VAROS(id,nev) VALUES (925,'Győröcske');
INSERT INTO VAROS(id,nev) VALUES (926,'Győrság');
INSERT INTO VAROS(id,nev) VALUES (927,'Győrsövényház');
INSERT INTO VAROS(id,nev) VALUES (928,'Győrszemere');
INSERT INTO VAROS(id,nev) VALUES (929,'Győrtelek');
INSERT INTO VAROS(id,nev) VALUES (930,'Győrújbarát');
INSERT INTO VAROS(id,nev) VALUES (931,'Győrújfalu');
INSERT INTO VAROS(id,nev) VALUES (932,'Győrvár');
INSERT INTO VAROS(id,nev) VALUES (933,'Győrzámoly');
INSERT INTO VAROS(id,nev) VALUES (934,'Gyugy');
INSERT INTO VAROS(id,nev) VALUES (935,'Gyula');
INSERT INTO VAROS(id,nev) VALUES (936,'Gyulaháza');
INSERT INTO VAROS(id,nev) VALUES (937,'Gyulaj');
INSERT INTO VAROS(id,nev) VALUES (938,'Gyulakeszi');
INSERT INTO VAROS(id,nev) VALUES (939,'Gyúró');
INSERT INTO VAROS(id,nev) VALUES (940,'Gyügye');
INSERT INTO VAROS(id,nev) VALUES (941,'Gyüre');
INSERT INTO VAROS(id,nev) VALUES (942,'Gyűrűs');
INSERT INTO VAROS(id,nev) VALUES (943,'Hács');
INSERT INTO VAROS(id,nev) VALUES (944,'Hagyárosbörönd');
INSERT INTO VAROS(id,nev) VALUES (945,'Hahót');
INSERT INTO VAROS(id,nev) VALUES (946,'Hajdúbagos');
INSERT INTO VAROS(id,nev) VALUES (947,'Hajdúböszörmény');
INSERT INTO VAROS(id,nev) VALUES (948,'Hajdúdorog');
INSERT INTO VAROS(id,nev) VALUES (949,'Hajdúhadház');
INSERT INTO VAROS(id,nev) VALUES (950,'Hajdúnánás');
INSERT INTO VAROS(id,nev) VALUES (951,'Hajdúsámson');
INSERT INTO VAROS(id,nev) VALUES (952,'Hajdúszoboszló');
INSERT INTO VAROS(id,nev) VALUES (953,'Hajdúszovát');
INSERT INTO VAROS(id,nev) VALUES (954,'Hajmás');
INSERT INTO VAROS(id,nev) VALUES (955,'Hajmáskér');
INSERT INTO VAROS(id,nev) VALUES (956,'Hajós');
INSERT INTO VAROS(id,nev) VALUES (957,'Halastó');
INSERT INTO VAROS(id,nev) VALUES (958,'Halászi');
INSERT INTO VAROS(id,nev) VALUES (959,'Halásztelek');
INSERT INTO VAROS(id,nev) VALUES (960,'Halimba');
INSERT INTO VAROS(id,nev) VALUES (961,'Halmaj');
INSERT INTO VAROS(id,nev) VALUES (962,'Halmajugra');
INSERT INTO VAROS(id,nev) VALUES (963,'Halogy');
INSERT INTO VAROS(id,nev) VALUES (964,'Hangács');
INSERT INTO VAROS(id,nev) VALUES (965,'Hangony');
INSERT INTO VAROS(id,nev) VALUES (966,'Hantos');
INSERT INTO VAROS(id,nev) VALUES (967,'Harasztifalu');
INSERT INTO VAROS(id,nev) VALUES (968,'Harc');
INSERT INTO VAROS(id,nev) VALUES (969,'Harka');
INSERT INTO VAROS(id,nev) VALUES (970,'Harkakötöny');
INSERT INTO VAROS(id,nev) VALUES (971,'Harkány');
INSERT INTO VAROS(id,nev) VALUES (972,'Háromfa');
INSERT INTO VAROS(id,nev) VALUES (973,'Háromhuta');
INSERT INTO VAROS(id,nev) VALUES (974,'Harsány');
INSERT INTO VAROS(id,nev) VALUES (975,'Hárskút');
INSERT INTO VAROS(id,nev) VALUES (976,'Harta');
INSERT INTO VAROS(id,nev) VALUES (977,'Hásságy');
INSERT INTO VAROS(id,nev) VALUES (978,'Hatvan');
INSERT INTO VAROS(id,nev) VALUES (979,'Hédervár');
INSERT INTO VAROS(id,nev) VALUES (980,'Hedrehely');
INSERT INTO VAROS(id,nev) VALUES (981,'Hegyesd');
INSERT INTO VAROS(id,nev) VALUES (982,'Hegyeshalom');
INSERT INTO VAROS(id,nev) VALUES (983,'Hegyfalu');
INSERT INTO VAROS(id,nev) VALUES (984,'Hegyháthodász');
INSERT INTO VAROS(id,nev) VALUES (985,'Hegyhátmaróc');
INSERT INTO VAROS(id,nev) VALUES (986,'Hegyhátsál');
INSERT INTO VAROS(id,nev) VALUES (987,'Hegyhátszentjakab');
INSERT INTO VAROS(id,nev) VALUES (988,'Hegyhátszentmárton');
INSERT INTO VAROS(id,nev) VALUES (989,'Hegyhátszentpéter');
INSERT INTO VAROS(id,nev) VALUES (990,'Hegykő');
INSERT INTO VAROS(id,nev) VALUES (991,'Hegymagas');
INSERT INTO VAROS(id,nev) VALUES (992,'Hegymeg');
INSERT INTO VAROS(id,nev) VALUES (993,'Hegyszentmárton');
INSERT INTO VAROS(id,nev) VALUES (994,'Héhalom');
INSERT INTO VAROS(id,nev) VALUES (995,'Hejce');
INSERT INTO VAROS(id,nev) VALUES (996,'Hejőbába');
INSERT INTO VAROS(id,nev) VALUES (997,'Hejőkeresztúr');
INSERT INTO VAROS(id,nev) VALUES (998,'Hejőkürt');
INSERT INTO VAROS(id,nev) VALUES (999,'Hejőpapi');
INSERT INTO VAROS(id,nev) VALUES (1000,'Hejőszalonta');
INSERT INTO VAROS(id,nev) VALUES (1001,'Helesfa');
INSERT INTO VAROS(id,nev) VALUES (1002,'Helvécia');
INSERT INTO VAROS(id,nev) VALUES (1003,'Hencida');
INSERT INTO VAROS(id,nev) VALUES (1004,'Hencse');
INSERT INTO VAROS(id,nev) VALUES (1005,'Herceghalom');
INSERT INTO VAROS(id,nev) VALUES (1006,'Hercegkút');
INSERT INTO VAROS(id,nev) VALUES (1007,'Hercegszántó');
INSERT INTO VAROS(id,nev) VALUES (1008,'Heréd');
INSERT INTO VAROS(id,nev) VALUES (1009,'Héreg');
INSERT INTO VAROS(id,nev) VALUES (1010,'Herencsény');
INSERT INTO VAROS(id,nev) VALUES (1011,'Herend');
INSERT INTO VAROS(id,nev) VALUES (1012,'Heresznye');
INSERT INTO VAROS(id,nev) VALUES (1013,'Hermánszeg');
INSERT INTO VAROS(id,nev) VALUES (1014,'Hernád');
INSERT INTO VAROS(id,nev) VALUES (1015,'Hernádbűd');
INSERT INTO VAROS(id,nev) VALUES (1016,'Hernádcéce');
INSERT INTO VAROS(id,nev) VALUES (1017,'Hernádkak');
INSERT INTO VAROS(id,nev) VALUES (1018,'Hernádkércs');
INSERT INTO VAROS(id,nev) VALUES (1019,'Hernádnémeti');
INSERT INTO VAROS(id,nev) VALUES (1020,'Hernádpetri');
INSERT INTO VAROS(id,nev) VALUES (1021,'Hernádszentandrás');
INSERT INTO VAROS(id,nev) VALUES (1022,'Hernádszurdok');
INSERT INTO VAROS(id,nev) VALUES (1023,'Hernádvécse');
INSERT INTO VAROS(id,nev) VALUES (1024,'Hernyék');
INSERT INTO VAROS(id,nev) VALUES (1025,'Hét');
INSERT INTO VAROS(id,nev) VALUES (1026,'Hetefejércse');
INSERT INTO VAROS(id,nev) VALUES (1027,'Hetes');
INSERT INTO VAROS(id,nev) VALUES (1028,'Hetvehely');
INSERT INTO VAROS(id,nev) VALUES (1029,'Hetyefő');
INSERT INTO VAROS(id,nev) VALUES (1030,'Heves');
INSERT INTO VAROS(id,nev) VALUES (1031,'Hevesaranyos');
INSERT INTO VAROS(id,nev) VALUES (1032,'Hevesvezekény');
INSERT INTO VAROS(id,nev) VALUES (1033,'Hévíz');
INSERT INTO VAROS(id,nev) VALUES (1034,'Hévízgyörk');
INSERT INTO VAROS(id,nev) VALUES (1035,'Hidas');
INSERT INTO VAROS(id,nev) VALUES (1036,'Hidasnémeti');
INSERT INTO VAROS(id,nev) VALUES (1037,'Hidegkút');
INSERT INTO VAROS(id,nev) VALUES (1038,'Hidegség');
INSERT INTO VAROS(id,nev) VALUES (1039,'Hidvégardó');
INSERT INTO VAROS(id,nev) VALUES (1040,'Himesháza');
INSERT INTO VAROS(id,nev) VALUES (1041,'Himod');
INSERT INTO VAROS(id,nev) VALUES (1042,'Hirics');
INSERT INTO VAROS(id,nev) VALUES (1043,'Hobol');
INSERT INTO VAROS(id,nev) VALUES (1044,'Hodász');
INSERT INTO VAROS(id,nev) VALUES (1045,'Hódmezővásárhely');
INSERT INTO VAROS(id,nev) VALUES (1046,'Hollád');
INSERT INTO VAROS(id,nev) VALUES (1047,'Hollóháza');
INSERT INTO VAROS(id,nev) VALUES (1048,'Hollókő');
INSERT INTO VAROS(id,nev) VALUES (1049,'Homokbödöge');
INSERT INTO VAROS(id,nev) VALUES (1050,'Homokkomárom');
INSERT INTO VAROS(id,nev) VALUES (1051,'Homokmégy');
INSERT INTO VAROS(id,nev) VALUES (1052,'Homokszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (1053,'Homorúd');
INSERT INTO VAROS(id,nev) VALUES (1054,'Homrogd');
INSERT INTO VAROS(id,nev) VALUES (1055,'Hont');
INSERT INTO VAROS(id,nev) VALUES (1056,'Horpács');
INSERT INTO VAROS(id,nev) VALUES (1057,'Hort');
INSERT INTO VAROS(id,nev) VALUES (1058,'Hortobágy');
INSERT INTO VAROS(id,nev) VALUES (1059,'Horváthertelend');
INSERT INTO VAROS(id,nev) VALUES (1060,'Horvátlövő');
INSERT INTO VAROS(id,nev) VALUES (1061,'Horvátzsidány');
INSERT INTO VAROS(id,nev) VALUES (1062,'Hosszúhetény');
INSERT INTO VAROS(id,nev) VALUES (1063,'Hosszúpályi');
INSERT INTO VAROS(id,nev) VALUES (1064,'Hosszúpereszteg');
INSERT INTO VAROS(id,nev) VALUES (1065,'Hosszúvíz');
INSERT INTO VAROS(id,nev) VALUES (1066,'Hosszúvölgy');
INSERT INTO VAROS(id,nev) VALUES (1067,'Hosztót');
INSERT INTO VAROS(id,nev) VALUES (1068,'Hottó');
INSERT INTO VAROS(id,nev) VALUES (1069,'Hőgyész');
INSERT INTO VAROS(id,nev) VALUES (1070,'Hövej');
INSERT INTO VAROS(id,nev) VALUES (1071,'Hugyag');
INSERT INTO VAROS(id,nev) VALUES (1072,'Hunya');
INSERT INTO VAROS(id,nev) VALUES (1073,'Hunyadfalva');
INSERT INTO VAROS(id,nev) VALUES (1074,'Husztót');
INSERT INTO VAROS(id,nev) VALUES (1075,'Ibafa');
INSERT INTO VAROS(id,nev) VALUES (1076,'Iborfia');
INSERT INTO VAROS(id,nev) VALUES (1077,'Ibrány');
INSERT INTO VAROS(id,nev) VALUES (1078,'Igal');
INSERT INTO VAROS(id,nev) VALUES (1079,'Igar');
INSERT INTO VAROS(id,nev) VALUES (1080,'Igrici');
INSERT INTO VAROS(id,nev) VALUES (1081,'Iharos');
INSERT INTO VAROS(id,nev) VALUES (1082,'Iharosberény');
INSERT INTO VAROS(id,nev) VALUES (1083,'Ikervár');
INSERT INTO VAROS(id,nev) VALUES (1084,'Iklad');
INSERT INTO VAROS(id,nev) VALUES (1085,'Iklanberény');
INSERT INTO VAROS(id,nev) VALUES (1086,'Iklódbördőce');
INSERT INTO VAROS(id,nev) VALUES (1087,'Ikrény');
INSERT INTO VAROS(id,nev) VALUES (1088,'Iliny');
INSERT INTO VAROS(id,nev) VALUES (1089,'Ilk');
INSERT INTO VAROS(id,nev) VALUES (1090,'Illocska');
INSERT INTO VAROS(id,nev) VALUES (1091,'Imola');
INSERT INTO VAROS(id,nev) VALUES (1092,'Imrehegy');
INSERT INTO VAROS(id,nev) VALUES (1093,'Ináncs');
INSERT INTO VAROS(id,nev) VALUES (1094,'Inárcs');
INSERT INTO VAROS(id,nev) VALUES (1095,'Inke');
INSERT INTO VAROS(id,nev) VALUES (1096,'Ipacsfa');
INSERT INTO VAROS(id,nev) VALUES (1097,'Ipolydamásd');
INSERT INTO VAROS(id,nev) VALUES (1098,'Ipolyszög');
INSERT INTO VAROS(id,nev) VALUES (1099,'Ipolytarnóc');
INSERT INTO VAROS(id,nev) VALUES (1100,'Ipolytölgyes');
INSERT INTO VAROS(id,nev) VALUES (1101,'Ipolyvece');
INSERT INTO VAROS(id,nev) VALUES (1102,'Iregszemcse');
INSERT INTO VAROS(id,nev) VALUES (1103,'Irota');
INSERT INTO VAROS(id,nev) VALUES (1104,'Isaszeg');
INSERT INTO VAROS(id,nev) VALUES (1105,'Ispánk');
INSERT INTO VAROS(id,nev) VALUES (1106,'Istenmezeje');
INSERT INTO VAROS(id,nev) VALUES (1107,'Istvándi');
INSERT INTO VAROS(id,nev) VALUES (1108,'Iszkaszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (1109,'Iszkáz');
INSERT INTO VAROS(id,nev) VALUES (1110,'Isztimér');
INSERT INTO VAROS(id,nev) VALUES (1111,'Ivád');
INSERT INTO VAROS(id,nev) VALUES (1112,'Iván');
INSERT INTO VAROS(id,nev) VALUES (1113,'Ivánbattyán');
INSERT INTO VAROS(id,nev) VALUES (1114,'Ivánc');
INSERT INTO VAROS(id,nev) VALUES (1115,'Iváncsa');
INSERT INTO VAROS(id,nev) VALUES (1116,'Ivándárda');
INSERT INTO VAROS(id,nev) VALUES (1117,'Izmény');
INSERT INTO VAROS(id,nev) VALUES (1118,'Izsák');
INSERT INTO VAROS(id,nev) VALUES (1119,'Izsófalva');
INSERT INTO VAROS(id,nev) VALUES (1120,'Jágónak');
INSERT INTO VAROS(id,nev) VALUES (1121,'Ják');
INSERT INTO VAROS(id,nev) VALUES (1122,'Jakabszállás');
INSERT INTO VAROS(id,nev) VALUES (1123,'Jákfa');
INSERT INTO VAROS(id,nev) VALUES (1124,'Jákfalva');
INSERT INTO VAROS(id,nev) VALUES (1125,'Jákó');
INSERT INTO VAROS(id,nev) VALUES (1126,'Jánd');
INSERT INTO VAROS(id,nev) VALUES (1127,'Jánkmajtis');
INSERT INTO VAROS(id,nev) VALUES (1128,'Jánoshalma');
INSERT INTO VAROS(id,nev) VALUES (1129,'Jánosháza');
INSERT INTO VAROS(id,nev) VALUES (1130,'Jánoshida');
INSERT INTO VAROS(id,nev) VALUES (1131,'Jánossomorja');
INSERT INTO VAROS(id,nev) VALUES (1132,'Járdánháza');
INSERT INTO VAROS(id,nev) VALUES (1133,'Jármi');
INSERT INTO VAROS(id,nev) VALUES (1134,'Jásd');
INSERT INTO VAROS(id,nev) VALUES (1135,'Jászágó');
INSERT INTO VAROS(id,nev) VALUES (1136,'Jászalsószentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (1137,'Jászapáti');
INSERT INTO VAROS(id,nev) VALUES (1138,'Jászárokszállás');
INSERT INTO VAROS(id,nev) VALUES (1139,'Jászberény');
INSERT INTO VAROS(id,nev) VALUES (1140,'Jászboldogháza');
INSERT INTO VAROS(id,nev) VALUES (1141,'Jászdózsa');
INSERT INTO VAROS(id,nev) VALUES (1142,'Jászfelsőszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (1143,'Jászfényszaru');
INSERT INTO VAROS(id,nev) VALUES (1144,'Jászivány');
INSERT INTO VAROS(id,nev) VALUES (1145,'Jászjákóhalma');
INSERT INTO VAROS(id,nev) VALUES (1146,'Jászkarajenő');
INSERT INTO VAROS(id,nev) VALUES (1147,'Jászkisér');
INSERT INTO VAROS(id,nev) VALUES (1148,'Jászladány');
INSERT INTO VAROS(id,nev) VALUES (1149,'Jászszentandrás');
INSERT INTO VAROS(id,nev) VALUES (1150,'Jászszentlászló');
INSERT INTO VAROS(id,nev) VALUES (1151,'Jásztelek');
INSERT INTO VAROS(id,nev) VALUES (1152,'Jéke');
INSERT INTO VAROS(id,nev) VALUES (1153,'Jenő');
INSERT INTO VAROS(id,nev) VALUES (1154,'Jobaháza');
INSERT INTO VAROS(id,nev) VALUES (1155,'Jobbágyi');
INSERT INTO VAROS(id,nev) VALUES (1156,'Jósvafő');
INSERT INTO VAROS(id,nev) VALUES (1157,'Juta');
INSERT INTO VAROS(id,nev) VALUES (1158,'Kaba');
INSERT INTO VAROS(id,nev) VALUES (1159,'Kacorlak');
INSERT INTO VAROS(id,nev) VALUES (1160,'Kács');
INSERT INTO VAROS(id,nev) VALUES (1161,'Kacsóta');
INSERT INTO VAROS(id,nev) VALUES (1162,'Kadarkút');
INSERT INTO VAROS(id,nev) VALUES (1163,'Kajárpéc');
INSERT INTO VAROS(id,nev) VALUES (1164,'Kajászó');
INSERT INTO VAROS(id,nev) VALUES (1165,'Kajdacs');
INSERT INTO VAROS(id,nev) VALUES (1166,'Kakasd');
INSERT INTO VAROS(id,nev) VALUES (1167,'Kákics');
INSERT INTO VAROS(id,nev) VALUES (1168,'Kakucs');
INSERT INTO VAROS(id,nev) VALUES (1169,'Kál');
INSERT INTO VAROS(id,nev) VALUES (1170,'Kalaznó');
INSERT INTO VAROS(id,nev) VALUES (1171,'Káld');
INSERT INTO VAROS(id,nev) VALUES (1172,'Kálló');
INSERT INTO VAROS(id,nev) VALUES (1173,'Kallósd');
INSERT INTO VAROS(id,nev) VALUES (1174,'Kállósemjén');
INSERT INTO VAROS(id,nev) VALUES (1175,'Kálmáncsa');
INSERT INTO VAROS(id,nev) VALUES (1176,'Kálmánháza');
INSERT INTO VAROS(id,nev) VALUES (1177,'Kálócfa');
INSERT INTO VAROS(id,nev) VALUES (1178,'Kalocsa');
INSERT INTO VAROS(id,nev) VALUES (1179,'Káloz');
INSERT INTO VAROS(id,nev) VALUES (1180,'Kám');
INSERT INTO VAROS(id,nev) VALUES (1181,'Kamond');
INSERT INTO VAROS(id,nev) VALUES (1182,'Kamut');
INSERT INTO VAROS(id,nev) VALUES (1183,'Kánó');
INSERT INTO VAROS(id,nev) VALUES (1184,'Kántorjánosi');
INSERT INTO VAROS(id,nev) VALUES (1185,'Kány');
INSERT INTO VAROS(id,nev) VALUES (1186,'Kánya');
INSERT INTO VAROS(id,nev) VALUES (1187,'Kányavár');
INSERT INTO VAROS(id,nev) VALUES (1188,'Kapolcs');
INSERT INTO VAROS(id,nev) VALUES (1189,'Kápolna');
INSERT INTO VAROS(id,nev) VALUES (1190,'Kápolnásnyék');
INSERT INTO VAROS(id,nev) VALUES (1191,'Kapoly');
INSERT INTO VAROS(id,nev) VALUES (1192,'Kaposfő');
INSERT INTO VAROS(id,nev) VALUES (1193,'Kaposgyarmat');
INSERT INTO VAROS(id,nev) VALUES (1194,'Kaposhomok');
INSERT INTO VAROS(id,nev) VALUES (1195,'Kaposkeresztúr');
INSERT INTO VAROS(id,nev) VALUES (1196,'Kaposmérő');
INSERT INTO VAROS(id,nev) VALUES (1197,'Kapospula');
INSERT INTO VAROS(id,nev) VALUES (1198,'Kaposújlak');
INSERT INTO VAROS(id,nev) VALUES (1199,'Kaposvár');
INSERT INTO VAROS(id,nev) VALUES (1200,'Kaposszekcső');
INSERT INTO VAROS(id,nev) VALUES (1201,'Kaposszerdahely');
INSERT INTO VAROS(id,nev) VALUES (1202,'Káptalanfa');
INSERT INTO VAROS(id,nev) VALUES (1203,'Káptalantóti');
INSERT INTO VAROS(id,nev) VALUES (1204,'Kapuvár');
INSERT INTO VAROS(id,nev) VALUES (1205,'Kára');
INSERT INTO VAROS(id,nev) VALUES (1206,'Karácsond');
INSERT INTO VAROS(id,nev) VALUES (1207,'Karád');
INSERT INTO VAROS(id,nev) VALUES (1208,'Karakó');
INSERT INTO VAROS(id,nev) VALUES (1209,'Karakószörcsök');
INSERT INTO VAROS(id,nev) VALUES (1210,'Karancsalja');
INSERT INTO VAROS(id,nev) VALUES (1211,'Karancsberény');
INSERT INTO VAROS(id,nev) VALUES (1212,'Karancskeszi');
INSERT INTO VAROS(id,nev) VALUES (1213,'Karancslapujtő');
INSERT INTO VAROS(id,nev) VALUES (1214,'Karancsság');
INSERT INTO VAROS(id,nev) VALUES (1215,'Kárász');
INSERT INTO VAROS(id,nev) VALUES (1216,'Karcag');
INSERT INTO VAROS(id,nev) VALUES (1217,'Karcsa');
INSERT INTO VAROS(id,nev) VALUES (1218,'Kardos');
INSERT INTO VAROS(id,nev) VALUES (1219,'Kardoskút');
INSERT INTO VAROS(id,nev) VALUES (1220,'Karmacs');
INSERT INTO VAROS(id,nev) VALUES (1221,'Károlyháza');
INSERT INTO VAROS(id,nev) VALUES (1222,'Karos');
INSERT INTO VAROS(id,nev) VALUES (1223,'Kartal');
INSERT INTO VAROS(id,nev) VALUES (1224,'Kásád');
INSERT INTO VAROS(id,nev) VALUES (1225,'Kaskantyú');
INSERT INTO VAROS(id,nev) VALUES (1226,'Kastélyosdombó');
INSERT INTO VAROS(id,nev) VALUES (1227,'Kaszaper');
INSERT INTO VAROS(id,nev) VALUES (1228,'Kaszó');
INSERT INTO VAROS(id,nev) VALUES (1229,'Katádfa');
INSERT INTO VAROS(id,nev) VALUES (1230,'Katafa');
INSERT INTO VAROS(id,nev) VALUES (1231,'Kátoly');
INSERT INTO VAROS(id,nev) VALUES (1232,'Katymár');
INSERT INTO VAROS(id,nev) VALUES (1233,'Káva');
INSERT INTO VAROS(id,nev) VALUES (1234,'Kávás');
INSERT INTO VAROS(id,nev) VALUES (1235,'Kazár');
INSERT INTO VAROS(id,nev) VALUES (1236,'Kazincbarcika');
INSERT INTO VAROS(id,nev) VALUES (1237,'Kázsmárk');
INSERT INTO VAROS(id,nev) VALUES (1238,'Kazsok');
INSERT INTO VAROS(id,nev) VALUES (1239,'Kecel');
INSERT INTO VAROS(id,nev) VALUES (1240,'Kecskéd');
INSERT INTO VAROS(id,nev) VALUES (1241,'Kecskemét');
INSERT INTO VAROS(id,nev) VALUES (1242,'Kehidakustány');
INSERT INTO VAROS(id,nev) VALUES (1243,'Kék');
INSERT INTO VAROS(id,nev) VALUES (1244,'Kékcse');
INSERT INTO VAROS(id,nev) VALUES (1245,'Kéked');
INSERT INTO VAROS(id,nev) VALUES (1246,'Kékesd');
INSERT INTO VAROS(id,nev) VALUES (1247,'Kékkút');
INSERT INTO VAROS(id,nev) VALUES (1248,'Kelebia');
INSERT INTO VAROS(id,nev) VALUES (1249,'Keléd');
INSERT INTO VAROS(id,nev) VALUES (1250,'Kelemér');
INSERT INTO VAROS(id,nev) VALUES (1251,'Kéleshalom');
INSERT INTO VAROS(id,nev) VALUES (1252,'Kelevíz');
INSERT INTO VAROS(id,nev) VALUES (1253,'Kemecse');
INSERT INTO VAROS(id,nev) VALUES (1254,'Kemence');
INSERT INTO VAROS(id,nev) VALUES (1255,'Kemendollár');
INSERT INTO VAROS(id,nev) VALUES (1256,'Kemeneshőgyész');
INSERT INTO VAROS(id,nev) VALUES (1257,'Kemeneskápolna');
INSERT INTO VAROS(id,nev) VALUES (1258,'Kemenesmagasi');
INSERT INTO VAROS(id,nev) VALUES (1259,'Kemenesmihályfa');
INSERT INTO VAROS(id,nev) VALUES (1260,'Kemenespálfa');
INSERT INTO VAROS(id,nev) VALUES (1261,'Kemenessömjén');
INSERT INTO VAROS(id,nev) VALUES (1262,'Kemenesszentmárton');
INSERT INTO VAROS(id,nev) VALUES (1263,'Kemenesszentpéter');
INSERT INTO VAROS(id,nev) VALUES (1264,'Keménfa');
INSERT INTO VAROS(id,nev) VALUES (1265,'Kémes');
INSERT INTO VAROS(id,nev) VALUES (1266,'Kemestaródfa');
INSERT INTO VAROS(id,nev) VALUES (1267,'Kemse');
INSERT INTO VAROS(id,nev) VALUES (1268,'Kenderes');
INSERT INTO VAROS(id,nev) VALUES (1269,'Kenéz');
INSERT INTO VAROS(id,nev) VALUES (1270,'Kenézlő');
INSERT INTO VAROS(id,nev) VALUES (1271,'Kengyel');
INSERT INTO VAROS(id,nev) VALUES (1272,'Kenyeri');
INSERT INTO VAROS(id,nev) VALUES (1273,'Kercaszomor');
INSERT INTO VAROS(id,nev) VALUES (1274,'Kercseliget');
INSERT INTO VAROS(id,nev) VALUES (1275,'Kerecsend');
INSERT INTO VAROS(id,nev) VALUES (1276,'Kerecseny');
INSERT INTO VAROS(id,nev) VALUES (1277,'Kerekegyháza');
INSERT INTO VAROS(id,nev) VALUES (1278,'Kerekharaszt');
INSERT INTO VAROS(id,nev) VALUES (1279,'Kereki');
INSERT INTO VAROS(id,nev) VALUES (1280,'Kerékteleki');
INSERT INTO VAROS(id,nev) VALUES (1281,'Kerepes');
INSERT INTO VAROS(id,nev) VALUES (1282,'Keresztéte');
INSERT INTO VAROS(id,nev) VALUES (1283,'Kerkabarabás');
INSERT INTO VAROS(id,nev) VALUES (1284,'Kerkafalva');
INSERT INTO VAROS(id,nev) VALUES (1285,'Kerkakutas');
INSERT INTO VAROS(id,nev) VALUES (1286,'Kerkáskápolna');
INSERT INTO VAROS(id,nev) VALUES (1287,'Kerkaszentkirály');
INSERT INTO VAROS(id,nev) VALUES (1288,'Kerkateskánd');
INSERT INTO VAROS(id,nev) VALUES (1289,'Kérsemjén');
INSERT INTO VAROS(id,nev) VALUES (1290,'Kerta');
INSERT INTO VAROS(id,nev) VALUES (1291,'Kertészsziget');
INSERT INTO VAROS(id,nev) VALUES (1292,'Keszeg');
INSERT INTO VAROS(id,nev) VALUES (1293,'Kesznyéten');
INSERT INTO VAROS(id,nev) VALUES (1294,'Keszőhidegkút');
INSERT INTO VAROS(id,nev) VALUES (1295,'Keszthely');
INSERT INTO VAROS(id,nev) VALUES (1296,'Kesztölc');
INSERT INTO VAROS(id,nev) VALUES (1297,'Keszü');
INSERT INTO VAROS(id,nev) VALUES (1298,'Kétbodony');
INSERT INTO VAROS(id,nev) VALUES (1299,'Kétegyháza');
INSERT INTO VAROS(id,nev) VALUES (1300,'Kéthely');
INSERT INTO VAROS(id,nev) VALUES (1301,'Kétpó');
INSERT INTO VAROS(id,nev) VALUES (1302,'Kétsoprony');
INSERT INTO VAROS(id,nev) VALUES (1303,'Kétújfalu');
INSERT INTO VAROS(id,nev) VALUES (1304,'Kétvölgy');
INSERT INTO VAROS(id,nev) VALUES (1305,'Kéty');
INSERT INTO VAROS(id,nev) VALUES (1306,'Kevermes');
INSERT INTO VAROS(id,nev) VALUES (1307,'Kilimán');
INSERT INTO VAROS(id,nev) VALUES (1308,'Kimle');
INSERT INTO VAROS(id,nev) VALUES (1309,'Kincsesbánya');
INSERT INTO VAROS(id,nev) VALUES (1310,'Királd');
INSERT INTO VAROS(id,nev) VALUES (1311,'Királyegyháza');
INSERT INTO VAROS(id,nev) VALUES (1312,'Királyhegyes');
INSERT INTO VAROS(id,nev) VALUES (1313,'Királyszentistván');
INSERT INTO VAROS(id,nev) VALUES (1314,'Kisapáti');
INSERT INTO VAROS(id,nev) VALUES (1315,'Kisapostag');
INSERT INTO VAROS(id,nev) VALUES (1316,'Kisar');
INSERT INTO VAROS(id,nev) VALUES (1317,'Kisasszond');
INSERT INTO VAROS(id,nev) VALUES (1318,'Kisasszonyfa');
INSERT INTO VAROS(id,nev) VALUES (1319,'Kisbabot');
INSERT INTO VAROS(id,nev) VALUES (1320,'Kisbágyon');
INSERT INTO VAROS(id,nev) VALUES (1321,'Kisbajcs');
INSERT INTO VAROS(id,nev) VALUES (1322,'Kisbajom');
INSERT INTO VAROS(id,nev) VALUES (1323,'Kisbárapáti');
INSERT INTO VAROS(id,nev) VALUES (1324,'Kisbárkány');
INSERT INTO VAROS(id,nev) VALUES (1325,'Kisbér');
INSERT INTO VAROS(id,nev) VALUES (1326,'Kisberény');
INSERT INTO VAROS(id,nev) VALUES (1327,'Kisberzseny');
INSERT INTO VAROS(id,nev) VALUES (1328,'Kisbeszterce');
INSERT INTO VAROS(id,nev) VALUES (1329,'Kisbodak');
INSERT INTO VAROS(id,nev) VALUES (1330,'Kisbucsa');
INSERT INTO VAROS(id,nev) VALUES (1331,'Kisbudmér');
INSERT INTO VAROS(id,nev) VALUES (1332,'Kiscsécs');
INSERT INTO VAROS(id,nev) VALUES (1333,'Kiscsehi');
INSERT INTO VAROS(id,nev) VALUES (1334,'Kiscsősz');
INSERT INTO VAROS(id,nev) VALUES (1335,'Kisdér');
INSERT INTO VAROS(id,nev) VALUES (1336,'Kisdobsza');
INSERT INTO VAROS(id,nev) VALUES (1337,'Kisdombegyház');
INSERT INTO VAROS(id,nev) VALUES (1338,'Kisdorog');
INSERT INTO VAROS(id,nev) VALUES (1339,'Kisecset');
INSERT INTO VAROS(id,nev) VALUES (1340,'Kisfalud');
INSERT INTO VAROS(id,nev) VALUES (1341,'Kisfüzes');
INSERT INTO VAROS(id,nev) VALUES (1342,'Kisgörbő');
INSERT INTO VAROS(id,nev) VALUES (1343,'Kisgyalán');
INSERT INTO VAROS(id,nev) VALUES (1344,'Kisgyőr');
INSERT INTO VAROS(id,nev) VALUES (1345,'Kishajmás');
INSERT INTO VAROS(id,nev) VALUES (1346,'Kisharsány');
INSERT INTO VAROS(id,nev) VALUES (1347,'Kishartyán');
INSERT INTO VAROS(id,nev) VALUES (1348,'Kisherend');
INSERT INTO VAROS(id,nev) VALUES (1349,'Kishódos');
INSERT INTO VAROS(id,nev) VALUES (1350,'Kishuta');
INSERT INTO VAROS(id,nev) VALUES (1351,'Kisigmánd');
INSERT INTO VAROS(id,nev) VALUES (1352,'Kisjakabfalva');
INSERT INTO VAROS(id,nev) VALUES (1353,'Kiskassa');
INSERT INTO VAROS(id,nev) VALUES (1354,'Kiskinizs');
INSERT INTO VAROS(id,nev) VALUES (1355,'Kiskorpád');
INSERT INTO VAROS(id,nev) VALUES (1356,'Kisköre');
INSERT INTO VAROS(id,nev) VALUES (1357,'Kiskőrös');
INSERT INTO VAROS(id,nev) VALUES (1358,'Kiskunfélegyháza');
INSERT INTO VAROS(id,nev) VALUES (1359,'Kiskunhalas');
INSERT INTO VAROS(id,nev) VALUES (1360,'Kiskunlacháza');
INSERT INTO VAROS(id,nev) VALUES (1361,'Kiskunmajsa');
INSERT INTO VAROS(id,nev) VALUES (1362,'Kiskutas');
INSERT INTO VAROS(id,nev) VALUES (1363,'Kisláng');
INSERT INTO VAROS(id,nev) VALUES (1364,'Kisléta');
INSERT INTO VAROS(id,nev) VALUES (1365,'Kislippó');
INSERT INTO VAROS(id,nev) VALUES (1366,'Kislőd');
INSERT INTO VAROS(id,nev) VALUES (1367,'Kismányok');
INSERT INTO VAROS(id,nev) VALUES (1368,'Kismarja');
INSERT INTO VAROS(id,nev) VALUES (1369,'Kismaros');
INSERT INTO VAROS(id,nev) VALUES (1370,'Kisnamény');
INSERT INTO VAROS(id,nev) VALUES (1371,'Kisnána');
INSERT INTO VAROS(id,nev) VALUES (1372,'Kisnémedi');
INSERT INTO VAROS(id,nev) VALUES (1373,'Kisnyárád');
INSERT INTO VAROS(id,nev) VALUES (1374,'Kisoroszi');
INSERT INTO VAROS(id,nev) VALUES (1375,'Kispalád');
INSERT INTO VAROS(id,nev) VALUES (1376,'Kispáli');
INSERT INTO VAROS(id,nev) VALUES (1377,'Kispirit');
INSERT INTO VAROS(id,nev) VALUES (1378,'Kisrákos');
INSERT INTO VAROS(id,nev) VALUES (1379,'Kisrécse');
INSERT INTO VAROS(id,nev) VALUES (1380,'Kisrozvágy');
INSERT INTO VAROS(id,nev) VALUES (1381,'Kissikátor');
INSERT INTO VAROS(id,nev) VALUES (1382,'Kissomlyó');
INSERT INTO VAROS(id,nev) VALUES (1383,'Kistamási');
INSERT INTO VAROS(id,nev) VALUES (1384,'Kistapolca');
INSERT INTO VAROS(id,nev) VALUES (1385,'Kistarcsa');
INSERT INTO VAROS(id,nev) VALUES (1386,'Kistelek');
INSERT INTO VAROS(id,nev) VALUES (1387,'Kistokaj');
INSERT INTO VAROS(id,nev) VALUES (1388,'Kistolmács');
INSERT INTO VAROS(id,nev) VALUES (1389,'Kistormás');
INSERT INTO VAROS(id,nev) VALUES (1390,'Kistótfalu');
INSERT INTO VAROS(id,nev) VALUES (1391,'Kisújszállás');
INSERT INTO VAROS(id,nev) VALUES (1392,'Kisunyom');
INSERT INTO VAROS(id,nev) VALUES (1393,'Kisvárda');
INSERT INTO VAROS(id,nev) VALUES (1394,'Kisvarsány');
INSERT INTO VAROS(id,nev) VALUES (1395,'Kisvásárhely');
INSERT INTO VAROS(id,nev) VALUES (1396,'Kisvaszar');
INSERT INTO VAROS(id,nev) VALUES (1397,'Kisvejke');
INSERT INTO VAROS(id,nev) VALUES (1398,'Kiszombor');
INSERT INTO VAROS(id,nev) VALUES (1399,'Kiszsidány');
INSERT INTO VAROS(id,nev) VALUES (1400,'Kisszállás');
INSERT INTO VAROS(id,nev) VALUES (1401,'Kisszékely');
INSERT INTO VAROS(id,nev) VALUES (1402,'Kisszekeres');
INSERT INTO VAROS(id,nev) VALUES (1403,'Kisszentmárton');
INSERT INTO VAROS(id,nev) VALUES (1404,'Kissziget');
INSERT INTO VAROS(id,nev) VALUES (1405,'Kisszőlős');
INSERT INTO VAROS(id,nev) VALUES (1406,'Klárafalva');
INSERT INTO VAROS(id,nev) VALUES (1407,'Kocs');
INSERT INTO VAROS(id,nev) VALUES (1408,'Kocsér');
INSERT INTO VAROS(id,nev) VALUES (1409,'Kocsola');
INSERT INTO VAROS(id,nev) VALUES (1410,'Kocsord');
INSERT INTO VAROS(id,nev) VALUES (1411,'Kóka');
INSERT INTO VAROS(id,nev) VALUES (1412,'Kokad');
INSERT INTO VAROS(id,nev) VALUES (1413,'Kolontár');
INSERT INTO VAROS(id,nev) VALUES (1414,'Komádi');
INSERT INTO VAROS(id,nev) VALUES (1415,'Komárom');
INSERT INTO VAROS(id,nev) VALUES (1416,'Komjáti');
INSERT INTO VAROS(id,nev) VALUES (1417,'Komló');
INSERT INTO VAROS(id,nev) VALUES (1418,'Komlódtótfalu');
INSERT INTO VAROS(id,nev) VALUES (1419,'Komlósd');
INSERT INTO VAROS(id,nev) VALUES (1420,'Komlóska');
INSERT INTO VAROS(id,nev) VALUES (1421,'Komoró');
INSERT INTO VAROS(id,nev) VALUES (1422,'Kompolt');
INSERT INTO VAROS(id,nev) VALUES (1423,'Kondó');
INSERT INTO VAROS(id,nev) VALUES (1424,'Kondorfa');
INSERT INTO VAROS(id,nev) VALUES (1425,'Kondoros');
INSERT INTO VAROS(id,nev) VALUES (1426,'Kóny');
INSERT INTO VAROS(id,nev) VALUES (1427,'Konyár');
INSERT INTO VAROS(id,nev) VALUES (1428,'Kópháza');
INSERT INTO VAROS(id,nev) VALUES (1429,'Koppányszántó');
INSERT INTO VAROS(id,nev) VALUES (1430,'Korlát');
INSERT INTO VAROS(id,nev) VALUES (1431,'Koroncó');
INSERT INTO VAROS(id,nev) VALUES (1432,'Kórós');
INSERT INTO VAROS(id,nev) VALUES (1433,'Kosd');
INSERT INTO VAROS(id,nev) VALUES (1434,'Kóspallag');
INSERT INTO VAROS(id,nev) VALUES (1435,'Kótaj');
INSERT INTO VAROS(id,nev) VALUES (1436,'Kovácshida');
INSERT INTO VAROS(id,nev) VALUES (1437,'Kovácsszénája');
INSERT INTO VAROS(id,nev) VALUES (1438,'Kovácsvágás');
INSERT INTO VAROS(id,nev) VALUES (1439,'Kozárd');
INSERT INTO VAROS(id,nev) VALUES (1440,'Kozármisleny');
INSERT INTO VAROS(id,nev) VALUES (1441,'Kozmadombja');
INSERT INTO VAROS(id,nev) VALUES (1442,'Köblény');
INSERT INTO VAROS(id,nev) VALUES (1443,'Köcsk');
INSERT INTO VAROS(id,nev) VALUES (1444,'Kökény');
INSERT INTO VAROS(id,nev) VALUES (1445,'Kőkút');
INSERT INTO VAROS(id,nev) VALUES (1446,'Kölcse');
INSERT INTO VAROS(id,nev) VALUES (1447,'Kölesd');
INSERT INTO VAROS(id,nev) VALUES (1448,'Kölked');
INSERT INTO VAROS(id,nev) VALUES (1449,'Kömlő');
INSERT INTO VAROS(id,nev) VALUES (1450,'Kömlőd');
INSERT INTO VAROS(id,nev) VALUES (1451,'Kömörő');
INSERT INTO VAROS(id,nev) VALUES (1452,'Kömpöc');
INSERT INTO VAROS(id,nev) VALUES (1453,'Körmend');
INSERT INTO VAROS(id,nev) VALUES (1454,'Környe');
INSERT INTO VAROS(id,nev) VALUES (1455,'Köröm');
INSERT INTO VAROS(id,nev) VALUES (1456,'Kőröshegy');
INSERT INTO VAROS(id,nev) VALUES (1457,'Körösladány');
INSERT INTO VAROS(id,nev) VALUES (1458,'Körösnagyharsány');
INSERT INTO VAROS(id,nev) VALUES (1459,'Köröstarcsa');
INSERT INTO VAROS(id,nev) VALUES (1460,'Kőröstetétlen');
INSERT INTO VAROS(id,nev) VALUES (1461,'Körösújfalu');
INSERT INTO VAROS(id,nev) VALUES (1462,'Körösszakál');
INSERT INTO VAROS(id,nev) VALUES (1463,'Körösszegapáti');
INSERT INTO VAROS(id,nev) VALUES (1464,'Kőszárhegy');
INSERT INTO VAROS(id,nev) VALUES (1465,'Kőszeg');
INSERT INTO VAROS(id,nev) VALUES (1466,'Kőszegdoroszló');
INSERT INTO VAROS(id,nev) VALUES (1467,'Kőszegpaty');
INSERT INTO VAROS(id,nev) VALUES (1468,'Kőszegszerdahely');
INSERT INTO VAROS(id,nev) VALUES (1469,'Kötcse');
INSERT INTO VAROS(id,nev) VALUES (1470,'Kötegyán');
INSERT INTO VAROS(id,nev) VALUES (1471,'Kőtelek');
INSERT INTO VAROS(id,nev) VALUES (1472,'Kővágóörs');
INSERT INTO VAROS(id,nev) VALUES (1473,'Kővágószőlős');
INSERT INTO VAROS(id,nev) VALUES (1474,'Kővágótöttös');
INSERT INTO VAROS(id,nev) VALUES (1475,'Kövegy');
INSERT INTO VAROS(id,nev) VALUES (1476,'Köveskál');
INSERT INTO VAROS(id,nev) VALUES (1477,'Krasznokvajda');
INSERT INTO VAROS(id,nev) VALUES (1478,'Kulcs');
INSERT INTO VAROS(id,nev) VALUES (1479,'Kunadacs');
INSERT INTO VAROS(id,nev) VALUES (1480,'Kunágota');
INSERT INTO VAROS(id,nev) VALUES (1481,'Kunbaja');
INSERT INTO VAROS(id,nev) VALUES (1482,'Kunbaracs');
INSERT INTO VAROS(id,nev) VALUES (1483,'Kuncsorba');
INSERT INTO VAROS(id,nev) VALUES (1484,'Kunfehértó');
INSERT INTO VAROS(id,nev) VALUES (1485,'Kunhegyes');
INSERT INTO VAROS(id,nev) VALUES (1486,'Kunmadaras');
INSERT INTO VAROS(id,nev) VALUES (1487,'Kunpeszér');
INSERT INTO VAROS(id,nev) VALUES (1488,'Kunszállás');
INSERT INTO VAROS(id,nev) VALUES (1489,'Kunszentmárton');
INSERT INTO VAROS(id,nev) VALUES (1490,'Kunszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (1491,'Kunsziget');
INSERT INTO VAROS(id,nev) VALUES (1492,'Kup');
INSERT INTO VAROS(id,nev) VALUES (1493,'Kupa');
INSERT INTO VAROS(id,nev) VALUES (1494,'Kurd');
INSERT INTO VAROS(id,nev) VALUES (1495,'Kurityán');
INSERT INTO VAROS(id,nev) VALUES (1496,'Kustánszeg');
INSERT INTO VAROS(id,nev) VALUES (1497,'Kutas');
INSERT INTO VAROS(id,nev) VALUES (1498,'Kutasó');
INSERT INTO VAROS(id,nev) VALUES (1499,'Kübekháza');
INSERT INTO VAROS(id,nev) VALUES (1500,'Külsősárd');
INSERT INTO VAROS(id,nev) VALUES (1501,'Külsővat');
INSERT INTO VAROS(id,nev) VALUES (1502,'Küngös');
INSERT INTO VAROS(id,nev) VALUES (1503,'Lábatlan');
INSERT INTO VAROS(id,nev) VALUES (1504,'Lábod');
INSERT INTO VAROS(id,nev) VALUES (1505,'Lácacséke');
INSERT INTO VAROS(id,nev) VALUES (1506,'Lad');
INSERT INTO VAROS(id,nev) VALUES (1507,'Ladánybene');
INSERT INTO VAROS(id,nev) VALUES (1508,'Ládbesenyő');
INSERT INTO VAROS(id,nev) VALUES (1509,'Lajoskomárom');
INSERT INTO VAROS(id,nev) VALUES (1510,'Lajosmizse');
INSERT INTO VAROS(id,nev) VALUES (1511,'Lak');
INSERT INTO VAROS(id,nev) VALUES (1512,'Lakhegy');
INSERT INTO VAROS(id,nev) VALUES (1513,'Lakitelek');
INSERT INTO VAROS(id,nev) VALUES (1514,'Lakócsa');
INSERT INTO VAROS(id,nev) VALUES (1515,'Lánycsók');
INSERT INTO VAROS(id,nev) VALUES (1516,'Lápafő');
INSERT INTO VAROS(id,nev) VALUES (1517,'Lapáncsa');
INSERT INTO VAROS(id,nev) VALUES (1518,'Laskod');
INSERT INTO VAROS(id,nev) VALUES (1519,'Lasztonya');
INSERT INTO VAROS(id,nev) VALUES (1520,'Látrány');
INSERT INTO VAROS(id,nev) VALUES (1521,'Lázi');
INSERT INTO VAROS(id,nev) VALUES (1522,'Leányfalu');
INSERT INTO VAROS(id,nev) VALUES (1523,'Leányvár');
INSERT INTO VAROS(id,nev) VALUES (1524,'Lébény');
INSERT INTO VAROS(id,nev) VALUES (1525,'Legénd');
INSERT INTO VAROS(id,nev) VALUES (1526,'Legyesbénye');
INSERT INTO VAROS(id,nev) VALUES (1527,'Léh');
INSERT INTO VAROS(id,nev) VALUES (1528,'Lénárddaróc');
INSERT INTO VAROS(id,nev) VALUES (1529,'Lendvadedes');
INSERT INTO VAROS(id,nev) VALUES (1530,'Lendvajakabfa');
INSERT INTO VAROS(id,nev) VALUES (1531,'Lengyel');
INSERT INTO VAROS(id,nev) VALUES (1532,'Lengyeltóti');
INSERT INTO VAROS(id,nev) VALUES (1533,'Lenti');
INSERT INTO VAROS(id,nev) VALUES (1534,'Lepsény');
INSERT INTO VAROS(id,nev) VALUES (1535,'Lesencefalu');
INSERT INTO VAROS(id,nev) VALUES (1536,'Lesenceistvánd');
INSERT INTO VAROS(id,nev) VALUES (1537,'Lesencetomaj');
INSERT INTO VAROS(id,nev) VALUES (1538,'Létavértes');
INSERT INTO VAROS(id,nev) VALUES (1539,'Letenye');
INSERT INTO VAROS(id,nev) VALUES (1540,'Letkés');
INSERT INTO VAROS(id,nev) VALUES (1541,'Levél');
INSERT INTO VAROS(id,nev) VALUES (1542,'Levelek');
INSERT INTO VAROS(id,nev) VALUES (1543,'Libickozma');
INSERT INTO VAROS(id,nev) VALUES (1544,'Lickóvadamos');
INSERT INTO VAROS(id,nev) VALUES (1545,'Liget');
INSERT INTO VAROS(id,nev) VALUES (1546,'Ligetfalva');
INSERT INTO VAROS(id,nev) VALUES (1547,'Lipót');
INSERT INTO VAROS(id,nev) VALUES (1548,'Lippó');
INSERT INTO VAROS(id,nev) VALUES (1549,'Liptód');
INSERT INTO VAROS(id,nev) VALUES (1550,'Lispeszentadorján');
INSERT INTO VAROS(id,nev) VALUES (1551,'Liszó');
INSERT INTO VAROS(id,nev) VALUES (1552,'Litér');
INSERT INTO VAROS(id,nev) VALUES (1553,'Litka');
INSERT INTO VAROS(id,nev) VALUES (1554,'Litke');
INSERT INTO VAROS(id,nev) VALUES (1555,'Lócs');
INSERT INTO VAROS(id,nev) VALUES (1556,'Lókút');
INSERT INTO VAROS(id,nev) VALUES (1557,'Lónya');
INSERT INTO VAROS(id,nev) VALUES (1558,'Lórév');
INSERT INTO VAROS(id,nev) VALUES (1559,'Lothárd');
INSERT INTO VAROS(id,nev) VALUES (1560,'Lovas');
INSERT INTO VAROS(id,nev) VALUES (1561,'Lovasberény');
INSERT INTO VAROS(id,nev) VALUES (1562,'Lovászhetény');
INSERT INTO VAROS(id,nev) VALUES (1563,'Lovászi');
INSERT INTO VAROS(id,nev) VALUES (1564,'Lovászpatona');
INSERT INTO VAROS(id,nev) VALUES (1565,'Lőkösháza');
INSERT INTO VAROS(id,nev) VALUES (1566,'Lőrinci');
INSERT INTO VAROS(id,nev) VALUES (1567,'Lövő');
INSERT INTO VAROS(id,nev) VALUES (1568,'Lövőpetri');
INSERT INTO VAROS(id,nev) VALUES (1569,'Lucfalva');
INSERT INTO VAROS(id,nev) VALUES (1570,'Ludányhalászi');
INSERT INTO VAROS(id,nev) VALUES (1571,'Ludas');
INSERT INTO VAROS(id,nev) VALUES (1572,'Lukácsháza');
INSERT INTO VAROS(id,nev) VALUES (1573,'Lulla');
INSERT INTO VAROS(id,nev) VALUES (1574,'Lúzsok');
INSERT INTO VAROS(id,nev) VALUES (1575,'Mád');
INSERT INTO VAROS(id,nev) VALUES (1576,'Madaras');
INSERT INTO VAROS(id,nev) VALUES (1577,'Madocsa');
INSERT INTO VAROS(id,nev) VALUES (1578,'Maglóca');
INSERT INTO VAROS(id,nev) VALUES (1579,'Maglód');
INSERT INTO VAROS(id,nev) VALUES (1580,'Mágocs');
INSERT INTO VAROS(id,nev) VALUES (1581,'Magosliget');
INSERT INTO VAROS(id,nev) VALUES (1582,'Magy');
INSERT INTO VAROS(id,nev) VALUES (1583,'Magyaralmás');
INSERT INTO VAROS(id,nev) VALUES (1584,'Magyaratád');
INSERT INTO VAROS(id,nev) VALUES (1585,'Magyarbánhegyes');
INSERT INTO VAROS(id,nev) VALUES (1586,'Magyarbóly');
INSERT INTO VAROS(id,nev) VALUES (1587,'Magyarcsanád');
INSERT INTO VAROS(id,nev) VALUES (1588,'Magyardombegyház');
INSERT INTO VAROS(id,nev) VALUES (1589,'Magyaregregy');
INSERT INTO VAROS(id,nev) VALUES (1590,'Magyaregres');
INSERT INTO VAROS(id,nev) VALUES (1591,'Magyarföld');
INSERT INTO VAROS(id,nev) VALUES (1592,'Magyargéc');
INSERT INTO VAROS(id,nev) VALUES (1593,'Magyargencs');
INSERT INTO VAROS(id,nev) VALUES (1594,'Magyarhertelend');
INSERT INTO VAROS(id,nev) VALUES (1595,'Magyarhomorog');
INSERT INTO VAROS(id,nev) VALUES (1596,'Magyarkeresztúr');
INSERT INTO VAROS(id,nev) VALUES (1597,'Magyarkeszi');
INSERT INTO VAROS(id,nev) VALUES (1598,'Magyarlak');
INSERT INTO VAROS(id,nev) VALUES (1599,'Magyarlukafa');
INSERT INTO VAROS(id,nev) VALUES (1600,'Magyarmecske');
INSERT INTO VAROS(id,nev) VALUES (1601,'Magyarnádalja');
INSERT INTO VAROS(id,nev) VALUES (1602,'Magyarnándor');
INSERT INTO VAROS(id,nev) VALUES (1603,'Magyarpolány');
INSERT INTO VAROS(id,nev) VALUES (1604,'Magyarsarlós');
INSERT INTO VAROS(id,nev) VALUES (1605,'Magyarszecsőd');
INSERT INTO VAROS(id,nev) VALUES (1606,'Magyarszék');
INSERT INTO VAROS(id,nev) VALUES (1607,'Magyarszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (1608,'Magyarszerdahely');
INSERT INTO VAROS(id,nev) VALUES (1609,'Magyarszombatfa');
INSERT INTO VAROS(id,nev) VALUES (1610,'Magyartelek');
INSERT INTO VAROS(id,nev) VALUES (1611,'Majosháza');
INSERT INTO VAROS(id,nev) VALUES (1612,'Majs');
INSERT INTO VAROS(id,nev) VALUES (1613,'Makád');
INSERT INTO VAROS(id,nev) VALUES (1614,'Makkoshotyka');
INSERT INTO VAROS(id,nev) VALUES (1615,'Maklár');
INSERT INTO VAROS(id,nev) VALUES (1616,'Makó');
INSERT INTO VAROS(id,nev) VALUES (1617,'Malomsok');
INSERT INTO VAROS(id,nev) VALUES (1618,'Mályi');
INSERT INTO VAROS(id,nev) VALUES (1619,'Mályinka');
INSERT INTO VAROS(id,nev) VALUES (1620,'Mánd');
INSERT INTO VAROS(id,nev) VALUES (1621,'Mándok');
INSERT INTO VAROS(id,nev) VALUES (1622,'Mánfa');
INSERT INTO VAROS(id,nev) VALUES (1623,'Mány');
INSERT INTO VAROS(id,nev) VALUES (1624,'Maráza');
INSERT INTO VAROS(id,nev) VALUES (1625,'Marcalgergelyi');
INSERT INTO VAROS(id,nev) VALUES (1626,'Marcali');
INSERT INTO VAROS(id,nev) VALUES (1627,'Marcaltő');
INSERT INTO VAROS(id,nev) VALUES (1628,'Márfa');
INSERT INTO VAROS(id,nev) VALUES (1629,'Máriahalom');
INSERT INTO VAROS(id,nev) VALUES (1630,'Máriakálnok');
INSERT INTO VAROS(id,nev) VALUES (1631,'Máriakéménd');
INSERT INTO VAROS(id,nev) VALUES (1632,'Márianosztra');
INSERT INTO VAROS(id,nev) VALUES (1633,'Máriapócs');
INSERT INTO VAROS(id,nev) VALUES (1634,'Markaz');
INSERT INTO VAROS(id,nev) VALUES (1635,'Márkháza');
INSERT INTO VAROS(id,nev) VALUES (1636,'Márkó');
INSERT INTO VAROS(id,nev) VALUES (1637,'Markóc');
INSERT INTO VAROS(id,nev) VALUES (1638,'Markotabödöge');
INSERT INTO VAROS(id,nev) VALUES (1639,'Maróc');
INSERT INTO VAROS(id,nev) VALUES (1640,'Marócsa');
INSERT INTO VAROS(id,nev) VALUES (1641,'Márok');
INSERT INTO VAROS(id,nev) VALUES (1642,'Márokföld');
INSERT INTO VAROS(id,nev) VALUES (1643,'Márokpapi');
INSERT INTO VAROS(id,nev) VALUES (1644,'Maroslele');
INSERT INTO VAROS(id,nev) VALUES (1645,'Mártély');
INSERT INTO VAROS(id,nev) VALUES (1646,'Martfű');
INSERT INTO VAROS(id,nev) VALUES (1647,'Martonfa');
INSERT INTO VAROS(id,nev) VALUES (1648,'Martonvásár');
INSERT INTO VAROS(id,nev) VALUES (1649,'Martonyi');
INSERT INTO VAROS(id,nev) VALUES (1650,'Mátészalka');
INSERT INTO VAROS(id,nev) VALUES (1651,'Mátételke');
INSERT INTO VAROS(id,nev) VALUES (1652,'Mátraballa');
INSERT INTO VAROS(id,nev) VALUES (1653,'Mátraderecske');
INSERT INTO VAROS(id,nev) VALUES (1654,'Mátramindszent');
INSERT INTO VAROS(id,nev) VALUES (1655,'Mátranovák');
INSERT INTO VAROS(id,nev) VALUES (1656,'Mátraszele');
INSERT INTO VAROS(id,nev) VALUES (1657,'Mátraszentimre');
INSERT INTO VAROS(id,nev) VALUES (1658,'Mátraszőlős');
INSERT INTO VAROS(id,nev) VALUES (1659,'Mátraterenye');
INSERT INTO VAROS(id,nev) VALUES (1660,'Mátraverebély');
INSERT INTO VAROS(id,nev) VALUES (1661,'Mátyásdomb');
INSERT INTO VAROS(id,nev) VALUES (1662,'Matty');
INSERT INTO VAROS(id,nev) VALUES (1663,'Mátyus');
INSERT INTO VAROS(id,nev) VALUES (1664,'Máza');
INSERT INTO VAROS(id,nev) VALUES (1665,'Mecseknádasd');
INSERT INTO VAROS(id,nev) VALUES (1666,'Mecsekpölöske');
INSERT INTO VAROS(id,nev) VALUES (1667,'Mecsér');
INSERT INTO VAROS(id,nev) VALUES (1668,'Medgyesbodzás');
INSERT INTO VAROS(id,nev) VALUES (1669,'Medgyesegyháza');
INSERT INTO VAROS(id,nev) VALUES (1670,'Medina');
INSERT INTO VAROS(id,nev) VALUES (1671,'Megyaszó');
INSERT INTO VAROS(id,nev) VALUES (1672,'Megyehíd');
INSERT INTO VAROS(id,nev) VALUES (1673,'Megyer');
INSERT INTO VAROS(id,nev) VALUES (1674,'Meggyeskovácsi');
INSERT INTO VAROS(id,nev) VALUES (1675,'Méhkerék');
INSERT INTO VAROS(id,nev) VALUES (1676,'Méhtelek');
INSERT INTO VAROS(id,nev) VALUES (1677,'Mekényes');
INSERT INTO VAROS(id,nev) VALUES (1678,'Mélykút');
INSERT INTO VAROS(id,nev) VALUES (1679,'Mencshely');
INSERT INTO VAROS(id,nev) VALUES (1680,'Mende');
INSERT INTO VAROS(id,nev) VALUES (1681,'Méra');
INSERT INTO VAROS(id,nev) VALUES (1682,'Merenye');
INSERT INTO VAROS(id,nev) VALUES (1683,'Mérges');
INSERT INTO VAROS(id,nev) VALUES (1684,'Mérk');
INSERT INTO VAROS(id,nev) VALUES (1685,'Mernye');
INSERT INTO VAROS(id,nev) VALUES (1686,'Mersevát');
INSERT INTO VAROS(id,nev) VALUES (1687,'Mesterháza');
INSERT INTO VAROS(id,nev) VALUES (1688,'Mesteri');
INSERT INTO VAROS(id,nev) VALUES (1689,'Mesterszállás');
INSERT INTO VAROS(id,nev) VALUES (1690,'Meszes');
INSERT INTO VAROS(id,nev) VALUES (1691,'Meszlen');
INSERT INTO VAROS(id,nev) VALUES (1692,'Mesztegnyő');
INSERT INTO VAROS(id,nev) VALUES (1693,'Mezőberény');
INSERT INTO VAROS(id,nev) VALUES (1694,'Mezőcsát');
INSERT INTO VAROS(id,nev) VALUES (1695,'Mezőcsokonya');
INSERT INTO VAROS(id,nev) VALUES (1696,'Meződ');
INSERT INTO VAROS(id,nev) VALUES (1697,'Mezőfalva');
INSERT INTO VAROS(id,nev) VALUES (1698,'Mezőgyán');
INSERT INTO VAROS(id,nev) VALUES (1699,'Mezőhegyes');
INSERT INTO VAROS(id,nev) VALUES (1700,'Mezőhék');
INSERT INTO VAROS(id,nev) VALUES (1701,'Mezőkeresztes');
INSERT INTO VAROS(id,nev) VALUES (1702,'Mezőkomárom');
INSERT INTO VAROS(id,nev) VALUES (1703,'Mezőkovácsháza');
INSERT INTO VAROS(id,nev) VALUES (1704,'Mezőkövesd');
INSERT INTO VAROS(id,nev) VALUES (1705,'Mezőladány');
INSERT INTO VAROS(id,nev) VALUES (1706,'Mezőlak');
INSERT INTO VAROS(id,nev) VALUES (1707,'Mezőnagymihály');
INSERT INTO VAROS(id,nev) VALUES (1708,'Mezőnyárád');
INSERT INTO VAROS(id,nev) VALUES (1709,'Mezőörs');
INSERT INTO VAROS(id,nev) VALUES (1710,'Mezőpeterd');
INSERT INTO VAROS(id,nev) VALUES (1711,'Mezősas');
INSERT INTO VAROS(id,nev) VALUES (1712,'Mezőszemere');
INSERT INTO VAROS(id,nev) VALUES (1713,'Mezőszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (1714,'Mezőszilas');
INSERT INTO VAROS(id,nev) VALUES (1715,'Mezőtárkány');
INSERT INTO VAROS(id,nev) VALUES (1716,'Mezőtúr');
INSERT INTO VAROS(id,nev) VALUES (1717,'Mezőzombor');
INSERT INTO VAROS(id,nev) VALUES (1718,'Miháld');
INSERT INTO VAROS(id,nev) VALUES (1719,'Mihályfa');
INSERT INTO VAROS(id,nev) VALUES (1720,'Mihálygerge');
INSERT INTO VAROS(id,nev) VALUES (1721,'Mihályháza');
INSERT INTO VAROS(id,nev) VALUES (1722,'Mihályi');
INSERT INTO VAROS(id,nev) VALUES (1723,'Mike');
INSERT INTO VAROS(id,nev) VALUES (1724,'Mikebuda');
INSERT INTO VAROS(id,nev) VALUES (1725,'Mikekarácsonyfa');
INSERT INTO VAROS(id,nev) VALUES (1726,'Mikepércs');
INSERT INTO VAROS(id,nev) VALUES (1727,'Miklósi');
INSERT INTO VAROS(id,nev) VALUES (1728,'Mikófalva');
INSERT INTO VAROS(id,nev) VALUES (1729,'Mikóháza');
INSERT INTO VAROS(id,nev) VALUES (1730,'Mikosszéplak');
INSERT INTO VAROS(id,nev) VALUES (1731,'Milejszeg');
INSERT INTO VAROS(id,nev) VALUES (1732,'Milota');
INSERT INTO VAROS(id,nev) VALUES (1733,'Mindszent');
INSERT INTO VAROS(id,nev) VALUES (1734,'Mindszentgodisa');
INSERT INTO VAROS(id,nev) VALUES (1735,'Mindszentkálla');
INSERT INTO VAROS(id,nev) VALUES (1736,'Misefa');
INSERT INTO VAROS(id,nev) VALUES (1737,'Miske');
INSERT INTO VAROS(id,nev) VALUES (1738,'Miskolc');
INSERT INTO VAROS(id,nev) VALUES (1739,'Miszla');
INSERT INTO VAROS(id,nev) VALUES (1740,'Mocsa');
INSERT INTO VAROS(id,nev) VALUES (1741,'Mogyoród');
INSERT INTO VAROS(id,nev) VALUES (1742,'Mogyorósbánya');
INSERT INTO VAROS(id,nev) VALUES (1743,'Mogyoróska');
INSERT INTO VAROS(id,nev) VALUES (1744,'Moha');
INSERT INTO VAROS(id,nev) VALUES (1745,'Mohács');
INSERT INTO VAROS(id,nev) VALUES (1746,'Mohora');
INSERT INTO VAROS(id,nev) VALUES (1747,'Molnári');
INSERT INTO VAROS(id,nev) VALUES (1748,'Molnaszecsőd');
INSERT INTO VAROS(id,nev) VALUES (1749,'Molvány');
INSERT INTO VAROS(id,nev) VALUES (1750,'Monaj');
INSERT INTO VAROS(id,nev) VALUES (1751,'Monok');
INSERT INTO VAROS(id,nev) VALUES (1752,'Monor');
INSERT INTO VAROS(id,nev) VALUES (1753,'Monorierdő');
INSERT INTO VAROS(id,nev) VALUES (1754,'Mónosbél');
INSERT INTO VAROS(id,nev) VALUES (1755,'Monostorapáti');
INSERT INTO VAROS(id,nev) VALUES (1756,'Monostorpályi');
INSERT INTO VAROS(id,nev) VALUES (1757,'Monoszló');
INSERT INTO VAROS(id,nev) VALUES (1758,'Monyoród');
INSERT INTO VAROS(id,nev) VALUES (1759,'Mór');
INSERT INTO VAROS(id,nev) VALUES (1760,'Mórágy');
INSERT INTO VAROS(id,nev) VALUES (1761,'Mórahalom');
INSERT INTO VAROS(id,nev) VALUES (1762,'Móricgát');
INSERT INTO VAROS(id,nev) VALUES (1763,'Mórichida');
INSERT INTO VAROS(id,nev) VALUES (1764,'Mosdós');
INSERT INTO VAROS(id,nev) VALUES (1765,'Mosonmagyaróvár');
INSERT INTO VAROS(id,nev) VALUES (1766,'Mosonszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (1767,'Mosonszolnok');
INSERT INTO VAROS(id,nev) VALUES (1768,'Mosonudvar');
INSERT INTO VAROS(id,nev) VALUES (1769,'Mozsgó');
INSERT INTO VAROS(id,nev) VALUES (1770,'Mőcsény');
INSERT INTO VAROS(id,nev) VALUES (1771,'Mucsfa');
INSERT INTO VAROS(id,nev) VALUES (1772,'Mucsi');
INSERT INTO VAROS(id,nev) VALUES (1773,'Múcsony');
INSERT INTO VAROS(id,nev) VALUES (1774,'Muhi');
INSERT INTO VAROS(id,nev) VALUES (1775,'Murakeresztúr');
INSERT INTO VAROS(id,nev) VALUES (1776,'Murarátka');
INSERT INTO VAROS(id,nev) VALUES (1777,'Muraszemenye');
INSERT INTO VAROS(id,nev) VALUES (1778,'Murga');
INSERT INTO VAROS(id,nev) VALUES (1779,'Murony');
INSERT INTO VAROS(id,nev) VALUES (1780,'Nábrád');
INSERT INTO VAROS(id,nev) VALUES (1781,'Nadap');
INSERT INTO VAROS(id,nev) VALUES (1782,'Nádasd');
INSERT INTO VAROS(id,nev) VALUES (1783,'Nádasdladány');
INSERT INTO VAROS(id,nev) VALUES (1784,'Nádudvar');
INSERT INTO VAROS(id,nev) VALUES (1785,'Nágocs');
INSERT INTO VAROS(id,nev) VALUES (1786,'Nagyacsád');
INSERT INTO VAROS(id,nev) VALUES (1787,'Nagyalásony');
INSERT INTO VAROS(id,nev) VALUES (1788,'Nagyar');
INSERT INTO VAROS(id,nev) VALUES (1789,'Nagyatád');
INSERT INTO VAROS(id,nev) VALUES (1790,'Nagybajcs');
INSERT INTO VAROS(id,nev) VALUES (1791,'Nagybajom');
INSERT INTO VAROS(id,nev) VALUES (1792,'Nagybakónak');
INSERT INTO VAROS(id,nev) VALUES (1793,'Nagybánhegyes');
INSERT INTO VAROS(id,nev) VALUES (1794,'Nagybaracska');
INSERT INTO VAROS(id,nev) VALUES (1795,'Nagybarca');
INSERT INTO VAROS(id,nev) VALUES (1796,'Nagybárkány');
INSERT INTO VAROS(id,nev) VALUES (1797,'Nagyberény');
INSERT INTO VAROS(id,nev) VALUES (1798,'Nagyberki');
INSERT INTO VAROS(id,nev) VALUES (1799,'Nagybörzsöny');
INSERT INTO VAROS(id,nev) VALUES (1800,'Nagybudmér');
INSERT INTO VAROS(id,nev) VALUES (1801,'Nagycenk');
INSERT INTO VAROS(id,nev) VALUES (1802,'Nagycsány');
INSERT INTO VAROS(id,nev) VALUES (1803,'Nagycsécs');
INSERT INTO VAROS(id,nev) VALUES (1804,'Nagycsepely');
INSERT INTO VAROS(id,nev) VALUES (1805,'Nagycserkesz');
INSERT INTO VAROS(id,nev) VALUES (1806,'Nagydém');
INSERT INTO VAROS(id,nev) VALUES (1807,'Nagydobos');
INSERT INTO VAROS(id,nev) VALUES (1808,'Nagydobsza');
INSERT INTO VAROS(id,nev) VALUES (1809,'Nagydorog');
INSERT INTO VAROS(id,nev) VALUES (1810,'Nagyecsed');
INSERT INTO VAROS(id,nev) VALUES (1811,'Nagyér');
INSERT INTO VAROS(id,nev) VALUES (1812,'Nagyesztergár');
INSERT INTO VAROS(id,nev) VALUES (1813,'Nagyfüged');
INSERT INTO VAROS(id,nev) VALUES (1814,'Nagygeresd');
INSERT INTO VAROS(id,nev) VALUES (1815,'Nagygörbő');
INSERT INTO VAROS(id,nev) VALUES (1816,'Nagygyimót');
INSERT INTO VAROS(id,nev) VALUES (1817,'Nagyhajmás');
INSERT INTO VAROS(id,nev) VALUES (1818,'Nagyhalász');
INSERT INTO VAROS(id,nev) VALUES (1819,'Nagyharsány');
INSERT INTO VAROS(id,nev) VALUES (1820,'Nagyhegyes');
INSERT INTO VAROS(id,nev) VALUES (1821,'Nagyhódos');
INSERT INTO VAROS(id,nev) VALUES (1822,'Nagyhuta');
INSERT INTO VAROS(id,nev) VALUES (1823,'Nagyigmánd');
INSERT INTO VAROS(id,nev) VALUES (1824,'Nagyiván');
INSERT INTO VAROS(id,nev) VALUES (1825,'Nagykálló');
INSERT INTO VAROS(id,nev) VALUES (1826,'Nagykamarás');
INSERT INTO VAROS(id,nev) VALUES (1827,'Nagykanizsa');
INSERT INTO VAROS(id,nev) VALUES (1828,'Nagykapornak');
INSERT INTO VAROS(id,nev) VALUES (1829,'Nagykarácsony');
INSERT INTO VAROS(id,nev) VALUES (1830,'Nagykáta');
INSERT INTO VAROS(id,nev) VALUES (1831,'Nagykereki');
INSERT INTO VAROS(id,nev) VALUES (1832,'Nagykeresztúr');
INSERT INTO VAROS(id,nev) VALUES (1833,'Nagykinizs');
INSERT INTO VAROS(id,nev) VALUES (1834,'Nagykónyi');
INSERT INTO VAROS(id,nev) VALUES (1835,'Nagykorpád');
INSERT INTO VAROS(id,nev) VALUES (1836,'Nagykovácsi');
INSERT INTO VAROS(id,nev) VALUES (1837,'Nagykozár');
INSERT INTO VAROS(id,nev) VALUES (1838,'Nagykökényes');
INSERT INTO VAROS(id,nev) VALUES (1839,'Nagykölked');
INSERT INTO VAROS(id,nev) VALUES (1840,'Nagykőrös');
INSERT INTO VAROS(id,nev) VALUES (1841,'Nagykörű');
INSERT INTO VAROS(id,nev) VALUES (1842,'Nagykutas');
INSERT INTO VAROS(id,nev) VALUES (1843,'Nagylak');
INSERT INTO VAROS(id,nev) VALUES (1844,'Nagylengyel');
INSERT INTO VAROS(id,nev) VALUES (1845,'Nagylóc');
INSERT INTO VAROS(id,nev) VALUES (1846,'Nagylók');
INSERT INTO VAROS(id,nev) VALUES (1847,'Nagylózs');
INSERT INTO VAROS(id,nev) VALUES (1848,'Nagymágocs');
INSERT INTO VAROS(id,nev) VALUES (1849,'Nagymányok');
INSERT INTO VAROS(id,nev) VALUES (1850,'Nagymaros');
INSERT INTO VAROS(id,nev) VALUES (1851,'Nagymizdó');
INSERT INTO VAROS(id,nev) VALUES (1852,'Nagynyárád');
INSERT INTO VAROS(id,nev) VALUES (1853,'Nagyoroszi');
INSERT INTO VAROS(id,nev) VALUES (1854,'Nagypáli');
INSERT INTO VAROS(id,nev) VALUES (1855,'Nagypall');
INSERT INTO VAROS(id,nev) VALUES (1856,'Nagypeterd');
INSERT INTO VAROS(id,nev) VALUES (1857,'Nagypirit');
INSERT INTO VAROS(id,nev) VALUES (1858,'Nagyrábé');
INSERT INTO VAROS(id,nev) VALUES (1859,'Nagyrada');
INSERT INTO VAROS(id,nev) VALUES (1860,'Nagyrákos');
INSERT INTO VAROS(id,nev) VALUES (1861,'Nagyrécse');
INSERT INTO VAROS(id,nev) VALUES (1862,'Nagyréde');
INSERT INTO VAROS(id,nev) VALUES (1863,'Nagyrév');
INSERT INTO VAROS(id,nev) VALUES (1864,'Nagyrozvágy');
INSERT INTO VAROS(id,nev) VALUES (1865,'Nagysáp');
INSERT INTO VAROS(id,nev) VALUES (1866,'Nagysimonyi');
INSERT INTO VAROS(id,nev) VALUES (1867,'Nagyszakácsi');
INSERT INTO VAROS(id,nev) VALUES (1868,'Nagyszékely');
INSERT INTO VAROS(id,nev) VALUES (1869,'Nagyszekeres');
INSERT INTO VAROS(id,nev) VALUES (1870,'Nagyszénás');
INSERT INTO VAROS(id,nev) VALUES (1871,'Nagyszentjános');
INSERT INTO VAROS(id,nev) VALUES (1872,'Nagyszokoly');
INSERT INTO VAROS(id,nev) VALUES (1873,'Nagytálya');
INSERT INTO VAROS(id,nev) VALUES (1874,'Nagytarcsa');
INSERT INTO VAROS(id,nev) VALUES (1875,'Nagytevel');
INSERT INTO VAROS(id,nev) VALUES (1876,'Nagytilaj');
INSERT INTO VAROS(id,nev) VALUES (1877,'Nagytótfalu');
INSERT INTO VAROS(id,nev) VALUES (1878,'Nagytőke');
INSERT INTO VAROS(id,nev) VALUES (1879,'Nagyút');
INSERT INTO VAROS(id,nev) VALUES (1880,'Nagyvarsány');
INSERT INTO VAROS(id,nev) VALUES (1881,'Nagyváty');
INSERT INTO VAROS(id,nev) VALUES (1882,'Nagyvázsony');
INSERT INTO VAROS(id,nev) VALUES (1883,'Nagyvejke');
INSERT INTO VAROS(id,nev) VALUES (1884,'Nagyveleg');
INSERT INTO VAROS(id,nev) VALUES (1885,'Nagyvenyim');
INSERT INTO VAROS(id,nev) VALUES (1886,'Nagyvisnyó');
INSERT INTO VAROS(id,nev) VALUES (1887,'Nak');
INSERT INTO VAROS(id,nev) VALUES (1888,'Napkor');
INSERT INTO VAROS(id,nev) VALUES (1889,'Nárai');
INSERT INTO VAROS(id,nev) VALUES (1890,'Narda');
INSERT INTO VAROS(id,nev) VALUES (1891,'Naszály');
INSERT INTO VAROS(id,nev) VALUES (1892,'Négyes');
INSERT INTO VAROS(id,nev) VALUES (1893,'Nekézseny');
INSERT INTO VAROS(id,nev) VALUES (1894,'Nemesapáti');
INSERT INTO VAROS(id,nev) VALUES (1895,'Nemesbikk');
INSERT INTO VAROS(id,nev) VALUES (1896,'Nemesborzova');
INSERT INTO VAROS(id,nev) VALUES (1897,'Nemesbőd');
INSERT INTO VAROS(id,nev) VALUES (1898,'Nemesbük');
INSERT INTO VAROS(id,nev) VALUES (1899,'Nemescsó');
INSERT INTO VAROS(id,nev) VALUES (1900,'Nemesdéd');
INSERT INTO VAROS(id,nev) VALUES (1901,'Nemesgörzsöny');
INSERT INTO VAROS(id,nev) VALUES (1902,'Nemesgulács');
INSERT INTO VAROS(id,nev) VALUES (1903,'Nemeshany');
INSERT INTO VAROS(id,nev) VALUES (1904,'Nemeshetés');
INSERT INTO VAROS(id,nev) VALUES (1905,'Nemeske');
INSERT INTO VAROS(id,nev) VALUES (1906,'Nemeskér');
INSERT INTO VAROS(id,nev) VALUES (1907,'Nemeskeresztúr');
INSERT INTO VAROS(id,nev) VALUES (1908,'Nemeskisfalud');
INSERT INTO VAROS(id,nev) VALUES (1909,'Nemeskocs');
INSERT INTO VAROS(id,nev) VALUES (1910,'Nemeskolta');
INSERT INTO VAROS(id,nev) VALUES (1911,'Nemesládony');
INSERT INTO VAROS(id,nev) VALUES (1912,'Nemesmedves');
INSERT INTO VAROS(id,nev) VALUES (1913,'Nemesnádudvar');
INSERT INTO VAROS(id,nev) VALUES (1914,'Nemesnép');
INSERT INTO VAROS(id,nev) VALUES (1915,'Nemespátró');
INSERT INTO VAROS(id,nev) VALUES (1916,'Nemesrádó');
INSERT INTO VAROS(id,nev) VALUES (1917,'Nemesrempehollós');
INSERT INTO VAROS(id,nev) VALUES (1918,'Nemessándorháza');
INSERT INTO VAROS(id,nev) VALUES (1919,'Nemesvámos');
INSERT INTO VAROS(id,nev) VALUES (1920,'Nemesvid');
INSERT INTO VAROS(id,nev) VALUES (1921,'Nemesvita');
INSERT INTO VAROS(id,nev) VALUES (1922,'Nemesszalók');
INSERT INTO VAROS(id,nev) VALUES (1923,'Nemesszentandrás');
INSERT INTO VAROS(id,nev) VALUES (1924,'Németbánya');
INSERT INTO VAROS(id,nev) VALUES (1925,'Németfalu');
INSERT INTO VAROS(id,nev) VALUES (1926,'Németkér');
INSERT INTO VAROS(id,nev) VALUES (1927,'Nemti');
INSERT INTO VAROS(id,nev) VALUES (1928,'Neszmély');
INSERT INTO VAROS(id,nev) VALUES (1929,'Nézsa');
INSERT INTO VAROS(id,nev) VALUES (1930,'Nick');
INSERT INTO VAROS(id,nev) VALUES (1931,'Nikla');
INSERT INTO VAROS(id,nev) VALUES (1932,'Nógrád');
INSERT INTO VAROS(id,nev) VALUES (1933,'Nógrádkövesd');
INSERT INTO VAROS(id,nev) VALUES (1934,'Nógrádmarcal');
INSERT INTO VAROS(id,nev) VALUES (1935,'Nógrádmegyer');
INSERT INTO VAROS(id,nev) VALUES (1936,'Nógrádsáp');
INSERT INTO VAROS(id,nev) VALUES (1937,'Nógrádsipek');
INSERT INTO VAROS(id,nev) VALUES (1938,'Nógrádszakál');
INSERT INTO VAROS(id,nev) VALUES (1939,'Nóráp');
INSERT INTO VAROS(id,nev) VALUES (1940,'Noszlop');
INSERT INTO VAROS(id,nev) VALUES (1941,'Noszvaj');
INSERT INTO VAROS(id,nev) VALUES (1942,'Nova');
INSERT INTO VAROS(id,nev) VALUES (1943,'Novaj');
INSERT INTO VAROS(id,nev) VALUES (1944,'Novajidrány');
INSERT INTO VAROS(id,nev) VALUES (1945,'Nőtincs');
INSERT INTO VAROS(id,nev) VALUES (1946,'Nyalka');
INSERT INTO VAROS(id,nev) VALUES (1947,'Nyárád');
INSERT INTO VAROS(id,nev) VALUES (1948,'Nyáregyháza');
INSERT INTO VAROS(id,nev) VALUES (1949,'Nyárlőrinc');
INSERT INTO VAROS(id,nev) VALUES (1950,'Nyársapát');
INSERT INTO VAROS(id,nev) VALUES (1951,'Nyékládháza');
INSERT INTO VAROS(id,nev) VALUES (1952,'Nyergesújfalu');
INSERT INTO VAROS(id,nev) VALUES (1953,'Nyésta');
INSERT INTO VAROS(id,nev) VALUES (1954,'Nyim');
INSERT INTO VAROS(id,nev) VALUES (1955,'Nyírábrány');
INSERT INTO VAROS(id,nev) VALUES (1956,'Nyíracsád');
INSERT INTO VAROS(id,nev) VALUES (1957,'Nyirád');
INSERT INTO VAROS(id,nev) VALUES (1958,'Nyíradony');
INSERT INTO VAROS(id,nev) VALUES (1959,'Nyírbátor');
INSERT INTO VAROS(id,nev) VALUES (1960,'Nyírbéltek');
INSERT INTO VAROS(id,nev) VALUES (1961,'Nyírbogát');
INSERT INTO VAROS(id,nev) VALUES (1962,'Nyírbogdány');
INSERT INTO VAROS(id,nev) VALUES (1963,'Nyírcsaholy');
INSERT INTO VAROS(id,nev) VALUES (1964,'Nyírcsászári');
INSERT INTO VAROS(id,nev) VALUES (1965,'Nyírderzs');
INSERT INTO VAROS(id,nev) VALUES (1966,'Nyíregyháza');
INSERT INTO VAROS(id,nev) VALUES (1967,'Nyírgelse');
INSERT INTO VAROS(id,nev) VALUES (1968,'Nyírgyulaj');
INSERT INTO VAROS(id,nev) VALUES (1969,'Nyíri');
INSERT INTO VAROS(id,nev) VALUES (1970,'Nyíribrony');
INSERT INTO VAROS(id,nev) VALUES (1971,'Nyírjákó');
INSERT INTO VAROS(id,nev) VALUES (1972,'Nyírkarász');
INSERT INTO VAROS(id,nev) VALUES (1973,'Nyírkáta');
INSERT INTO VAROS(id,nev) VALUES (1974,'Nyírkércs');
INSERT INTO VAROS(id,nev) VALUES (1975,'Nyírlövő');
INSERT INTO VAROS(id,nev) VALUES (1976,'Nyírlugos');
INSERT INTO VAROS(id,nev) VALUES (1977,'Nyírmada');
INSERT INTO VAROS(id,nev) VALUES (1978,'Nyírmártonfalva');
INSERT INTO VAROS(id,nev) VALUES (1979,'Nyírmeggyes');
INSERT INTO VAROS(id,nev) VALUES (1980,'Nyírmihálydi');
INSERT INTO VAROS(id,nev) VALUES (1981,'Nyírparasznya');
INSERT INTO VAROS(id,nev) VALUES (1982,'Nyírpazony');
INSERT INTO VAROS(id,nev) VALUES (1983,'Nyírpilis');
INSERT INTO VAROS(id,nev) VALUES (1984,'Nyírtass');
INSERT INTO VAROS(id,nev) VALUES (1985,'Nyírtelek');
INSERT INTO VAROS(id,nev) VALUES (1986,'Nyírtét');
INSERT INTO VAROS(id,nev) VALUES (1987,'Nyírtura');
INSERT INTO VAROS(id,nev) VALUES (1988,'Nyírvasvári');
INSERT INTO VAROS(id,nev) VALUES (1989,'Nyomár');
INSERT INTO VAROS(id,nev) VALUES (1990,'Nyőgér');
INSERT INTO VAROS(id,nev) VALUES (1991,'Nyugotszenterzsébet');
INSERT INTO VAROS(id,nev) VALUES (1992,'Nyúl');
INSERT INTO VAROS(id,nev) VALUES (1993,'Óbánya');
INSERT INTO VAROS(id,nev) VALUES (1994,'Óbarok');
INSERT INTO VAROS(id,nev) VALUES (1995,'Óbudavár');
INSERT INTO VAROS(id,nev) VALUES (1996,'Ócsa');
INSERT INTO VAROS(id,nev) VALUES (1997,'Ócsárd');
INSERT INTO VAROS(id,nev) VALUES (1998,'Ófalu');
INSERT INTO VAROS(id,nev) VALUES (1999,'Ófehértó');
INSERT INTO VAROS(id,nev) VALUES (2000,'Óföldeák');
INSERT INTO VAROS(id,nev) VALUES (2001,'Óhíd');
INSERT INTO VAROS(id,nev) VALUES (2002,'Okány');
INSERT INTO VAROS(id,nev) VALUES (2003,'Okorág');
INSERT INTO VAROS(id,nev) VALUES (2004,'Okorvölgy');
INSERT INTO VAROS(id,nev) VALUES (2005,'Olasz');
INSERT INTO VAROS(id,nev) VALUES (2006,'Olaszfa');
INSERT INTO VAROS(id,nev) VALUES (2007,'Olaszfalu');
INSERT INTO VAROS(id,nev) VALUES (2008,'Olaszliszka');
INSERT INTO VAROS(id,nev) VALUES (2009,'Olcsva');
INSERT INTO VAROS(id,nev) VALUES (2010,'Olcsvaapáti');
INSERT INTO VAROS(id,nev) VALUES (2011,'Old');
INSERT INTO VAROS(id,nev) VALUES (2012,'Ólmod');
INSERT INTO VAROS(id,nev) VALUES (2013,'Oltárc');
INSERT INTO VAROS(id,nev) VALUES (2014,'Onga');
INSERT INTO VAROS(id,nev) VALUES (2015,'Ónod');
INSERT INTO VAROS(id,nev) VALUES (2016,'Ópályi');
INSERT INTO VAROS(id,nev) VALUES (2017,'Ópusztaszer');
INSERT INTO VAROS(id,nev) VALUES (2018,'Orbányosfa');
INSERT INTO VAROS(id,nev) VALUES (2019,'Orci');
INSERT INTO VAROS(id,nev) VALUES (2020,'Ordacsehi');
INSERT INTO VAROS(id,nev) VALUES (2021,'Ordas');
INSERT INTO VAROS(id,nev) VALUES (2022,'Orfalu');
INSERT INTO VAROS(id,nev) VALUES (2023,'Orfű');
INSERT INTO VAROS(id,nev) VALUES (2024,'Orgovány');
INSERT INTO VAROS(id,nev) VALUES (2025,'Ormándlak');
INSERT INTO VAROS(id,nev) VALUES (2026,'Ormosbánya');
INSERT INTO VAROS(id,nev) VALUES (2027,'Orosháza');
INSERT INTO VAROS(id,nev) VALUES (2028,'Oroszi');
INSERT INTO VAROS(id,nev) VALUES (2029,'Oroszlány');
INSERT INTO VAROS(id,nev) VALUES (2030,'Oroszló');
INSERT INTO VAROS(id,nev) VALUES (2031,'Orosztony');
INSERT INTO VAROS(id,nev) VALUES (2032,'Ortaháza');
INSERT INTO VAROS(id,nev) VALUES (2033,'Osli');
INSERT INTO VAROS(id,nev) VALUES (2034,'Ostffyasszonyfa');
INSERT INTO VAROS(id,nev) VALUES (2035,'Ostoros');
INSERT INTO VAROS(id,nev) VALUES (2036,'Oszkó');
INSERT INTO VAROS(id,nev) VALUES (2037,'Oszlár');
INSERT INTO VAROS(id,nev) VALUES (2038,'Osztopán');
INSERT INTO VAROS(id,nev) VALUES (2039,'Ózd');
INSERT INTO VAROS(id,nev) VALUES (2040,'Ózdfalu');
INSERT INTO VAROS(id,nev) VALUES (2041,'Ozmánbük');
INSERT INTO VAROS(id,nev) VALUES (2042,'Ozora');
INSERT INTO VAROS(id,nev) VALUES (2043,'Öcs');
INSERT INTO VAROS(id,nev) VALUES (2044,'Őcsény');
INSERT INTO VAROS(id,nev) VALUES (2045,'Öcsöd');
INSERT INTO VAROS(id,nev) VALUES (2046,'Ököritófülpös');
INSERT INTO VAROS(id,nev) VALUES (2047,'Ölbő');
INSERT INTO VAROS(id,nev) VALUES (2048,'Ömböly');
INSERT INTO VAROS(id,nev) VALUES (2049,'Őr');
INSERT INTO VAROS(id,nev) VALUES (2050,'Őrbottyán');
INSERT INTO VAROS(id,nev) VALUES (2051,'Öregcsertő');
INSERT INTO VAROS(id,nev) VALUES (2052,'Öreglak');
INSERT INTO VAROS(id,nev) VALUES (2053,'Őrhalom');
INSERT INTO VAROS(id,nev) VALUES (2054,'Őrimagyarósd');
INSERT INTO VAROS(id,nev) VALUES (2055,'Őriszentpéter');
INSERT INTO VAROS(id,nev) VALUES (2056,'Örkény');
INSERT INTO VAROS(id,nev) VALUES (2057,'Örményes');
INSERT INTO VAROS(id,nev) VALUES (2058,'Örménykút');
INSERT INTO VAROS(id,nev) VALUES (2059,'Őrtilos');
INSERT INTO VAROS(id,nev) VALUES (2060,'Örvényes');
INSERT INTO VAROS(id,nev) VALUES (2061,'Ősagárd');
INSERT INTO VAROS(id,nev) VALUES (2062,'Ősi');
INSERT INTO VAROS(id,nev) VALUES (2063,'Öskü');
INSERT INTO VAROS(id,nev) VALUES (2064,'Öttevény');
INSERT INTO VAROS(id,nev) VALUES (2065,'Öttömös');
INSERT INTO VAROS(id,nev) VALUES (2066,'Ötvöskónyi');
INSERT INTO VAROS(id,nev) VALUES (2067,'Pácin');
INSERT INTO VAROS(id,nev) VALUES (2068,'Pacsa');
INSERT INTO VAROS(id,nev) VALUES (2069,'Pácsony');
INSERT INTO VAROS(id,nev) VALUES (2070,'Padár');
INSERT INTO VAROS(id,nev) VALUES (2071,'Páhi');
INSERT INTO VAROS(id,nev) VALUES (2072,'Páka');
INSERT INTO VAROS(id,nev) VALUES (2073,'Pakod');
INSERT INTO VAROS(id,nev) VALUES (2074,'Pákozd');
INSERT INTO VAROS(id,nev) VALUES (2075,'Paks');
INSERT INTO VAROS(id,nev) VALUES (2076,'Palé');
INSERT INTO VAROS(id,nev) VALUES (2077,'Pálfa');
INSERT INTO VAROS(id,nev) VALUES (2078,'Pálfiszeg');
INSERT INTO VAROS(id,nev) VALUES (2079,'Pálháza');
INSERT INTO VAROS(id,nev) VALUES (2080,'Páli');
INSERT INTO VAROS(id,nev) VALUES (2081,'Palkonya');
INSERT INTO VAROS(id,nev) VALUES (2082,'Pálmajor');
INSERT INTO VAROS(id,nev) VALUES (2083,'Pálmonostora');
INSERT INTO VAROS(id,nev) VALUES (2084,'Pálosvörösmart');
INSERT INTO VAROS(id,nev) VALUES (2085,'Palotabozsok');
INSERT INTO VAROS(id,nev) VALUES (2086,'Palotás');
INSERT INTO VAROS(id,nev) VALUES (2087,'Paloznak');
INSERT INTO VAROS(id,nev) VALUES (2088,'Pamlény');
INSERT INTO VAROS(id,nev) VALUES (2089,'Pamuk');
INSERT INTO VAROS(id,nev) VALUES (2090,'Pánd');
INSERT INTO VAROS(id,nev) VALUES (2091,'Pankasz');
INSERT INTO VAROS(id,nev) VALUES (2092,'Pannonhalma');
INSERT INTO VAROS(id,nev) VALUES (2093,'Pányok');
INSERT INTO VAROS(id,nev) VALUES (2094,'Panyola');
INSERT INTO VAROS(id,nev) VALUES (2095,'Pap');
INSERT INTO VAROS(id,nev) VALUES (2096,'Pápa');
INSERT INTO VAROS(id,nev) VALUES (2097,'Pápadereske');
INSERT INTO VAROS(id,nev) VALUES (2098,'Pápakovácsi');
INSERT INTO VAROS(id,nev) VALUES (2099,'Pápasalamon');
INSERT INTO VAROS(id,nev) VALUES (2100,'Pápateszér');
INSERT INTO VAROS(id,nev) VALUES (2101,'Papkeszi');
INSERT INTO VAROS(id,nev) VALUES (2102,'Pápoc');
INSERT INTO VAROS(id,nev) VALUES (2103,'Papos');
INSERT INTO VAROS(id,nev) VALUES (2104,'Páprád');
INSERT INTO VAROS(id,nev) VALUES (2105,'Parád');
INSERT INTO VAROS(id,nev) VALUES (2106,'Parádsasvár');
INSERT INTO VAROS(id,nev) VALUES (2107,'Parasznya');
INSERT INTO VAROS(id,nev) VALUES (2108,'Pári');
INSERT INTO VAROS(id,nev) VALUES (2109,'Paszab');
INSERT INTO VAROS(id,nev) VALUES (2110,'Pásztó');
INSERT INTO VAROS(id,nev) VALUES (2111,'Pásztori');
INSERT INTO VAROS(id,nev) VALUES (2112,'Pat');
INSERT INTO VAROS(id,nev) VALUES (2113,'Patak');
INSERT INTO VAROS(id,nev) VALUES (2114,'Patalom');
INSERT INTO VAROS(id,nev) VALUES (2115,'Patapoklosi');
INSERT INTO VAROS(id,nev) VALUES (2116,'Patca');
INSERT INTO VAROS(id,nev) VALUES (2117,'Pátka');
INSERT INTO VAROS(id,nev) VALUES (2118,'Patosfa');
INSERT INTO VAROS(id,nev) VALUES (2119,'Pátroha');
INSERT INTO VAROS(id,nev) VALUES (2120,'Patvarc');
INSERT INTO VAROS(id,nev) VALUES (2121,'Páty');
INSERT INTO VAROS(id,nev) VALUES (2122,'Pátyod');
INSERT INTO VAROS(id,nev) VALUES (2123,'Pázmánd');
INSERT INTO VAROS(id,nev) VALUES (2124,'Pázmándfalu');
INSERT INTO VAROS(id,nev) VALUES (2125,'Pécel');
INSERT INTO VAROS(id,nev) VALUES (2126,'Pecöl');
INSERT INTO VAROS(id,nev) VALUES (2127,'Pécs');
INSERT INTO VAROS(id,nev) VALUES (2128,'Pécsbagota');
INSERT INTO VAROS(id,nev) VALUES (2129,'Pécsdevecser');
INSERT INTO VAROS(id,nev) VALUES (2130,'Pécsely');
INSERT INTO VAROS(id,nev) VALUES (2131,'Pécsudvard');
INSERT INTO VAROS(id,nev) VALUES (2132,'Pécsvárad');
INSERT INTO VAROS(id,nev) VALUES (2133,'Pellérd');
INSERT INTO VAROS(id,nev) VALUES (2134,'Pély');
INSERT INTO VAROS(id,nev) VALUES (2135,'Penc');
INSERT INTO VAROS(id,nev) VALUES (2136,'Penészlek');
INSERT INTO VAROS(id,nev) VALUES (2137,'Pénzesgyőr');
INSERT INTO VAROS(id,nev) VALUES (2138,'Penyige');
INSERT INTO VAROS(id,nev) VALUES (2139,'Pér');
INSERT INTO VAROS(id,nev) VALUES (2140,'Perbál');
INSERT INTO VAROS(id,nev) VALUES (2141,'Pere');
INSERT INTO VAROS(id,nev) VALUES (2142,'Perecse');
INSERT INTO VAROS(id,nev) VALUES (2143,'Pereked');
INSERT INTO VAROS(id,nev) VALUES (2144,'Perenye');
INSERT INTO VAROS(id,nev) VALUES (2145,'Peresznye');
INSERT INTO VAROS(id,nev) VALUES (2146,'Pereszteg');
INSERT INTO VAROS(id,nev) VALUES (2147,'Perkáta');
INSERT INTO VAROS(id,nev) VALUES (2148,'Perkupa');
INSERT INTO VAROS(id,nev) VALUES (2149,'Perőcsény');
INSERT INTO VAROS(id,nev) VALUES (2150,'Peterd');
INSERT INTO VAROS(id,nev) VALUES (2151,'Péterhida');
INSERT INTO VAROS(id,nev) VALUES (2152,'Péteri');
INSERT INTO VAROS(id,nev) VALUES (2153,'Pétervására');
INSERT INTO VAROS(id,nev) VALUES (2154,'Pétfürdő');
INSERT INTO VAROS(id,nev) VALUES (2155,'Pethőhenye');
INSERT INTO VAROS(id,nev) VALUES (2156,'Petneháza');
INSERT INTO VAROS(id,nev) VALUES (2157,'Petőfibánya');
INSERT INTO VAROS(id,nev) VALUES (2158,'Petőfiszállás');
INSERT INTO VAROS(id,nev) VALUES (2159,'Petőháza');
INSERT INTO VAROS(id,nev) VALUES (2160,'Petőmihályfa');
INSERT INTO VAROS(id,nev) VALUES (2161,'Petrikeresztúr');
INSERT INTO VAROS(id,nev) VALUES (2162,'Petrivente');
INSERT INTO VAROS(id,nev) VALUES (2163,'Pettend');
INSERT INTO VAROS(id,nev) VALUES (2164,'Piliny');
INSERT INTO VAROS(id,nev) VALUES (2165,'Pilis');
INSERT INTO VAROS(id,nev) VALUES (2166,'Pilisborosjenő');
INSERT INTO VAROS(id,nev) VALUES (2167,'Piliscsaba');
INSERT INTO VAROS(id,nev) VALUES (2168,'Piliscsév');
INSERT INTO VAROS(id,nev) VALUES (2169,'Pilisjászfalu');
INSERT INTO VAROS(id,nev) VALUES (2170,'Pilismarót');
INSERT INTO VAROS(id,nev) VALUES (2171,'Pilisvörösvár');
INSERT INTO VAROS(id,nev) VALUES (2172,'Pilisszántó');
INSERT INTO VAROS(id,nev) VALUES (2173,'Pilisszentiván');
INSERT INTO VAROS(id,nev) VALUES (2174,'Pilisszentkereszt');
INSERT INTO VAROS(id,nev) VALUES (2175,'Pilisszentlászló');
INSERT INTO VAROS(id,nev) VALUES (2176,'Pincehely');
INSERT INTO VAROS(id,nev) VALUES (2177,'Pinkamindszent');
INSERT INTO VAROS(id,nev) VALUES (2178,'Pinnye');
INSERT INTO VAROS(id,nev) VALUES (2179,'Piricse');
INSERT INTO VAROS(id,nev) VALUES (2180,'Pirtó');
INSERT INTO VAROS(id,nev) VALUES (2181,'Piskó');
INSERT INTO VAROS(id,nev) VALUES (2182,'Pitvaros');
INSERT INTO VAROS(id,nev) VALUES (2183,'Pócsa');
INSERT INTO VAROS(id,nev) VALUES (2184,'Pocsaj');
INSERT INTO VAROS(id,nev) VALUES (2185,'Pócsmegyer');
INSERT INTO VAROS(id,nev) VALUES (2186,'Pócspetri');
INSERT INTO VAROS(id,nev) VALUES (2187,'Pogány');
INSERT INTO VAROS(id,nev) VALUES (2188,'Pogányszentpéter');
INSERT INTO VAROS(id,nev) VALUES (2189,'Pókaszepetk');
INSERT INTO VAROS(id,nev) VALUES (2190,'Polány');
INSERT INTO VAROS(id,nev) VALUES (2191,'Polgár');
INSERT INTO VAROS(id,nev) VALUES (2192,'Polgárdi');
INSERT INTO VAROS(id,nev) VALUES (2193,'Pomáz');
INSERT INTO VAROS(id,nev) VALUES (2194,'Porcsalma');
INSERT INTO VAROS(id,nev) VALUES (2195,'Pornóapáti');
INSERT INTO VAROS(id,nev) VALUES (2196,'Poroszló');
INSERT INTO VAROS(id,nev) VALUES (2197,'Porpác');
INSERT INTO VAROS(id,nev) VALUES (2198,'Porrog');
INSERT INTO VAROS(id,nev) VALUES (2199,'Porrogszentkirály');
INSERT INTO VAROS(id,nev) VALUES (2200,'Porrogszentpál');
INSERT INTO VAROS(id,nev) VALUES (2201,'Pórszombat');
INSERT INTO VAROS(id,nev) VALUES (2202,'Porva');
INSERT INTO VAROS(id,nev) VALUES (2203,'Pósfa');
INSERT INTO VAROS(id,nev) VALUES (2204,'Potony');
INSERT INTO VAROS(id,nev) VALUES (2205,'Potyond');
INSERT INTO VAROS(id,nev) VALUES (2206,'Pölöske');
INSERT INTO VAROS(id,nev) VALUES (2207,'Pölöskefő');
INSERT INTO VAROS(id,nev) VALUES (2208,'Pörböly');
INSERT INTO VAROS(id,nev) VALUES (2209,'Pördefölde');
INSERT INTO VAROS(id,nev) VALUES (2210,'Pötréte');
INSERT INTO VAROS(id,nev) VALUES (2211,'Prügy');
INSERT INTO VAROS(id,nev) VALUES (2212,'Pula');
INSERT INTO VAROS(id,nev) VALUES (2213,'Pusztaapáti');
INSERT INTO VAROS(id,nev) VALUES (2214,'Pusztaberki');
INSERT INTO VAROS(id,nev) VALUES (2215,'Pusztacsalád');
INSERT INTO VAROS(id,nev) VALUES (2216,'Pusztacsó');
INSERT INTO VAROS(id,nev) VALUES (2217,'Pusztadobos');
INSERT INTO VAROS(id,nev) VALUES (2218,'Pusztaederics');
INSERT INTO VAROS(id,nev) VALUES (2219,'Pusztafalu');
INSERT INTO VAROS(id,nev) VALUES (2220,'Pusztaföldvár');
INSERT INTO VAROS(id,nev) VALUES (2221,'Pusztahencse');
INSERT INTO VAROS(id,nev) VALUES (2222,'Pusztakovácsi');
INSERT INTO VAROS(id,nev) VALUES (2223,'Pusztamagyaród');
INSERT INTO VAROS(id,nev) VALUES (2224,'Pusztamérges');
INSERT INTO VAROS(id,nev) VALUES (2225,'Pusztamiske');
INSERT INTO VAROS(id,nev) VALUES (2226,'Pusztamonostor');
INSERT INTO VAROS(id,nev) VALUES (2227,'Pusztaottlaka');
INSERT INTO VAROS(id,nev) VALUES (2228,'Pusztaradvány');
INSERT INTO VAROS(id,nev) VALUES (2229,'Pusztaszabolcs');
INSERT INTO VAROS(id,nev) VALUES (2230,'Pusztaszemes');
INSERT INTO VAROS(id,nev) VALUES (2231,'Pusztaszentlászló');
INSERT INTO VAROS(id,nev) VALUES (2232,'Pusztaszer');
INSERT INTO VAROS(id,nev) VALUES (2233,'Pusztavacs');
INSERT INTO VAROS(id,nev) VALUES (2234,'Pusztavám');
INSERT INTO VAROS(id,nev) VALUES (2235,'Pusztazámor');
INSERT INTO VAROS(id,nev) VALUES (2236,'Putnok');
INSERT INTO VAROS(id,nev) VALUES (2237,'Püski');
INSERT INTO VAROS(id,nev) VALUES (2238,'Püspökhatvan');
INSERT INTO VAROS(id,nev) VALUES (2239,'Püspökladány');
INSERT INTO VAROS(id,nev) VALUES (2240,'Püspökmolnári');
INSERT INTO VAROS(id,nev) VALUES (2241,'Püspökszilágy');
INSERT INTO VAROS(id,nev) VALUES (2242,'Rábacsanak');
INSERT INTO VAROS(id,nev) VALUES (2243,'Rábacsécsény');
INSERT INTO VAROS(id,nev) VALUES (2244,'Rábagyarmat');
INSERT INTO VAROS(id,nev) VALUES (2245,'Rábahídvég');
INSERT INTO VAROS(id,nev) VALUES (2246,'Rábakecöl');
INSERT INTO VAROS(id,nev) VALUES (2247,'Rábapatona');
INSERT INTO VAROS(id,nev) VALUES (2248,'Rábapaty');
INSERT INTO VAROS(id,nev) VALUES (2249,'Rábapordány');
INSERT INTO VAROS(id,nev) VALUES (2250,'Rábasebes');
INSERT INTO VAROS(id,nev) VALUES (2251,'Rábaszentandrás');
INSERT INTO VAROS(id,nev) VALUES (2252,'Rábaszentmihály');
INSERT INTO VAROS(id,nev) VALUES (2253,'Rábaszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (2254,'Rábatamási');
INSERT INTO VAROS(id,nev) VALUES (2255,'Rábatöttös');
INSERT INTO VAROS(id,nev) VALUES (2256,'Rábcakapi');
INSERT INTO VAROS(id,nev) VALUES (2257,'Rácalmás');
INSERT INTO VAROS(id,nev) VALUES (2258,'Ráckeresztúr');
INSERT INTO VAROS(id,nev) VALUES (2259,'Ráckeve');
INSERT INTO VAROS(id,nev) VALUES (2260,'Rád');
INSERT INTO VAROS(id,nev) VALUES (2261,'Rádfalva');
INSERT INTO VAROS(id,nev) VALUES (2262,'Rádóckölked');
INSERT INTO VAROS(id,nev) VALUES (2263,'Radostyán');
INSERT INTO VAROS(id,nev) VALUES (2264,'Ragály');
INSERT INTO VAROS(id,nev) VALUES (2265,'Rajka');
INSERT INTO VAROS(id,nev) VALUES (2266,'Rakaca');
INSERT INTO VAROS(id,nev) VALUES (2267,'Rakacaszend');
INSERT INTO VAROS(id,nev) VALUES (2268,'Rakamaz');
INSERT INTO VAROS(id,nev) VALUES (2269,'Rákóczibánya');
INSERT INTO VAROS(id,nev) VALUES (2270,'Rákóczifalva');
INSERT INTO VAROS(id,nev) VALUES (2271,'Rákócziújfalu');
INSERT INTO VAROS(id,nev) VALUES (2272,'Ráksi');
INSERT INTO VAROS(id,nev) VALUES (2273,'Ramocsa');
INSERT INTO VAROS(id,nev) VALUES (2274,'Ramocsaháza');
INSERT INTO VAROS(id,nev) VALUES (2275,'Rápolt');
INSERT INTO VAROS(id,nev) VALUES (2276,'Raposka');
INSERT INTO VAROS(id,nev) VALUES (2277,'Rásonysápberencs');
INSERT INTO VAROS(id,nev) VALUES (2278,'Rátka');
INSERT INTO VAROS(id,nev) VALUES (2279,'Rátót');
INSERT INTO VAROS(id,nev) VALUES (2280,'Ravazd');
INSERT INTO VAROS(id,nev) VALUES (2281,'Recsk');
INSERT INTO VAROS(id,nev) VALUES (2282,'Réde');
INSERT INTO VAROS(id,nev) VALUES (2283,'Rédics');
INSERT INTO VAROS(id,nev) VALUES (2284,'Regéc');
INSERT INTO VAROS(id,nev) VALUES (2285,'Regenye');
INSERT INTO VAROS(id,nev) VALUES (2286,'Regöly');
INSERT INTO VAROS(id,nev) VALUES (2287,'Rém');
INSERT INTO VAROS(id,nev) VALUES (2288,'Remeteszőlős');
INSERT INTO VAROS(id,nev) VALUES (2289,'Répáshuta');
INSERT INTO VAROS(id,nev) VALUES (2290,'Répcelak');
INSERT INTO VAROS(id,nev) VALUES (2291,'Répceszemere');
INSERT INTO VAROS(id,nev) VALUES (2292,'Répceszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (2293,'Répcevis');
INSERT INTO VAROS(id,nev) VALUES (2294,'Resznek');
INSERT INTO VAROS(id,nev) VALUES (2295,'Rétalap');
INSERT INTO VAROS(id,nev) VALUES (2296,'Rétközberencs');
INSERT INTO VAROS(id,nev) VALUES (2297,'Rétság');
INSERT INTO VAROS(id,nev) VALUES (2298,'Révfülöp');
INSERT INTO VAROS(id,nev) VALUES (2299,'Révleányvár');
INSERT INTO VAROS(id,nev) VALUES (2300,'Rezi');
INSERT INTO VAROS(id,nev) VALUES (2301,'Ricse');
INSERT INTO VAROS(id,nev) VALUES (2302,'Rigács');
INSERT INTO VAROS(id,nev) VALUES (2303,'Rigyác');
INSERT INTO VAROS(id,nev) VALUES (2304,'Rimóc');
INSERT INTO VAROS(id,nev) VALUES (2305,'Rinyabesenyő');
INSERT INTO VAROS(id,nev) VALUES (2306,'Rinyakovácsi');
INSERT INTO VAROS(id,nev) VALUES (2307,'Rinyaszentkirály');
INSERT INTO VAROS(id,nev) VALUES (2308,'Rinyaújlak');
INSERT INTO VAROS(id,nev) VALUES (2309,'Rinyaújnép');
INSERT INTO VAROS(id,nev) VALUES (2310,'Rohod');
INSERT INTO VAROS(id,nev) VALUES (2311,'Románd');
INSERT INTO VAROS(id,nev) VALUES (2312,'Romhány');
INSERT INTO VAROS(id,nev) VALUES (2313,'Romonya');
INSERT INTO VAROS(id,nev) VALUES (2314,'Rózsafa');
INSERT INTO VAROS(id,nev) VALUES (2315,'Rozsály');
INSERT INTO VAROS(id,nev) VALUES (2316,'Rózsaszentmárton');
INSERT INTO VAROS(id,nev) VALUES (2317,'Röjtökmuzsaj');
INSERT INTO VAROS(id,nev) VALUES (2318,'Rönök');
INSERT INTO VAROS(id,nev) VALUES (2319,'Röszke');
INSERT INTO VAROS(id,nev) VALUES (2320,'Rudabánya');
INSERT INTO VAROS(id,nev) VALUES (2321,'Rudolftelep');
INSERT INTO VAROS(id,nev) VALUES (2322,'Rum');
INSERT INTO VAROS(id,nev) VALUES (2323,'Ruzsa');
INSERT INTO VAROS(id,nev) VALUES (2324,'Ságújfalu');
INSERT INTO VAROS(id,nev) VALUES (2325,'Ságvár');
INSERT INTO VAROS(id,nev) VALUES (2326,'Sajóbábony');
INSERT INTO VAROS(id,nev) VALUES (2327,'Sajóecseg');
INSERT INTO VAROS(id,nev) VALUES (2328,'Sajógalgóc');
INSERT INTO VAROS(id,nev) VALUES (2329,'Sajóhídvég');
INSERT INTO VAROS(id,nev) VALUES (2330,'Sajóivánka');
INSERT INTO VAROS(id,nev) VALUES (2331,'Sajókápolna');
INSERT INTO VAROS(id,nev) VALUES (2332,'Sajókaza');
INSERT INTO VAROS(id,nev) VALUES (2333,'Sajókeresztúr');
INSERT INTO VAROS(id,nev) VALUES (2334,'Sajólád');
INSERT INTO VAROS(id,nev) VALUES (2335,'Sajólászlófalva');
INSERT INTO VAROS(id,nev) VALUES (2336,'Sajómercse');
INSERT INTO VAROS(id,nev) VALUES (2337,'Sajónémeti');
INSERT INTO VAROS(id,nev) VALUES (2338,'Sajóörös');
INSERT INTO VAROS(id,nev) VALUES (2339,'Sajópálfala');
INSERT INTO VAROS(id,nev) VALUES (2340,'Sajópetri');
INSERT INTO VAROS(id,nev) VALUES (2341,'Sajópüspöki');
INSERT INTO VAROS(id,nev) VALUES (2342,'Sajósenye');
INSERT INTO VAROS(id,nev) VALUES (2343,'Sajószentpéter');
INSERT INTO VAROS(id,nev) VALUES (2344,'Sajószöged');
INSERT INTO VAROS(id,nev) VALUES (2345,'Sajóvámos');
INSERT INTO VAROS(id,nev) VALUES (2346,'Sajóvelezd');
INSERT INTO VAROS(id,nev) VALUES (2347,'Sajtoskál');
INSERT INTO VAROS(id,nev) VALUES (2348,'Salföld');
INSERT INTO VAROS(id,nev) VALUES (2349,'Salgótarján');
INSERT INTO VAROS(id,nev) VALUES (2350,'Salköveskút');
INSERT INTO VAROS(id,nev) VALUES (2351,'Salomvár');
INSERT INTO VAROS(id,nev) VALUES (2352,'Sály');
INSERT INTO VAROS(id,nev) VALUES (2353,'Sámod');
INSERT INTO VAROS(id,nev) VALUES (2354,'Sámsonháza');
INSERT INTO VAROS(id,nev) VALUES (2355,'Sand');
INSERT INTO VAROS(id,nev) VALUES (2356,'Sándorfalva');
INSERT INTO VAROS(id,nev) VALUES (2357,'Sántos');
INSERT INTO VAROS(id,nev) VALUES (2358,'Sáp');
INSERT INTO VAROS(id,nev) VALUES (2359,'Sáránd');
INSERT INTO VAROS(id,nev) VALUES (2360,'Sárazsadány');
INSERT INTO VAROS(id,nev) VALUES (2361,'Sárbogárd');
INSERT INTO VAROS(id,nev) VALUES (2362,'Sáregres');
INSERT INTO VAROS(id,nev) VALUES (2363,'Sárfimizdó');
INSERT INTO VAROS(id,nev) VALUES (2364,'Sárhida');
INSERT INTO VAROS(id,nev) VALUES (2365,'Sárisáp');
INSERT INTO VAROS(id,nev) VALUES (2366,'Sarkad');
INSERT INTO VAROS(id,nev) VALUES (2367,'Sarkadkeresztúr');
INSERT INTO VAROS(id,nev) VALUES (2368,'Sárkeresztes');
INSERT INTO VAROS(id,nev) VALUES (2369,'Sárkeresztúr');
INSERT INTO VAROS(id,nev) VALUES (2370,'Sárkeszi');
INSERT INTO VAROS(id,nev) VALUES (2371,'Sármellék');
INSERT INTO VAROS(id,nev) VALUES (2372,'Sárok');
INSERT INTO VAROS(id,nev) VALUES (2373,'Sárosd');
INSERT INTO VAROS(id,nev) VALUES (2374,'Sárospatak');
INSERT INTO VAROS(id,nev) VALUES (2375,'Sárpilis');
INSERT INTO VAROS(id,nev) VALUES (2376,'Sárrétudvari');
INSERT INTO VAROS(id,nev) VALUES (2377,'Sarród');
INSERT INTO VAROS(id,nev) VALUES (2378,'Sárszentágota');
INSERT INTO VAROS(id,nev) VALUES (2379,'Sárszentlőrinc');
INSERT INTO VAROS(id,nev) VALUES (2380,'Sárszentmihály');
INSERT INTO VAROS(id,nev) VALUES (2381,'Sarud');
INSERT INTO VAROS(id,nev) VALUES (2382,'Sárvár');
INSERT INTO VAROS(id,nev) VALUES (2383,'Sásd');
INSERT INTO VAROS(id,nev) VALUES (2384,'Sáska');
INSERT INTO VAROS(id,nev) VALUES (2385,'Sáta');
INSERT INTO VAROS(id,nev) VALUES (2386,'Sátoraljaújhely');
INSERT INTO VAROS(id,nev) VALUES (2387,'Sátorhely');
INSERT INTO VAROS(id,nev) VALUES (2388,'Sávoly');
INSERT INTO VAROS(id,nev) VALUES (2389,'Sé');
INSERT INTO VAROS(id,nev) VALUES (2390,'Segesd');
INSERT INTO VAROS(id,nev) VALUES (2391,'Selyeb');
INSERT INTO VAROS(id,nev) VALUES (2392,'Sellye');
INSERT INTO VAROS(id,nev) VALUES (2393,'Semjén');
INSERT INTO VAROS(id,nev) VALUES (2394,'Semjénháza');
INSERT INTO VAROS(id,nev) VALUES (2395,'Sénye');
INSERT INTO VAROS(id,nev) VALUES (2396,'Sényő');
INSERT INTO VAROS(id,nev) VALUES (2397,'Seregélyes');
INSERT INTO VAROS(id,nev) VALUES (2398,'Serényfalva');
INSERT INTO VAROS(id,nev) VALUES (2399,'Sérsekszőlős');
INSERT INTO VAROS(id,nev) VALUES (2400,'Sikátor');
INSERT INTO VAROS(id,nev) VALUES (2401,'Siklós');
INSERT INTO VAROS(id,nev) VALUES (2402,'Siklósbodony');
INSERT INTO VAROS(id,nev) VALUES (2403,'Siklósnagyfalu');
INSERT INTO VAROS(id,nev) VALUES (2404,'Sima');
INSERT INTO VAROS(id,nev) VALUES (2405,'Simaság');
INSERT INTO VAROS(id,nev) VALUES (2406,'Simonfa');
INSERT INTO VAROS(id,nev) VALUES (2407,'Simontornya');
INSERT INTO VAROS(id,nev) VALUES (2408,'Sióagárd');
INSERT INTO VAROS(id,nev) VALUES (2409,'Siófok');
INSERT INTO VAROS(id,nev) VALUES (2410,'Siójut');
INSERT INTO VAROS(id,nev) VALUES (2411,'Sirok');
INSERT INTO VAROS(id,nev) VALUES (2412,'Sitke');
INSERT INTO VAROS(id,nev) VALUES (2413,'Sobor');
INSERT INTO VAROS(id,nev) VALUES (2414,'Sokorópátka');
INSERT INTO VAROS(id,nev) VALUES (2415,'Solt');
INSERT INTO VAROS(id,nev) VALUES (2416,'Soltszentimre');
INSERT INTO VAROS(id,nev) VALUES (2417,'Soltvadkert');
INSERT INTO VAROS(id,nev) VALUES (2418,'Sóly');
INSERT INTO VAROS(id,nev) VALUES (2419,'Solymár');
INSERT INTO VAROS(id,nev) VALUES (2420,'Som');
INSERT INTO VAROS(id,nev) VALUES (2421,'Somberek');
INSERT INTO VAROS(id,nev) VALUES (2422,'Somlójenő');
INSERT INTO VAROS(id,nev) VALUES (2423,'Somlószőlős');
INSERT INTO VAROS(id,nev) VALUES (2424,'Somlóvásárhely');
INSERT INTO VAROS(id,nev) VALUES (2425,'Somlóvecse');
INSERT INTO VAROS(id,nev) VALUES (2426,'Somodor');
INSERT INTO VAROS(id,nev) VALUES (2427,'Somogyacsa');
INSERT INTO VAROS(id,nev) VALUES (2428,'Somogyapáti');
INSERT INTO VAROS(id,nev) VALUES (2429,'Somogyaracs');
INSERT INTO VAROS(id,nev) VALUES (2430,'Somogyaszaló');
INSERT INTO VAROS(id,nev) VALUES (2431,'Somogybabod');
INSERT INTO VAROS(id,nev) VALUES (2432,'Somogybükkösd');
INSERT INTO VAROS(id,nev) VALUES (2433,'Somogycsicsó');
INSERT INTO VAROS(id,nev) VALUES (2434,'Somogydöröcske');
INSERT INTO VAROS(id,nev) VALUES (2435,'Somogyegres');
INSERT INTO VAROS(id,nev) VALUES (2436,'Somogyfajsz');
INSERT INTO VAROS(id,nev) VALUES (2437,'Somogygeszti');
INSERT INTO VAROS(id,nev) VALUES (2438,'Somogyhárságy');
INSERT INTO VAROS(id,nev) VALUES (2439,'Somogyhatvan');
INSERT INTO VAROS(id,nev) VALUES (2440,'Somogyjád');
INSERT INTO VAROS(id,nev) VALUES (2441,'Somogymeggyes');
INSERT INTO VAROS(id,nev) VALUES (2442,'Somogysámson');
INSERT INTO VAROS(id,nev) VALUES (2443,'Somogysárd');
INSERT INTO VAROS(id,nev) VALUES (2444,'Somogysimonyi');
INSERT INTO VAROS(id,nev) VALUES (2445,'Somogyszentpál');
INSERT INTO VAROS(id,nev) VALUES (2446,'Somogyszil');
INSERT INTO VAROS(id,nev) VALUES (2447,'Somogyszob');
INSERT INTO VAROS(id,nev) VALUES (2448,'Somogytúr');
INSERT INTO VAROS(id,nev) VALUES (2449,'Somogyudvarhely');
INSERT INTO VAROS(id,nev) VALUES (2450,'Somogyvámos');
INSERT INTO VAROS(id,nev) VALUES (2451,'Somogyvár');
INSERT INTO VAROS(id,nev) VALUES (2452,'Somogyviszló');
INSERT INTO VAROS(id,nev) VALUES (2453,'Somogyzsitfa');
INSERT INTO VAROS(id,nev) VALUES (2454,'Somoskőújfalu');
INSERT INTO VAROS(id,nev) VALUES (2455,'Sonkád');
INSERT INTO VAROS(id,nev) VALUES (2456,'Soponya');
INSERT INTO VAROS(id,nev) VALUES (2457,'Sopron');
INSERT INTO VAROS(id,nev) VALUES (2458,'Sopronhorpács');
INSERT INTO VAROS(id,nev) VALUES (2459,'Sopronkövesd');
INSERT INTO VAROS(id,nev) VALUES (2460,'Sopronnémeti');
INSERT INTO VAROS(id,nev) VALUES (2461,'Sorkifalud');
INSERT INTO VAROS(id,nev) VALUES (2462,'Sorkikápolna');
INSERT INTO VAROS(id,nev) VALUES (2463,'Sormás');
INSERT INTO VAROS(id,nev) VALUES (2464,'Sorokpolány');
INSERT INTO VAROS(id,nev) VALUES (2465,'Sóshartyán');
INSERT INTO VAROS(id,nev) VALUES (2466,'Sóskút');
INSERT INTO VAROS(id,nev) VALUES (2467,'Sóstófalva');
INSERT INTO VAROS(id,nev) VALUES (2468,'Sósvertike');
INSERT INTO VAROS(id,nev) VALUES (2469,'Sótony');
INSERT INTO VAROS(id,nev) VALUES (2470,'Söjtör');
INSERT INTO VAROS(id,nev) VALUES (2471,'Söpte');
INSERT INTO VAROS(id,nev) VALUES (2472,'Söréd');
INSERT INTO VAROS(id,nev) VALUES (2473,'Sukoró');
INSERT INTO VAROS(id,nev) VALUES (2474,'Sumony');
INSERT INTO VAROS(id,nev) VALUES (2475,'Súr');
INSERT INTO VAROS(id,nev) VALUES (2476,'Surd');
INSERT INTO VAROS(id,nev) VALUES (2477,'Sükösd');
INSERT INTO VAROS(id,nev) VALUES (2478,'Sülysáp');
INSERT INTO VAROS(id,nev) VALUES (2479,'Sümeg');
INSERT INTO VAROS(id,nev) VALUES (2480,'Sümegcsehi');
INSERT INTO VAROS(id,nev) VALUES (2481,'Sümegprága');
INSERT INTO VAROS(id,nev) VALUES (2482,'Süttő');
INSERT INTO VAROS(id,nev) VALUES (2483,'Szabadbattyán');
INSERT INTO VAROS(id,nev) VALUES (2484,'Szabadegyháza');
INSERT INTO VAROS(id,nev) VALUES (2485,'Szabadhídvég');
INSERT INTO VAROS(id,nev) VALUES (2486,'Szabadi');
INSERT INTO VAROS(id,nev) VALUES (2487,'Szabadkígyós');
INSERT INTO VAROS(id,nev) VALUES (2488,'Szabadszállás');
INSERT INTO VAROS(id,nev) VALUES (2489,'Szabadszentkirály');
INSERT INTO VAROS(id,nev) VALUES (2490,'Szabás');
INSERT INTO VAROS(id,nev) VALUES (2491,'Szabolcs');
INSERT INTO VAROS(id,nev) VALUES (2492,'Szabolcsbáka');
INSERT INTO VAROS(id,nev) VALUES (2493,'Szabolcsveresmart');
INSERT INTO VAROS(id,nev) VALUES (2494,'Szada');
INSERT INTO VAROS(id,nev) VALUES (2495,'Szágy');
INSERT INTO VAROS(id,nev) VALUES (2496,'Szajk');
INSERT INTO VAROS(id,nev) VALUES (2497,'Szajla');
INSERT INTO VAROS(id,nev) VALUES (2498,'Szajol');
INSERT INTO VAROS(id,nev) VALUES (2499,'Szakácsi');
INSERT INTO VAROS(id,nev) VALUES (2500,'Szakadát');
INSERT INTO VAROS(id,nev) VALUES (2501,'Szakáld');
INSERT INTO VAROS(id,nev) VALUES (2502,'Szakály');
INSERT INTO VAROS(id,nev) VALUES (2503,'Szakcs');
INSERT INTO VAROS(id,nev) VALUES (2504,'Szakmár');
INSERT INTO VAROS(id,nev) VALUES (2505,'Szaknyér');
INSERT INTO VAROS(id,nev) VALUES (2506,'Szakoly');
INSERT INTO VAROS(id,nev) VALUES (2507,'Szakony');
INSERT INTO VAROS(id,nev) VALUES (2508,'Szakonyfalu');
INSERT INTO VAROS(id,nev) VALUES (2509,'Szákszend');
INSERT INTO VAROS(id,nev) VALUES (2510,'Szalafő');
INSERT INTO VAROS(id,nev) VALUES (2511,'Szalánta');
INSERT INTO VAROS(id,nev) VALUES (2512,'Szalapa');
INSERT INTO VAROS(id,nev) VALUES (2513,'Szalaszend');
INSERT INTO VAROS(id,nev) VALUES (2514,'Szalatnak');
INSERT INTO VAROS(id,nev) VALUES (2515,'Szálka');
INSERT INTO VAROS(id,nev) VALUES (2516,'Szalkszentmárton');
INSERT INTO VAROS(id,nev) VALUES (2517,'Szalmatercs');
INSERT INTO VAROS(id,nev) VALUES (2518,'Szalonna');
INSERT INTO VAROS(id,nev) VALUES (2519,'Szamosangyalos');
INSERT INTO VAROS(id,nev) VALUES (2520,'Szamosbecs');
INSERT INTO VAROS(id,nev) VALUES (2521,'Szamoskér');
INSERT INTO VAROS(id,nev) VALUES (2522,'Szamossályi');
INSERT INTO VAROS(id,nev) VALUES (2523,'Szamostatárfalva');
INSERT INTO VAROS(id,nev) VALUES (2524,'Szamosújlak');
INSERT INTO VAROS(id,nev) VALUES (2525,'Szamosszeg');
INSERT INTO VAROS(id,nev) VALUES (2526,'Szanda');
INSERT INTO VAROS(id,nev) VALUES (2527,'Szank');
INSERT INTO VAROS(id,nev) VALUES (2528,'Szántód');
INSERT INTO VAROS(id,nev) VALUES (2529,'Szany');
INSERT INTO VAROS(id,nev) VALUES (2530,'Szápár');
INSERT INTO VAROS(id,nev) VALUES (2531,'Szaporca');
INSERT INTO VAROS(id,nev) VALUES (2532,'Szár');
INSERT INTO VAROS(id,nev) VALUES (2533,'Szárász');
INSERT INTO VAROS(id,nev) VALUES (2534,'Szárazd');
INSERT INTO VAROS(id,nev) VALUES (2535,'Szárföld');
INSERT INTO VAROS(id,nev) VALUES (2536,'Szárliget');
INSERT INTO VAROS(id,nev) VALUES (2537,'Szarvas');
INSERT INTO VAROS(id,nev) VALUES (2538,'Szarvasgede');
INSERT INTO VAROS(id,nev) VALUES (2539,'Szarvaskend');
INSERT INTO VAROS(id,nev) VALUES (2540,'Szarvaskő');
INSERT INTO VAROS(id,nev) VALUES (2541,'Szászberek');
INSERT INTO VAROS(id,nev) VALUES (2542,'Szászfa');
INSERT INTO VAROS(id,nev) VALUES (2543,'Szászvár');
INSERT INTO VAROS(id,nev) VALUES (2544,'Szatmárcseke');
INSERT INTO VAROS(id,nev) VALUES (2545,'Szátok');
INSERT INTO VAROS(id,nev) VALUES (2546,'Szatta');
INSERT INTO VAROS(id,nev) VALUES (2547,'Szatymaz');
INSERT INTO VAROS(id,nev) VALUES (2548,'Szava');
INSERT INTO VAROS(id,nev) VALUES (2549,'Százhalombatta');
INSERT INTO VAROS(id,nev) VALUES (2550,'Szebény');
INSERT INTO VAROS(id,nev) VALUES (2551,'Szécsénke');
INSERT INTO VAROS(id,nev) VALUES (2552,'Szécsény');
INSERT INTO VAROS(id,nev) VALUES (2553,'Szécsényfelfalu');
INSERT INTO VAROS(id,nev) VALUES (2554,'Szécsisziget');
INSERT INTO VAROS(id,nev) VALUES (2555,'Szederkény');
INSERT INTO VAROS(id,nev) VALUES (2556,'Szedres');
INSERT INTO VAROS(id,nev) VALUES (2557,'Szeged');
INSERT INTO VAROS(id,nev) VALUES (2558,'Szegerdő');
INSERT INTO VAROS(id,nev) VALUES (2559,'Szeghalom');
INSERT INTO VAROS(id,nev) VALUES (2560,'Szegi');
INSERT INTO VAROS(id,nev) VALUES (2561,'Szegilong');
INSERT INTO VAROS(id,nev) VALUES (2562,'Szegvár');
INSERT INTO VAROS(id,nev) VALUES (2563,'Székely');
INSERT INTO VAROS(id,nev) VALUES (2564,'Székelyszabar');
INSERT INTO VAROS(id,nev) VALUES (2565,'Székesfehérvár');
INSERT INTO VAROS(id,nev) VALUES (2566,'Székkutas');
INSERT INTO VAROS(id,nev) VALUES (2567,'Szekszárd');
INSERT INTO VAROS(id,nev) VALUES (2568,'Szeleste');
INSERT INTO VAROS(id,nev) VALUES (2569,'Szelevény');
INSERT INTO VAROS(id,nev) VALUES (2570,'Szellő');
INSERT INTO VAROS(id,nev) VALUES (2571,'Szemely');
INSERT INTO VAROS(id,nev) VALUES (2572,'Szemenye');
INSERT INTO VAROS(id,nev) VALUES (2573,'Szemere');
INSERT INTO VAROS(id,nev) VALUES (2574,'Szendehely');
INSERT INTO VAROS(id,nev) VALUES (2575,'Szendrő');
INSERT INTO VAROS(id,nev) VALUES (2576,'Szendrőlád');
INSERT INTO VAROS(id,nev) VALUES (2577,'Szenna');
INSERT INTO VAROS(id,nev) VALUES (2578,'Szenta');
INSERT INTO VAROS(id,nev) VALUES (2579,'Szentantalfa');
INSERT INTO VAROS(id,nev) VALUES (2580,'Szentbalázs');
INSERT INTO VAROS(id,nev) VALUES (2581,'Szentbékkálla');
INSERT INTO VAROS(id,nev) VALUES (2582,'Szentborbás');
INSERT INTO VAROS(id,nev) VALUES (2583,'Szentdénes');
INSERT INTO VAROS(id,nev) VALUES (2584,'Szentdomonkos');
INSERT INTO VAROS(id,nev) VALUES (2585,'Szente');
INSERT INTO VAROS(id,nev) VALUES (2586,'Szentegát');
INSERT INTO VAROS(id,nev) VALUES (2587,'Szentendre');
INSERT INTO VAROS(id,nev) VALUES (2588,'Szentes');
INSERT INTO VAROS(id,nev) VALUES (2589,'Szentgál');
INSERT INTO VAROS(id,nev) VALUES (2590,'Szentgáloskér');
INSERT INTO VAROS(id,nev) VALUES (2591,'Szentgotthárd');
INSERT INTO VAROS(id,nev) VALUES (2592,'Szentgyörgyvár');
INSERT INTO VAROS(id,nev) VALUES (2593,'Szentgyörgyvölgy');
INSERT INTO VAROS(id,nev) VALUES (2594,'Szentimrefalva');
INSERT INTO VAROS(id,nev) VALUES (2595,'Szentistván');
INSERT INTO VAROS(id,nev) VALUES (2596,'Szentistvánbaksa');
INSERT INTO VAROS(id,nev) VALUES (2597,'Szentjakabfa');
INSERT INTO VAROS(id,nev) VALUES (2598,'Szentkatalin');
INSERT INTO VAROS(id,nev) VALUES (2599,'Szentkirály');
INSERT INTO VAROS(id,nev) VALUES (2600,'Szentkirályszabadja');
INSERT INTO VAROS(id,nev) VALUES (2601,'Szentkozmadombja');
INSERT INTO VAROS(id,nev) VALUES (2602,'Szentlászló');
INSERT INTO VAROS(id,nev) VALUES (2603,'Szentliszló');
INSERT INTO VAROS(id,nev) VALUES (2604,'Szentlőrinc');
INSERT INTO VAROS(id,nev) VALUES (2605,'Szentlőrinckáta');
INSERT INTO VAROS(id,nev) VALUES (2606,'Szentmargitfalva');
INSERT INTO VAROS(id,nev) VALUES (2607,'Szentmártonkáta');
INSERT INTO VAROS(id,nev) VALUES (2608,'Szentpéterfa');
INSERT INTO VAROS(id,nev) VALUES (2609,'Szentpéterfölde');
INSERT INTO VAROS(id,nev) VALUES (2610,'Szentpéterszeg');
INSERT INTO VAROS(id,nev) VALUES (2611,'Szentpéterúr');
INSERT INTO VAROS(id,nev) VALUES (2612,'Szenyér');
INSERT INTO VAROS(id,nev) VALUES (2613,'Szepetnek');
INSERT INTO VAROS(id,nev) VALUES (2614,'Szerecseny');
INSERT INTO VAROS(id,nev) VALUES (2615,'Szeremle');
INSERT INTO VAROS(id,nev) VALUES (2616,'Szerencs');
INSERT INTO VAROS(id,nev) VALUES (2617,'Szerep');
INSERT INTO VAROS(id,nev) VALUES (2618,'Szergény');
INSERT INTO VAROS(id,nev) VALUES (2619,'Szigetbecse');
INSERT INTO VAROS(id,nev) VALUES (2620,'Szigetcsép');
INSERT INTO VAROS(id,nev) VALUES (2621,'Szigethalom');
INSERT INTO VAROS(id,nev) VALUES (2622,'Szigetmonostor');
INSERT INTO VAROS(id,nev) VALUES (2623,'Szigetszentmárton');
INSERT INTO VAROS(id,nev) VALUES (2624,'Szigetszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (2625,'Szigetújfalu');
INSERT INTO VAROS(id,nev) VALUES (2626,'Szigetvár');
INSERT INTO VAROS(id,nev) VALUES (2627,'Szigliget');
INSERT INTO VAROS(id,nev) VALUES (2628,'Szihalom');
INSERT INTO VAROS(id,nev) VALUES (2629,'Szijártóháza');
INSERT INTO VAROS(id,nev) VALUES (2630,'Szikszó');
INSERT INTO VAROS(id,nev) VALUES (2631,'Szil');
INSERT INTO VAROS(id,nev) VALUES (2632,'Szilágy');
INSERT INTO VAROS(id,nev) VALUES (2633,'Szilaspogony');
INSERT INTO VAROS(id,nev) VALUES (2634,'Szilsárkány');
INSERT INTO VAROS(id,nev) VALUES (2635,'Szilvágy');
INSERT INTO VAROS(id,nev) VALUES (2636,'Szilvás');
INSERT INTO VAROS(id,nev) VALUES (2637,'Szilvásvárad');
INSERT INTO VAROS(id,nev) VALUES (2638,'Szilvásszentmárton');
INSERT INTO VAROS(id,nev) VALUES (2639,'Szin');
INSERT INTO VAROS(id,nev) VALUES (2640,'Szinpetri');
INSERT INTO VAROS(id,nev) VALUES (2641,'Szirák');
INSERT INTO VAROS(id,nev) VALUES (2642,'Szirmabesenyő');
INSERT INTO VAROS(id,nev) VALUES (2643,'Szob');
INSERT INTO VAROS(id,nev) VALUES (2644,'Szokolya');
INSERT INTO VAROS(id,nev) VALUES (2645,'Szólád');
INSERT INTO VAROS(id,nev) VALUES (2646,'Szolnok');
INSERT INTO VAROS(id,nev) VALUES (2647,'Szombathely');
INSERT INTO VAROS(id,nev) VALUES (2648,'Szomód');
INSERT INTO VAROS(id,nev) VALUES (2649,'Szomolya');
INSERT INTO VAROS(id,nev) VALUES (2650,'Szomor');
INSERT INTO VAROS(id,nev) VALUES (2651,'Szorgalmatos');
INSERT INTO VAROS(id,nev) VALUES (2652,'Szorosad');
INSERT INTO VAROS(id,nev) VALUES (2653,'Szőc');
INSERT INTO VAROS(id,nev) VALUES (2654,'Szőce');
INSERT INTO VAROS(id,nev) VALUES (2655,'Sződ');
INSERT INTO VAROS(id,nev) VALUES (2656,'Sződliget');
INSERT INTO VAROS(id,nev) VALUES (2657,'Szögliget');
INSERT INTO VAROS(id,nev) VALUES (2658,'Szőke');
INSERT INTO VAROS(id,nev) VALUES (2659,'Szőkéd');
INSERT INTO VAROS(id,nev) VALUES (2660,'Szőkedencs');
INSERT INTO VAROS(id,nev) VALUES (2661,'Szőlősardó');
INSERT INTO VAROS(id,nev) VALUES (2662,'Szőlősgyörök');
INSERT INTO VAROS(id,nev) VALUES (2663,'Szörény');
INSERT INTO VAROS(id,nev) VALUES (2664,'Szúcs');
INSERT INTO VAROS(id,nev) VALUES (2665,'Szuha');
INSERT INTO VAROS(id,nev) VALUES (2666,'Szuhafő');
INSERT INTO VAROS(id,nev) VALUES (2667,'Szuhakálló');
INSERT INTO VAROS(id,nev) VALUES (2668,'Szuhogy');
INSERT INTO VAROS(id,nev) VALUES (2669,'Szulimán');
INSERT INTO VAROS(id,nev) VALUES (2670,'Szulok');
INSERT INTO VAROS(id,nev) VALUES (2671,'Szurdokpüspöki');
INSERT INTO VAROS(id,nev) VALUES (2672,'Szűcsi');
INSERT INTO VAROS(id,nev) VALUES (2673,'Szügy');
INSERT INTO VAROS(id,nev) VALUES (2674,'Szűr');
INSERT INTO VAROS(id,nev) VALUES (2675,'Tab');
INSERT INTO VAROS(id,nev) VALUES (2676,'Tabajd');
INSERT INTO VAROS(id,nev) VALUES (2677,'Tabdi');
INSERT INTO VAROS(id,nev) VALUES (2678,'Táborfalva');
INSERT INTO VAROS(id,nev) VALUES (2679,'Tác');
INSERT INTO VAROS(id,nev) VALUES (2680,'Tagyon');
INSERT INTO VAROS(id,nev) VALUES (2681,'Tahitótfalu');
INSERT INTO VAROS(id,nev) VALUES (2682,'Takácsi');
INSERT INTO VAROS(id,nev) VALUES (2683,'Tákos');
INSERT INTO VAROS(id,nev) VALUES (2684,'Taksony');
INSERT INTO VAROS(id,nev) VALUES (2685,'Taktabáj');
INSERT INTO VAROS(id,nev) VALUES (2686,'Taktaharkány');
INSERT INTO VAROS(id,nev) VALUES (2687,'Taktakenéz');
INSERT INTO VAROS(id,nev) VALUES (2688,'Taktaszada');
INSERT INTO VAROS(id,nev) VALUES (2689,'Taliándörögd');
INSERT INTO VAROS(id,nev) VALUES (2690,'Tállya');
INSERT INTO VAROS(id,nev) VALUES (2691,'Tamási');
INSERT INTO VAROS(id,nev) VALUES (2692,'Tanakajd');
INSERT INTO VAROS(id,nev) VALUES (2693,'Táp');
INSERT INTO VAROS(id,nev) VALUES (2694,'Tápióbicske');
INSERT INTO VAROS(id,nev) VALUES (2695,'Tápiógyörgye');
INSERT INTO VAROS(id,nev) VALUES (2696,'Tápióság');
INSERT INTO VAROS(id,nev) VALUES (2697,'Tápiószecső');
INSERT INTO VAROS(id,nev) VALUES (2698,'Tápiószele');
INSERT INTO VAROS(id,nev) VALUES (2699,'Tápiószentmárton');
INSERT INTO VAROS(id,nev) VALUES (2700,'Tápiószőlős');
INSERT INTO VAROS(id,nev) VALUES (2701,'Táplánszentkereszt');
INSERT INTO VAROS(id,nev) VALUES (2702,'Tapolca');
INSERT INTO VAROS(id,nev) VALUES (2703,'Tapsony');
INSERT INTO VAROS(id,nev) VALUES (2704,'Tápszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (2705,'Tar');
INSERT INTO VAROS(id,nev) VALUES (2706,'Tarany');
INSERT INTO VAROS(id,nev) VALUES (2707,'Tarcal');
INSERT INTO VAROS(id,nev) VALUES (2708,'Tard');
INSERT INTO VAROS(id,nev) VALUES (2709,'Tardona');
INSERT INTO VAROS(id,nev) VALUES (2710,'Tardos');
INSERT INTO VAROS(id,nev) VALUES (2711,'Tarhos');
INSERT INTO VAROS(id,nev) VALUES (2712,'Tarján');
INSERT INTO VAROS(id,nev) VALUES (2713,'Tarjánpuszta');
INSERT INTO VAROS(id,nev) VALUES (2714,'Tárkány');
INSERT INTO VAROS(id,nev) VALUES (2715,'Tarnabod');
INSERT INTO VAROS(id,nev) VALUES (2716,'Tarnalelesz');
INSERT INTO VAROS(id,nev) VALUES (2717,'Tarnaméra');
INSERT INTO VAROS(id,nev) VALUES (2718,'Tarnaörs');
INSERT INTO VAROS(id,nev) VALUES (2719,'Tarnaszentmária');
INSERT INTO VAROS(id,nev) VALUES (2720,'Tarnaszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (2721,'Tarnazsadány');
INSERT INTO VAROS(id,nev) VALUES (2722,'Tárnok');
INSERT INTO VAROS(id,nev) VALUES (2723,'Tárnokréti');
INSERT INTO VAROS(id,nev) VALUES (2724,'Tarpa');
INSERT INTO VAROS(id,nev) VALUES (2725,'Tarrós');
INSERT INTO VAROS(id,nev) VALUES (2726,'Táska');
INSERT INTO VAROS(id,nev) VALUES (2727,'Tass');
INSERT INTO VAROS(id,nev) VALUES (2728,'Taszár');
INSERT INTO VAROS(id,nev) VALUES (2729,'Tát');
INSERT INTO VAROS(id,nev) VALUES (2730,'Tata');
INSERT INTO VAROS(id,nev) VALUES (2731,'Tatabánya');
INSERT INTO VAROS(id,nev) VALUES (2732,'Tataháza');
INSERT INTO VAROS(id,nev) VALUES (2733,'Tatárszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (2734,'Tázlár');
INSERT INTO VAROS(id,nev) VALUES (2735,'Téglás');
INSERT INTO VAROS(id,nev) VALUES (2736,'Tekenye');
INSERT INTO VAROS(id,nev) VALUES (2737,'Tékes');
INSERT INTO VAROS(id,nev) VALUES (2738,'Teklafalu');
INSERT INTO VAROS(id,nev) VALUES (2739,'Telekes');
INSERT INTO VAROS(id,nev) VALUES (2740,'Telekgerendás');
INSERT INTO VAROS(id,nev) VALUES (2741,'Teleki');
INSERT INTO VAROS(id,nev) VALUES (2742,'Telki');
INSERT INTO VAROS(id,nev) VALUES (2743,'Telkibánya');
INSERT INTO VAROS(id,nev) VALUES (2744,'Tengelic');
INSERT INTO VAROS(id,nev) VALUES (2745,'Tengeri');
INSERT INTO VAROS(id,nev) VALUES (2746,'Tengőd');
INSERT INTO VAROS(id,nev) VALUES (2747,'Tenk');
INSERT INTO VAROS(id,nev) VALUES (2748,'Tényő');
INSERT INTO VAROS(id,nev) VALUES (2749,'Tépe');
INSERT INTO VAROS(id,nev) VALUES (2750,'Terem');
INSERT INTO VAROS(id,nev) VALUES (2751,'Terény');
INSERT INTO VAROS(id,nev) VALUES (2752,'Tereske');
INSERT INTO VAROS(id,nev) VALUES (2753,'Teresztenye');
INSERT INTO VAROS(id,nev) VALUES (2754,'Terpes');
INSERT INTO VAROS(id,nev) VALUES (2755,'Tés');
INSERT INTO VAROS(id,nev) VALUES (2756,'Tésa');
INSERT INTO VAROS(id,nev) VALUES (2757,'Tésenfa');
INSERT INTO VAROS(id,nev) VALUES (2758,'Téseny');
INSERT INTO VAROS(id,nev) VALUES (2759,'Teskánd');
INSERT INTO VAROS(id,nev) VALUES (2760,'Tét');
INSERT INTO VAROS(id,nev) VALUES (2761,'Tetétlen');
INSERT INTO VAROS(id,nev) VALUES (2762,'Tevel');
INSERT INTO VAROS(id,nev) VALUES (2763,'Tibolddaróc');
INSERT INTO VAROS(id,nev) VALUES (2764,'Tiborszállás');
INSERT INTO VAROS(id,nev) VALUES (2765,'Tihany');
INSERT INTO VAROS(id,nev) VALUES (2766,'Tikos');
INSERT INTO VAROS(id,nev) VALUES (2767,'Tilaj');
INSERT INTO VAROS(id,nev) VALUES (2768,'Timár');
INSERT INTO VAROS(id,nev) VALUES (2769,'Tinnye');
INSERT INTO VAROS(id,nev) VALUES (2770,'Tiszaadony');
INSERT INTO VAROS(id,nev) VALUES (2771,'Tiszaalpár');
INSERT INTO VAROS(id,nev) VALUES (2772,'Tiszabábolna');
INSERT INTO VAROS(id,nev) VALUES (2773,'Tiszabecs');
INSERT INTO VAROS(id,nev) VALUES (2774,'Tiszabercel');
INSERT INTO VAROS(id,nev) VALUES (2775,'Tiszabezdéd');
INSERT INTO VAROS(id,nev) VALUES (2776,'Tiszabő');
INSERT INTO VAROS(id,nev) VALUES (2777,'Tiszabura');
INSERT INTO VAROS(id,nev) VALUES (2778,'Tiszacsécse');
INSERT INTO VAROS(id,nev) VALUES (2779,'Tiszacsege');
INSERT INTO VAROS(id,nev) VALUES (2780,'Tiszacsermely');
INSERT INTO VAROS(id,nev) VALUES (2781,'Tiszadada');
INSERT INTO VAROS(id,nev) VALUES (2782,'Tiszaderzs');
INSERT INTO VAROS(id,nev) VALUES (2783,'Tiszadob');
INSERT INTO VAROS(id,nev) VALUES (2784,'Tiszadorogma');
INSERT INTO VAROS(id,nev) VALUES (2785,'Tiszaeszlár');
INSERT INTO VAROS(id,nev) VALUES (2786,'Tiszaföldvár');
INSERT INTO VAROS(id,nev) VALUES (2787,'Tiszafüred');
INSERT INTO VAROS(id,nev) VALUES (2788,'Tiszagyenda');
INSERT INTO VAROS(id,nev) VALUES (2789,'Tiszagyulaháza');
INSERT INTO VAROS(id,nev) VALUES (2790,'Tiszaigar');
INSERT INTO VAROS(id,nev) VALUES (2791,'Tiszainoka');
INSERT INTO VAROS(id,nev) VALUES (2792,'Tiszajenő');
INSERT INTO VAROS(id,nev) VALUES (2793,'Tiszakanyár');
INSERT INTO VAROS(id,nev) VALUES (2794,'Tiszakarád');
INSERT INTO VAROS(id,nev) VALUES (2795,'Tiszakécske');
INSERT INTO VAROS(id,nev) VALUES (2796,'Tiszakerecseny');
INSERT INTO VAROS(id,nev) VALUES (2797,'Tiszakeszi');
INSERT INTO VAROS(id,nev) VALUES (2798,'Tiszakóród');
INSERT INTO VAROS(id,nev) VALUES (2799,'Tiszakürt');
INSERT INTO VAROS(id,nev) VALUES (2800,'Tiszaladány');
INSERT INTO VAROS(id,nev) VALUES (2801,'Tiszalök');
INSERT INTO VAROS(id,nev) VALUES (2802,'Tiszalúc');
INSERT INTO VAROS(id,nev) VALUES (2803,'Tiszamogyorós');
INSERT INTO VAROS(id,nev) VALUES (2804,'Tiszanagyfalu');
INSERT INTO VAROS(id,nev) VALUES (2805,'Tiszanána');
INSERT INTO VAROS(id,nev) VALUES (2806,'Tiszaörs');
INSERT INTO VAROS(id,nev) VALUES (2807,'Tiszapalkonya');
INSERT INTO VAROS(id,nev) VALUES (2808,'Tiszapüspöki');
INSERT INTO VAROS(id,nev) VALUES (2809,'Tiszarád');
INSERT INTO VAROS(id,nev) VALUES (2810,'Tiszaroff');
INSERT INTO VAROS(id,nev) VALUES (2811,'Tiszasas');
INSERT INTO VAROS(id,nev) VALUES (2812,'Tiszasüly');
INSERT INTO VAROS(id,nev) VALUES (2813,'Tiszaszalka');
INSERT INTO VAROS(id,nev) VALUES (2814,'Tiszaszentimre');
INSERT INTO VAROS(id,nev) VALUES (2815,'Tiszaszentmárton');
INSERT INTO VAROS(id,nev) VALUES (2816,'Tiszasziget');
INSERT INTO VAROS(id,nev) VALUES (2817,'Tiszaszőlős');
INSERT INTO VAROS(id,nev) VALUES (2818,'Tiszatardos');
INSERT INTO VAROS(id,nev) VALUES (2819,'Tiszatarján');
INSERT INTO VAROS(id,nev) VALUES (2820,'Tiszatelek');
INSERT INTO VAROS(id,nev) VALUES (2821,'Tiszatenyő');
INSERT INTO VAROS(id,nev) VALUES (2822,'Tiszaug');
INSERT INTO VAROS(id,nev) VALUES (2823,'Tiszaújváros');
INSERT INTO VAROS(id,nev) VALUES (2824,'Tiszavalk');
INSERT INTO VAROS(id,nev) VALUES (2825,'Tiszavárkony');
INSERT INTO VAROS(id,nev) VALUES (2826,'Tiszavasvári');
INSERT INTO VAROS(id,nev) VALUES (2827,'Tiszavid');
INSERT INTO VAROS(id,nev) VALUES (2828,'Tisztaberek');
INSERT INTO VAROS(id,nev) VALUES (2829,'Tivadar');
INSERT INTO VAROS(id,nev) VALUES (2830,'Tóalmás');
INSERT INTO VAROS(id,nev) VALUES (2831,'Tófalu');
INSERT INTO VAROS(id,nev) VALUES (2832,'Tófej');
INSERT INTO VAROS(id,nev) VALUES (2833,'Tófű');
INSERT INTO VAROS(id,nev) VALUES (2834,'Tokaj');
INSERT INTO VAROS(id,nev) VALUES (2835,'Tokod');
INSERT INTO VAROS(id,nev) VALUES (2836,'Tokodaltáró');
INSERT INTO VAROS(id,nev) VALUES (2837,'Tokorcs');
INSERT INTO VAROS(id,nev) VALUES (2838,'Tolcsva');
INSERT INTO VAROS(id,nev) VALUES (2839,'Told');
INSERT INTO VAROS(id,nev) VALUES (2840,'Tolmács');
INSERT INTO VAROS(id,nev) VALUES (2841,'Tolna');
INSERT INTO VAROS(id,nev) VALUES (2842,'Tolnanémedi');
INSERT INTO VAROS(id,nev) VALUES (2843,'Tomajmonostora');
INSERT INTO VAROS(id,nev) VALUES (2844,'Tomor');
INSERT INTO VAROS(id,nev) VALUES (2845,'Tompa');
INSERT INTO VAROS(id,nev) VALUES (2846,'Tompaládony');
INSERT INTO VAROS(id,nev) VALUES (2847,'Tordas');
INSERT INTO VAROS(id,nev) VALUES (2848,'Tormafölde');
INSERT INTO VAROS(id,nev) VALUES (2849,'Tormás');
INSERT INTO VAROS(id,nev) VALUES (2850,'Tormásliget');
INSERT INTO VAROS(id,nev) VALUES (2851,'Tornabarakony');
INSERT INTO VAROS(id,nev) VALUES (2852,'Tornakápolna');
INSERT INTO VAROS(id,nev) VALUES (2853,'Tornanádaska');
INSERT INTO VAROS(id,nev) VALUES (2854,'Tornaszentandrás');
INSERT INTO VAROS(id,nev) VALUES (2855,'Tornaszentjakab');
INSERT INTO VAROS(id,nev) VALUES (2856,'Tornyiszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (2857,'Tornyosnémeti');
INSERT INTO VAROS(id,nev) VALUES (2858,'Tornyospálca');
INSERT INTO VAROS(id,nev) VALUES (2859,'Torony');
INSERT INTO VAROS(id,nev) VALUES (2860,'Torvaj');
INSERT INTO VAROS(id,nev) VALUES (2861,'Tószeg');
INSERT INTO VAROS(id,nev) VALUES (2862,'Tótkomlós');
INSERT INTO VAROS(id,nev) VALUES (2863,'Tótszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (2864,'Tótszentmárton');
INSERT INTO VAROS(id,nev) VALUES (2865,'Tótszerdahely');
INSERT INTO VAROS(id,nev) VALUES (2866,'Tótújfalu');
INSERT INTO VAROS(id,nev) VALUES (2867,'Tótvázsony');
INSERT INTO VAROS(id,nev) VALUES (2868,'Tök');
INSERT INTO VAROS(id,nev) VALUES (2869,'Tököl');
INSERT INTO VAROS(id,nev) VALUES (2870,'Töltéstava');
INSERT INTO VAROS(id,nev) VALUES (2871,'Tömörd');
INSERT INTO VAROS(id,nev) VALUES (2872,'Tömörkény');
INSERT INTO VAROS(id,nev) VALUES (2873,'Törökbálint');
INSERT INTO VAROS(id,nev) VALUES (2874,'Törökkoppány');
INSERT INTO VAROS(id,nev) VALUES (2875,'Törökszentmiklós');
INSERT INTO VAROS(id,nev) VALUES (2876,'Törtel');
INSERT INTO VAROS(id,nev) VALUES (2877,'Töttös');
INSERT INTO VAROS(id,nev) VALUES (2878,'Trizs');
INSERT INTO VAROS(id,nev) VALUES (2879,'Tunyogmatolcs');
INSERT INTO VAROS(id,nev) VALUES (2880,'Tura');
INSERT INTO VAROS(id,nev) VALUES (2881,'Túristvándi');
INSERT INTO VAROS(id,nev) VALUES (2882,'Túrkeve');
INSERT INTO VAROS(id,nev) VALUES (2883,'Túrony');
INSERT INTO VAROS(id,nev) VALUES (2884,'Túrricse');
INSERT INTO VAROS(id,nev) VALUES (2885,'Tuzsér');
INSERT INTO VAROS(id,nev) VALUES (2886,'Türje');
INSERT INTO VAROS(id,nev) VALUES (2887,'Tüskevár');
INSERT INTO VAROS(id,nev) VALUES (2888,'Tyukod');
INSERT INTO VAROS(id,nev) VALUES (2889,'Udvar');
INSERT INTO VAROS(id,nev) VALUES (2890,'Udvari');
INSERT INTO VAROS(id,nev) VALUES (2891,'Ugod');
INSERT INTO VAROS(id,nev) VALUES (2892,'Újbarok');
INSERT INTO VAROS(id,nev) VALUES (2893,'Újcsanálos');
INSERT INTO VAROS(id,nev) VALUES (2894,'Újdombrád');
INSERT INTO VAROS(id,nev) VALUES (2895,'Újfehértó');
INSERT INTO VAROS(id,nev) VALUES (2896,'Újhartyán');
INSERT INTO VAROS(id,nev) VALUES (2897,'Újiráz');
INSERT INTO VAROS(id,nev) VALUES (2898,'Újireg');
INSERT INTO VAROS(id,nev) VALUES (2899,'Újkenéz');
INSERT INTO VAROS(id,nev) VALUES (2900,'Újkér');
INSERT INTO VAROS(id,nev) VALUES (2901,'Újkígyós');
INSERT INTO VAROS(id,nev) VALUES (2902,'Újlengyel');
INSERT INTO VAROS(id,nev) VALUES (2903,'Újléta');
INSERT INTO VAROS(id,nev) VALUES (2904,'Újlőrincfalva');
INSERT INTO VAROS(id,nev) VALUES (2905,'Újpetre');
INSERT INTO VAROS(id,nev) VALUES (2906,'Újrónafő');
INSERT INTO VAROS(id,nev) VALUES (2907,'Újsolt');
INSERT INTO VAROS(id,nev) VALUES (2908,'Újszalonta');
INSERT INTO VAROS(id,nev) VALUES (2909,'Újszász');
INSERT INTO VAROS(id,nev) VALUES (2910,'Újszentiván');
INSERT INTO VAROS(id,nev) VALUES (2911,'Újszentmargita');
INSERT INTO VAROS(id,nev) VALUES (2912,'Újszilvás');
INSERT INTO VAROS(id,nev) VALUES (2913,'Újtelek');
INSERT INTO VAROS(id,nev) VALUES (2914,'Újtikos');
INSERT INTO VAROS(id,nev) VALUES (2915,'Újudvar');
INSERT INTO VAROS(id,nev) VALUES (2916,'Újvárfalva');
INSERT INTO VAROS(id,nev) VALUES (2917,'Ukk');
INSERT INTO VAROS(id,nev) VALUES (2918,'Und');
INSERT INTO VAROS(id,nev) VALUES (2919,'Úny');
INSERT INTO VAROS(id,nev) VALUES (2920,'Uppony');
INSERT INTO VAROS(id,nev) VALUES (2921,'Ura');
INSERT INTO VAROS(id,nev) VALUES (2922,'Uraiújfalu');
INSERT INTO VAROS(id,nev) VALUES (2923,'Úrhida');
INSERT INTO VAROS(id,nev) VALUES (2924,'Úri');
INSERT INTO VAROS(id,nev) VALUES (2925,'Úrkút');
INSERT INTO VAROS(id,nev) VALUES (2926,'Uszka');
INSERT INTO VAROS(id,nev) VALUES (2927,'Uszód');
INSERT INTO VAROS(id,nev) VALUES (2928,'Uzsa');
INSERT INTO VAROS(id,nev) VALUES (2929,'Üllés');
INSERT INTO VAROS(id,nev) VALUES (2930,'Üllő');
INSERT INTO VAROS(id,nev) VALUES (2931,'Üröm');
INSERT INTO VAROS(id,nev) VALUES (2932,'Vác');
INSERT INTO VAROS(id,nev) VALUES (2933,'Vácduka');
INSERT INTO VAROS(id,nev) VALUES (2934,'Vácegres');
INSERT INTO VAROS(id,nev) VALUES (2935,'Váchartyán');
INSERT INTO VAROS(id,nev) VALUES (2936,'Váckisújfalu');
INSERT INTO VAROS(id,nev) VALUES (2937,'Vácrátót');
INSERT INTO VAROS(id,nev) VALUES (2938,'Vácszentlászló');
INSERT INTO VAROS(id,nev) VALUES (2939,'Vadna');
INSERT INTO VAROS(id,nev) VALUES (2940,'Vadosfa');
INSERT INTO VAROS(id,nev) VALUES (2941,'Vág');
INSERT INTO VAROS(id,nev) VALUES (2942,'Vágáshuta');
INSERT INTO VAROS(id,nev) VALUES (2943,'Vaja');
INSERT INTO VAROS(id,nev) VALUES (2944,'Vajdácska');
INSERT INTO VAROS(id,nev) VALUES (2945,'Vajszló');
INSERT INTO VAROS(id,nev) VALUES (2946,'Vajta');
INSERT INTO VAROS(id,nev) VALUES (2947,'Vál');
INSERT INTO VAROS(id,nev) VALUES (2948,'Valkó');
INSERT INTO VAROS(id,nev) VALUES (2949,'Valkonya');
INSERT INTO VAROS(id,nev) VALUES (2950,'Vállaj');
INSERT INTO VAROS(id,nev) VALUES (2951,'Vállus');
INSERT INTO VAROS(id,nev) VALUES (2952,'Vámosatya');
INSERT INTO VAROS(id,nev) VALUES (2953,'Vámoscsalád');
INSERT INTO VAROS(id,nev) VALUES (2954,'Vámosgyörk');
INSERT INTO VAROS(id,nev) VALUES (2955,'Vámosmikola');
INSERT INTO VAROS(id,nev) VALUES (2956,'Vámosoroszi');
INSERT INTO VAROS(id,nev) VALUES (2957,'Vámospércs');
INSERT INTO VAROS(id,nev) VALUES (2958,'Vámosújfalu');
INSERT INTO VAROS(id,nev) VALUES (2959,'Vámosszabadi');
INSERT INTO VAROS(id,nev) VALUES (2960,'Váncsod');
INSERT INTO VAROS(id,nev) VALUES (2961,'Vanyarc');
INSERT INTO VAROS(id,nev) VALUES (2962,'Vanyola');
INSERT INTO VAROS(id,nev) VALUES (2963,'Várad');
INSERT INTO VAROS(id,nev) VALUES (2964,'Váralja');
INSERT INTO VAROS(id,nev) VALUES (2965,'Varászló');
INSERT INTO VAROS(id,nev) VALUES (2966,'Váraszó');
INSERT INTO VAROS(id,nev) VALUES (2967,'Várbalog');
INSERT INTO VAROS(id,nev) VALUES (2968,'Varbó');
INSERT INTO VAROS(id,nev) VALUES (2969,'Varbóc');
INSERT INTO VAROS(id,nev) VALUES (2970,'Várda');
INSERT INTO VAROS(id,nev) VALUES (2971,'Várdomb');
INSERT INTO VAROS(id,nev) VALUES (2972,'Várfölde');
INSERT INTO VAROS(id,nev) VALUES (2973,'Varga');
INSERT INTO VAROS(id,nev) VALUES (2974,'Várgesztes');
INSERT INTO VAROS(id,nev) VALUES (2975,'Várkesző');
INSERT INTO VAROS(id,nev) VALUES (2976,'Várong');
INSERT INTO VAROS(id,nev) VALUES (2977,'Városföld');
INSERT INTO VAROS(id,nev) VALUES (2978,'Városlőd');
INSERT INTO VAROS(id,nev) VALUES (2979,'Várpalota');
INSERT INTO VAROS(id,nev) VALUES (2980,'Varsád');
INSERT INTO VAROS(id,nev) VALUES (2981,'Varsány');
INSERT INTO VAROS(id,nev) VALUES (2982,'Várvölgy');
INSERT INTO VAROS(id,nev) VALUES (2983,'Vasad');
INSERT INTO VAROS(id,nev) VALUES (2984,'Vasalja');
INSERT INTO VAROS(id,nev) VALUES (2985,'Vásárosbéc');
INSERT INTO VAROS(id,nev) VALUES (2986,'Vásárosdombó');
INSERT INTO VAROS(id,nev) VALUES (2987,'Vásárosfalu');
INSERT INTO VAROS(id,nev) VALUES (2988,'Vásárosmiske');
INSERT INTO VAROS(id,nev) VALUES (2989,'Vásárosnamény');
INSERT INTO VAROS(id,nev) VALUES (2990,'Vasasszonyfa');
INSERT INTO VAROS(id,nev) VALUES (2991,'Vasboldogasszony');
INSERT INTO VAROS(id,nev) VALUES (2992,'Vasegerszeg');
INSERT INTO VAROS(id,nev) VALUES (2993,'Vashosszúfalu');
INSERT INTO VAROS(id,nev) VALUES (2994,'Vaskeresztes');
INSERT INTO VAROS(id,nev) VALUES (2995,'Vaskút');
INSERT INTO VAROS(id,nev) VALUES (2996,'Vasmegyer');
INSERT INTO VAROS(id,nev) VALUES (2997,'Vaspör');
INSERT INTO VAROS(id,nev) VALUES (2998,'Vassurány');
INSERT INTO VAROS(id,nev) VALUES (2999,'Vasvár');
INSERT INTO VAROS(id,nev) VALUES (3000,'Vaszar');
INSERT INTO VAROS(id,nev) VALUES (3001,'Vászoly');
INSERT INTO VAROS(id,nev) VALUES (3002,'Vasszécseny');
INSERT INTO VAROS(id,nev) VALUES (3003,'Vasszentmihály');
INSERT INTO VAROS(id,nev) VALUES (3004,'Vasszilvágy');
INSERT INTO VAROS(id,nev) VALUES (3005,'Vát');
INSERT INTO VAROS(id,nev) VALUES (3006,'Vatta');
INSERT INTO VAROS(id,nev) VALUES (3007,'Vázsnok');
INSERT INTO VAROS(id,nev) VALUES (3008,'Vécs');
INSERT INTO VAROS(id,nev) VALUES (3009,'Vecsés');
INSERT INTO VAROS(id,nev) VALUES (3010,'Végegyháza');
INSERT INTO VAROS(id,nev) VALUES (3011,'Vejti');
INSERT INTO VAROS(id,nev) VALUES (3012,'Vékény');
INSERT INTO VAROS(id,nev) VALUES (3013,'Vekerd');
INSERT INTO VAROS(id,nev) VALUES (3014,'Velem');
INSERT INTO VAROS(id,nev) VALUES (3015,'Velemér');
INSERT INTO VAROS(id,nev) VALUES (3016,'Velence');
INSERT INTO VAROS(id,nev) VALUES (3017,'Velény');
INSERT INTO VAROS(id,nev) VALUES (3018,'Véménd');
INSERT INTO VAROS(id,nev) VALUES (3019,'Vének');
INSERT INTO VAROS(id,nev) VALUES (3020,'Vép');
INSERT INTO VAROS(id,nev) VALUES (3021,'Vereb');
INSERT INTO VAROS(id,nev) VALUES (3022,'Veresegyház');
INSERT INTO VAROS(id,nev) VALUES (3023,'Verőce');
INSERT INTO VAROS(id,nev) VALUES (3024,'Verpelét');
INSERT INTO VAROS(id,nev) VALUES (3025,'Verseg');
INSERT INTO VAROS(id,nev) VALUES (3026,'Versend');
INSERT INTO VAROS(id,nev) VALUES (3027,'Vértesacsa');
INSERT INTO VAROS(id,nev) VALUES (3028,'Vértesboglár');
INSERT INTO VAROS(id,nev) VALUES (3029,'Vérteskethely');
INSERT INTO VAROS(id,nev) VALUES (3030,'Vértessomló');
INSERT INTO VAROS(id,nev) VALUES (3031,'Vértestolna');
INSERT INTO VAROS(id,nev) VALUES (3032,'Vértesszőlős');
INSERT INTO VAROS(id,nev) VALUES (3033,'Vése');
INSERT INTO VAROS(id,nev) VALUES (3034,'Veszkény');
INSERT INTO VAROS(id,nev) VALUES (3035,'Veszprém');
INSERT INTO VAROS(id,nev) VALUES (3036,'Veszprémfajsz');
INSERT INTO VAROS(id,nev) VALUES (3037,'Veszprémgalsa');
INSERT INTO VAROS(id,nev) VALUES (3038,'Veszprémvarsány');
INSERT INTO VAROS(id,nev) VALUES (3039,'Vésztő');
INSERT INTO VAROS(id,nev) VALUES (3040,'Vezseny');
INSERT INTO VAROS(id,nev) VALUES (3041,'Vid');
INSERT INTO VAROS(id,nev) VALUES (3042,'Vigántpetend');
INSERT INTO VAROS(id,nev) VALUES (3043,'Villány');
INSERT INTO VAROS(id,nev) VALUES (3044,'Villánykövesd');
INSERT INTO VAROS(id,nev) VALUES (3045,'Vilmány');
INSERT INTO VAROS(id,nev) VALUES (3046,'Vilonya');
INSERT INTO VAROS(id,nev) VALUES (3047,'Vilyvitány');
INSERT INTO VAROS(id,nev) VALUES (3048,'Vinár');
INSERT INTO VAROS(id,nev) VALUES (3049,'Vindornyafok');
INSERT INTO VAROS(id,nev) VALUES (3050,'Vindornyalak');
INSERT INTO VAROS(id,nev) VALUES (3051,'Vindornyaszőlős');
INSERT INTO VAROS(id,nev) VALUES (3052,'Visegrád');
INSERT INTO VAROS(id,nev) VALUES (3053,'Visnye');
INSERT INTO VAROS(id,nev) VALUES (3054,'Visonta');
INSERT INTO VAROS(id,nev) VALUES (3055,'Viss');
INSERT INTO VAROS(id,nev) VALUES (3056,'Visz');
INSERT INTO VAROS(id,nev) VALUES (3057,'Viszák');
INSERT INTO VAROS(id,nev) VALUES (3058,'Viszló');
INSERT INTO VAROS(id,nev) VALUES (3059,'Visznek');
INSERT INTO VAROS(id,nev) VALUES (3060,'Vitnyéd');
INSERT INTO VAROS(id,nev) VALUES (3061,'Vízvár');
INSERT INTO VAROS(id,nev) VALUES (3062,'Vizslás');
INSERT INTO VAROS(id,nev) VALUES (3063,'Vizsoly');
INSERT INTO VAROS(id,nev) VALUES (3064,'Vokány');
INSERT INTO VAROS(id,nev) VALUES (3065,'Vonyarcvashegy');
INSERT INTO VAROS(id,nev) VALUES (3066,'Vöckönd');
INSERT INTO VAROS(id,nev) VALUES (3067,'Völcsej');
INSERT INTO VAROS(id,nev) VALUES (3068,'Vönöck');
INSERT INTO VAROS(id,nev) VALUES (3069,'Vöröstó');
INSERT INTO VAROS(id,nev) VALUES (3070,'Vörs');
INSERT INTO VAROS(id,nev) VALUES (3071,'Zabar');
INSERT INTO VAROS(id,nev) VALUES (3072,'Zádor');
INSERT INTO VAROS(id,nev) VALUES (3073,'Zádorfalva');
INSERT INTO VAROS(id,nev) VALUES (3074,'Zagyvarékas');
INSERT INTO VAROS(id,nev) VALUES (3075,'Zagyvaszántó');
INSERT INTO VAROS(id,nev) VALUES (3076,'Záhony');
INSERT INTO VAROS(id,nev) VALUES (3077,'Zajk');
INSERT INTO VAROS(id,nev) VALUES (3078,'Zajta');
INSERT INTO VAROS(id,nev) VALUES (3079,'Zákány');
INSERT INTO VAROS(id,nev) VALUES (3080,'Zákányfalu');
INSERT INTO VAROS(id,nev) VALUES (3081,'Zákányszék');
INSERT INTO VAROS(id,nev) VALUES (3082,'Zala');
INSERT INTO VAROS(id,nev) VALUES (3083,'Zalaapáti');
INSERT INTO VAROS(id,nev) VALUES (3084,'Zalabaksa');
INSERT INTO VAROS(id,nev) VALUES (3085,'Zalabér');
INSERT INTO VAROS(id,nev) VALUES (3086,'Zalaboldogfa');
INSERT INTO VAROS(id,nev) VALUES (3087,'Zalacsány');
INSERT INTO VAROS(id,nev) VALUES (3088,'Zalacséb');
INSERT INTO VAROS(id,nev) VALUES (3089,'Zalaegerszeg');
INSERT INTO VAROS(id,nev) VALUES (3090,'Zalaerdőd');
INSERT INTO VAROS(id,nev) VALUES (3091,'Zalagyömörő');
INSERT INTO VAROS(id,nev) VALUES (3092,'Zalahaláp');
INSERT INTO VAROS(id,nev) VALUES (3093,'Zalaháshágy');
INSERT INTO VAROS(id,nev) VALUES (3094,'Zalaigrice');
INSERT INTO VAROS(id,nev) VALUES (3095,'Zalaistvánd');
INSERT INTO VAROS(id,nev) VALUES (3096,'Zalakaros');
INSERT INTO VAROS(id,nev) VALUES (3097,'Zalakomár');
INSERT INTO VAROS(id,nev) VALUES (3098,'Zalaköveskút');
INSERT INTO VAROS(id,nev) VALUES (3099,'Zalalövő');
INSERT INTO VAROS(id,nev) VALUES (3100,'Zalameggyes');
INSERT INTO VAROS(id,nev) VALUES (3101,'Zalamerenye');
INSERT INTO VAROS(id,nev) VALUES (3102,'Zalasárszeg');
INSERT INTO VAROS(id,nev) VALUES (3103,'Zalaszabar');
INSERT INTO VAROS(id,nev) VALUES (3104,'Zalaszántó');
INSERT INTO VAROS(id,nev) VALUES (3105,'Zalaszegvár');
INSERT INTO VAROS(id,nev) VALUES (3106,'Zalaszentbalázs');
INSERT INTO VAROS(id,nev) VALUES (3107,'Zalaszentgrót');
INSERT INTO VAROS(id,nev) VALUES (3108,'Zalaszentgyörgy');
INSERT INTO VAROS(id,nev) VALUES (3109,'Zalaszentiván');
INSERT INTO VAROS(id,nev) VALUES (3110,'Zalaszentjakab');
INSERT INTO VAROS(id,nev) VALUES (3111,'Zalaszentlászló');
INSERT INTO VAROS(id,nev) VALUES (3112,'Zalaszentlőrinc');
INSERT INTO VAROS(id,nev) VALUES (3113,'Zalaszentmárton');
INSERT INTO VAROS(id,nev) VALUES (3114,'Zalaszentmihály');
INSERT INTO VAROS(id,nev) VALUES (3115,'Zalaszombatfa');
INSERT INTO VAROS(id,nev) VALUES (3116,'Zaláta');
INSERT INTO VAROS(id,nev) VALUES (3117,'Zalatárnok');
INSERT INTO VAROS(id,nev) VALUES (3118,'Zalaújlak');
INSERT INTO VAROS(id,nev) VALUES (3119,'Zalavár');
INSERT INTO VAROS(id,nev) VALUES (3120,'Zalavég');
INSERT INTO VAROS(id,nev) VALUES (3121,'Zalkod');
INSERT INTO VAROS(id,nev) VALUES (3122,'Zamárdi');
INSERT INTO VAROS(id,nev) VALUES (3123,'Zámoly');
INSERT INTO VAROS(id,nev) VALUES (3124,'Zánka');
INSERT INTO VAROS(id,nev) VALUES (3125,'Zaránk');
INSERT INTO VAROS(id,nev) VALUES (3126,'Závod');
INSERT INTO VAROS(id,nev) VALUES (3127,'Zebecke');
INSERT INTO VAROS(id,nev) VALUES (3128,'Zebegény');
INSERT INTO VAROS(id,nev) VALUES (3129,'Zemplénagárd');
INSERT INTO VAROS(id,nev) VALUES (3130,'Zengővárkony');
INSERT INTO VAROS(id,nev) VALUES (3131,'Zichyújfalu');
INSERT INTO VAROS(id,nev) VALUES (3132,'Zics');
INSERT INTO VAROS(id,nev) VALUES (3133,'Ziliz');
INSERT INTO VAROS(id,nev) VALUES (3134,'Zimány');
INSERT INTO VAROS(id,nev) VALUES (3135,'Zirc');
INSERT INTO VAROS(id,nev) VALUES (3136,'Zók');
INSERT INTO VAROS(id,nev) VALUES (3137,'Zomba');
INSERT INTO VAROS(id,nev) VALUES (3138,'Zubogy');
INSERT INTO VAROS(id,nev) VALUES (3139,'Zsadány');
INSERT INTO VAROS(id,nev) VALUES (3140,'Zsáka');
INSERT INTO VAROS(id,nev) VALUES (3141,'Zsámbék');
INSERT INTO VAROS(id,nev) VALUES (3142,'Zsámbok');
INSERT INTO VAROS(id,nev) VALUES (3143,'Zsana');
INSERT INTO VAROS(id,nev) VALUES (3144,'Zsarolyán');
INSERT INTO VAROS(id,nev) VALUES (3145,'Zsebeháza');
INSERT INTO VAROS(id,nev) VALUES (3146,'Zsédeny');
INSERT INTO VAROS(id,nev) VALUES (3147,'Zselickisfalud');
INSERT INTO VAROS(id,nev) VALUES (3148,'Zselickislak');
INSERT INTO VAROS(id,nev) VALUES (3149,'Zselicszentpál');
INSERT INTO VAROS(id,nev) VALUES (3150,'Zsennye');
INSERT INTO VAROS(id,nev) VALUES (3151,'Zsira');
INSERT INTO VAROS(id,nev) VALUES (3152,'Zsombó');
INSERT INTO VAROS(id,nev) VALUES (3153,'Zsujta');
INSERT INTO VAROS(id,nev) VALUES (3154,'Zsurk');


INSERT INTO ALLAPOT(id,megnevezes) VALUES (1,'elfogadva');
INSERT INTO ALLAPOT(id,megnevezes) VALUES (2,'elutasítva');
INSERT INTO ALLAPOT(id,megnevezes) VALUES (3,'feldolgozás alatt');


INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (1,'Rácz Albert','lbyers0','R7TQ03R');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (2,'Soós Noel','rkield1','Jd7vRQe20');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (3,'Pál Márkó','msnazle2','42t4FHdZM6Zb');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (4,'Fülöp Viktor','iherrieven3','Nay7WDeBCRE');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (5,'Apród Marcell','avedyashkin4','4WPuV9Y');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (6,'Lengyel Mihály','ysaltern5','1MZqGoJ9g');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (7,'Fodor Barna','wgroarty6','JiLCPjCyB');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (8,'Vincze Gergő','mmorrish7','gJCGsOht2C');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (9,'Kelemen Kálmán','pseman8','Lfr8oS');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (10,'Bognár Adrián','aroughan9','zZMT6i');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (11,'Orsós Botond','kjellymana','i3wiXXaL');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (12,'Lakatos János','bsothernb','kV6Ea78ytJD');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (13,'Németh Szabolcs','fpiddlesdenc','dTklnzA0');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (14,'Mészáros Tamás','gstriplingd','EoG0XF');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (15,'Veres Dénes','llanstone','XB0Uywur81');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (16,'Pásztor Róbert','fbegginf','iQN264fq');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (17,'Major Viktor','jyearnesg','jYL46qi');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (18,'Sípos Kevin','pliverh','2Fhp2fea');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (19,'Kiss Márton','ggregoni','aYm5Y6');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (20,'László Antal','lgrahlj','yuXMA6jSjV1Y');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (21,'Szücs László','pbrindk','kOJANw2BOU');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (22,'Simon Mihály','kkingswelll','MharKqI3vb');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (23,'Kerekes Alex','kringrosem','2JIOaIIi8N');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (24,'Fekete Zsolt','shinchcliffen','5rgL1j27');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (25,'Pap Csongor','jorigino','fVHzQeYc');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (26,'Szőke Máté','mchrystalp','UPnXncu7');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (27,'Csonka Vilmos','amacknockerq','m5Uf8SjaA');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (28,'Székely Csanád','jwarlawr','IdN9nCjE');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (29,'Bakos Géza','ecorstons','gKiDxzB');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (30,'Bognár Henrik','cpetscheltt','BPwaLxYGKsq');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (31,'Gál Veronika','tdovestonu','m5PeFD');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (32,'Orbán Szimonetta','cliddenv','9edgMcsnU6qW');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (33,'Vörös Annamária','edew','9WMS1D');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (34,'Szűts Anita','agiraudox','E7YOSShejID');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (35,'Pál Alexandra','aphillpsy','7DMFVuIy');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (36,'Zobor Laura','chalfheadz','1bVjBiODZ8xS');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (37,'Simon Lili','rsimacek10','PADENFOm8yE');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (38,'Sípos Mónika','bcolquete11','L4uppUW');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (39,'Kovács Vanessza','zdowse12','FovlcWAlvr');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (40,'Dobos Beatrix','vo13','1xEcWXjopwU4');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (41,'Kis Mátyás','smindenhall14','0e9zw3JCn');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (42,'Nemes Milán','mminocchi15','HOA4NKNcAt3A');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (43,'Fekete Bence','jgazzard16','ZL6Rph');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (44,'Magyar Csaba','sjosling17','wv7UOdSwK');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (45,'Sándor Dezső','hfriday18','tNldRT3px');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (46,'Kelemen Vince','ckarel19','f06aHk');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (47,'Zobor Levente','amonini1a','HiSyP0Zke');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (48,'Szalai Albert','kphilipsson1b','6gTIRhgE');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (49,'Illés Szabolcs','pvoff1c','CvaaRqsx');
INSERT INTO MODERATOR(id,nev,felh_nev,jelszo) VALUES (50,'Barna Endre','bcartmel1d','v8wlWzrHe');


INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (1,'Pap András','jlunge0@blinklist.com','+86 927 346 0120');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (2,'Bognár Mátyás','jmcinnerny1@myspace.com','+62 975 135 9922');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (3,'Nemes Bálint','pstruis2@cornell.edu','+86 521 214 1412');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (4,'Vászoly Zsombor','kdicken3@opera.com','+86 384 820 2618');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (5,'Zobor Dominik','oburch4@netscape.com','+62 510 275 9463');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (6,'Somogyi Olivér','jlowdyane5@mozilla.com','+33 462 570 7252');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (7,'Orosz Zsolt','lchalcraft6@nsw.gov.au','+33 819 371 4710');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (8,'Lengyel Richárd','dsimnel7@comsenz.com','+86 754 481 8859');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (9,'Lakatos Alex','sraven8@netvibes.com','+235 436 488 4210');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (10,'Novák József','cvoyce9@unblog.fr','+1 619 492 1906');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (11,'Rácz Erik','mgreensladea@abc.net.au','+86 723 609 3428');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (12,'Fodor Dávid','iacostab@symantec.com','+7 342 599 0191');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (13,'Pál Máté','tarnleyc@e-recht24.de','+1 816 437 7401');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (14,'Fábián Richárd','shalsond@squidoo.com','+86 800 801 7523');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (15,'Bács László','tkeileye@is.gd','+506 873 469 5014');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (16,'Virág Endre','sdopplerf@livejournal.com','+55 293 735 6216');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (17,'Csonka Alex','mgilmoreg@msu.edu','+380 276 948 2849');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (18,'Csatár Lajos','wharmonh@bbb.org','+41 794 197 7583');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (19,'Miksa Sándor','hthurbyi@columbia.edu','+57 264 216 3710');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (20,'Kis Márk','fstihlj@cafepress.com','+1 893 869 4452');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (21,'Katona József','sweatherallk@google.com.au','+86 754 620 1502');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (22,'Fodor Szilveszter','mtringl@ovh.net','+66 562 633 1424');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (23,'László Bertalan','kblucherm@typepad.com','+48 564 117 1910');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (24,'Bálint Richárd','aborlandn@sfgate.com','+386 786 298 0230');
INSERT INTO KAPCSOLATTARTO(id,nev,email,telefonszam) VALUES (25,'Tóth Marcell','bdealo@google.com','+1 303 934 5563');


INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (1,'ABAHÁZY Bt. - Fordítóiroda',942,'Vörösmarty utca',8,'gdakhno0','ZGKIR6',11);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (2,'AMAKSZ Kft.',1720,'Zöldfa utca',39,'jwildber1','4NM6RL',13);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (3,'ANDREZOL-NET Kft.',2752,'Zrínyi utca',82,'kcashman2','Pi8ER1f',23);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (4,'Autobox5 Bt.',1350,'Templom köz',62,'rbriggdale3','dFMEd234onVQ',3);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (5,'Bajnai Nóra Katalin pszichológus',1064,'Toldi utca',51,'jhylden4','NhDxmA6w',5);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (6,'Baliza Kft - GDmats.eu',739,'Tölgyfa utca',41,'cpiens5','XJrMxU4JWmb',6);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (7,'Central PC Service Bt.',2431,'Töltés utca',100,'klippatt6','68wxSFSfCct',22);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (8,'Creatick Online Marketing',2600,'Tompa utca',53,'ttutton7','pA9O3JsX',25);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (9,'Csepp-Kőker Kft.',306,'Róna utca',100,'dbattams8','7G021BL6C49a',7);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (10,'D’oro Italia Hungary',1611,'Rövid utca',78,'mmyott9','GJ2CNx0rnB',9);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (11,'DentalCrown Kft.',2714,'Rózsa utca',48,'rwayletta','uBddG526',19);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (12,'Eupor Group Kft.',557,'Sárhajó utca',95,'rdeanesyb','cj2oG2hLTp',10);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (13,'Exkluzív Asztalos',719,'Sarló utca',129,'djevonc','Q7yMaLK',2);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (14,'Gizsahigiénia',338,'Mátyás király utca',136,'delmhurstd','gwZCNI3Al',1);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (15,'Gyógyforrás Gyógycentrum',1887,'Meggy utca',95,'tpavette','EZQSrOWzJyO',20);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (16,'Haladjunk.hu',1330,'Mezei utca',112,'amithunf','Bh2WnjmxHv',8);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (17,'Hard Bútor',2076,'Mikes utca',58,'mtowng','GmhWrFsh',21);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (18,'Ház-Mester 2006 Bt.',1468,'Asztalos utca',100,'hparmanh','SgOJwrjtg0O',15);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (19,'Hetényi Clean',969,'Attila utca',3,'cpooli','HKRLaLkVi',12);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (20,'Hornyák Design',430,'Deák Ferenc utca',13,'bkringej','2asoSq',16);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (21,'Irtó Trió Kft.',118,'Décseri utca',42,'mmaccheynek','kvv0E2BB',24);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (22,'KataPorta',194,'Dió utca',128,'draul','YkJDWImRSm',14);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (23,'Kék-Suli Oktatóközpont',1922,'Domokos utca',42,'gberfordm','52BJlGM2i',18);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (24,'Kéri Bádog Direct',2677,'Dózsa utca',79,'hhinksn','Ykia6rZIQvO',4);
INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) VALUES (25,'Király László Ferenc e.v.',3040,'Drága utca',69,'mchazelaso','VTV5KG',17);


INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (1,12,2432,40,'Elektromechanikai műszerész','Sed sagittis.',183356,TO_TIMESTAMP('2018.09.30 17:35 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (2,25,156,41,'Elektromos gép- és készülékszerelő','Aenean sit amet justo. Morbi ut odio.',146280,TO_TIMESTAMP('2018.12.28 3:57 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (3,25,2582,42,'Elektronikai műszerész','Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',276465,TO_TIMESTAMP('2018.08.10 17:43 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (4,5,712,43,'Elektronikai technikus','Aenean auctor gravida sem.',188442,TO_TIMESTAMP('2018.06.17 14:36 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (5,18,1928,44,'Élelmiszer- és vegyiáru-eladó','Sed vel enim sit amet nunc viverra dapibus.',126260,TO_TIMESTAMP('2018.04.13 3:30 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (6,18,1651,45,'Élelmiszer-higiénikus','Quisque ut erat.',144032,TO_TIMESTAMP('2018.03.13 1:21 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (7,12,631,46,'Energiahasznosító berendezés szerelője','Aenean fermentum.',477766,TO_TIMESTAMP('2019.02.07 21:48 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (8,18,1484,47,'Épület- és építménybádogos','Cras non velit nec nisi vulputate nonummy.',123098,TO_TIMESTAMP('2018.03.18 19:57 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (9,9,1738,48,'Épületasztalos','Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.',389497,TO_TIMESTAMP('2019.02.11 10:24 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (10,22,1299,49,'Épületgépész technikus','Sed accumsan felis. Ut at dolor quis odio consequat varius.',141723,TO_TIMESTAMP('2019.02.27 4:24 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (11,6,236,50,'Erősáramú eletrotechnikus','Duis bibendum.',181858,TO_TIMESTAMP('2018.03.20 19:35 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (12,17,919,51,'Fémműves','Pellentesque ultrices mattis odio.',111680,TO_TIMESTAMP('2019.01.01 18:41 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (13,3,2648,52,'Értékpapírpiaci szakügyintéző','Nulla justo.',294777,TO_TIMESTAMP('2018.06.13 16:37 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (14,19,1858,53,'Fényképész- és fotótermék kereskedő','Donec quis orci eget orci vehicula condimentum.',109670,TO_TIMESTAMP('2018.11.27 19:33 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (15,6,1637,54,'Férfiszabó','Suspendisse potenti. Nullam porttitor lacus at turpis.',186644,TO_TIMESTAMP('2018.03.20 12:32 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (16,22,1097,55,'Festő','Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',103740,TO_TIMESTAMP('2018.12.03 22:00 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (17,3,1554,56,'Finommechanikai műszerész','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',102820,TO_TIMESTAMP('2018.04.05 13:50 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (18,7,1491,57,'Fitness-wellness asszisztens','In hac habitasse platea dictumst.',183974,TO_TIMESTAMP('2018.03.26 10:42 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (19,16,1807,58,'Fodrász','Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',100483,TO_TIMESTAMP('2018.10.26 22:26 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (20,8,1255,59,'Fogászati asszisztens','Donec posuere metus vitae ipsum. Aliquam non mauris.',136453,TO_TIMESTAMP('2018.12.15 1:05 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (21,1,2690,60,'Fogtechnikus (rész: fülilleszték készítő)','Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend.',145492,TO_TIMESTAMP('2018.08.17 4:17 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (22,7,316,61,'Forgalmi szolgálattevő','Aenean lectus.',139416,TO_TIMESTAMP('2018.04.10 22:20 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (23,1,1073,62,'Fűszernövény-termesztő','Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci.',115509,TO_TIMESTAMP('2018.11.04 18:40 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (24,12,484,63,'Gazdasági informatikus','Nullam porttitor lacus at turpis.',286137,TO_TIMESTAMP('2019.03.02 21:16 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (25,6,1689,64,'Gázfogyasztásberendezés- és csőhálózat-szerelő','Donec posuere metus vitae ipsum. Aliquam non mauris.',112590,TO_TIMESTAMP('2018.11.11 21:38 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (26,11,2800,65,'Gépgyártástechnológiai technikus','Nullam varius. Nulla facilisi.',145808,TO_TIMESTAMP('2018.05.24 12:30 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (27,23,2916,66,'Gépi forgácsoló','Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.',299768,TO_TIMESTAMP('2019.01.28 0:26 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (28,12,1711,67,'Géplakatos','Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',191893,TO_TIMESTAMP('2018.09.07 10:46 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (29,19,2744,68,'Gombatermesztő','Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',118392,TO_TIMESTAMP('2018.11.05 20:46 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (30,24,2614,69,'Grafológus','Nullam varius. Nulla facilisi.',140284,TO_TIMESTAMP('2018.09.23 9:02 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (31,22,1680,70,'Gyógymasszőr','Integer non velit.',281023,TO_TIMESTAMP('2018.08.08 4:31 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (32,10,2124,71,'Gyógynövénytermesztő','Phasellus in felis. Donec semper sapien a libero.',123567,TO_TIMESTAMP('2018.10.21 8:25 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (33,20,60,72,'Gyógypedagógiai asszisztens','Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae',112590,TO_TIMESTAMP('2018.08.12 9:26 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (34,15,1787,73,'Gyógyszertári asszisztens','Praesent id massa id nisl venenatis lacinia.',121165,TO_TIMESTAMP('2018.07.17 5:50 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (35,17,56,74,'Gyorséttermi- és ételeladó','Phasellus sit amet erat.',114264,TO_TIMESTAMP('2018.09.30 11:15 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (36,15,1603,75,'Hajózási technikus','Integer ac leo. Pellentesque ultrices mattis odio.',178214,TO_TIMESTAMP('2018.07.27 20:48 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (37,25,765,76,'Hangtechnikus','Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.',133985,TO_TIMESTAMP('2018.08.07 10:57 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (38,25,2605,77,'Hegesztő','Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',143597,TO_TIMESTAMP('2019.02.14 6:13 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (39,24,859,78,'Hídépítő és -fenntartó technikus','In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',135919,TO_TIMESTAMP('2018.12.18 11:09 ','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLAS(id,ceg_id,varos_id,szakma_id,munkakor,leiras,ber,feladas_datuma) VALUES (40,2,2786,79,'Hulladékgazdálkodó','Phasellus id sapien in sapien iaculis congue.',116624,TO_TIMESTAMP('2018.09.30 19:08 ','YYYY.MM.DD HH24:MI'));


INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (1,'Jónás Tamás',TO_TIMESTAMP('1987.07.11 2:40','YYYY.MM.DD HH24:MI'),'jarndell0@quantcast.com',1369,'Baky utca',21,2,'cmartinovsky0','e4klhNLQ7GvJ',TO_TIMESTAMP('2018.06.21 6:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (2,'Szücs Benedek',TO_TIMESTAMP('1955.11.22 19:20','YYYY.MM.DD HH24:MI'),'sdexter1@symantec.com',555,'Árvízvédelmi töltés',51,1,'mfrick1','KcwkA9NcmS',TO_TIMESTAMP('2018.10.23 17:24','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (3,'Apród Soma',TO_TIMESTAMP('1994.06.07 10:54','YYYY.MM.DD HH24:MI'),'gregitz2@bloomberg.com',2135,'Csendes utca',249,3,'zhamprecht2','zyJGOff',TO_TIMESTAMP('2018.11.24 2:46','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (4,'Zobor Krisztián',TO_TIMESTAMP('1958.05.31 17:59','YYYY.MM.DD HH24:MI'),'fgillice3@ebay.com',2681,'Kettős-Körös híd',49,1,'psimoncelli3','CbLK9d7pz4',TO_TIMESTAMP('2018.09.06 11:56','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (5,'Lukács Richárd',TO_TIMESTAMP('1985.06.16 18:56','YYYY.MM.DD HH24:MI'),'dphilipet4@naver.com',2650,'Gyár utca',241,2,'ispier4','7bckfr',TO_TIMESTAMP('2019.01.24 11:55','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (6,'Bogdán Donát',TO_TIMESTAMP('1966.04.25 16:13','YYYY.MM.DD HH24:MI'),'eharesign5@who.int',1795,'Búzavirág utca',85,3,'raddyman5','5o36qhjlDG',TO_TIMESTAMP('2018.04.09 19:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (7,'Tamás Imre',TO_TIMESTAMP('1976.06.26 11:15','YYYY.MM.DD HH24:MI'),'jpinnion6@feedburner.com',299,'Árok utca',124,3,'amumm6','Fh0ZSQqnj',TO_TIMESTAMP('2018.04.23 4:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (8,'Csonka Noel',TO_TIMESTAMP('1965.11.14 10:25','YYYY.MM.DD HH24:MI'),'krizziello7@example.com',1743,'Attila utca',240,3,'lmundell7','u1Bo7d',TO_TIMESTAMP('2018.08.28 3:14','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (9,'Miksa Géza',TO_TIMESTAMP('1961.02.14 0:34','YYYY.MM.DD HH24:MI'),'rlockney8@blinklist.com',67,'Álmos utca',11,1,'rsnelman8','UgaGDcuTv7',TO_TIMESTAMP('2018.09.27 4:01','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (10,'Bognár Alex',TO_TIMESTAMP('1977.02.17 4:12','YYYY.MM.DD HH24:MI'),'hwhistlecroft9@upenn.edu',271,'Csabai út',64,1,'astiggles9','JKtQIwx3r6x',TO_TIMESTAMP('2018.04.25 23:35','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (11,'Bogdán Rebeka',TO_TIMESTAMP('1981.09.25 15:08','YYYY.MM.DD HH24:MI'),'bdobrovolnya@discuz.net',1338,'Csabai utca',124,3,'mneavesa','58WV9gVnf',TO_TIMESTAMP('2018.10.12 21:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (12,'Nemes Mónika',TO_TIMESTAMP('1972.09.25 22:51','YYYY.MM.DD HH24:MI'),'kdenecampb@biblegateway.com',2730,'Kert utca',147,3,'foxxb','0ZqbQdb',TO_TIMESTAMP('2018.04.29 4:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (13,'Kocsis Nóra',TO_TIMESTAMP('1978.12.10 3:06','YYYY.MM.DD HH24:MI'),'slaverackc@theguardian.com',1962,'Farkas Gyula utca',168,2,'uhallfordc','viN8hF',TO_TIMESTAMP('2018.08.23 10:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (14,'Tóth Vivien',TO_TIMESTAMP('1993.11.23 12:26','YYYY.MM.DD HH24:MI'),'bmounceyd@comsenz.com',28,'Babilon sor',157,3,'kpilpovicd','KBa4KGK1ME',TO_TIMESTAMP('2019.02.02 8:18','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (15,'Simon Panna',TO_TIMESTAMP('1955.11.14 17:17','YYYY.MM.DD HH24:MI'),'ddate@bing.com',1694,'Ék utca',115,1,'feastope','Vexwydc',TO_TIMESTAMP('2019.02.25 15:19','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (16,'Kerekes Emese',TO_TIMESTAMP('1984.02.07 1:18','YYYY.MM.DD HH24:MI'),'asimonsonf@issuu.com',346,'Fehér-Körös sor',23,1,'fschollickf','erLAqZYK',TO_TIMESTAMP('2018.11.12 0:22','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (17,'Virág Júlia',TO_TIMESTAMP('1987.09.10 14:08','YYYY.MM.DD HH24:MI'),'cwinningg@google.fr',492,'Fülöp utca',195,3,'hgawthorpg','tlp7078DFp',TO_TIMESTAMP('2018.04.09 3:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (18,'Lengyel Izabella',TO_TIMESTAMP('1981.11.15 14:55','YYYY.MM.DD HH24:MI'),'gbreffith@creativecommons.org',2298,'Borosgyán utca',199,3,'asilcocksh','z27Xj81Y',TO_TIMESTAMP('2018.04.22 5:05','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (19,'Somogyi Cintia',TO_TIMESTAMP('1952.06.08 20:57','YYYY.MM.DD HH24:MI'),'lorgeli@devhub.com',210,'Bihari János utca',229,1,'lbenezi','AsDGMAvlO',TO_TIMESTAMP('2018.05.09 2:23','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (20,'Bálint Gréta',TO_TIMESTAMP('1976.05.25 5:48','YYYY.MM.DD HH24:MI'),'gleggingj@a8.net',671,'Brassói utca',30,2,'iramsteadj','j9OZOIe',TO_TIMESTAMP('2019.02.26 0:16','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (21,'Kapolcs Evelin',TO_TIMESTAMP('1994.02.09 5:40','YYYY.MM.DD HH24:MI'),'lbarwoodk@wikimedia.org',85,'Csap utca',137,1,'brusek','H66nBRfMN',TO_TIMESTAMP('2018.08.27 14:16','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (22,'Barna Melinda',TO_TIMESTAMP('1997.10.12 15:12','YYYY.MM.DD HH24:MI'),'umceachernl@t-online.de',1164,'Ady Endre utca',125,2,'gmabbsl','X8IWOHZttk',TO_TIMESTAMP('2018.06.07 20:48','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (23,'Balla Kata',TO_TIMESTAMP('1988.01.27 16:45','YYYY.MM.DD HH24:MI'),'pcroncheym@smugmug.com',1914,'Füzes utca',221,2,'ljuram','bCfXVOQ76ho',TO_TIMESTAMP('2018.04.19 14:40','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (24,'Orsós Izabella',TO_TIMESTAMP('1966.05.01 20:00','YYYY.MM.DD HH24:MI'),'dchsteneyn@thetimes.co.uk',2524,'Boglárka tér',9,1,'chowerdn','pEJHiGXzhMuD',TO_TIMESTAMP('2018.08.24 16:48','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (25,'Oláh Eszter',TO_TIMESTAMP('1983.04.01 12:35','YYYY.MM.DD HH24:MI'),'rdillawayo@cloudflare.com',2690,'Drága utca',69,2,'stewkesburyo','oEuYZSjX',TO_TIMESTAMP('2018.08.08 19:40','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (26,'Mezei Lilla',TO_TIMESTAMP('1974.12.21 13:20','YYYY.MM.DD HH24:MI'),'eblondellp@slate.com',462,'Dió utca',42,1,'tambrosiop','owa67dD7CJRV',TO_TIMESTAMP('2019.02.13 7:24','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (27,'Király Adrienn',TO_TIMESTAMP('1979.09.15 4:56','YYYY.MM.DD HH24:MI'),'oreedickq@pagesperso-orange.fr',3080,'Gagarin utca',133,2,'mchristolq','VSH0fCVDvro',TO_TIMESTAMP('2019.01.03 8:48','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (28,'Virág Regina',TO_TIMESTAMP('1973.12.11 15:48','YYYY.MM.DD HH24:MI'),'dmcgillivrayr@taobao.com',1465,'Daru utca',42,1,'rgoymerr','ocOuSlGPVHJ',TO_TIMESTAMP('2018.07.02 7:38','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (29,'Hegedüs Ágnes',TO_TIMESTAMP('1976.10.18 23:33','YYYY.MM.DD HH24:MI'),'aredholess@barnesandnoble.com',1717,'Báthori utca',228,1,'agirardengos','12m6AksDnPX',TO_TIMESTAMP('2019.02.10 5:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (30,'Lukács Dalma',TO_TIMESTAMP('1991.09.14 13:17','YYYY.MM.DD HH24:MI'),'msivornt@photobucket.com',1935,'Bolyai utca',99,3,'edmitrievt','8r4oeQ',TO_TIMESTAMP('2018.08.27 12:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (31,'Antal Roland',TO_TIMESTAMP('1997.08.18 23:37','YYYY.MM.DD HH24:MI'),'cpobjayu@facebook.com',1953,'Dózsa utca',105,1,'bcollatonu','68ugng2NhlUq',TO_TIMESTAMP('2018.08.30 9:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (32,'Szabó Imre',TO_TIMESTAMP('1954.12.07 13:20','YYYY.MM.DD HH24:MI'),'lsecretv@phpbb.com',1658,'Gyöngy utca',166,2,'mhaddockv','ecLUhv',TO_TIMESTAMP('2018.09.03 11:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (33,'Tamás Alex',TO_TIMESTAMP('1971.06.05 15:17','YYYY.MM.DD HH24:MI'),'sgrethamw@merriam-webster.com',790,'Erkel Ferenc utca',234,1,'demeneyw','pVdeBw',TO_TIMESTAMP('2019.01.19 20:37','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (34,'Apród Ármin',TO_TIMESTAMP('1967.09.18 6:32','YYYY.MM.DD HH24:MI'),'gsantacrolex@chron.com',2751,'Deák Ferenc utca',125,2,'tskirvinx','KfIMrtx5ium',TO_TIMESTAMP('2018.10.14 12:49','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (35,'Gáspár Máté',TO_TIMESTAMP('1961.11.25 1:06','YYYY.MM.DD HH24:MI'),'ssillarsy@opera.com',1197,'Gyűrű utca',11,3,'sgosdeny','t5fOGIgQZ6f',TO_TIMESTAMP('2018.11.16 2:11','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (36,'Balázs Rudolf',TO_TIMESTAMP('1954.11.21 13:39','YYYY.MM.DD HH24:MI'),'bgomesz@spotify.com',507,'Görbe utca',24,2,'cmortelz','lH6aGL2',TO_TIMESTAMP('2018.07.14 19:04','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (37,'Székely Gyula',TO_TIMESTAMP('1962.09.17 13:13','YYYY.MM.DD HH24:MI'),'cshoreson10@bigcartel.com',535,'Darab utca',23,2,'gnutbeem10','eJnM80M',TO_TIMESTAMP('2018.10.05 6:38','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (38,'Péter Ábel',TO_TIMESTAMP('1969.12.13 13:46','YYYY.MM.DD HH24:MI'),'cthaxter11@wix.com',682,'Epres köz',194,3,'igagen11','2LOZ8A',TO_TIMESTAMP('2018.10.15 10:00','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (39,'Zobor Valentin',TO_TIMESTAMP('1982.08.25 20:38','YYYY.MM.DD HH24:MI'),'afoli12@geocities.com',198,'Fonó utca',47,1,'elayne12','SHZDyfAMoVu',TO_TIMESTAMP('2018.06.17 12:29','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (40,'Major Norbert',TO_TIMESTAMP('1951.05.30 6:57','YYYY.MM.DD HH24:MI'),'ieassom13@360.cn',2184,'Dr. Veress Endre utca',56,2,'wpickerin13','ebZZ9Gl',TO_TIMESTAMP('2018.04.19 20:11','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (41,'Soós Henrik',TO_TIMESTAMP('1970.07.16 10:21','YYYY.MM.DD HH24:MI'),'cmatysiak14@businessinsider.com',2475,'Halász utca',133,3,'leubank14','aD14FgXDLM',TO_TIMESTAMP('2018.07.21 12:51','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (42,'Veres Ármin',TO_TIMESTAMP('1960.12.12 12:01','YYYY.MM.DD HH24:MI'),'ohassall15@desdev.cn',2811,'Hajnal utca',208,1,'btower15','wuVw9UUjzR8',TO_TIMESTAMP('2018.09.04 11:41','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (43,'Bálint Imre',TO_TIMESTAMP('1972.05.20 13:22','YYYY.MM.DD HH24:MI'),'jrossander16@ow.ly',1005,'Bercsényi utca',229,2,'edalrymple16','NazIZcaz0qi',TO_TIMESTAMP('2018.08.07 15:00','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (44,'Nagy Szilveszter',TO_TIMESTAMP('1984.09.01 22:43','YYYY.MM.DD HH24:MI'),'osanbrooke17@chicagotribune.com',3009,'Gőzmalom sor',119,1,'hmcronald17','a8kaT2PhGdM4',TO_TIMESTAMP('2018.04.12 21:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (45,'Bogdán Marcell',TO_TIMESTAMP('1962.05.04 11:19','YYYY.MM.DD HH24:MI'),'fbeardwell18@telegraph.co.uk',568,'Fiumei utca',15,3,'omarshland18','aaBdhMDQS',TO_TIMESTAMP('2018.04.07 2:10','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (46,'Horváth Soma',TO_TIMESTAMP('1962.12.28 12:33','YYYY.MM.DD HH24:MI'),'amapes19@mtv.com',1555,'Erzsébet ligeti híd',103,2,'lsalleir19','a4WifzhG',TO_TIMESTAMP('2018.07.28 5:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (47,'Pap Attila',TO_TIMESTAMP('1987.02.22 15:22','YYYY.MM.DD HH24:MI'),'trubinshtein1a@tmall.com',3016,'Ág utca',249,3,'uspiers1a','Hw0HBcxxE',TO_TIMESTAMP('2018.12.03 15:33','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (48,'Faragó Barna',TO_TIMESTAMP('1953.08.03 9:49','YYYY.MM.DD HH24:MI'),'lbraunter1b@hud.gov',52,'Durkó utca',177,3,'fdutch1b','rierWxOS',TO_TIMESTAMP('2018.03.25 21:33','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (49,'Barna György',TO_TIMESTAMP('1953.08.05 18:08','YYYY.MM.DD HH24:MI'),'fpenddreth1c@gnu.org',52,'Bánát utca',131,2,'hjoyson1c','uVan6HVI',TO_TIMESTAMP('2018.12.13 1:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (50,'Illés Csanád',TO_TIMESTAMP('1962.09.04 15:16','YYYY.MM.DD HH24:MI'),'jvertey1d@fotki.com',65,'Bocskai utca',178,1,'elermouth1d','HRvGFFy',TO_TIMESTAMP('2018.10.09 18:08','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (51,'Szilágyi Róbert',TO_TIMESTAMP('1960.01.04 15:42','YYYY.MM.DD HH24:MI'),'fmanvelle1e@alexa.com',2705,'Fúró utca',14,1,'tdaly1e','Jz208n',TO_TIMESTAMP('2018.09.24 4:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (52,'Illés Márk',TO_TIMESTAMP('1977.09.06 0:25','YYYY.MM.DD HH24:MI'),'gbalstone1f@foxnews.com',418,'Bethlen utca',57,2,'spaxforde1f','6OqL3w',TO_TIMESTAMP('2018.08.26 13:48','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (53,'Novák Albert',TO_TIMESTAMP('1956.06.08 23:26','YYYY.MM.DD HH24:MI'),'flisamore1g@e-recht24.de',2842,'Gát utca',215,2,'tdickie1g','HriA1TvNYHOy',TO_TIMESTAMP('2018.11.20 20:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (54,'Hajdú Nándor',TO_TIMESTAMP('1956.10.07 1:59','YYYY.MM.DD HH24:MI'),'astriker1h@msu.edu',1737,'Bartók Béla utca',160,2,'wchatain1h','NB4Nfc',TO_TIMESTAMP('2018.03.11 23:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (55,'Németh Márkó',TO_TIMESTAMP('1997.08.24 22:20','YYYY.MM.DD HH24:MI'),'jgeoghegan1i@rediff.com',2228,'Hajó utca',26,2,'gkemston1i','dh3fjvoAaQ',TO_TIMESTAMP('2018.11.07 3:24','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (56,'Juhász Mátyás',TO_TIMESTAMP('1980.07.25 11:34','YYYY.MM.DD HH24:MI'),'edun1j@mit.edu',1984,'Gólya utca',100,2,'hcoupman1j','yguZDdAgC',TO_TIMESTAMP('2018.04.06 0:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (57,'Szabó Antal',TO_TIMESTAMP('1989.02.01 8:00','YYYY.MM.DD HH24:MI'),'hcicetti1k@123-reg.co.uk',283,'Fecske utca',80,1,'amckay1k','3NKnWRuBX',TO_TIMESTAMP('2018.07.20 15:51','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (58,'Sípos Márió',TO_TIMESTAMP('1987.11.30 4:47','YYYY.MM.DD HH24:MI'),'rcullington1l@elegantthemes.com',2379,'Bánvég utca',33,3,'mhoffman1l','rF5Kdki',TO_TIMESTAMP('2018.04.01 9:21','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (59,'Nemes Dávid',TO_TIMESTAMP('1987.12.21 12:50','YYYY.MM.DD HH24:MI'),'gwaliszek1m@lulu.com',622,'Fekete-Körös sor',237,2,'bmallindine1m','XwqYCb',TO_TIMESTAMP('2018.09.29 12:14','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (60,'Kozma Lajos',TO_TIMESTAMP('1996.03.13 4:39','YYYY.MM.DD HH24:MI'),'gstoggell1n@usnews.com',1403,'Bodoki Károly utca',133,1,'ehudspith1n','BzPhca8s1Hol',TO_TIMESTAMP('2018.05.11 0:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (61,'Mezei Evelin',TO_TIMESTAMP('1955.07.16 12:32','YYYY.MM.DD HH24:MI'),'cborley1o@walmart.com',210,'Darányi utca',219,2,'rkreutzer1o','seo230hn4oSZ',TO_TIMESTAMP('2018.06.18 9:27','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (62,'Gulyás Boglárka',TO_TIMESTAMP('1970.11.17 0:26','YYYY.MM.DD HH24:MI'),'hfountian1p@slate.com',1352,'Gém utca',200,3,'ffriel1p','GggX2eNeO',TO_TIMESTAMP('2018.11.01 22:07','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (63,'Magyar Fruzsina',TO_TIMESTAMP('1998.07.16 21:47','YYYY.MM.DD HH24:MI'),'mvanderbrugge1q@army.mil',2213,'Előd utca',9,1,'pcleverley1q','Cght7ElRi',TO_TIMESTAMP('2019.01.04 4:14','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (64,'Török Katalin',TO_TIMESTAMP('1996.10.13 4:14','YYYY.MM.DD HH24:MI'),'tizen1r@feedburner.com',729,'Árpád utca',23,3,'esnasdell1r','wi66kH75h',TO_TIMESTAMP('2018.05.12 18:54','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (65,'Molnár Krisztina',TO_TIMESTAMP('1980.12.16 9:41','YYYY.MM.DD HH24:MI'),'rpyvis1s@cam.ac.uk',3089,'Kígyó utca',163,1,'lwornham1s','tVZTWwA',TO_TIMESTAMP('2018.05.26 10:18','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (66,'Szalai Éva',TO_TIMESTAMP('1993.08.13 11:14','YYYY.MM.DD HH24:MI'),'fraigatt1t@techcrunch.com',1708,'Asztalos utca',193,3,'mfeaks1t','AUiiWH6gRePu',TO_TIMESTAMP('2018.06.03 18:59','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (67,'Kelemen Beatrix',TO_TIMESTAMP('1955.08.22 7:43','YYYY.MM.DD HH24:MI'),'ksutterfield1u@drupal.org',2673,'Bajza utca',216,3,'ipumfrett1u','dfiF3Hgd8r',TO_TIMESTAMP('2018.04.04 10:59','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (68,'Hegedüs Dóra',TO_TIMESTAMP('1953.01.08 20:24','YYYY.MM.DD HH24:MI'),'bcheccucci1v@yellowbook.com',856,'Fürdő sétány',28,3,'mbarnewelle1v','uxJPTXAf',TO_TIMESTAMP('2018.03.26 1:57','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (69,'Dobos Kíra',TO_TIMESTAMP('1983.01.09 4:02','YYYY.MM.DD HH24:MI'),'hboutellier1w@spiegel.de',2418,'Asztalos utca',177,2,'cpereira1w','MB58gwBW',TO_TIMESTAMP('2018.11.03 6:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (70,'Zobor Ildikó',TO_TIMESTAMP('1970.03.10 1:30','YYYY.MM.DD HH24:MI'),'amattisssen1x@joomla.org',1111,'Kinizsi utca',62,1,'afurlong1x','9X7b59x5O',TO_TIMESTAMP('2018.09.19 1:07','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (71,'Fülöp Bianka',TO_TIMESTAMP('1988.07.29 14:39','YYYY.MM.DD HH24:MI'),'bgross1y@prweb.com',685,'Kereszt utca',199,2,'dtitford1y','JRefKIEmKYHh',TO_TIMESTAMP('2018.09.27 11:55','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (72,'Virág Csilla',TO_TIMESTAMP('1982.12.15 0:45','YYYY.MM.DD HH24:MI'),'dfarron1z@hibu.com',2948,'Décseri utca',40,2,'ehambrick1z','zyPLF53agtal',TO_TIMESTAMP('2018.03.19 21:44','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (73,'Tamás Adél',TO_TIMESTAMP('1980.09.29 17:01','YYYY.MM.DD HH24:MI'),'alewing20@walmart.com',2130,'Galamb utca',223,3,'senticott20','gvwHYA',TO_TIMESTAMP('2018.04.07 7:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (74,'Márton Sára',TO_TIMESTAMP('1982.03.31 15:04','YYYY.MM.DD HH24:MI'),'nhampstead21@oaic.gov.au',81,'Csallóközi utca',114,3,'astopford21','zDvHltkT',TO_TIMESTAMP('2018.03.23 2:22','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (75,'Orbán Rebeka',TO_TIMESTAMP('1995.09.10 14:41','YYYY.MM.DD HH24:MI'),'ctonepohl22@i2i.jp',642,'Bérenc utca',64,3,'mmcmichael22','rrYyZtYpZGa',TO_TIMESTAMP('2018.08.24 23:09','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (76,'Jónás Szimonetta',TO_TIMESTAMP('1955.10.06 16:39','YYYY.MM.DD HH24:MI'),'mlain23@ovh.net',2563,'Hegedűs utca',188,2,'cwilmut23','f6HcTfY',TO_TIMESTAMP('2018.09.13 6:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (77,'Soós Zsanett',TO_TIMESTAMP('1983.12.15 15:28','YYYY.MM.DD HH24:MI'),'hatterbury24@nhs.uk',2301,'Damjanich János utca',191,3,'fworsall24','1IZBqG',TO_TIMESTAMP('2018.11.03 17:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (78,'Hajdú Patrícia',TO_TIMESTAMP('1964.08.20 21:14','YYYY.MM.DD HH24:MI'),'fofeeny25@parallels.com',2209,'Keszeg utca',170,3,'kgowing25','T1gbhO7H',TO_TIMESTAMP('2018.04.09 15:07','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (79,'Rácz Annamária',TO_TIMESTAMP('1951.02.19 7:26','YYYY.MM.DD HH24:MI'),'ccollisson26@google.com.hk',1268,'Csokonai utca',197,2,'nyare26','NTrDQkRkx5',TO_TIMESTAMP('2018.05.29 0:28','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (80,'Somogyi Éva',TO_TIMESTAMP('1969.01.19 22:09','YYYY.MM.DD HH24:MI'),'vrivenzon27@japanpost.jp',2676,'Hársfa utca',230,3,'lamott27','9TPFd3s6',TO_TIMESTAMP('2018.08.19 14:49','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (81,'Bogdán Dániel',TO_TIMESTAMP('1989.11.11 4:34','YYYY.MM.DD HH24:MI'),'ehazell28@wikipedia.org',1019,'Csók zug',222,3,'rcoche28','uhTzBEzG4',TO_TIMESTAMP('2018.04.09 19:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (82,'Németh Kevin',TO_TIMESTAMP('1954.12.14 18:50','YYYY.MM.DD HH24:MI'),'pstormonth29@last.fm',207,'Cseresznye utca',244,3,'phurlin29','7FpVz2nJ',TO_TIMESTAMP('2018.11.06 12:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (83,'Török Béla',TO_TIMESTAMP('1974.04.20 23:44','YYYY.MM.DD HH24:MI'),'sgue2a@twitter.com',2424,'Fábián utca',248,3,'ychastan2a','8gngMujKK22O',TO_TIMESTAMP('2019.02.26 23:54','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (84,'Barta Valentin',TO_TIMESTAMP('1966.11.12 1:24','YYYY.MM.DD HH24:MI'),'eleyre2b@unc.edu',1430,'Keserűsor utca',125,3,'rtibols2b','gmbRbjAMtt0A',TO_TIMESTAMP('2018.10.24 19:09','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (85,'Dudás Máté',TO_TIMESTAMP('1954.03.17 22:38','YYYY.MM.DD HH24:MI'),'emoakes2c@unc.edu',2054,'Domokos utca',180,3,'lmasey2c','WUr2uZSkrmW',TO_TIMESTAMP('2018.08.12 17:20','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (86,'Sípos Vince',TO_TIMESTAMP('1979.05.22 16:44','YYYY.MM.DD HH24:MI'),'mtestin2d@europa.eu',980,'Gyulai utca',82,2,'challan2d','HwcUtqqZ49XR',TO_TIMESTAMP('2018.08.16 6:51','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (87,'Székely János',TO_TIMESTAMP('1981.09.02 0:42','YYYY.MM.DD HH24:MI'),'cpettwood2e@issuu.com',2801,'Ékes utca',222,3,'hbeards2e','AXxXZsrd',TO_TIMESTAMP('2018.03.26 13:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (88,'Bognár Levente',TO_TIMESTAMP('1985.10.21 17:06','YYYY.MM.DD HH24:MI'),'vfinci2f@yandex.ru',1007,'Dankó utca',107,1,'btwaite2f','oonzgvebg72',TO_TIMESTAMP('2018.12.31 10:28','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (89,'Szilágyi Ákos',TO_TIMESTAMP('1993.08.26 5:20','YYYY.MM.DD HH24:MI'),'ggabrieli2g@barnesandnoble.com',2693,'Egyenes utca',73,2,'bkirtley2g','Go2wbX0W5GcE',TO_TIMESTAMP('2018.11.26 23:27','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (90,'Major Richárd',TO_TIMESTAMP('1964.01.31 20:03','YYYY.MM.DD HH24:MI'),'obrailsford2h@about.me',419,'Csíkos utca',234,2,'adesaur2h','XqEMoWfhUnYX',TO_TIMESTAMP('2018.10.13 22:45','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (91,'Miksa Vince',TO_TIMESTAMP('1996.11.04 23:23','YYYY.MM.DD HH24:MI'),'tsalasar2i@biglobe.ne.jp',131,'Andor utca',126,2,'aaikin2i','Oa9XQVOMQV',TO_TIMESTAMP('2018.12.24 15:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (92,'Apród Géza',TO_TIMESTAMP('1990.08.19 21:34','YYYY.MM.DD HH24:MI'),'esegeswoeth2j@yelp.com',2242,'Borz utca',51,3,'jduplan2j','aN3VpcjAtpdT',TO_TIMESTAMP('2018.06.20 19:33','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (93,'Molnár Tamás',TO_TIMESTAMP('1971.07.11 13:53','YYYY.MM.DD HH24:MI'),'nnangle2k@mediafire.com',2503,'Akácfa utca',107,1,'fepilet2k','eLoYxIKA8',TO_TIMESTAMP('2018.04.17 1:58','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (94,'Major Árpád',TO_TIMESTAMP('1964.07.17 14:01','YYYY.MM.DD HH24:MI'),'tmariot2l@sogou.com',1404,'Kikötő utca',186,2,'dquinnette2l','YtF8RkhuXU',TO_TIMESTAMP('2019.02.24 5:58','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (95,'Székely Gergely',TO_TIMESTAMP('1981.04.09 3:09','YYYY.MM.DD HH24:MI'),'mcoule2m@mac.com',331,'Kerék utca',9,3,'tgladdin2m','QPA7qcrvx',TO_TIMESTAMP('2018.10.11 8:20','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (96,'Szalai Zsolt',TO_TIMESTAMP('1995.11.15 17:10','YYYY.MM.DD HH24:MI'),'rede2n@salon.com',325,'Arany János utca',247,1,'atregust2n','WMzAMl',TO_TIMESTAMP('2018.03.24 0:56','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (97,'Takács Ferenc',TO_TIMESTAMP('1971.08.27 12:23','YYYY.MM.DD HH24:MI'),'hjonin2o@google.co.jp',225,'Harcsa utca',176,2,'mramey2o','Z4Oi4cA6o',TO_TIMESTAMP('2018.06.08 17:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (98,'Biró Márió',TO_TIMESTAMP('1988.08.18 7:44','YYYY.MM.DD HH24:MI'),'ndebruijne2p@reverbnation.com',2225,'Fáy András utca',31,3,'nwatmore2p','XziE0L',TO_TIMESTAMP('2018.05.29 11:01','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (99,'Németh Tibor',TO_TIMESTAMP('1972.05.06 22:06','YYYY.MM.DD HH24:MI'),'kmckendo2q@marriott.com',2527,'Árvíz utca',12,1,'aashmole2q','mLzc2k6mQ',TO_TIMESTAMP('2018.04.20 14:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) VALUES (100,'Bodnár Dominik',TO_TIMESTAMP('1970.02.19 19:33','YYYY.MM.DD HH24:MI'),'tdahlback2r@hostgator.com',1707,'Gyékény utca',229,2,'nfrome2r','lmBNI6ye1Sh',TO_TIMESTAMP('2018.11.11 10:45','YYYY.MM.DD HH24:MI'));


INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (1,1);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (1,2);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (1,3);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (2,4);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (2,5);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (2,6);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (39,7);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (82,8);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (2,9);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (22,10);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (114,11);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (29,12);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (72,13);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (111,14);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (77,15);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (81,16);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (68,17);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (60,18);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (89,19);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (86,20);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (124,21);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (116,22);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (6,23);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (69,24);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (76,25);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (70,26);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (13,27);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (52,28);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (11,29);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (7,30);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (88,31);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (40,32);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (85,33);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (18,34);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (59,35);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (87,36);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (119,37);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (27,38);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (10,39);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (80,40);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (67,41);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (95,42);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (14,43);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (61,44);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (53,45);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (79,46);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (31,47);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (83,48);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (12,49);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (51,50);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (26,51);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (21,52);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (32,53);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (99,54);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (71,55);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (38,56);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (1,57);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (91,58);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (117,59);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (73,60);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (35,61);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (19,62);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (9,63);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (106,64);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (48,65);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (44,66);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (107,67);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (118,68);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (109,69);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (25,70);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (43,71);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (15,72);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (75,73);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (42,74);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (64,75);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (115,76);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (54,77);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (65,78);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (45,79);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (28,80);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (3,81);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (78,82);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (47,83);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (123,84);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (105,85);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (37,86);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (46,87);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (55,88);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (110,89);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (17,90);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (50,91);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (49,92);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (84,93);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (103,94);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (74,95);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (58,96);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (5,97);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (121,98);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (125,99);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (36,100);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (63,1);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (112,2);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (100,3);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (90,4);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (93,5);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (98,6);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (113,7);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (56,8);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (92,9);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (4,10);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (120,11);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (101,12);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (34,13);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (102,14);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (57,15);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (23,16);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (108,17);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (20,18);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (62,19);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (104,20);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (33,21);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (24,22);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (16,23);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (122,24);
INSERT INTO ALLASKERESOSZAKMA(szakma_id,allaskereso_id) VALUES (41,25);


INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (1,1,utl_raw.cast_to_raw('Phasellus in felis. Donec semper sapien a libero. Nam dui.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (2,2,utl_raw.cast_to_raw('Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (3,3,utl_raw.cast_to_raw('Nulla tempus. Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (4,4,utl_raw.cast_to_raw('Nulla tempus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (5,5,utl_raw.cast_to_raw('Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (6,6,utl_raw.cast_to_raw('Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (7,7,utl_raw.cast_to_raw('Maecenas rhoncus aliquam lacus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (8,8,utl_raw.cast_to_raw('Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin interdum mauris non ligula pellentesque ultrices.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (9,9,utl_raw.cast_to_raw('Vestibulum ac est lacinia nisi venenatis tristique.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (10,10,utl_raw.cast_to_raw('Aenean lectus. Pellentesque eget nunc.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (11,11,utl_raw.cast_to_raw('Vivamus tortor. Duis mattis egestas metus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (12,12,utl_raw.cast_to_raw('Praesent blandit. Nam nulla.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (13,13,utl_raw.cast_to_raw('Sed accumsan felis. Ut at dolor quis odio consequat varius.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (14,14,utl_raw.cast_to_raw('Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (15,15,utl_raw.cast_to_raw('Maecenas tincidunt lacus at velit.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (16,16,utl_raw.cast_to_raw('Morbi ut odio.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (17,17,utl_raw.cast_to_raw('Integer a nibh. In quis justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (18,18,utl_raw.cast_to_raw('Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (19,19,utl_raw.cast_to_raw('Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (20,20,utl_raw.cast_to_raw('Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (21,21,utl_raw.cast_to_raw('Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (22,22,utl_raw.cast_to_raw('Ut tellus. Nulla ut erat id mauris vulputate elementum.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (23,23,utl_raw.cast_to_raw('Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (24,24,utl_raw.cast_to_raw('Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (25,25,utl_raw.cast_to_raw('Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (26,26,utl_raw.cast_to_raw('Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (27,27,utl_raw.cast_to_raw('In hac habitasse platea dictumst.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (28,28,utl_raw.cast_to_raw('Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (29,29,utl_raw.cast_to_raw('Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (30,30,utl_raw.cast_to_raw('Nullam molestie nibh in lectus. Pellentesque at nulla. Suspendisse potenti.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (31,31,utl_raw.cast_to_raw('Donec posuere metus vitae ipsum. Aliquam non mauris.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (32,32,utl_raw.cast_to_raw('Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (33,33,utl_raw.cast_to_raw('Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (34,34,utl_raw.cast_to_raw('Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (35,35,utl_raw.cast_to_raw('Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (36,36,utl_raw.cast_to_raw('Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (37,37,utl_raw.cast_to_raw('Donec vitae nisi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (38,38,utl_raw.cast_to_raw('Curabitur gravida nisi at nibh.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (39,39,utl_raw.cast_to_raw('Etiam justo. Etiam pretium iaculis justo. In hac habitasse platea dictumst.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (40,40,utl_raw.cast_to_raw('In quis justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (41,41,utl_raw.cast_to_raw('Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (42,42,utl_raw.cast_to_raw('Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (43,43,utl_raw.cast_to_raw('Nulla tellus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (44,44,utl_raw.cast_to_raw('Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (45,45,utl_raw.cast_to_raw('Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (46,46,utl_raw.cast_to_raw('Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (47,47,utl_raw.cast_to_raw('Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (48,48,utl_raw.cast_to_raw('Phasellus sit amet erat. Nulla tempus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (49,49,utl_raw.cast_to_raw('In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat. Nulla nisl.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (50,50,utl_raw.cast_to_raw('Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (51,51,utl_raw.cast_to_raw('Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (52,52,utl_raw.cast_to_raw('Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (53,53,utl_raw.cast_to_raw('Morbi ut odio.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (54,54,utl_raw.cast_to_raw('Curabitur convallis.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (55,55,utl_raw.cast_to_raw('Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (56,56,utl_raw.cast_to_raw('Nam nulla.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (57,57,utl_raw.cast_to_raw('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (58,58,utl_raw.cast_to_raw('Suspendisse potenti.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (59,59,utl_raw.cast_to_raw('Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (60,60,utl_raw.cast_to_raw('Sed accumsan felis. Ut at dolor quis odio consequat varius. Integer ac leo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (61,61,utl_raw.cast_to_raw('Nam nulla.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (62,62,utl_raw.cast_to_raw('Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (63,63,utl_raw.cast_to_raw('Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (64,64,utl_raw.cast_to_raw('Phasellus id sapien in sapien iaculis congue.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (65,65,utl_raw.cast_to_raw('Duis at velit eu est congue elementum.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (66,66,utl_raw.cast_to_raw('Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (67,67,utl_raw.cast_to_raw('Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (68,68,utl_raw.cast_to_raw('Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (69,69,utl_raw.cast_to_raw('Nullam sit amet turpis elementum ligula vehicula consequat.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (70,70,utl_raw.cast_to_raw('Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (71,71,utl_raw.cast_to_raw('Nam dui. Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (72,72,utl_raw.cast_to_raw('Cras in purus eu magna vulputate luctus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (73,73,utl_raw.cast_to_raw('Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (74,74,utl_raw.cast_to_raw('Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (75,75,utl_raw.cast_to_raw('Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (76,76,utl_raw.cast_to_raw('In hac habitasse platea dictumst.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (77,77,utl_raw.cast_to_raw('Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (78,78,utl_raw.cast_to_raw('Proin risus. Praesent lectus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (79,79,utl_raw.cast_to_raw('Phasellus id sapien in sapien iaculis congue.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (80,80,utl_raw.cast_to_raw('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (81,81,utl_raw.cast_to_raw('Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (82,82,utl_raw.cast_to_raw('Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (83,83,utl_raw.cast_to_raw('Vivamus vestibulum sagittis sapien.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (84,84,utl_raw.cast_to_raw('Sed vel enim sit amet nunc viverra dapibus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (85,85,utl_raw.cast_to_raw('Vestibulum sed magna at nunc commodo placerat. Praesent blandit.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (86,1,utl_raw.cast_to_raw('Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (87,2,utl_raw.cast_to_raw('Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (88,3,utl_raw.cast_to_raw('Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (89,4,utl_raw.cast_to_raw('Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (90,5,utl_raw.cast_to_raw('Mauris sit amet eros.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (91,6,utl_raw.cast_to_raw('Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Duis faucibus accumsan odio.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (92,7,utl_raw.cast_to_raw('Maecenas tincidunt lacus at velit.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (93,8,utl_raw.cast_to_raw('Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (94,9,utl_raw.cast_to_raw('Morbi a ipsum. Integer a nibh.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (95,10,utl_raw.cast_to_raw('Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (96,11,utl_raw.cast_to_raw('Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (97,12,utl_raw.cast_to_raw('Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (98,13,utl_raw.cast_to_raw('Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (99,14,utl_raw.cast_to_raw('Praesent lectus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (100,15,utl_raw.cast_to_raw('Cras in purus eu magna vulputate luctus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (101,16,utl_raw.cast_to_raw('Etiam pretium iaculis justo. In hac habitasse platea dictumst. Etiam faucibus cursus urna.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (102,17,utl_raw.cast_to_raw('Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (103,18,utl_raw.cast_to_raw('Duis mattis egestas metus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (104,19,utl_raw.cast_to_raw('In eleifend quam a odio. In hac habitasse platea dictumst.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (105,20,utl_raw.cast_to_raw('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (106,21,utl_raw.cast_to_raw('Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (107,22,utl_raw.cast_to_raw('Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (108,23,utl_raw.cast_to_raw('Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (109,24,utl_raw.cast_to_raw('Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (110,25,utl_raw.cast_to_raw('Etiam pretium iaculis justo. In hac habitasse platea dictumst.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (111,26,utl_raw.cast_to_raw('Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (112,27,utl_raw.cast_to_raw('Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (113,28,utl_raw.cast_to_raw('Donec vitae nisi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (114,29,utl_raw.cast_to_raw('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (115,30,utl_raw.cast_to_raw('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (116,31,utl_raw.cast_to_raw('Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (117,32,utl_raw.cast_to_raw('Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (118,33,utl_raw.cast_to_raw('Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (119,34,utl_raw.cast_to_raw('Nulla suscipit ligula in lacus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (120,35,utl_raw.cast_to_raw('Aenean lectus. Pellentesque eget nunc.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (121,36,utl_raw.cast_to_raw('Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (122,37,utl_raw.cast_to_raw('Maecenas pulvinar lobortis est.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (123,38,utl_raw.cast_to_raw('Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (124,39,utl_raw.cast_to_raw('Sed ante.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (125,40,utl_raw.cast_to_raw('In congue.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (126,41,utl_raw.cast_to_raw('Aenean sit amet justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (127,42,utl_raw.cast_to_raw('Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (128,43,utl_raw.cast_to_raw('Sed ante. Vivamus tortor.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (129,44,utl_raw.cast_to_raw('Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (130,45,utl_raw.cast_to_raw('Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (131,46,utl_raw.cast_to_raw('Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (132,47,utl_raw.cast_to_raw('Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (133,48,utl_raw.cast_to_raw('Vivamus in felis eu sapien cursus vestibulum. Proin eu mi.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (134,49,utl_raw.cast_to_raw('Suspendisse potenti. Cras in purus eu magna vulputate luctus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (135,50,utl_raw.cast_to_raw('Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (136,1,utl_raw.cast_to_raw('In quis justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (137,2,utl_raw.cast_to_raw('Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (138,3,utl_raw.cast_to_raw('Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (139,4,utl_raw.cast_to_raw('Aliquam non mauris.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (140,5,utl_raw.cast_to_raw('Nulla tellus. In sagittis dui vel nisl. Duis ac nibh.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (141,6,utl_raw.cast_to_raw('In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (142,7,utl_raw.cast_to_raw('Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (143,8,utl_raw.cast_to_raw('Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (144,9,utl_raw.cast_to_raw('Nullam varius.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (145,10,utl_raw.cast_to_raw('In est risus, auctor sed, tristique in, tempus sit amet, sem.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (146,11,utl_raw.cast_to_raw('Etiam justo. Etiam pretium iaculis justo.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (147,12,utl_raw.cast_to_raw('In eleifend quam a odio.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (148,13,utl_raw.cast_to_raw('Proin at turpis a pede posuere nonummy.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (149,14,utl_raw.cast_to_raw('Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.'));
INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz) VALUES (150,15,utl_raw.cast_to_raw('Nullam molestie nibh in lectus.'));


INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (1,1,'Vivamus vel nulla eget eros elementum pellentesque.',TO_TIMESTAMP('2018.03.08 21:10','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (2,2,'Fusce consequat. Nulla nisl.',TO_TIMESTAMP('2018.06.12 22:51','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (3,3,'Phasellus id sapien in sapien iaculis congue.',TO_TIMESTAMP('2018.11.18 10:44','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (4,4,'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',TO_TIMESTAMP('2019.02.16 9:24','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (5,5,'Vivamus in felis eu sapien cursus vestibulum. Proin eu mi. Nulla ac enim.',TO_TIMESTAMP('2018.04.12 17:58','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (6,6,'Praesent id massa id nisl venenatis lacinia.',TO_TIMESTAMP('2018.07.21 2:25','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (7,7,'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.',TO_TIMESTAMP('2018.11.26 12:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (8,8,'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',TO_TIMESTAMP('2018.11.15 6:15','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (9,9,'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',TO_TIMESTAMP('2018.06.09 3:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (10,10,'Aliquam quis turpis eget elit sodales scelerisque.',TO_TIMESTAMP('2019.01.12 17:28','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (11,11,'Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque. Quisque porta volutpat erat.',TO_TIMESTAMP('2018.10.09 18:16','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (12,12,'Nullam varius.',TO_TIMESTAMP('2018.06.14 8:47','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (13,13,'Proin at turpis a pede posuere nonummy. Integer non velit.',TO_TIMESTAMP('2018.08.31 23:42','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (14,14,'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.',TO_TIMESTAMP('2018.03.30 14:56','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (15,15,'Etiam pretium iaculis justo.',TO_TIMESTAMP('2019.02.01 5:48','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (16,16,'Nam tristique tortor eu pede.',TO_TIMESTAMP('2018.06.29 3:10','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (17,17,'Suspendisse potenti. Nullam porttitor lacus at turpis.',TO_TIMESTAMP('2018.06.15 0:05','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (18,18,'Integer non velit.',TO_TIMESTAMP('2019.02.18 4:21','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (19,19,'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.',TO_TIMESTAMP('2018.07.30 20:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (20,20,'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue.',TO_TIMESTAMP('2019.01.19 13:42','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (21,21,'Nullam varius.',TO_TIMESTAMP('2018.10.21 16:41','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (22,22,'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy.',TO_TIMESTAMP('2018.10.07 1:46','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (23,23,'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',TO_TIMESTAMP('2018.08.29 10:41','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (24,24,'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem. Sed sagittis.',TO_TIMESTAMP('2018.12.11 21:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (25,25,'Morbi vel lectus in quam fringilla rhoncus.',TO_TIMESTAMP('2018.07.25 14:23','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (26,26,'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.',TO_TIMESTAMP('2018.07.20 8:21','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (27,27,'Proin at turpis a pede posuere nonummy. Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',TO_TIMESTAMP('2018.09.08 14:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (28,28,'Morbi a ipsum. Integer a nibh.',TO_TIMESTAMP('2018.06.05 19:54','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (29,29,'Integer ac neque. Duis bibendum. Morbi non quam nec dui luctus rutrum.',TO_TIMESTAMP('2018.03.17 17:29','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (30,30,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae',TO_TIMESTAMP('2018.03.08 7:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (31,31,'Fusce consequat. Nulla nisl. Nunc nisl.',TO_TIMESTAMP('2019.01.05 17:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (32,32,'Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.',TO_TIMESTAMP('2019.01.22 20:05','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (33,33,'Nulla facilisi.',TO_TIMESTAMP('2019.01.31 5:46','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (34,34,'Aliquam non mauris. Morbi non lectus.',TO_TIMESTAMP('2018.07.06 16:34','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (35,35,'Duis at velit eu est congue elementum.',TO_TIMESTAMP('2018.11.28 19:59','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (36,36,'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.',TO_TIMESTAMP('2018.05.07 17:55','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (37,37,'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo.',TO_TIMESTAMP('2018.11.23 16:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (38,38,'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.',TO_TIMESTAMP('2018.03.14 17:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (39,39,'Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus. Pellentesque eget nunc.',TO_TIMESTAMP('2018.07.05 2:19','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (40,40,'Morbi porttitor lorem id ligula.',TO_TIMESTAMP('2018.05.20 22:09','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (41,1,'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',TO_TIMESTAMP('2019.02.09 1:44','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (42,2,'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.',TO_TIMESTAMP('2018.04.03 13:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (43,3,'Nunc purus. Phasellus in felis.',TO_TIMESTAMP('2018.03.27 7:42','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (44,4,'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',TO_TIMESTAMP('2018.04.28 0:47','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (45,5,'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',TO_TIMESTAMP('2019.02.14 23:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (46,6,'Donec dapibus.',TO_TIMESTAMP('2019.01.15 11:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (47,7,'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.',TO_TIMESTAMP('2018.10.02 11:11','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (48,8,'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla.',TO_TIMESTAMP('2018.07.22 23:24','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (49,9,'Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',TO_TIMESTAMP('2018.10.03 12:30','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (50,10,'Nulla ac enim.',TO_TIMESTAMP('2018.08.15 14:41','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (75,11,'Aenean lectus. Pellentesque eget nunc.',TO_TIMESTAMP('2018.05.08 6:03','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (76,12,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien.',TO_TIMESTAMP('2018.06.07 1:20','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (77,13,'Suspendisse potenti. Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum.',TO_TIMESTAMP('2018.07.01 8:10','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (78,14,'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',TO_TIMESTAMP('2018.03.29 1:28','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (79,15,'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',TO_TIMESTAMP('2018.03.30 6:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (80,16,'Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.',TO_TIMESTAMP('2018.12.06 10:47','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (81,17,'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',TO_TIMESTAMP('2018.08.10 23:56','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (82,18,'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.',TO_TIMESTAMP('2018.04.22 4:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (83,19,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',TO_TIMESTAMP('2018.03.12 10:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (84,20,'Aenean auctor gravida sem.',TO_TIMESTAMP('2018.11.23 7:38','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (85,21,'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.',TO_TIMESTAMP('2018.05.17 15:25','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (86,22,'Suspendisse potenti.',TO_TIMESTAMP('2018.07.16 20:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (87,23,'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.',TO_TIMESTAMP('2019.01.01 4:12','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (88,24,'Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',TO_TIMESTAMP('2019.01.05 6:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (89,25,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',TO_TIMESTAMP('2018.10.05 6:19','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (90,26,'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.',TO_TIMESTAMP('2018.12.23 5:55','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (91,27,'Donec posuere metus vitae ipsum. Aliquam non mauris. Morbi non lectus.',TO_TIMESTAMP('2018.12.16 6:54','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (92,28,'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',TO_TIMESTAMP('2018.09.23 15:16','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (93,29,'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.',TO_TIMESTAMP('2018.03.28 13:47','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (94,30,'Nam nulla.',TO_TIMESTAMP('2018.04.05 14:25','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (95,31,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.',TO_TIMESTAMP('2018.10.01 22:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (96,32,'Quisque id justo sit amet sapien dignissim vestibulum.',TO_TIMESTAMP('2018.12.26 23:11','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (97,33,'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',TO_TIMESTAMP('2018.03.07 11:44','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (98,34,'Sed accumsan felis.',TO_TIMESTAMP('2019.01.29 4:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (99,35,'Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.',TO_TIMESTAMP('2018.06.25 7:09','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (100,36,'Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',TO_TIMESTAMP('2018.09.09 0:10','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (1,37,'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.',TO_TIMESTAMP('2019.01.05 14:12','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (2,38,'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue.',TO_TIMESTAMP('2018.08.29 23:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (3,39,'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',TO_TIMESTAMP('2018.12.29 12:57','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (4,40,'Cras pellentesque volutpat dui. Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc.',TO_TIMESTAMP('2018.06.25 18:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (5,1,'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.',TO_TIMESTAMP('2018.05.08 3:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (6,2,'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',TO_TIMESTAMP('2018.09.23 23:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (7,3,'Donec posuere metus vitae ipsum.',TO_TIMESTAMP('2018.10.24 21:15','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (8,4,'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus. Pellentesque at nulla.',TO_TIMESTAMP('2018.04.10 13:39','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (9,5,'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.',TO_TIMESTAMP('2018.03.19 15:03','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (10,6,'Nulla facilisi.',TO_TIMESTAMP('2018.09.20 5:44','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (11,7,'Aenean lectus.',TO_TIMESTAMP('2019.02.02 2:46','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (12,8,'Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros. Vestibulum ac est lacinia nisi venenatis tristique.',TO_TIMESTAMP('2018.05.06 22:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (13,9,'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',TO_TIMESTAMP('2019.01.02 15:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (14,10,'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum. Curabitur in libero ut massa volutpat convallis.',TO_TIMESTAMP('2018.04.02 6:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (15,11,'In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.',TO_TIMESTAMP('2018.12.06 1:49','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (16,12,'Integer a nibh.',TO_TIMESTAMP('2019.02.13 6:19','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (17,13,'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',TO_TIMESTAMP('2019.01.30 4:35','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (18,14,'Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.',TO_TIMESTAMP('2018.11.22 10:14','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (19,15,'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.',TO_TIMESTAMP('2018.07.13 15:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (20,16,'In hac habitasse platea dictumst.',TO_TIMESTAMP('2018.10.31 22:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (1,17,'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros.',TO_TIMESTAMP('2018.12.28 5:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (2,18,'Nunc purus. Phasellus in felis.',TO_TIMESTAMP('2018.11.22 9:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (3,19,'Donec ut mauris eget massa tempor convallis.',TO_TIMESTAMP('2018.05.18 14:40','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (4,20,'Ut tellus. Nulla ut erat id mauris vulputate elementum.',TO_TIMESTAMP('2019.02.19 16:27','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (5,21,'Suspendisse potenti.',TO_TIMESTAMP('2018.05.23 4:21','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (6,22,'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',TO_TIMESTAMP('2019.02.15 23:37','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (7,23,'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',TO_TIMESTAMP('2018.04.29 10:19','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (8,24,'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',TO_TIMESTAMP('2018.12.16 7:45','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (9,25,'Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor.',TO_TIMESTAMP('2018.05.22 4:14','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (10,26,'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.',TO_TIMESTAMP('2018.09.17 18:40','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (11,27,'Nullam varius. Nulla facilisi.',TO_TIMESTAMP('2019.01.25 23:57','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (12,28,'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.',TO_TIMESTAMP('2018.09.27 8:30','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASKERESOERT(allaskereso_id,allas_id,ertekeles,datum) VALUES (13,29,'Ut tellus.',TO_TIMESTAMP('2018.12.30 5:40','YYYY.MM.DD HH24:MI'));


INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (1,1,1,TO_TIMESTAMP('2018.11.19 1:36','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (2,2,1,TO_TIMESTAMP('2019.02.05 18:57','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (3,3,3,TO_TIMESTAMP('2018.04.29 7:45','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (4,4,3,TO_TIMESTAMP('2019.02.01 22:54','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (5,5,3,TO_TIMESTAMP('2018.09.19 11:10','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (6,6,1,TO_TIMESTAMP('2018.09.22 17:12','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (7,7,2,TO_TIMESTAMP('2018.06.03 0:08','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (8,8,1,TO_TIMESTAMP('2019.01.03 21:45','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (9,9,2,TO_TIMESTAMP('2018.03.19 21:55','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (10,10,2,TO_TIMESTAMP('2018.09.19 23:41','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (11,11,1,TO_TIMESTAMP('2018.09.08 12:14','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (12,12,3,TO_TIMESTAMP('2019.02.23 4:38','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (13,13,1,TO_TIMESTAMP('2018.05.20 14:54','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (14,14,2,TO_TIMESTAMP('2018.06.18 0:46','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (15,15,2,TO_TIMESTAMP('2018.08.08 12:15','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (16,16,1,TO_TIMESTAMP('2018.10.22 14:30','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (17,17,1,TO_TIMESTAMP('2018.09.26 2:52','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (18,18,2,TO_TIMESTAMP('2018.06.05 9:47','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (19,19,2,TO_TIMESTAMP('2018.05.19 0:07','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (20,20,3,TO_TIMESTAMP('2018.04.21 3:04','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (21,21,1,TO_TIMESTAMP('2018.05.10 20:26','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (22,22,2,TO_TIMESTAMP('2018.10.03 7:23','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (23,23,2,TO_TIMESTAMP('2018.08.28 5:24','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (24,24,1,TO_TIMESTAMP('2018.05.18 1:56','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (25,25,1,TO_TIMESTAMP('2018.04.30 21:52','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (26,26,2,TO_TIMESTAMP('2018.08.11 0:16','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (27,27,2,TO_TIMESTAMP('2018.06.12 23:02','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (28,28,1,TO_TIMESTAMP('2018.07.31 17:36','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (29,29,3,TO_TIMESTAMP('2018.08.15 19:30','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (30,30,1,TO_TIMESTAMP('2018.12.10 14:14','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (31,31,2,TO_TIMESTAMP('2018.03.08 3:54','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (32,32,3,TO_TIMESTAMP('2019.01.23 10:33','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (33,33,1,TO_TIMESTAMP('2018.09.26 11:20','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (34,34,2,TO_TIMESTAMP('2019.01.07 0:48','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (35,35,1,TO_TIMESTAMP('2018.09.06 10:39','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (36,36,3,TO_TIMESTAMP('2018.04.19 0:38','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (37,37,1,TO_TIMESTAMP('2018.04.12 14:03','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (38,38,1,TO_TIMESTAMP('2018.10.07 3:56','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (39,39,1,TO_TIMESTAMP('2018.06.04 15:28','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (40,40,2,TO_TIMESTAMP('2018.09.06 19:34','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (41,1,3,TO_TIMESTAMP('2018.03.19 6:39','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (42,2,1,TO_TIMESTAMP('2018.10.15 12:53','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (43,3,3,TO_TIMESTAMP('2018.07.15 13:48','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (44,4,3,TO_TIMESTAMP('2018.07.24 14:18','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (45,5,1,TO_TIMESTAMP('2018.04.19 1:14','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (46,6,1,TO_TIMESTAMP('2019.02.07 17:57','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (47,7,1,TO_TIMESTAMP('2018.10.10 4:56','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (48,8,1,TO_TIMESTAMP('2018.03.16 19:55','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (49,9,2,TO_TIMESTAMP('2018.04.03 19:27','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (50,10,2,TO_TIMESTAMP('2018.04.22 14:58','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (75,11,1,TO_TIMESTAMP('2019.02.14 18:56','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (76,12,3,TO_TIMESTAMP('2018.12.15 9:41','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (77,13,3,TO_TIMESTAMP('2018.11.09 20:30','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (78,14,3,TO_TIMESTAMP('2018.06.08 21:07','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (79,15,3,TO_TIMESTAMP('2019.01.26 16:39','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (80,16,3,TO_TIMESTAMP('2019.02.02 19:18','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (81,17,1,TO_TIMESTAMP('2018.06.06 8:21','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (82,18,3,TO_TIMESTAMP('2018.12.01 11:56','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (83,19,3,TO_TIMESTAMP('2018.07.03 3:19','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (84,20,3,TO_TIMESTAMP('2018.10.10 3:16','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (85,21,2,TO_TIMESTAMP('2018.03.12 16:54','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (86,22,1,TO_TIMESTAMP('2018.08.03 9:41','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (87,23,3,TO_TIMESTAMP('2018.11.18 4:09','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (88,24,2,TO_TIMESTAMP('2019.01.13 9:48','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (89,25,2,TO_TIMESTAMP('2018.04.16 2:34','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (90,26,2,TO_TIMESTAMP('2018.07.16 4:42','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (91,27,2,TO_TIMESTAMP('2018.11.06 22:20','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (92,28,3,TO_TIMESTAMP('2018.04.04 15:12','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (93,29,2,TO_TIMESTAMP('2018.07.06 2:15','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (94,30,1,TO_TIMESTAMP('2018.03.05 10:09','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (95,31,2,TO_TIMESTAMP('2018.05.03 4:23','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (96,32,2,TO_TIMESTAMP('2018.11.18 8:00','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (97,33,1,TO_TIMESTAMP('2018.05.29 20:59','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (98,34,3,TO_TIMESTAMP('2018.11.28 14:03','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (99,35,1,TO_TIMESTAMP('2018.09.25 11:41','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (100,36,2,TO_TIMESTAMP('2019.01.25 14:27','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (1,37,2,TO_TIMESTAMP('2018.08.15 1:42','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (2,38,2,TO_TIMESTAMP('2018.06.01 23:48','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (3,39,2,TO_TIMESTAMP('2018.03.21 20:27','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (4,40,2,TO_TIMESTAMP('2018.09.06 20:53','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (5,1,1,TO_TIMESTAMP('2018.06.07 16:45','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (6,2,1,TO_TIMESTAMP('2019.02.16 18:46','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (7,3,3,TO_TIMESTAMP('2018.03.23 8:22','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (8,4,2,TO_TIMESTAMP('2019.01.28 8:23','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (9,5,1,TO_TIMESTAMP('2018.08.16 10:54','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (10,6,1,TO_TIMESTAMP('2018.08.06 1:50','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (11,7,3,TO_TIMESTAMP('2018.11.25 17:17','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (12,8,1,TO_TIMESTAMP('2018.10.06 10:13','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (13,9,1,TO_TIMESTAMP('2018.11.07 2:22','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (14,10,1,TO_TIMESTAMP('2019.02.19 23:08','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (15,11,3,TO_TIMESTAMP('2018.11.29 11:05','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (16,12,1,TO_TIMESTAMP('2018.11.16 7:10','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (17,13,2,TO_TIMESTAMP('2018.04.01 22:48','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (18,14,1,TO_TIMESTAMP('2018.12.27 17:28','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (19,15,2,TO_TIMESTAMP('2018.03.20 3:01','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (20,16,3,TO_TIMESTAMP('2018.10.26 7:34','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (1,17,3,TO_TIMESTAMP('2018.08.02 21:51','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (2,18,1,TO_TIMESTAMP('2018.05.01 16:36','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (3,19,2,TO_TIMESTAMP('2018.12.31 17:26','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (4,20,2,TO_TIMESTAMP('2018.07.27 21:30','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (5,21,1,TO_TIMESTAMP('2018.07.14 18:20','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (6,22,3,TO_TIMESTAMP('2018.06.03 17:48','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (7,23,2,TO_TIMESTAMP('2018.07.17 13:28','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (8,24,1,TO_TIMESTAMP('2018.09.20 12:29','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (9,25,1,TO_TIMESTAMP('2018.09.22 20:51','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (10,26,2,TO_TIMESTAMP('2019.01.24 4:30','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (11,27,2,TO_TIMESTAMP('2018.11.06 16:16','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (12,28,2,TO_TIMESTAMP('2018.08.16 2:49','YYYY.MM.DD HH24:MI'));
INSERT INTO JELENTKEZES(allaskereso_id,allas_id,allapot_id,datum) VALUES (13,29,3,TO_TIMESTAMP('2018.11.27 23:24','YYYY.MM.DD HH24:MI'));



INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (1,1,1,'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',2,TO_TIMESTAMP('2018.06.13 10:00','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (2,2,2,'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.',2,TO_TIMESTAMP('2018.09.10 10:32','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (3,3,3,'Sed accumsan felis. Ut at dolor quis odio consequat varius.',1,TO_TIMESTAMP('2018.03.07 12:54','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (4,4,4,'Curabitur at ipsum ac tellus semper interdum.',5,TO_TIMESTAMP('2019.01.21 3:15','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (5,5,5,'Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',2,TO_TIMESTAMP('2018.10.18 1:55','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (6,6,6,'Proin risus. Praesent lectus. Vestibulum quam sapien, varius ut, blandit non, interdum in, ante.',2,TO_TIMESTAMP('2019.02.01 21:56','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (7,7,7,'Mauris sit amet eros.',5,TO_TIMESTAMP('2018.10.29 11:22','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (8,8,8,'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',2,TO_TIMESTAMP('2018.03.11 4:34','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (9,9,9,'Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit.',2,TO_TIMESTAMP('2019.02.05 17:55','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (10,10,10,'Donec vitae nisi. Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',1,TO_TIMESTAMP('2018.12.18 18:23','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (11,11,11,'Suspendisse potenti. In eleifend quam a odio.',2,TO_TIMESTAMP('2018.03.15 11:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (12,12,12,'Fusce consequat.',3,TO_TIMESTAMP('2019.01.09 20:47','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (13,13,13,'Integer non velit. Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue.',1,TO_TIMESTAMP('2018.03.31 1:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (14,14,14,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus.',4,TO_TIMESTAMP('2018.09.11 18:33','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (15,15,15,'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.',2,TO_TIMESTAMP('2018.10.15 10:08','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (16,16,16,'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',4,TO_TIMESTAMP('2019.02.21 0:35','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (17,17,17,'Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl. Aenean lectus.',4,TO_TIMESTAMP('2018.11.06 20:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (18,18,18,'Donec posuere metus vitae ipsum.',3,TO_TIMESTAMP('2018.08.22 23:39','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (19,19,19,'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',4,TO_TIMESTAMP('2018.09.09 15:57','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (20,20,20,'Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla.',3,TO_TIMESTAMP('2018.06.20 7:49','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (21,21,21,'In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.',2,TO_TIMESTAMP('2018.10.25 16:16','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (22,22,22,'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.',1,TO_TIMESTAMP('2018.05.07 11:04','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (23,23,23,'Morbi ut odio.',4,TO_TIMESTAMP('2018.12.19 11:04','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (24,24,24,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit. Nam nulla.',1,TO_TIMESTAMP('2019.01.11 0:22','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (25,25,25,'Nunc rhoncus dui vel sem.',4,TO_TIMESTAMP('2018.10.03 23:28','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (26,26,26,'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',5,TO_TIMESTAMP('2018.03.07 9:18','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (27,27,27,'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae',4,TO_TIMESTAMP('2018.08.09 14:56','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (28,28,28,'In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.',3,TO_TIMESTAMP('2019.02.13 4:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (29,29,29,'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.',4,TO_TIMESTAMP('2018.03.15 4:24','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (30,30,30,'Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh. Quisque id justo sit amet sapien dignissim vestibulum.',1,TO_TIMESTAMP('2018.08.12 20:50','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (31,31,31,'Morbi vel lectus in quam fringilla rhoncus. Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.',1,TO_TIMESTAMP('2018.06.30 16:25','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (32,32,32,'Proin risus. Praesent lectus.',1,TO_TIMESTAMP('2018.07.15 23:16','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (33,33,33,'Maecenas ut massa quis augue luctus tincidunt.',4,TO_TIMESTAMP('2018.08.23 23:58','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (34,34,34,'Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam. Nam tristique tortor eu pede.',3,TO_TIMESTAMP('2018.09.18 23:33','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (35,35,35,'Aliquam non mauris. Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet.',5,TO_TIMESTAMP('2018.09.07 3:18','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (36,36,36,'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo.',3,TO_TIMESTAMP('2018.10.03 16:21','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (37,37,37,'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.',4,TO_TIMESTAMP('2018.11.03 17:42','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (38,38,38,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',5,TO_TIMESTAMP('2018.03.29 16:13','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (39,39,39,'Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo.',4,TO_TIMESTAMP('2018.04.18 7:54','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (40,40,40,'Cras pellentesque volutpat dui.',3,TO_TIMESTAMP('2018.08.31 11:39','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (41,41,1,'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.',2,TO_TIMESTAMP('2018.10.28 14:15','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (42,42,2,'Nulla ac enim.',4,TO_TIMESTAMP('2018.06.11 4:50','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (43,43,3,'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',1,TO_TIMESTAMP('2019.02.26 0:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (44,44,4,'Pellentesque at nulla.',4,TO_TIMESTAMP('2018.08.12 5:01','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (45,45,5,'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae',3,TO_TIMESTAMP('2018.08.05 22:33','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (46,46,6,'Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.',3,TO_TIMESTAMP('2019.03.03 14:21','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (47,47,7,'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.',1,TO_TIMESTAMP('2019.02.16 15:00','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (48,48,8,'Nulla nisl. Nunc nisl.',1,TO_TIMESTAMP('2018.07.02 0:59','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (49,49,9,'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.',4,TO_TIMESTAMP('2018.10.17 17:12','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (50,50,10,'Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.',4,TO_TIMESTAMP('2018.09.11 16:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (51,75,11,'Aenean fermentum. Donec ut mauris eget massa tempor convallis.',3,TO_TIMESTAMP('2018.07.06 1:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (52,76,12,'Etiam faucibus cursus urna.',5,TO_TIMESTAMP('2018.11.30 14:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (53,77,13,'Suspendisse accumsan tortor quis turpis.',2,TO_TIMESTAMP('2018.03.08 11:20','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (54,78,14,'Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus. Suspendisse potenti. In eleifend quam a odio.',3,TO_TIMESTAMP('2018.05.23 4:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (55,79,15,'Etiam faucibus cursus urna. Ut tellus. Nulla ut erat id mauris vulputate elementum.',4,TO_TIMESTAMP('2018.05.29 10:20','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (56,80,16,'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.',5,TO_TIMESTAMP('2018.12.21 16:40','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (57,81,17,'Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',1,TO_TIMESTAMP('2018.07.02 8:10','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (58,82,18,'Morbi a ipsum. Integer a nibh. In quis justo.',3,TO_TIMESTAMP('2018.07.24 8:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (59,83,19,'Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem. Duis aliquam convallis nunc.',3,TO_TIMESTAMP('2018.11.30 1:34','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (60,84,20,'Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.',4,TO_TIMESTAMP('2019.02.24 18:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (61,85,21,'Suspendisse potenti. Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',3,TO_TIMESTAMP('2018.05.06 3:04','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (62,86,22,'Aenean auctor gravida sem.',3,TO_TIMESTAMP('2018.07.06 23:16','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (63,87,23,'Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem. Fusce consequat.',5,TO_TIMESTAMP('2018.04.05 2:42','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (64,88,24,'Proin at turpis a pede posuere nonummy.',1,TO_TIMESTAMP('2018.05.09 14:21','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (65,89,25,'In sagittis dui vel nisl. Duis ac nibh.',2,TO_TIMESTAMP('2018.06.12 19:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (66,90,26,'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Etiam vel augue. Vestibulum rutrum rutrum neque.',3,TO_TIMESTAMP('2018.07.20 23:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (67,91,27,'Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.',4,TO_TIMESTAMP('2018.12.01 18:51','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (68,92,28,'Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.',1,TO_TIMESTAMP('2019.02.10 17:52','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (69,93,29,'Aliquam quis turpis eget elit sodales scelerisque.',2,TO_TIMESTAMP('2018.08.27 19:26','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (70,94,30,'Nulla suscipit ligula in lacus. Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla.',1,TO_TIMESTAMP('2018.10.14 10:45','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (71,95,31,'Praesent blandit.',3,TO_TIMESTAMP('2019.02.23 5:44','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (72,96,32,'Vivamus vel nulla eget eros elementum pellentesque.',4,TO_TIMESTAMP('2018.04.01 22:17','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (73,97,33,'Cras in purus eu magna vulputate luctus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.',1,TO_TIMESTAMP('2019.01.30 21:11','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (74,98,34,'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor.',5,TO_TIMESTAMP('2018.03.09 6:49','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (75,99,35,'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam.',2,TO_TIMESTAMP('2018.09.14 3:44','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (76,100,36,'In hac habitasse platea dictumst.',2,TO_TIMESTAMP('2018.12.16 9:46','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (77,1,37,'In hac habitasse platea dictumst.',4,TO_TIMESTAMP('2019.02.28 19:24','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (78,2,38,'Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis. Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl.',1,TO_TIMESTAMP('2018.08.04 1:51','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (79,3,39,'Vestibulum sed magna at nunc commodo placerat. Praesent blandit.',2,TO_TIMESTAMP('2018.10.03 18:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (80,4,40,'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',3,TO_TIMESTAMP('2018.06.25 22:29','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (81,5,1,'Proin eu mi.',5,TO_TIMESTAMP('2018.04.23 0:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (82,6,2,'Curabitur gravida nisi at nibh.',1,TO_TIMESTAMP('2019.02.08 7:02','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (83,7,3,'Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.',1,TO_TIMESTAMP('2018.07.15 5:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (84,8,4,'Maecenas tincidunt lacus at velit.',2,TO_TIMESTAMP('2019.01.17 3:55','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (85,9,5,'Proin at turpis a pede posuere nonummy. Integer non velit.',5,TO_TIMESTAMP('2018.05.25 0:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (86,10,6,'Vestibulum rutrum rutrum neque. Aenean auctor gravida sem. Praesent id massa id nisl venenatis lacinia.',4,TO_TIMESTAMP('2018.08.29 2:36','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (87,11,7,'Morbi non quam nec dui luctus rutrum. Nulla tellus. In sagittis dui vel nisl.',1,TO_TIMESTAMP('2019.02.22 12:46','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (88,12,8,'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.',5,TO_TIMESTAMP('2018.07.25 2:59','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (89,13,9,'Fusce consequat.',5,TO_TIMESTAMP('2018.06.04 3:51','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (90,14,10,'Quisque id justo sit amet sapien dignissim vestibulum.',1,TO_TIMESTAMP('2018.12.05 8:54','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (91,15,11,'Etiam vel augue.',2,TO_TIMESTAMP('2018.07.02 13:28','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (92,16,12,'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante.',1,TO_TIMESTAMP('2019.02.15 11:57','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (93,17,13,'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.',5,TO_TIMESTAMP('2018.04.15 12:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (94,18,14,'Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci.',5,TO_TIMESTAMP('2018.11.15 20:28','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (95,19,15,'Sed sagittis.',1,TO_TIMESTAMP('2018.05.04 8:20','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (96,20,16,'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.',1,TO_TIMESTAMP('2018.07.06 7:00','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (97,1,17,'In eleifend quam a odio.',1,TO_TIMESTAMP('2018.03.10 12:11','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (98,2,18,'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus.',1,TO_TIMESTAMP('2018.12.26 20:22','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (99,3,19,'Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.',5,TO_TIMESTAMP('2018.04.01 12:07','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (100,4,20,'Ut at dolor quis odio consequat varius. Integer ac leo. Pellentesque ultrices mattis odio.',3,TO_TIMESTAMP('2018.07.16 1:35','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (101,5,21,'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis.',4,TO_TIMESTAMP('2018.08.17 10:30','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (102,6,22,'Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede. Morbi porttitor lorem id ligula.',2,TO_TIMESTAMP('2018.07.15 21:53','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (103,7,23,'Sed accumsan felis.',1,TO_TIMESTAMP('2019.02.27 23:30','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (104,8,24,'Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.',1,TO_TIMESTAMP('2018.03.30 16:43','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (105,9,25,'Nulla tellus. In sagittis dui vel nisl.',3,TO_TIMESTAMP('2019.01.23 4:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (106,10,26,'Morbi quis tortor id nulla ultrices aliquet.',2,TO_TIMESTAMP('2018.03.12 17:14','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (107,11,27,'Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.',3,TO_TIMESTAMP('2018.05.07 21:06','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (108,12,28,'In eleifend quam a odio. In hac habitasse platea dictumst.',4,TO_TIMESTAMP('2018.03.19 1:20','YYYY.MM.DD HH24:MI'));
INSERT INTO ALLASERT(id,allaskereso_id,allas_id,szoveg,ertek,datum) VALUES (109,13,29,'Aenean fermentum.',4,TO_TIMESTAMP('2018.09.19 13:58','YYYY.MM.DD HH24:MI'));


CREATE OR REPLACE PROCEDURE listVarosok(ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT * FROM VAROS;
END;
/

CREATE OR REPLACE PROCEDURE listSzakmak(ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT * FROM SZAKMA;
END;
/

CREATE OR REPLACE PROCEDURE listCegek(ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT * FROM CEG;
END;
/

CREATE OR REPLACE PROCEDURE listAllaskeresok(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLASKERESO;
END;
/

CREATE OR REPLACE PROCEDURE listAllapotok(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLAPOT;
END;
/

CREATE OR REPLACE PROCEDURE listJelentkezesek(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM JELENTKEZES;
END;
/

CREATE OR REPLACE PROCEDURE listAllasertekelesek(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLASERT;
END;
/

CREATE OR REPLACE PROCEDURE listAllaskeresoertekelesek(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLASKERESOERT;
END;
/

CREATE OR REPLACE PROCEDURE listOneletrajzok(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ONELETRAJZ;
END;
/

CREATE OR REPLACE PROCEDURE listAllaskeresoszakmak(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLASKERESOSZAKMA;
END;
/

CREATE OR REPLACE PROCEDURE listAllasok(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLAS;
END;
/

CREATE OR REPLACE PROCEDURE listKapcsolattartok(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM KAPCSOLATTARTO;
END;
/

CREATE OR REPLACE PROCEDURE listModeratorok(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM MODERATOR;
END;
/

CREATE OR REPLACE PROCEDURE listStatuszok(ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM STATUSZ;
END;
/

CREATE OR REPLACE PROCEDURE allaskeresoLogin(username IN ALLASKERESO.felh_nev%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT ALLASKERESO.id,ALLASKERESO.felh_nev,ALLASKERESO.jelszo FROM ALLASKERESO WHERE ALLASKERESO.felh_nev=username;
END;
/

CREATE OR REPLACE PROCEDURE cegLogin(username IN CEG.felh_nev%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT CEG.id,CEG.felh_nev,CEG.jelszo FROM CEG WHERE CEG.felh_nev=username;
END;
/

CREATE OR REPLACE PROCEDURE moderatorLogin(username IN MODERATOR.felh_nev%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT MODERATOR.id,MODERATOR.felh_nev,MODERATOR.jelszo FROM MODERATOR WHERE MODERATOR.felh_nev=username;
END;
/

CREATE OR REPLACE PROCEDURE varosIdByNev(vnev IN Varos.nev%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT VAROS.id,VAROS.nev FROM VAROS WHERE VAROS.nev=vnev;
END;
/

CREATE OR REPLACE PROCEDURE szakmaIdByNev(sznev IN SZAKMA.MEGNEVEZES%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT SZAKMA.id,SZAKMA.MEGNEVEZES FROM SZAKMA WHERE SZAKMA.MEGNEVEZES=sznev;
END;
/

CREATE OR REPLACE PROCEDURE ujSzakma(sznev IN SZAKMA.MEGNEVEZES%TYPE)
IS
    new_id NUMBER;
BEGIN
    SELECT MAX(SZAKMA.id) INTO new_id FROM SZAKMA;
    new_id:=new_id+1;
    INSERT INTO SZAKMA(id,megnevezes) VALUES (new_id,sznev);
END;
/


CREATE OR REPLACE PROCEDURE ujAllaskereso(anev IN ALLASKERESO.nev%TYPE,szul IN allaskereso.szul_ido%TYPE,emailc IN allaskereso.email%TYPE,varosid IN VAROS.id%TYPE,
utcap IN allaskereso.utca%TYPE, hazszamp IN allaskereso.hazszam%TYPE,felh_nevp IN allaskereso.felh_nev%TYPE, jelszop IN allaskereso.jelszo%TYPE, utolso_belepesp IN allaskereso.utolso_belepes%TYPE)
IS
    new_id NUMBER;
BEGIN
    SELECT MAX(ALLASKERESo.id) INTO new_id FROM ALLASKERESO;
    new_id:=new_id+1;
    INSERT INTO ALLASKERESO(id,nev,szul_ido,email,varos_id,utca,hazszam,statusz_id,felh_nev,jelszo,utolso_belepes) 
    VALUES (new_id,anev,szul,emailc,varosid,utcap,hazszamp,1,felh_nevp,jelszop,utolso_belepesp);
END;
/


CREATE OR REPLACE PROCEDURE ujCeg(cnev IN CEG.nev%TYPE,varosid IN varos.id%TYPE,
utcap IN ceg.utca%TYPE, hazszamp IN ceg.hazszam%TYPE,felh_nevp IN ceg.felh_nev%TYPE, jelszop IN ceg.jelszo%TYPE,kapcs_nev IN kapcsolattarto.nev%TYPE,
kapcs_tel IN kapcsolattarto.telefonszam%type, kapcs_email IN kapcsolattarto.email%TYPE)
IS
    new_cegid NUMBER;
    new_kapcsolattartoid NUMBER;
BEGIN
    SELECT MAX(ceg.id) INTO new_cegid FROM CEG;
    new_cegid:=new_cegid+1;
    SELECT MAX(kapcsolattarto.id) INTO new_kapcsolattartoid FROM kapcsolattarto;
    new_kapcsolattartoid:=new_kapcsolattartoid+1;
    INSERT INTO KAPCSOLATTARTO(id, nev, email, telefonszam) 
    VALUES(new_kapcsolattartoid,kapcs_nev,kapcs_email,kapcs_tel);
    INSERT INTO CEG(id,nev,varos_id,utca,hazszam,felh_nev,jelszo,kapcsolattarto_id) 
    VALUES (new_cegid,cnev,varosid,utcap,hazszamp,felh_nevp,jelszop,new_kapcsolattartoid);
END;
/

CREATE OR REPLACE PROCEDURE allaskeresoIdByFNev(anev IN allaskereso.felh_nev%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT allaskereso.id,allaskereso.felh_nev FROM allaskereso WHERE allaskereso.felh_nev=anev;
END;
/

CREATE OR REPLACE PROCEDURE allaskeresoIdByEmail(emailc IN allaskereso.email%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT allaskereso.id,allaskereso.email FROM allaskereso WHERE allaskereso.email=emailc;
END;
/

CREATE OR REPLACE PROCEDURE kapcsolattartoIdByEmail(emailc IN kapcsolattarto.email%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT kapcsolattarto.id,kapcsolattarto.email FROM kapcsolattarto WHERE kapcsolattarto.email=emailc;
END;
/

CREATE OR REPLACE PROCEDURE kapcsolattartoIdByTel(tel IN kapcsolattarto.telefonszam%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT kapcsolattarto.id,kapcsolattarto.telefonszam FROM kapcsolattarto WHERE kapcsolattarto.telefonszam=tel;
END;
/

CREATE OR REPLACE PROCEDURE cegIdByFNev(fnev IN ceg.felh_nev%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT ceg.id,ceg.felh_nev FROM ceg WHERE ceg.felh_nev=fnev;
END;
/
CREATE OR REPLACE PROCEDURE insertOneletrajz(allaskeresop IN allaskereso.id%TYPE,oneletrajzp IN oneletrajz.oneletrajz%TYPE)
IS
    max_oneletrajzid NUMBER;
BEGIN
    SELECT MAX(id) INTO max_oneletrajzid FROM ONELETRAJZ;
    max_oneletrajzid:=max_oneletrajzid+1;
    INSERT INTO ONELETRAJZ(id,allaskereso_id,oneletrajz)
    VALUES(max_oneletrajzid,allaskeresop,oneletrajzp);
END;
/
CREATE OR REPLACE PROCEDURE insertAllaskeresoSzakma(allask_id IN allaskereso.id%TYPE,szakmaid IN szakma.id%TYPE)
IS
BEGIN
    INSERT INTO allaskeresoszakma(szakma_id,allaskereso_id)
    VALUES(szakmaid,allask_id);
END;
/
CREATE OR REPLACE PROCEDURE ujAllas(ceg_idp IN CEG.id%TYPE,varos_idp IN varos.id%TYPE,szakma_idp IN szakma.id%TYPE,munkakorp IN allas.munkakor%TYPE,
leirasp IN allas.leiras%TYPE, berp IN allas.ber%TYPE,feladas_datumap IN allas.feladas_datuma%TYPE)
IS
    new_id NUMBER;
BEGIN
    SELECT MAX(ALLAS.id) INTO new_id FROM ALLAS;
    new_id:=new_id+1;
    INSERT INTO ALLAS
    VALUES (new_id,ceg_idp,varos_idp,szakma_idp,munkakorp,leirasp,berp,feladas_datumap);
END;
/
CREATE OR REPLACE PROCEDURE allaskeresoLogUpdate(fnev IN allaskereso.felh_nev%TYPE,new_date IN allaskereso.utolso_belepes%TYPE)
IS
BEGIN
    UPDATE ALLASKERESO SET utolso_belepes=new_date where felh_nev=fnev;
END;
/
CREATE OR REPLACE PROCEDURE listAllaskeresoByFnev(fnev IN allaskereso.felh_nev%TYPE, ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLASKERESO WHERE felh_nev=fnev;
END;
/
CREATE OR REPLACE PROCEDURE listAllasBySzakmaId(szid IN allas.szakma_id%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM ALLAS WHERE allas.szakma_id=szid;
END;
/
--nem trivialis
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
    GROUP BY SZAKMA.MEGNEVEZES;
END;
/

--8.
CREATE OR REPLACE PROCEDURE allasokDarabszamOrszagonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, VAROS.nev as megnevezes FROM ALLAS, VAROS
    WHERE VAROS.ID=allas.varos_id
    GROUP BY VAROS.nev;
END;
/
--9.
CREATE OR REPLACE PROCEDURE allaskeresokDarabszamVarosonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, VAROS.nev as megnevezes FROM ALLASKERESO, VAROS
    WHERE VAROS.ID=allaskereso.varos_id
    GROUP BY VAROS.nev;
END;
/
--10.
CREATE OR REPLACE PROCEDURE cegekDarabszamVarosonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, VAROS.nev as megnevezes FROM CEG, VAROS
    WHERE VAROS.ID=ceg.varos_id
    GROUP BY VAROS.nev;
END;
/
--11.
CREATE OR REPLACE PROCEDURE allasjelentkezesekDarabszamAllapotokszerint(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, allapot.megnevezes as megnevezes FROM JELENTKEZES, ALLAPOT
    WHERE jelentkezes.allapot_id=allapot.id
    GROUP BY allapot.megnevezes;
END;
/
--12.
CREATE OR REPLACE PROCEDURE allaskeresokDarabszamStatuszokszerint(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT COUNT(*) as value, statusz.megnevezes  as megnevezes FROM statusz, allaskereso
    WHERE allaskereso.statusz_id=statusz.id
    GROUP BY statusz.megnevezes;
END;
/
--13.
CREATE OR REPLACE PROCEDURE atlagFizetesVarosonkent(ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT AVG(allas.ber) as value, varos.nev  as megnevezes FROM varos, allas
    WHERE allas.varos_id=varos.id
    GROUP BY varos.nev;
END;
/
--nem trivialis
CREATE OR REPLACE PROCEDURE allaskeresoErtekeles(allaskid IN allaskereso.id%TYPE,allasid IN allas.id%TYPE,ert IN allaskeresoert.ertekeles%TYPE,datump IN allaskeresoert.datum%TYPE, ret OUT SYS_REFCURSOR)
IS
BEGIN
    INSERT INTO ALLASKERESOERT VALUES(allaskid,allasid,ert,datump);
END;
/

CREATE OR REPLACE TRIGGER allaskeresoErtTrig
BEFORE INSERT ON ALLASKERESOERT
FOR EACH ROW
DECLARE
    cnt NUMBER:=0;
    cegid NUMBER:=0;
BEGIN
    SELECT COUNT(*)INTO cnt FROM JELENTKEZES WHERE jelentkezes.allaskereso_id=:NEW.allaskereso_ID;
    if cnt=0 THEN
        RAISE_APPLICATION_ERROR(-20012,'NEM IS JELENTKEZETT AZ ALLASRA AZ ALLASKERESO');
    end if;
END;
/
CREATE OR REPLACE PROCEDURE allaskeresoAdatmodositas(fnev IN allaskereso.felh_nev%TYPE,emailp IN allaskereso.email%TYPE, jelszop IN allaskereso.jelszo%TYPE,
varosp IN allaskereso.varos_id%TYPE, utcap IN allaskereso.utca%TYPE, hazszamp IN allaskereso.hazszam%TYPE, statuszp IN allaskereso.statusz_id%TYPE)
IS
BEGIN
    UPDATE ALLASKERESO SET email=emailp, jelszo=jelszop, varos_id=varosp, utca=utcap, hazszam=hazszamp, statusz_id=statuszp where felh_nev=fnev;
END;
/

CREATE OR REPLACE PROCEDURE statuszIdBynev(snev IN statusz.megnevezes%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
    OPEN ret FOR SELECT * FROM statusz WHERE statusz.megnevezes=snev;
END;
/

CREATE OR REPLACE PROCEDURE cegAdatmodositas(fnev IN ceg.felh_nev%TYPE,kapcsp IN ceg.kapcsolattarto_id%TYPE,nevp IN ceg.nev%TYPE, jelszop IN ceg.jelszo%TYPE,
varosp IN ceg.varos_id%TYPE, utcap IN ceg.utca%TYPE, hazszamp IN ceg.hazszam%TYPE,kapcsnev IN kapcsolattarto.nev%TYPE,
kapcsemail IN kapcsolattarto.email%TYPE, kapcstel IN kapcsolattarto.telefonszam%TYPE)
IS
BEGIN
    UPDATE KAPCSOLATTARTO SET nev=kapcsnev, email=kapcsemail, telefonszam=kapcstel where id=kapcsp;
    UPDATE CEG SET nev=nevp, jelszo=jelszop, varos_id=varosp, utca=utcap, hazszam=hazszamp where felh_nev=fnev;
END;
/
CREATE OR REPLACE PROCEDURE listCegByFnev(fnev IN ceg.felh_nev%TYPE, ret OUT SYS_REFCURSOR)
IS
BEGIN
	OPEN ret FOR SELECT * FROM CEG WHERE felh_nev=fnev;
END;
/
CREATE OR REPLACE PROCEDURE ujJelentkezes(allaskid IN allaskereso.id%TYPE,allasid IN allas.id%TYPE, datump IN jelentkezes.datum%TYPE)
IS
BEGIN
    INSERT INTO JELENTKEZES VALUES(allaskid,allasid,3,datump);
END;
/
CREATE OR REPLACE PROCEDURE allasErtekeles(allaskid IN allasert.id%TYPE,allasid IN allasert.id%TYPE,szovegp IN allasert.szoveg%TYPE,
ertekp IN allasert.ertek%TYPE,datump IN allasert.datum%TYPE)
IS
    max_id NUMBER:=0;
BEGIN
    SELECT MAX(id) into max_id from allasert;
    max_id:=max_id+1;
    INSERT INTO allasert VALUES(max_id,allaskid,allasid,szovegp,ertekp,datump);
END;
/
CREATE OR REPLACE PROCEDURE deleteAllasertekeles(idp IN allasert.id%TYPE)
IS
BEGIN
    DELETE FROM allasert where allasert.id=idp;
END;
/
CREATE OR REPLACE PROCEDURE deleteAllaskeresoert(allaskeresoidp IN allaskeresoert.allaskereso_id%TYPE, 
allasidp IN allaskeresoert.allas_id%TYPE)
IS
BEGIN
    DELETE FROM allaskeresoert where allaskereso_id=allaskeresoidp and allas_id=allasidp;
END;
/
CREATE OR REPLACE TRIGGER belepes
AFTER UPDATE OF UTOLSO_BELEPES ON ALLASKERESO
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Üdvözöllek, beléptél, mint ' || :OLD.NEV);
	INSERT INTO LOGOLAS VALUES(:OLD.NEV ||' belépett.', SYSDATE);
END;
/
CREATE OR REPLACE PROCEDURE allaskeresoErtekeles(allaskid IN allaskereso.id%TYPE,allasid IN allas.id%TYPE,ert IN allaskeresoert.ertekeles%TYPE,datump IN allaskeresoert.datum%TYPE, ret OUT SYS_REFCURSOR)
IS
BEGIN
    INSERT INTO ALLASKERESOERT VALUES(allaskid,allasid,ert,datump);
END;
/

CREATE OR REPLACE TRIGGER allaskeresoErtTrig
BEFORE INSERT ON ALLASKERESOERT
FOR EACH ROW
DECLARE
    cnt NUMBER:=0;
    cegid NUMBER:=0;
BEGIN
    SELECT COUNT(*)INTO cnt FROM JELENTKEZES WHERE jelentkezes.allaskereso_id=:NEW.allaskereso_ID;
    if cnt=0 THEN
        RAISE_APPLICATION_ERROR(-20012,'NEM IS JELENTKEZETT AZ ALLASRA AZ ALLASKERESO');
    end if;
END;
/
CREATE OR REPLACE PROCEDURE searchAllapotIdbyName(allapotp IN allapot.megnevezes%TYPE,ret OUT SYS_REFCURSOR)
IS
BEGIN
   OPEN RET FOR SELECT * FROM allapot where megnevezes=allapotp;
END;
/
CREATE OR REPLACE PROCEDURE updateStatusz(allaskid IN jelentkezes.allaskereso_id%TYPE)
IS
BEGIN
    UPDATE allaskereso set allaskereso.statusz_id=3 WHERE allaskereso.id=allaskid;
END;
/


