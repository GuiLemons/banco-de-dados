-- Função com retorno table
-- função que retorna alunos com data de nascimento maior que a enviada por parâmetro



create function retorna_alunos(@data date)
returns @tbaluno table(id int ,
nome varchar(200))
as
begin

insert into @tbaluno
select id_aluno, nome from Alunos where data_nascimento > @data

return
end

select * from retorna_alunos('10/01/1950')



-- Função que retorna apenas um valor



create function soma (@a int, @b int)
returns int
as

begin
 
declare @res int
set @res = @a+@b
return @res

end

select dbo.soma(4,2)



-- Função que retira acentos



create function retiraAcentos(@textoOriginal varchar(300))
returns varchar(300)
as
begin

declare @vComAcento varchar(300)
declare @vSemAcento varchar(300)
declare @a int
declare @posicao int

set @vComAcento = 'àáâãäåçèéêëìíîïòóôõöùúûüÀÁÂÃÄÅÇÈÉÊËÌÍÎÏÒÓÔÕÖÙÚÛÜ-'
set @vSemAcento = 'aaaaaaceeeeiiiiooooouuuuAAAAAACEEEEIIIIOOOOOUUUU '

set @a = 1

while @a <= len(@textoOriginal)
begin
set @posicao = CHARINDEX(substring(@textoOriginal, @a, 1),@vComAcento, 1);
if @posicao > 0
begin
set @textoOriginal = REPLACE(@textoOriginal,
substring(@vComAcento, @posicao,1),
substring(@vSemAcento, @posicao,1));
end
     set @a = @a+1
end
return @textoOriginal
end

select dbo.retiraAcentos('ação')
