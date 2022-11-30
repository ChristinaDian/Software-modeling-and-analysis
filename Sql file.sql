CREATE DATABASE Pinterest;
USE Pinterest;

CREATE TABLE COUNTRIES(
COUNTRY_CODE INT PRIMARY KEY,
NAME VARCHAR(30) NOT NULL
)

CREATE TABLE USERS(
ID INT PRIMARY KEY IDENTITY(1,1),
EMAIL VARCHAR(30) NOT NULL UNIQUE,
FIRST_NAME VARCHAR(30) NOT NULL,
LAST_NAME VARCHAR(30) NOT NULL,
PASSWORD VARCHAR(30) NOT NULL,
LINK VARCHAR(MAX),
ABOUT TEXT,
AGE TINYINT NOT NULL,
GENDER CHAR(1) NOT NULL CHECK(GENDER IN ('M','F')),
COUNTRY_CODE INT FOREIGN KEY REFERENCES COUNTRIES
)

CREATE TABLE BOARDS(
ID INT PRIMARY KEY IDENTITY(1,1),
USER_ID INT FOREIGN KEY REFERENCES USERS (ID),
NAME VARCHAR(30) NOT NULL,
VISIBILITY BIT NOT NULL,
LAST_ADDED DATETIME NULL
)

CREATE TABLE HASHTAGS(
ID INT PRIMARY KEY IDENTITY(1,1),
CONTENT VARCHAR(30) NOT NULL UNIQUE
)

CREATE TABLE PINS(
ID INT PRIMARY KEY IDENTITY(1,1),
USER_ID INT FOREIGN KEY REFERENCES USERS (ID),
TITLE VARCHAR(30) NOT NULL UNIQUE,
DESCRIPTION TEXT,
DESTINATION_WEBSITE VARCHAR(MAX),
PHOTO_URL VARCHAR(MAX) NOT NULL
)

CREATE TABLE VIDEOS(
ID INT PRIMARY KEY IDENTITY(1,1),
USER_ID INT FOREIGN KEY REFERENCES USERS (ID),
TITLE VARCHAR(30) NOT NULL UNIQUE,
DESCRIPTION TEXT,
LIKES_COUNT INT,
SENDINGS_COUNT INT,
VIDEO_URL VARCHAR(MAX) NOT NULL
)

CREATE TABLE COMMENTS(
ID INT PRIMARY KEY IDENTITY(1,1),
USER_ID INT FOREIGN KEY REFERENCES USERS (ID) NOT NULL,
PIN_ID INT FOREIGN KEY REFERENCES PINS (ID) NULL,
VIDEO_ID INT FOREIGN KEY REFERENCES VIDEOS (ID) NULL,
CONTENT TEXT NOT NULL,
CREATED_AT DATETIME DEFAULT(getdate()),
LIKE_REACTIONS INT,
LOVE_REACTIONS INT
)

CREATE TABLE REPLIES(
ID INT NOT NULL,
COMMENT_ID INT REFERENCES COMMENTS (ID) NOT NULL,
PRIMARY KEY(COMMENT_ID, ID),
CONTENT TEXT NOT NULL,
CREATED_AT DATETIME DEFAULT(getdate()),
LIKE_REACTIONS INT,
LOVE_REACTIONS INT
)

CREATE TABLE SAVED_POSTS_TO_BOARDS(
ID INT PRIMARY KEY IDENTITY(1,1),
USER_ID INT FOREIGN KEY REFERENCES USERS (ID) NOT NULL,
BOARD_ID INT FOREIGN KEY REFERENCES BOARDS (ID) NOT NULL,
PIN_ID INT FOREIGN KEY REFERENCES PINS (ID) NULL,
VIDEO_ID INT FOREIGN KEY REFERENCES VIDEOS (ID) NULL
)

CREATE TABLE HASHTAGS_TO_POSTS(
ID INT PRIMARY KEY IDENTITY(1,1),
HASHTAG_ID INT FOREIGN KEY REFERENCES HASHTAGS (ID) NOT NULL,
PIN_ID INT FOREIGN KEY REFERENCES PINS (ID) NULL,
VIDEO_ID INT FOREIGN KEY REFERENCES VIDEOS (ID) NULL
)

INSERT INTO COUNTRIES
VALUES(93, 'Afghanistan'), (359, 'Bulgaria'), (55, 'Brazil'),
(1, 'Canada'), (33, 'France'), (30, 'Greece'), (49, 'Germany'),
(39, 'Italy'), (64, 'New Zealand'), (47, 'Norway'), (974, 'Qatar')

insert into users 
values ('dflye0@1688.com', 'Dorelia', 'Flye', 'bvnSbh6J', '202.255.17.128', 'Networked regional emulation', 19, 'F', 359),
('astolting1@dot.gov', 'Aloysia', 'Stolting', 'jynp5TVe4p2y', '228.230.251.150', 'Implemented intermediate concept', 29, 'F', 359),
('jhorry2@spiegel.de', 'Jedediah', 'Horry', '52c7R1X2DTc', '190.52.228.168', 'Decentralized static complexity', 38, 'M', 359),
('smacswayde3@un.org', 'Stephen', 'MacSwayde', 'rJEI7fGB9z', '229.193.58.137', 'Optimized regional circuit', 15, 'M', 49),
('erameau4@newsvine.com', 'Erny', 'Rameau', 'VEXS2FSaM', '73.161.209.52', 'Devolved responsive hardware', 33, 'M', 49),
('hgask5@vk.com', 'Hally', 'Gask', 'XzgjHza', '104.244.220.215', 'Profit-focused web-enabled frame', 16, 'F', 39),
('hzappel6@list-manage.com', 'Heindrick', 'Zappel', 'b4Y2fCvSf', '197.158.215.0', 'Assimilated next generation parallelism', 17, 'M', 39),
('lchasmar7@photobucket.com', 'Lucita', 'Chasmar', '50qpGCYL806', '93.115.138.249', 'Intuitive non-volatile archive', 18, 'M', 47),
('gsloyan8@utexas.edu', 'Gertrud', 'Sloyan', 'xgM79TlM', '242.171.79.133', 'Profound next generation system engine', 19, 'F', 47),
('smonks9@house.gov', 'Sayres', 'Monks', 'IhCeZK', '248.244.212.69', 'Upgradable optimizing firmware', 20, 'M', 974)

INSERT INTO BOARDS
VALUES(1, 'Hair', 0, GETDATE()), (1, 'Nails', 0, GETDATE()),
(1, 'Cars', 1, GETDATE()), (5, 'Places', 1, GETDATE()),
(5, 'Cats', 0, GETDATE()), (3, 'Halloween', 0, GETDATE()),
(2, 'Christmas', 1, GETDATE()), (4, 'Sql', 0, GETDATE()),
(8, 'Hairstyles', 1, GETDATE()), (8, 'Outfits', 1, GETDATE())

INSERT INTO HASHTAGS
VALUES('HAIR'), ('BULGARIA'), ('BEAUTIFUL'), ('PINK'), ('BLACK'), ('CARS'),
('TODAY_PHOTO'), ('STUDY'), ('CATS'), ('ANIMALS'), ('DOGS'), ('NAILS')

insert into PINS 
values (1, 'Love Sick', 'Future-proofed real-time parallelism', 'http://guardian.co.uk/nunc/viverra/dapibus.jsp?orci=mauris&pede=enim&venenatis=leo&non=rhoncus&sodales=sed&sed=vestibulum&tincidunt=sit&eu=amet&felis=cursus', 'http://dummyimage.com/201x100.png/dddddd/000000'),
(1, 'Love Is a Woman', 'Versatile bottom-line synergy', 'https://scientificamerican.com/mattis/odio/donec.aspx?et=vivamus&eros=metus&vestibulum=arcu&ac=adipiscing&est=molestie&lacinia=hendrerit&nisi=at&venenatis=vulputate&tristique=vitae&fusce=nisl&congue=aenean&diam=lectus&id=pellentesque&ornare=eget&imperdiet=nunc&sapien=donec&urna=quis&pretium=orci&nisl=eget&ut=orci&volutpat=vehicula&sapien=condimentum&arcu=curabitur&sed=in&augue=libero&aliquam=ut&erat=massa&volutpat=volutpat&in=convallis&congue=morbi&etiam=odio&justo=odio&etiam=elementum&pretium=eu&iaculis=interdum&justo=eu&in=tincidunt&hac=in&habitasse=leo&platea=maecenas&dictumst=pulvinar&etiam=lobortis&faucibus=est&cursus=phasellus&urna=sit&ut=amet&tellus=erat&nulla=nulla&ut=tempus&erat=vivamus&id=in&mauris=felis&vulputate=eu&elementum=sapien&nullam=cursus&varius=vestibulum&nulla=proin&facilisi=eu&cras=mi&non=nulla&velit=ac&nec=enim&nisi=in&vulputate=tempor&nonummy=turpis&maecenas=nec&tincidunt=euismod&lacus=scelerisque&at=quam&velit=turpis&vivamus=adipiscing&vel=lorem&nulla=vitae&eget=mattis&eros=nibh&elementum=ligula&pellentesque=nec&quisque=sem&porta=duis&volutpat=aliquam&erat=convallis&quisque=nunc&erat=proin&eros=at', 'http://dummyimage.com/182x100.png/ff4444/ffffff'),
(3, 'Aaron Loves Angela', 'Synchronised global utilisation', 'http://marriott.com/risus/auctor/sed/tristique/in/tempus/sit.jsp?est=neque&risus=libero&auctor=convallis&sed=eget&tristique=eleifend&in=luctus&tempus=ultricies&sit=eu&amet=nibh&sem=quisque&fusce=id&consequat=justo&nulla=sit&nisl=amet&nunc=sapien&nisl=dignissim&duis=vestibulum&bibendum=vestibulum&felis=ante&sed=ipsum&interdum=primis&venenatis=in&turpis=faucibus&enim=orci&blandit=luctus&mi=et&in=ultrices&porttitor=posuere&pede=cubilia&justo=curae&eu=nulla&massa=dapibus&donec=dolor&dapibus=vel&duis=est&at=donec&velit=odio&eu=justo&est=sollicitudin&congue=ut&elementum=suscipit&in=a&hac=feugiat&habitasse=et&platea=eros&dictumst=vestibulum&morbi=ac&vestibulum=est&velit=lacinia&id=nisi', 'http://dummyimage.com/241x100.png/5fa2dd/ffffff'),
(1, 'Rockaway', 'Cross-platform asynchronous collaboration', 'https://macromedia.com/mauris/non/ligula/pellentesque/ultrices/phasellus/id.js?nec=volutpat&nisi=in&volutpat=congue&eleifend=etiam&donec=justo&ut=etiam&dolor=pretium', 'http://dummyimage.com/128x100.png/ff4444/ffffff'),
(5, 'Cecil B DeMented', 'Upgradable solution-oriented structure', 'http://sbwire.com/at.aspx?etiam=quam&justo=sapien&etiam=varius&pretium=ut&iaculis=blandit&justo=non&in=interdum&hac=in&habitasse=ante&platea=vestibulum&dictumst=ante&etiam=ipsum&faucibus=primis&cursus=in&urna=faucibus&ut=orci&tellus=luctus&nulla=et&ut=ultrices&erat=posuere&id=cubilia&mauris=curae&vulputate=duis&elementum=faucibus&nullam=accumsan&varius=odio&nulla=curabitur&facilisi=convallis&cras=duis&non=consequat&velit=dui&nec=nec&nisi=nisi&vulputate=volutpat&nonummy=eleifend&maecenas=donec&tincidunt=ut&lacus=dolor&at=morbi&velit=vel&vivamus=lectus&vel=in&nulla=quam&eget=fringilla&eros=rhoncus&elementum=mauris&pellentesque=enim&quisque=leo&porta=rhoncus&volutpat=sed&erat=vestibulum&quisque=sit&erat=amet&eros=cursus&viverra=id&eget=turpis&congue=integer&eget=aliquet&semper=massa&rutrum=id&nulla=lobortis&nunc=convallis&purus=tortor&phasellus=risus&in=dapibus&felis=augue&donec=vel&semper=accumsan&sapien=tellus&a=nisi&libero=eu&nam=orci&dui=mauris&proin=lacinia&leo=sapien&odio=quis&porttitor=libero&id=nullam&consequat=sit&in=amet&consequat=turpis&ut=elementum&nulla=ligula&sed=vehicula&accumsan=consequat&felis=morbi&ut=a&at=ipsum&dolor=integer&quis=a&odio=nibh&consequat=in&varius=quis&integer=justo&ac=maecenas&leo=rhoncus', 'http://dummyimage.com/153x100.png/dddddd/000000'),
(5, 'Yankee Zulu', 'Reduced grid-enabled solution', 'https://vimeo.com/semper/interdum/mauris/ullamcorper/purus/sit.html?porta=convallis&volutpat=nulla&quam=neque&pede=libero&lobortis=convallis&ligula=eget&sit=eleifend&amet=luctus&eleifend=ultricies&pede=eu&libero=nibh&quis=quisque&orci=id&nullam=justo&molestie=sit&nibh=amet&in=sapien&lectus=dignissim&pellentesque=vestibulum&at=vestibulum&nulla=ante&suspendisse=ipsum&potenti=primis&cras=in&in=faucibus&purus=orci&eu=luctus&magna=et&vulputate=ultrices&luctus=posuere&cum=cubilia&sociis=curae&natoque=nulla&penatibus=dapibus&et=dolor&magnis=vel&dis=est&parturient=donec&montes=odio&nascetur=justo&ridiculus=sollicitudin&mus=ut&vivamus=suscipit&vestibulum=a&sagittis=feugiat&sapien=et&cum=eros&sociis=vestibulum&natoque=ac&penatibus=est&et=lacinia&magnis=nisi&dis=venenatis&parturient=tristique&montes=fusce&nascetur=congue&ridiculus=diam&mus=id&etiam=ornare&vel=imperdiet&augue=sapien&vestibulum=urna&rutrum=pretium&rutrum=nisl&neque=ut&aenean=volutpat&auctor=sapien&gravida=arcu&sem=sed&praesent=augue&id=aliquam&massa=erat&id=volutpat&nisl=in', 'http://dummyimage.com/131x100.png/dddddd/000000'),
(8, 'Silent Fall', 'Mandatory foreground conglomeration', 'https://comsenz.com/aliquet/ultrices/erat/tortor/sollicitudin/mi/sit.png?eu=eget&est=eleifend&congue=luctus&elementum=ultricies&in=eu&hac=nibh&habitasse=quisque&platea=id&dictumst=justo&morbi=sit&vestibulum=amet&velit=sapien&id=dignissim&pretium=vestibulum&iaculis=vestibulum&diam=ante&erat=ipsum&fermentum=primis&justo=in&nec=faucibus&condimentum=orci&neque=luctus&sapien=et&placerat=ultrices&ante=posuere&nulla=cubilia&justo=curae&aliquam=nulla&quis=dapibus&turpis=dolor&eget=vel&elit=est&sodales=donec&scelerisque=odio&mauris=justo&sit=sollicitudin&amet=ut&eros=suscipit&suspendisse=a&accumsan=feugiat&tortor=et&quis=eros&turpis=vestibulum&sed=ac&ante=est&vivamus=lacinia&tortor=nisi&duis=venenatis&mattis=tristique&egestas=fusce&metus=congue&aenean=diam&fermentum=id&donec=ornare&ut=imperdiet&mauris=sapien&eget=urna&massa=pretium&tempor=nisl&convallis=ut&nulla=volutpat&neque=sapien&libero=arcu&convallis=sed&eget=augue&eleifend=aliquam&luctus=erat&ultricies=volutpat&eu=in&nibh=congue&quisque=etiam&id=justo&justo=etiam&sit=pretium&amet=iaculis&sapien=justo&dignissim=in&vestibulum=hac&vestibulum=habitasse&ante=platea&ipsum=dictumst&primis=etiam', 'http://dummyimage.com/222x100.png/dddddd/000000'),
(8, 'Music Man The', 'Reactive analyzing focus group', 'http://mtv.com/magnis/dis/parturient/montes.png?justo=lorem&aliquam=vitae&quis=mattis&turpis=nibh&eget=ligula&elit=nec&sodales=sem&scelerisque=duis&mauris=aliquam&sit=convallis&amet=nunc&eros=proin&suspendisse=at&accumsan=turpis&tortor=a&quis=pede&turpis=posuere&sed=nonummy&ante=integer&vivamus=non&tortor=velit&duis=donec&mattis=diam&egestas=neque&metus=vestibulum&aenean=eget&fermentum=vulputate&donec=ut&ut=ultrices&mauris=vel&eget=augue&massa=vestibulum&tempor=ante&convallis=ipsum&nulla=primis&neque=in&libero=faucibus&convallis=orci&eget=luctus&eleifend=et&luctus=ultrices&ultricies=posuere&eu=cubilia&nibh=curae&quisque=donec&id=pharetra&justo=magna&sit=vestibulum&amet=aliquet&sapien=ultrices&dignissim=erat&vestibulum=tortor&vestibulum=sollicitudin&ante=mi&ipsum=sit&primis=amet&in=lobortis&faucibus=sapien&orci=sapien&luctus=non&et=mi&ultrices=integer&posuere=ac&cubilia=neque&curae=duis&nulla=bibendum&dapibus=morbi&dolor=non&vel=quam&est=nec&donec=dui&odio=luctus&justo=rutrum&sollicitudin=nulla&ut=tellus&suscipit=in&a=sagittis&feugiat=dui&et=vel&eros=nisl&vestibulum=duis&ac=ac&est=nibh&lacinia=fusce&nisi=lacus&venenatis=purus&tristique=aliquet&fusce=at&congue=feugiat&diam=non&id=pretium&ornare=quis&imperdiet=lectus', 'http://dummyimage.com/143x100.png/cc0000/ffffff'),
(1, 'Buffalo Bill and the Indians', 'Fundamental eco-centric database', 'http://plala.or.jp/sollicitudin/ut/suscipit/a/feugiat/et.js?nulla=volutpat&integer=sapien&pede=arcu&justo=sed&lacinia=augue&eget=aliquam&tincidunt=erat&eget=volutpat&tempus=in&vel=congue&pede=etiam&morbi=justo&porttitor=etiam&lorem=pretium&id=iaculis&ligula=justo&suspendisse=in&ornare=hac&consequat=habitasse&lectus=platea&in=dictumst&est=etiam&risus=faucibus&auctor=cursus&sed=urna&tristique=ut&in=tellus&tempus=nulla&sit=ut&amet=erat&sem=id&fusce=mauris&consequat=vulputate&nulla=elementum&nisl=nullam&nunc=varius', 'http://dummyimage.com/183x100.png/5fa2dd/ffffff'),
(4, 'Alice in Wonderland', 'Cloned web-enabled standardization', 'https://psu.edu/amet/turpis.jsp?mattis=phasellus&nibh=id&ligula=sapien&nec=in&sem=sapien&duis=iaculis&aliquam=congue&convallis=vivamus&nunc=metus&proin=arcu&at=adipiscing&turpis=molestie&a=hendrerit&pede=at&posuere=vulputate&nonummy=vitae&integer=nisl&non=aenean&velit=lectus&donec=pellentesque&diam=eget&neque=nunc&vestibulum=donec&eget=quis&vulputate=orci&ut=eget&ultrices=orci&vel=vehicula&augue=condimentum&vestibulum=curabitur&ante=in&ipsum=libero&primis=ut&in=massa&faucibus=volutpat&orci=convallis&luctus=morbi&et=odio&ultrices=odio&posuere=elementum&cubilia=eu&curae=interdum&donec=eu&pharetra=tincidunt&magna=in&vestibulum=leo&aliquet=maecenas&ultrices=pulvinar&erat=lobortis&tortor=est&sollicitudin=phasellus&mi=sit&sit=amet&amet=erat&lobortis=nulla&sapien=tempus&sapien=vivamus&non=in&mi=felis&integer=eu&ac=sapien&neque=cursus&duis=vestibulum&bibendum=proin&morbi=eu&non=mi&quam=nulla&nec=ac&dui=enim&luctus=in&rutrum=tempor&nulla=turpis&tellus=nec&in=euismod', 'http://dummyimage.com/211x100.png/5fa2dd/ffffff'),
(6, 'Lipton Cockton', 'Realigned hybrid success', 'https://twitter.com/interdum/venenatis/turpis.aspx?eget=orci&elit=luctus&sodales=et&scelerisque=ultrices&mauris=posuere&sit=cubilia&amet=curae&eros=nulla&suspendisse=dapibus&accumsan=dolor&tortor=vel&quis=est&turpis=donec&sed=odio&ante=justo&vivamus=sollicitudin&tortor=ut&duis=suscipit&mattis=a&egestas=feugiat&metus=et&aenean=eros&fermentum=vestibulum&donec=ac&ut=est&mauris=lacinia&eget=nisi&massa=venenatis&tempor=tristique&convallis=fusce&nulla=congue&neque=diam&libero=id&convallis=ornare&eget=imperdiet&eleifend=sapien&luctus=urna&ultricies=pretium&eu=nisl&nibh=ut&quisque=volutpat&id=sapien&justo=arcu&sit=sed&amet=augue&sapien=aliquam&dignissim=erat&vestibulum=volutpat&vestibulum=in&ante=congue&ipsum=etiam&primis=justo&in=etiam&faucibus=pretium&orci=iaculis&luctus=justo&et=in&ultrices=hac&posuere=habitasse&cubilia=platea&curae=dictumst&nulla=etiam&dapibus=faucibus&dolor=cursus&vel=urna&est=ut&donec=tellus&odio=nulla&justo=ut&sollicitudin=erat&ut=id&suscipit=mauris', 'http://dummyimage.com/147x100.png/5fa2dd/ffffff'),
(7, 'Grays Anatomy', 'Ergonomic intangible customer loyalty', 'https://typepad.com/massa/id/lobortis.html?eu=consequat&interdum=metus&eu=sapien&tincidunt=ut&in=nunc&leo=vestibulum&maecenas=ante&pulvinar=ipsum&lobortis=primis&est=in&phasellus=faucibus&sit=orci&amet=luctus&erat=et&nulla=ultrices&tempus=posuere&vivamus=cubilia&in=curae&felis=mauris&eu=viverra&sapien=diam&cursus=vitae&vestibulum=quam&proin=suspendisse&eu=potenti&mi=nullam&nulla=porttitor&ac=lacus&enim=at&in=turpis&tempor=donec&turpis=posuere&nec=metus&euismod=vitae&scelerisque=ipsum&quam=aliquam&turpis=non&adipiscing=mauris&lorem=morbi&vitae=non&mattis=lectus&nibh=aliquam&ligula=sit&nec=amet&sem=diam&duis=in&aliquam=magna&convallis=bibendum&nunc=imperdiet&proin=nullam&at=orci&turpis=pede&a=venenatis&pede=non&posuere=sodales&nonummy=sed&integer=tincidunt&non=eu&velit=felis&donec=fusce&diam=posuere&neque=felis&vestibulum=sed&eget=lacus&vulputate=morbi&ut=sem&ultrices=mauris&vel=laoreet&augue=ut&vestibulum=rhoncus&ante=aliquet&ipsum=pulvinar&primis=sed', 'http://dummyimage.com/233x100.png/dddddd/000000')

insert into VIDEOS
values (1, 'Love Object', 'User-friendly local database', 9031, 1778, 'http://dummyimage.com/180x100.png/cc0000/ffffff'),
(1, 'Descent, The', 'Diverse intangible project', 7, 75, 'http://dummyimage.com/239x100.png/5fa2dd/ffffff'),
(1, 'Caesar Must Die ', 'Cross-group dedicated attitude', 19476, 743, 'http://dummyimage.com/156x100.png/5fa2dd/ffffff'),
(9, 'EDtv', 'Reactive optimizing solution', 2, 15189, 'http://dummyimage.com/167x100.png/5fa2dd/ffffff'),
(9, 'Dante 01', 'Horizontal real-time project', 0146, 1, 'http://dummyimage.com/200x100.png/5fa2dd/ffffff'),
(8, 'Sign of Leo', 'Organic logistical success', 5048, 6611, 'http://dummyimage.com/153x100.png/dddddd/000000'),
(5, 'Ladrones', 'Open-source homogeneous core', 76917, 99125, 'http://dummyimage.com/140x100.png/dddddd/000000'),
(3, 'Mr. Woodcock', 'Self-enabling human-resource standardization', 50, 88, 'http://dummyimage.com/161x100.png/dddddd/000000'),
(3, 'Code 46', 'Front-line 24 hour hierarchy', 9, 366, 'http://dummyimage.com/145x100.png/ff4444/ffffff'),
(1, 'Once Upon a Time in Mexico', 'Diverse radical benchmark', 5665, 2, 'http://dummyimage.com/209x100.png/dddddd/000000'),
(2, 'Lupin III', 'Profit-focused mission-critical parallelism', 23, 2083, 'http://dummyimage.com/169x100.png/cc0000/ffffff'),
(4, 'Three Smart Girls Grow Up', 'Profound didactic definition', 279, 34546, 'http://dummyimage.com/193x100.png/dddddd/000000')

INSERT INTO COMMENTS
values (1, 15, NULL,'Profit-focused upward-trending intranet', '5/7/2022', 20, NULL),
(3, 15, NULL,'Progressive motivating internet solution', '2/14/2022',NULL, NULL),
(2, 13, NULL,'Grass-roots radical help-desk', '6/26/2022', NULL, NULL),
(8, 11, NULL,'Automated multimedia encoding', '12/18/2021', NULL,NULL),
(6, NULL, 6,'Robust mission-critical installation', '12/25/2021', NULL,NULL),
(4, 12,NULL,'User-friendly secondary installation', '3/23/2022', NULL,NULL),
(7, 12,NULL,'De-engineered system-worthy encoding', '3/19/2022', 3,NULL),
(1, NULL,8,'Stand-alone hybrid installation', '11/2/2022', NULL,NULL),
(2, 15, NULL,'Upgradable 4th generation structure', '10/10/2022', 1,NULL),
(2, 16, NULL,'Team-oriented demand-driven functionalities', '2/8/2022', NULL,6),
(4, NULL,4, 'Persevering client-driven toolset', '6/6/2022', NULL,35),
(7, 16, NULL, 'Realigned discrete local area network', '12/7/2021', NULL,2)

INSERT INTO REPLIES
VALUES(1, 14, 'Programmable coherent system engine', '8/1/2022', NULL,NULL),
(2, 14, 'Diverse maximized Graphical User Interface', '6/4/2022', NULL,NULL),
(3, 20, 'Organized analyzing moratorium', '5/25/2022', NULL,NULL),
(4, 20,'Public-key contextually-based open architecture', '8/24/2022', NULL,NULL),
(5, 20, 'Compatible solution-oriented alliance', '3/22/2022', NULL,NULL),
(6, 20, 'Cloned web-enabled standardization', '11/5/2022', NULL,NULL),
(7, 14, 'Fundamental next generation project', '1/19/2022', NULL,NULL),
(8, 14, 'Visionary real-time implementation', '2/15/2022', NULL,NULL)

INSERT INTO SAVED_POSTS_TO_BOARDS
VALUES(1, 1, 11, NULL),
(1, 1, 16, NULL),
(1, 1, 18, NULL),
(1, 2, 19, NULL),
(1, 2, NULL, 4)

INSERT INTO SAVED_POSTS_TO_BOARDS
VALUES(2, 1, 11, NULL),
(2, 1, 16, NULL),
(2, 1, 18, NULL),
(3, 2, 19, NULL),
(4, 2, NULL, 4)

INSERT INTO HASHTAGS_TO_POSTS
VALUES(1, 11, NULL),
(2, 11, NULL),
(3, 11, NULL),
(4, 11, NULL),
(2, 14, NULL),
(2, 19, NULL)

CREATE PROCEDURE SHOW_ALL_SAVED_PINS_FOR_USERS
AS
BEGIN
SELECT U.FIRST_NAME + ' ' + U.LAST_NAME AS 'Saved By', P.TITLE AS Pins, V.TITLE AS Videos
FROM USERS U
JOIN SAVED_POSTS_TO_BOARDS SP
ON U.ID = SP.USER_ID
LEFT JOIN PINS P
ON P.ID = SP.PIN_ID
LEFT JOIN VIDEOS V
ON V.ID = SP.VIDEO_ID
END;

EXEC SHOW_ALL_SAVED_PINS_FOR_USERS

CREATE FUNCTION TOTAL_USED_HASHTAGS_FUNC () RETURNS TABLE
AS
RETURN
SELECT TOP 10 H.CONTENT AS 'Name', COUNT(HP.PIN_ID) + COUNT(HP.VIDEO_ID) AS 'Total Likes' 
FROM HASHTAGS H
LEFT JOIN HASHTAGS_TO_POSTS HP
ON H.ID = HP.HASHTAG_ID
GROUP BY H.CONTENT
ORDER BY 'Total Likes' DESC

SELECT * FROM TOTAL_USED_HASHTAGS_FUNC ()

CREATE TABLE USERS_HISTORY
(
	USER_ID INT,
	OLD_NAME VARCHAR(50),
	NEW_NAME VARCHAR(50)
)
 

 CREATE TRIGGER UPDATE_INSERT_LNAME_TRIGGER
 ON USERS
 FOR UPDATE
 AS
	IF UPDATE (LAST_NAME)
	BEGIN
		INSERT INTO USERS_HISTORY(USER_ID, OLD_NAME, NEW_NAME)
		SELECT I.ID, D.LAST_NAME, I.LAST_NAME
		FROM inserted I , deleted D
		WHERE I.ID = D.ID
	END

UPDATE USERS
SET LAST_NAME = LAST_NAME + '-' + 'NEW'
WHERE ID IN (1, 4)

SELECT *
FROM  USERS_HISTORY
WHERE USER_ID IN (1, 4)
