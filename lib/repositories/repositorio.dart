import 'package:postgres/postgres.dart';

class Repositorio {

  /*
  Base de dados:
    CREATE TABLE pessoas (
    id SERIAL PRIMARY KEY,  -- Coluna de ID com auto-incremento
    nome VARCHAR(100) NOT NULL,  -- Coluna para o nome da pessoa
    email VARCHAR(100) UNIQUE NOT NULL,  -- Coluna para o email, deve ser único
    data_nascimento DATE,  -- Coluna para a data de nascimento
    telefone VARCHAR(20),  -- Coluna para o número de telefone
    endereco TEXT  -- Coluna para o endereço da pessoa
    );
  */

  static final Endpoint _endpoint = Endpoint(
    host: 'ep-quiet-grass-a54otrv0.us-east-2.aws.neon.tech',
    database: 'postgresdb',
    username: 'postgresdb_owner',
    password: 'f6gypr7cjCEd',

  );
  static const ConnectionSettings _connectionSettings =
  ConnectionSettings(sslMode: SslMode.require); // no teste que fiz na base dados do PI usei SslMode.disable

  Future<List<Map<String, dynamic>>> trazerTodasPessoas() async {
    List<String> nomeColunas = ["id", "nome", "email", "data_nascimento", "telefone", "endereco"];
    late final Connection _conn;
    List<Map<String, dynamic>> lista=[];

    try {
      _conn = await Connection.open(_endpoint, settings: _connectionSettings);
      final result = await _conn.execute("SELECT * from pessoas");
      for (var elemento in result){
        Map<String, dynamic> json={};
        for (int i = 0; i < nomeColunas.length; i++) {
          json[nomeColunas[i]] = elemento[i]; // Associa o nome da coluna ao valor
        }
        lista.add(json);
      }
    } catch (e) {
      print('Error: ${e.toString()}');
    } finally {
      await _conn.close();
    }
    print(lista);
    return lista;
  }
}