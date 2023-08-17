-- Esta query cria a tabela 'Funcionarios' para armazenar informa��es sobre os funcion�rios.

CREATE TABLE Funcionarios (
    idFuncionario INT IDENTITY(1,1) PRIMARY KEY, -- Coluna de ID autom�tico e chave prim�ria
    Nome VARCHAR(50),                -- Coluna para armazenar o nome do funcion�rio
    Cargo VARCHAR(50),               -- Coluna para armazenar o cargo do funcion�rio
    Salario DECIMAL(10, 2)           -- Coluna para armazenar o sal�rio do funcion�rio
);


SELECT * FROM Funcionarios -- Esta consulta traz como resultado todos os dados que foram inseridos ou atualizados da tabela criada anteriormente


-- Esta consulta calcula a quantidade de funcion�rios por cargo e o total de sal�rios pagos por cargo.

SELECT
    Cargo,                           -- Seleciona a coluna 'Cargo'
    COUNT(*) AS Quantidade_Funcionarios, -- Conta a quantidade de registros em cada grupo
    SUM(Salario) AS Total_Salarios   -- Soma os sal�rios em cada grupo
FROM
    Funcionarios                      -- Seleciona a tabela 'Funcionarios'
GROUP BY
    Cargo;                            -- Agrupa os resultados pela coluna 'Cargo'
