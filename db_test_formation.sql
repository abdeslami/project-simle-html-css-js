/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/05/2023 00:43:29                          */
/*==============================================================*/


drop table if exists ETUDIANT;

drop table if exists FORMATION;

drop table if exists INSCRIPTION;

drop table if exists SESSION;

/*==============================================================*/
/* Table: ETUDIANT                                              */
/*==============================================================*/
create table ETUDIANT
(
   CIN_ETUDIANT         varchar(20) not null,
   NOM_ETUDIANT         varchar(30),
   PRENOM_ETUDIANT      varchar(30),
   DATE_NAISSANCE       date,
   primary key (CIN_ETUDIANT)
);

/*==============================================================*/
/* Table: FORMATION                                             */
/*==============================================================*/
create table FORMATION
(
   CODE_FORMATION       varchar(100) not null,
   primary key (CODE_FORMATION)
);

/*==============================================================*/
/* Table: INSCRIPTION                                           */
/*==============================================================*/
create table INSCRIPTION
(
   CIN_ETUDIANT         varchar(20) not null,
   CODE_SESSION         varchar(100) not null,
   TYPE_COURS           varchar(15),
   primary key (CIN_ETUDIANT, CODE_SESSION)
);

/*==============================================================*/
/* Table: SESSION                                               */
/*==============================================================*/
create table SESSION
(
   CODE_SESSION         varchar(100) not null,
   CODE_FORMATION       varchar(100) not null,
   primary key (CODE_SESSION)
);

alter table INSCRIPTION add constraint FK_INSCRIPTION foreign key (CIN_ETUDIANT)
      references ETUDIANT (CIN_ETUDIANT) on delete restrict on update restrict;

alter table INSCRIPTION add constraint FK_INSCRIPTION2 foreign key (CODE_SESSION)
      references SESSION (CODE_SESSION) on delete restrict on update restrict;

alter table SESSION add constraint FK_CONCERNER foreign key (CODE_FORMATION)
      references FORMATION (CODE_FORMATION) on delete restrict on update restrict;

