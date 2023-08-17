-- Esta query cria a tabela 'Funcionarios' para armazenar informações sobre os funcionários.

CREATE TABLE Funcionarios (
    idFuncionario INT IDENTITY(1,1) PRIMARY KEY, -- Coluna de ID automático e chave primária
    Nome VARCHAR(50),                -- Coluna para armazenar o nome do funcionário
    Cargo VARCHAR(50),               -- Coluna para armazenar o cargo do funcionário
    Salario DECIMAL(10, 2)           -- Coluna para armazenar o salário do funcionário
);


SELECT * FROM Funcionarios -- Esta consulta traz como resultado todos os dados que foram inseridos ou atualizados da tabela criada anteriormente


-- Esta consulta calcula a quantidade de funcionários por cargo e o total de salários pagos por cargo.

SELECT
    Cargo,                           -- Seleciona a coluna 'Cargo'
    COUNT(*) AS Quantidade_Funcionarios, -- Conta a quantidade de registros em cada grupo
    SUM(Salario) AS Total_Salarios   -- Soma os salários em cada grupo
FROM
    Funcionarios                      -- Seleciona a tabela 'Funcionarios'
GROUP BY
    Cargo;                            -- Agrupa os resultados pela coluna 'Cargo'
