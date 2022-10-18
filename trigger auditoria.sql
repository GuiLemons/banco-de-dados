-- essa trigger verifica qual coluna foi alterada da 'tabela1' e salva as alterações e informações dessa alteração numa tabela 'auditoria'

create trigger trg_audit
	on tabela1
	after update
	as
	begin
		declare @colunas varchar(500)
		declare @antigos varchar(500)
		declare @novos varchar(500)


		declare @nome varchar(100)
		declare @cpf varchar(100)
		declare @idade int
		declare @situacao bit

		declare @nome_novo varchar(100)
		declare @cpf_novo varchar(100)
		declare @idade_novo int
		declare @situacao_novo bit


		if update(nome)
		begin
			set @colunas = 'nome'
			select @antigos = nome from deleted
			select @novos = nome from inserted
		end

		if update(cpf)
		begin
			set @colunas =CONCAT(@colunas, '| cpf')
			select @cpf = cpf from deleted
			select @cpf_novo = cpf from inserted
			set @antigos =CONCAT(@antigos,' | ', @cpf)
			set @novos =CONCAT(@novos,' | ', @cpf_novo)
		end

		if update(idade)
		begin
			set @colunas =CONCAT(@colunas, '| idade')
			select @idade = idade from deleted
			select @idade_novo = idade from inserted
			set @antigos =CONCAT(@antigos,' | ', @idade)
			set @novos =CONCAT(@novos,' | ', @idade_novo)
		end

		if update(situacao)
		begin
			set @colunas =CONCAT(@colunas, '| situacao')
			select @situacao = situacao from deleted
			select @situacao_novo = situacao from inserted
			set @antigos =CONCAT(@antigos,' | ', @situacao)
			set @novos =CONCAT(@novos,' | ', @situacao_novo)
		end


		insert into auditoria values (@colunas, @antigos, @novos, getdate())
end