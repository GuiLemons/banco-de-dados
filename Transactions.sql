
BEGIN TRANSACTION;  
 
BEGIN TRY  
     
   
insert into teste values(10, 2)

-- para confirmar a transa��o
COMMIT TRANSACTION;  
-- para desfazer a transa��o
ROLLBACK TRANSACTION;  






-- EXEMPLO DE TRANSACTION COM TRY/CATCH

BEGIN TRANSACTION;  
 
BEGIN TRY  -- tenta fazer o insert
     
    insert into teste values(next value for sTeste, '5')
insert into teste values(10, 2)
END TRY  
BEGIN CATCH  -- caso d� erro, entra no catch
    SELECT  -- select para mostrar na tela algumas informa��es sobre o erro
        ERROR_NUMBER() AS ErrorNumber  
        ,ERROR_SEVERITY() AS ErrorSeverity  
        ,ERROR_STATE() AS ErrorState  
        ,ERROR_PROCEDURE() AS ErrorProcedure  
        ,ERROR_LINE() AS ErrorLine  
        ,ERROR_MESSAGE() AS ErrorMessage;  
 
    IF @@TRANCOUNT > 0  -- if para verificar se h� transa��o aberta
        ROLLBACK TRANSACTION;  -- se entro no catch, executa um rollback para desfazer
END CATCH;  
 
IF @@TRANCOUNT > 0  -- if para verificar se h� transa��o aberta. Caso tenha entrado no catch acima, ter� sido executado o rollback, n�o existir� mais transa��o aberta e n�o entrar� nesse if
    COMMIT TRANSACTION;  -- Caso ainda haja transa��o aberta, ser� feito commit desta
GO  
