-- Criando usu�rios para fornecer permiss�es 

create login ggle with password='12345'
create user ggle from login ggle

create login ze with password='12345'
create user ze from login ze

-- criando database de teste

create database teste
go
use teste

create table a(
texto varchar(30)
)

create table b(
texto varchar (30)
)

-- Negando select  na tabela 'a' para usu�rio ggle
deny select on a to ggle

-- Removendo a nega��o de select para usu�rio ggle
revoke select on a to ggle

-- Fornecendo permiss�es na tabela 'a' para usu�rio ze
grant select, insert, update, delete on a to ze

-- Removendo apenas permiss�o de Insert
revoke  insert on a to ze


-- testando permiss�es via procedure
-- negando permiss�o de insert na tabela a
deny insert on a to ggle

-- criando procedure para insert
create proc
insereTexto @txt varchar(30)
as 
begin
insert into a values(@txt)
end

-- fornecendo permiss�o de executar a procedure criada
grant exec on insereTexto to ggle


-- testando permiss�es via views

-- criando uma view
create view testeViews as select * from a where texto like '%a'

-- negando a permiss�o de select
deny select on a to ggle

-- fronecendo permiss�o de executar a view
grant select on testeViews to ggle

-- � possivel fornecer permiss�o para o bd todo, sem especificar a tabela 
grant select to ggle