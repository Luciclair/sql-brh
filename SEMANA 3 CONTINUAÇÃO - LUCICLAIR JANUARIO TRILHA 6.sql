Semana 3  continua��o
Tarefas: 
Listar colaboradores com mais dependentes
Listar faixa et�ria dos dependentes
Paginar listagem de colaboradores
Relat�rio de plano de sa�de
Listar colaboradores que participaram de todos os projetos
select  c.nome as nome_colaborador, d.nome as nome_dependente
OU
c.matricula
from brh.colaborador c
inner Join brh.dependente  d
OU left
on c.matricula = d.colaborador

select c.nome as nome_colaborador,  Count(*)
from brh.colaborador c
inner Join brh.dependente  d
on c.matricula = d.colaborador
group by c.nome

select * from (
select c.nome as nome_colaborador, Count(*) as qtd_dependente
from brh.colaborador c
inner Join brh.dependente d
on c.matricula = d.colaborador
OU
Having Count(*) > 1
Ordery by cont (*) desc, c.nome
group by c.nome
)
Where qtd_dependente

Select cpf, nome, data_nascimento,
to_char(data_nascimento, �dd-mm-yyyy�) as data_formatada ou as data_nascimento,
parentesco,
colaborador,
sysdate � data_nascimento
Ou
Trunc (months_between (sysdate, data_nascimento) / 12 as idade, 
Case When TRUNC (MONTHS_BETWEEN (SYSDATE, data-nascimento/12) < 18 then �Menor de idade�
Else �Maior de idade�
End as faixa_etaria
From brh.dependente

Select c.nome  as nome_colaborador, salario, 
Case When salario <= 3000 then (0.01 * salario)
When salario > 3000 and salario  <= 6000 then (0.02 * salario)
When salario > 6000 and salario <= 2000 then (0.03 * salario)
Else (0.05 * salario) 
End as contribicao_senioridade
From brh.colaborador c 
Select
Colaborador as matricula,
Ou
 sum (campo)
OU 
TRUNC (MONTHS_BETWEEN (SYSDATE, data-nascimento/12) as idade, parentesco,
Sum Case When TRUNC (MONTHS_BETWEEN (SYSDATE, data-nascimento/12) < 18  and parentesco = (�filho(a)�) then 25
Case When TRUNC (MONTHS_BETWEEN (SYSDATE, data-nascimento/12) >= 18  and parentesco = (�filho(a)�) then 50
Else 100
End)  as contribui��o_dependente
From brh.dependente 
Group by colaborador
Ou select nome_colaborador
Select c.nome as nome_colaborador, (contribui��o_senioridade + contribui��o_dependente) as mensalidade 
Case When salario <= 3000 then (0.01 * salario)
When salario > 3000 and salario  <= 6000 then (0.02 * salario)
When salario > 6000 and salario <= 2000 then (0.03 * salario)
Else 100
End as contribuicao_senioridade
Contribui��o_dependente
From brh.dependente
Group by colaborador) d
On c.matricula = d.matricula )
