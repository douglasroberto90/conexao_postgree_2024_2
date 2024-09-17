import 'package:conexao_postgree_2024_2/repositories/repositorio.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String,dynamic>> lista = [];
  Repositorio repositorio = Repositorio();

  @override
  void initState() {
    repositorio.trazerTodasPessoas().then((dados) {
      setState(() {
        lista = dados;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de pessoas"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(lista[index]["nome"].toString()),
              );
            },
          ))
        ],
      ),
    );
  }
}
