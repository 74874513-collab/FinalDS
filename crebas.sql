/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     05/12/2025 03:46:45 p. m.                    */
/*==============================================================*/


drop table if exists CHIP;

drop table if exists DECLARACION_JURADA;

drop table if exists EMPRESA;

drop table if exists HOJA_DE_LIQUIDACION;

drop table if exists HOJA_DE_RETORNO;

drop table if exists HOJA_DE_RUTA;

drop table if exists HOJA_PEDIDOS;

drop table if exists HUELLA;

drop table if exists MOTORIZADO;

drop table if exists PEDIDO;

drop table if exists PRODUCTO;

drop table if exists USUARIO;

/*==============================================================*/
/* Table: CHIP                                                  */
/*==============================================================*/
create table CHIP
(
   CHIPID               int not null,
   PRODID               int not null,
   CHIPNUMERO           varchar(9) not null,
   CHIPESTADO           varchar(100) not null,
   primary key (CHIPID)
);

/*==============================================================*/
/* Table: DECLARACION_JURADA                                    */
/*==============================================================*/
create table DECLARACION_JURADA
(
   IDDECLARACIONJURADA  int not null,
   HUELLAID             int not null,
   primary key (IDDECLARACIONJURADA)
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA
(
   RUC                  int not null,
   CORREO               varchar(100) not null,
   TELEFONO             varchar(9) not null,
   RAZONSOCIAL          varchar(100) not null,
   primary key (RUC)
);

/*==============================================================*/
/* Table: HOJA_DE_LIQUIDACION                                   */
/*==============================================================*/
create table HOJA_DE_LIQUIDACION
(
   IDLIQUID             int not null,
   LIQUIDESTADO         varchar(25) not null,
   primary key (IDLIQUID)
);

/*==============================================================*/
/* Table: HOJA_DE_RETORNO                                       */
/*==============================================================*/
create table HOJA_DE_RETORNO
(
   IDHOJADERETORNO      int not null,
   IDPEDIDO             int not null,
   primary key (IDHOJADERETORNO)
);

/*==============================================================*/
/* Table: HOJA_DE_RUTA                                          */
/*==============================================================*/
create table HOJA_DE_RUTA
(
   IDHOJADERUTA         int not null,
   IDLIQUID             int not null,
   IDMOTORIZADO         int not null,
   primary key (IDHOJADERUTA)
);

/*==============================================================*/
/* Table: HOJA_PEDIDOS                                          */
/*==============================================================*/
create table HOJA_PEDIDOS
(
   IDHOJAPEDIDO         int not null,
   PRODID               int not null,
   IDPEDIDO             int not null,
   primary key (IDHOJAPEDIDO)
);

/*==============================================================*/
/* Table: HUELLA                                                */
/*==============================================================*/
create table HUELLA
(
   HUELLAID             int not null,
   primary key (HUELLAID)
);

/*==============================================================*/
/* Table: MOTORIZADO                                            */
/*==============================================================*/
create table MOTORIZADO
(
   IDMOTORIZADO         int not null,
   IDUSUARIO            int not null,
   IDDECLARACIONJURADA  int not null,
   MOTPLACA             varchar(10) not null,
   MOTLICENCIA          varchar(15) not null,
   MOTESTADO            varchar(20) not null,
   primary key (IDMOTORIZADO)
);

/*==============================================================*/
/* Table: PEDIDO                                                */
/*==============================================================*/
create table PEDIDO
(
   IDPEDIDO             int not null,
   RUC                  int not null,
   IDHOJADERUTA         int not null,
   PEDFECHA             datetime not null,
   PEDDNICLIENTE        varchar(8) not null,
   PEDDIRECCIONC        varchar(100) not null,
   PEDTELEFONOC         varchar(9) not null,
   PEDESTADO            varchar(20) not null,
   primary key (IDPEDIDO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO
(
   PRODID               int not null,
   PRODDESCRIPCION      varchar(100) not null,
   PRODTIPO             varchar(100) not null,
   primary key (PRODID)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO
(
   IDUSUARIO            int not null,
   USERNOMBRE           varchar(25) not null,
   USERCORREO           varchar(100) not null,
   USERCONTRASENA       varchar(100) not null,
   USERTELEFONO         varchar(9) not null,
   primary key (IDUSUARIO)
);

alter table CHIP add constraint FK_RELATIONSHIP_2 foreign key (PRODID)
      references PRODUCTO (PRODID) on delete restrict on update restrict;

alter table DECLARACION_JURADA add constraint FK_RELATIONSHIP_9 foreign key (HUELLAID)
      references HUELLA (HUELLAID) on delete restrict on update restrict;

alter table HOJA_DE_RETORNO add constraint FK_RELATIONSHIP_5 foreign key (IDPEDIDO)
      references PEDIDO (IDPEDIDO) on delete restrict on update restrict;

alter table HOJA_DE_RUTA add constraint FK_RELATIONSHIP_6 foreign key (IDLIQUID)
      references HOJA_DE_LIQUIDACION (IDLIQUID) on delete restrict on update restrict;

alter table HOJA_DE_RUTA add constraint FK_RELATIONSHIP_8 foreign key (IDMOTORIZADO)
      references MOTORIZADO (IDMOTORIZADO) on delete restrict on update restrict;

alter table HOJA_PEDIDOS add constraint FK_HOJA_PEDIDOS foreign key (PRODID)
      references PRODUCTO (PRODID) on delete restrict on update restrict;

alter table HOJA_PEDIDOS add constraint FK_HOJA_PEDIDOS2 foreign key (IDPEDIDO)
      references PEDIDO (IDPEDIDO) on delete restrict on update restrict;

alter table MOTORIZADO add constraint FK_RELATIONSHIP_10 foreign key (IDDECLARACIONJURADA)
      references DECLARACION_JURADA (IDDECLARACIONJURADA) on delete restrict on update restrict;

alter table MOTORIZADO add constraint FK_RELATIONSHIP_7 foreign key (IDUSUARIO)
      references USUARIO (IDUSUARIO) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_RELATIONSHIP_3 foreign key (RUC)
      references EMPRESA (RUC) on delete restrict on update restrict;

alter table PEDIDO add constraint FK_RELATIONSHIP_4 foreign key (IDHOJADERUTA)
      references HOJA_DE_RUTA (IDHOJADERUTA) on delete restrict on update restrict;

