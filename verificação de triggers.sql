
-- verifica quais trigger a 'tabela1' tem
exec sp_helptrigger @tabname = 'tabela1'

-- verifica todas as trigger o BD tem e que estão ativas (se quiser ver as desativadas, mude o 1 para 0)
select * from sys.triggers where is_disabled = 1

-- Comando para ativar ou desativar uma trigger (mude o 'enable' para 'disable' se quiser desativar)
alter table tabela1
enable trigger trg_nDelete