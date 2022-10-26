-- Criando usuários para fornecer permissões 

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

-- Negando select  na tabela 'a' para usuário ggle
deny select on a to ggle

-- Removendo a negação de select para usuário ggle
revoke select on a to ggle

-- Fornecendo permissões na tabela 'a' para usuário ze
grant select, insert, update, delete on a to ze

-- Removendo apenas permissão de Insert
revoke  insert on a to ze


-- testando permissões via procedure
-- negando permissão de insert na tabela a
deny insert on a to ggle

-- criando procedure para insert
create proc
insereTexto @txt varchar(30)
as 
begin
insert into a values(@txt)
end

-- fornecendo permissão de executar a procedure criada
grant exec on insereTexto to ggle


-- testando permissões via views

-- criando uma view
create view testeViews as select * from a where texto like '%a'

-- negando a permissão de select
deny select on a to ggle

-- fronecendo permissão de executar a view
grant select on testeViews to ggle

-- É possivel fornecer permissão para o bd todo, sem especificar a tabela 
grant select to ggle