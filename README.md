# conexao_postgree_2024_2

Projeto demonstrando a integração do Flutter com o Postgres via pacote [postgres](https://pub.dev/packages/postgres)

Nesse exemplo é feito uma consulta trazendo toda a tabela Pessoas de um banco de dados em Postgree hospedado no serviço online [Neon](https://neon.tech/).

Os dados são retornados em uma lista de objetos JSON (Map<String, dynamic>) que são consumidos pela HomePage e listados em tela.
O JSON tem como chave o nome da coluna e como valor o conteúdo daquela coluna naquela linha. Ex:
{id: 1, nome: Maria Silva, email: maria.silva@example.com, data_nascimento: 1990-05-20 00:00:00.000Z, telefone: 555-1234, endereco: Rua A, 123, São Paulo}

O banco de dados possui apenas informações geradas via IA, utilizando o seguinte script de criação:

CREATE TABLE pessoas (
id SERIAL PRIMARY KEY,  -- Coluna de ID com auto-incremento
nome VARCHAR(100) NOT NULL,  -- Coluna para o nome da pessoa
email VARCHAR(100) UNIQUE NOT NULL,  -- Coluna para o email, deve ser único
data_nascimento DATE,  -- Coluna para a data de nascimento
telefone VARCHAR(20),  -- Coluna para o número de telefone
endereco TEXT  -- Coluna para o endereço da pessoa
);




