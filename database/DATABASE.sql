/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     1/27/2023 9:34:51 AM                         */
/*==============================================================*/


drop trigger TRIGGER_1;

alter table CLIENT 
   drop foreign key FK_CLIENT_SUBSCRIBE_EMPLOYEE;

alter table DOCUMENT 
   drop foreign key FK_DOCUMENT_PROVIDE_CLIENT;

alter table PAYMENT 
   drop foreign key FK_PAYMENT_LETTER_PROPERTY;

alter table PROPERTY 
   drop foreign key FK_PROPERTY_PURCHASE_CLIENT;

alter table PROPERTYFEATURE 
   drop foreign key FK_PROPERTY_PROPERTYF_PROPERTY;

alter table PROPERTYFEATURE 
   drop foreign key FK_PROPERTY_PROPERTYF_FEATURE;

alter table STAGE_CLIENT 
   drop foreign key FK_STAGE_CL_STAGE_CLI_CLIENT;

alter table STAGE_CLIENT 
   drop foreign key FK_STAGE_CL_STAGE_CLI_STAGE;


alter table CLIENT 
   drop foreign key FK_CLIENT_SUBSCRIBE_EMPLOYEE;

drop table if exists CLIENT;


alter table DOCUMENT 
   drop foreign key FK_DOCUMENT_PROVIDE_CLIENT;

drop table if exists DOCUMENT;

drop table if exists EMPLOYEE;

drop table if exists FEATURE;


alter table PAYMENT 
   drop foreign key FK_PAYMENT_LETTER_PROPERTY;

drop table if exists PAYMENT;


alter table PROPERTY 
   drop foreign key FK_PROPERTY_PURCHASE_CLIENT;

drop table if exists PROPERTY;


alter table PROPERTYFEATURE 
   drop foreign key FK_PROPERTY_PROPERTYF_PROPERTY;

alter table PROPERTYFEATURE 
   drop foreign key FK_PROPERTY_PROPERTYF_FEATURE;

drop table if exists PROPERTYFEATURE;

drop table if exists STAGE;


alter table STAGE_CLIENT 
   drop foreign key FK_STAGE_CL_STAGE_CLI_CLIENT;

alter table STAGE_CLIENT 
   drop foreign key FK_STAGE_CL_STAGE_CLI_STAGE;

drop table if exists STAGE_CLIENT;

/*==============================================================*/
/* Table: CLIENT                                                */
/*==============================================================*/
create table CLIENT
(
   ID_CLIENT            varchar(10) not null  comment '',
   ID_EMPLOYEE          char(36) not null default 'UUID()'  comment '',
   NAME_CLIENT          varchar(32) not null  comment '',
   LASTNAME_CLIENT      varchar(32) not null  comment '',
   PHONE_CLIENT         varchar(10) not null  comment '',
   TYPE_CLIENT          char(16) not null  comment '',
   EMAIL_CLIENT         varchar(32)  comment '',
   DATE_SUSCRIBE        date  comment '',
   CITY_SUBSCRIBE       varchar(16)  comment '',
   SPOUSE_NAME          varchar(32)  comment '',
   SPOUSE_OCUPATION     varchar(32)  comment '',
   SPOUSE_DIRECTION     varchar(64)  comment '',
   SPOUSE_SALARY        decimal(6,2)  comment '',
   SPOUSE_ENTITY        varchar(32)  comment '',
   DIRECTION_CLIENT     varchar(64)  comment '',
   OCUPATION_CLIENT     varchar(32)  comment '',
   SALARY_CLIENT        decimal(7,2)  comment '',
   MARITAL_STATUS_CLIENT varchar(8)  comment '',
   primary key (ID_CLIENT)
);

/*==============================================================*/
/* Table: DOCUMENT                                              */
/*==============================================================*/
create table DOCUMENT
(
   ID_DOCUMENT          char(36) not null  comment '',
   ID_CLIENT            varchar(10) not null  comment '',
   NAME_DOCUMENT        varchar(16) not null  comment '',
   TYPE_DOCUMENT        varchar(16) not null  comment '',
   primary key (ID_DOCUMENT)
);

/*==============================================================*/
/* Table: EMPLOYEE                                              */
/*==============================================================*/
create table EMPLOYEE
(
   ID_EMPLOYEE          char(36) not null default 'UUID()'  comment '',
   NAME_EMPLOYEE        varchar(32) not null  comment '',
   LASTNAME_EMPLOYEE    varchar(32) not null  comment '',
   EMAIL_EMPLOYEE       varchar(32) not null  comment '',
   POSITION_EMPLOYEE    varchar(16)  comment '',
   PASSWORD_EMPLOYEE    varchar(32) not null  comment '',
   PERMISSIONS          varchar(16) not null  comment '',
   primary key (ID_EMPLOYEE)
);

/*==============================================================*/
/* Table: FEATURE                                               */
/*==============================================================*/
create table FEATURE
(
   ID_FEATURE           char(36) not null default 'UUID()'  comment '',
   NAME_FEATURE         varchar(16)  comment '',
   primary key (ID_FEATURE)
);

/*==============================================================*/
/* Table: PAYMENT                                               */
/*==============================================================*/
create table PAYMENT
(
   ID_CLIENT            varchar(10) not null  comment '',
   ID_PROPERTY          char(36) not null  comment '',
   ID_PAYMENT           char(36) not null  comment '',
   DESCRIPTION_PAYMENT  varchar(32)  comment '',
   DATE_PAYMENT         date  comment '',
   primary key (ID_CLIENT, ID_PROPERTY, ID_PAYMENT)
);

/*==============================================================*/
/* Table: PROPERTY                                              */
/*==============================================================*/
create table PROPERTY
(
   ID_CLIENT            varchar(10) not null  comment '',
   ID_PROPERTY          char(36) not null  comment '',
   TYPE_PROPERTY        varchar(16)  comment '',
   primary key (ID_CLIENT, ID_PROPERTY)
);

/*==============================================================*/
/* Table: PROPERTYFEATURE                                       */
/*==============================================================*/
create table PROPERTYFEATURE
(
   ID_CLIENT            varchar(10) not null  comment '',
   ID_PROPERTY          char(36) not null  comment '',
   ID_FEATURE           char(36) not null default 'UUID()'  comment '',
   primary key (ID_CLIENT, ID_PROPERTY, ID_FEATURE)
);

/*==============================================================*/
/* Table: STAGE                                                 */
/*==============================================================*/
create table STAGE
(
   ID_STAGE             char(36) not null  comment '',
   PRECONDITION_STAGE   bool  comment '',
   primary key (ID_STAGE)
);

/*==============================================================*/
/* Table: STAGE_CLIENT                                          */
/*==============================================================*/
create table STAGE_CLIENT
(
   ID_CLIENT            varchar(10) not null  comment '',
   ID_STAGE             char(36) not null  comment '',
   STAGE_START_DATE     date  comment '',
   STAGE_END_DATE       date  comment '',
   primary key (ID_CLIENT, ID_STAGE)
);

alter table CLIENT add constraint FK_CLIENT_SUBSCRIBE_EMPLOYEE foreign key (ID_EMPLOYEE)
      references EMPLOYEE (ID_EMPLOYEE) on delete restrict on update restrict;

alter table DOCUMENT add constraint FK_DOCUMENT_PROVIDE_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT) on delete restrict on update restrict;

alter table PAYMENT add constraint FK_PAYMENT_LETTER_PROPERTY foreign key (ID_CLIENT, ID_PROPERTY)
      references PROPERTY (ID_CLIENT, ID_PROPERTY) on delete restrict on update restrict;

alter table PROPERTY add constraint FK_PROPERTY_PURCHASE_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT) on delete restrict on update restrict;

alter table PROPERTYFEATURE add constraint FK_PROPERTY_PROPERTYF_PROPERTY foreign key (ID_CLIENT, ID_PROPERTY)
      references PROPERTY (ID_CLIENT, ID_PROPERTY) on delete restrict on update restrict;

alter table PROPERTYFEATURE add constraint FK_PROPERTY_PROPERTYF_FEATURE foreign key (ID_FEATURE)
      references FEATURE (ID_FEATURE) on delete restrict on update restrict;

alter table STAGE_CLIENT add constraint FK_STAGE_CL_STAGE_CLI_CLIENT foreign key (ID_CLIENT)
      references CLIENT (ID_CLIENT) on delete restrict on update restrict;

alter table STAGE_CLIENT add constraint FK_STAGE_CL_STAGE_CLI_STAGE foreign key (ID_STAGE)
      references STAGE (ID_STAGE) on delete restrict on update restrict;


create trigger TRIGGER_1 after insert
on DOCUMENT for each row
begin
end;

