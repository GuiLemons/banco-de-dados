 
 -- exemplo de uso de fun��es que retornam informa��es sobre erros
 
 
 SET @MENSAGEM = 'Houve um erro n�mero: ' + CONVERT(VARCHAR(10), ERROR_NUMBER()) + ' - '
 SET @MENSAGEM = @MENSAGEM + 'Mensagem: ' + ERROR_MESSAGE() + ' - '
 SET @MENSAGEM = @MENSAGEM + 'Grau de severidade do erro: ' + CONVERT(VARCHAR(10), ERROR_SEVERITY()) + ' - '
 SET @MENSAGEM = @MENSAGEM + 'Estado do erro: ' + CONVERT(VARCHAR(10), ERROR_STATE()) + ' - '
 SET @MENSAGEM = @MENSAGEM + 'N�mero da linha: ' + CONVERT(VARCHAR(10), ERROR_LINE()) + ' - '
 SET @MENSAGEM = @MENSAGEM + 'Procedure: ' + ERROR_PROCEDURE()