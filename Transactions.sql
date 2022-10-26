
BEGIN TRANSACTION;  
 
BEGIN TRY  
     
   
insert into teste values(10, 2)

-- para confirmar a transação
COMMIT TRANSACTION;  
-- para desfazer a transação
ROLLBACK TRANSACTION;  






-- EXEMPLO DE TRANSACTION COM TRY/CATCH

BEGIN TRANSACTION;  
 
BEGIN TRY  -- tenta fazer o insert
     
    insert into teste values(next value for sTeste, '5')
insert into teste values(10, 2)
END TRY  
BEGIN CATCH  -- caso dê erro, entra no catch
    SELECT  -- select para mostrar na tela algumas informações sobre o erro
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
 
    IF @@TRANCOUNT > 0  -- if para verificar se há transação aberta
        ROLLBACK TRANSACTION;  -- se entro no catch, executa um rollback para desfazer
END CATCH;  
 
IF @@TRANCOUNT > 0  -- if para verificar se há transação aberta. Caso tenha entrado no catch acima, terá sido executado o rollback, não existirá mais transação aberta e não entrará nesse if
    COMMIT TRANSACTION;  -- Caso ainda haja transação aberta, será feito commit desta
GO  
