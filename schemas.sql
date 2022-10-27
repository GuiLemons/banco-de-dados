create database testes_schemas
go
use testes_schemas

create table tabela1(
cod int,
txt varchar(30)
)

-- Cria��o de Schema
create schema senai

-- Criando uma tabela dentro do Schema
create table senai.tabela2(
cod int,
txt varchar(30)
)

create table senai.tabela3(
cod int,
txt varchar(30)
)

-- Inserindo dados em uma tabela que esta em um schema
insert into senai.tabela2 values(1,'teste')

-- transferindo uma tabela de um schema para outro schema

create schema charui

alter schema charui transfer senai.tabela2
alter schema charui transfer dbo.tabela1

create schema charuri

alter schema charuri transfer charui.tabela2
alter schema charuri transfer charui.tabela1



-- permiss�es a nivel de schema

create login ggle with password='12345'
create user ggle from login ggle

grant select, update, insert, delete on schema::charuri 
to ggle

-- O Usu�rio GGLE ter� acesso select, update, insert, delete a todos os objetos dentro do SCHEMA CHARURI, 
-- mas n�o ter� acesso nenhum aos objetos que estiverem em outros schemas