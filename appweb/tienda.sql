CREATE DATABASE tienda;
DROP TABLE PRODUCTO;
DROP TABLE CATEGORIA;
DROP TABLE USUARIO;
/*==============================================================*/
/* Table: CATEGORIA                                             */
/*==============================================================*/
create table CATEGORIA
(
   CAT_ID               int not null auto_increment,
   CAT_NOMBRE           varchar(40) not null,
   primary key (CAT_ID)
)
Engine = InnoDB;
/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   USU_ID               int not null auto_increment,
   USU_NOMBRE           varchar(40) not null,
   USU_CLAVE            varchar(40) not null,
   primary key (USU_ID)
)
Engine = InnoDB;

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   PRO_ID               int not null auto_increment,
   CAT_ID               int,
   PRO_NOMBRE           varchar(40) not null,
   PRO_PRECIO           float(8,2) not null,
   PRO_IMAGEN           varchar(300),
   primary key (PRO_ID)
)
Engine = InnoDB;

alter table PRODUCTO add constraint CATEGORIA_PRODUCTO foreign key (CAT_ID)
      references CATEGORIA (CAT_ID) on delete restrict on update restrict;

/*DATOS*/

/*DELETE FROM PRODUCTO;
DELETE FROM CATEGORIA;*/
/*CATEGORIAS*/
INSERT INTO `tienda`.`CATEGORIA` (`CAT_NOMBRE`) VALUES ('Zapatos');
INSERT INTO `tienda`.`CATEGORIA` (`CAT_NOMBRE`) VALUES ('Pantalones');
/*PROUCTOS*/
INSERT INTO `tienda`.`PRODUCTO` (`CAT_ID`,`PRO_NOMBRE`,`PRO_PRECIO`,`PRO_IMAGEN`)VALUES(1,'zapato 1',80.4, 'pantalon1.jpg');
INSERT INTO `tienda`.`PRODUCTO` (`CAT_ID`,`PRO_NOMBRE`,`PRO_PRECIO`,`PRO_IMAGEN`)VALUES(1,'zapato 2',29.99, 'zapato1.jpg');
INSERT INTO `tienda`.`PRODUCTO` (`CAT_ID`,`PRO_NOMBRE`,`PRO_PRECIO`,`PRO_IMAGEN`)VALUES(1,'zapato 3',20.50, 'zapato2.jpg');
INSERT INTO `tienda`.`PRODUCTO` (`CAT_ID`,`PRO_NOMBRE`,`PRO_PRECIO`,`PRO_IMAGEN`)VALUES(2,'pantalon 1',80.4, 'pantalon1.jpg');
INSERT INTO `tienda`.`PRODUCTO` (`CAT_ID`,`PRO_NOMBRE`,`PRO_PRECIO`,`PRO_IMAGEN`)VALUES(2,'pantalon 2',70.0, 'pantalon2.jpg');
INSERT INTO `tienda`.`PRODUCTO` (`CAT_ID`,`PRO_NOMBRE`,`PRO_PRECIO`,`PRO_IMAGEN`)VALUES(2,'pantalon 3',30.5, 'pantalon3.jpg');
