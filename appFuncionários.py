import pyodbc

# Configurações de conexão com o banco de dados
server = 'DESKTOP-KSJG3CA\SQLEXPRESS'
database = 'TESTE'
username = 'crud'
password = 'teste'
conn_str = f'DRIVER=SQL Server;SERVER={server};DATABASE={database};UID={username};PWD={password}'

def create_funcionario(nome, cargo, salario):
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()

    cursor.execute("INSERT INTO Funcionarios (Nome, Cargo, Salario) VALUES (?, ?, ?)", nome, cargo, salario)
    conn.commit()

    conn.close()
    print("Funcionário criado com sucesso!")

# Função para ler os dados de um funcionário
def read_funcionario(idFuncionario):
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()

    cursor.execute("SELECT * FROM Funcionarios WHERE idFuncionario = ?", idFuncionario)
    row = cursor.fetchone()

    conn.close()

    if row:
        print("Dados do funcionário:")
        print("ID:", row[0])
        print("Nome:", row[1])
        print("Cargo:", row[2])
        print("Salário:", row[3])
    else:
        print("Funcionário não encontrado.")

# Função para atualizar os dados de um funcionário
def update_funcionario(idFuncionario, nome, cargo, salario):
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()

    cursor.execute("UPDATE Funcionarios SET Nome = ?, Cargo = ?, Salario = ? WHERE idFuncionario = ?", nome, cargo, salario, idFuncionario)
    conn.commit()

    conn.close()
    print("Dados do funcionário atualizados com sucesso!")

# Função para excluir um funcionário
def delete_funcionario(idFuncionario):
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()

    cursor.execute("DELETE FROM Funcionarios WHERE idFuncionario = ?", idFuncionario)
    conn.commit()

    conn.close()
    print("Funcionário excluído com sucesso!")

# Exemplo de uso
create_funcionario("José Silva", "Assistente", 1000)
funcionario = read_funcionario(4)
update_funcionario(4, "Pedro", "Diretor", 10000)
delete_funcionario(3)