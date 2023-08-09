import 'package:flutter/material.dart';

class HomePage  extends StatelessWidget {
  const HomePage ({ Key? key }) : super(key: key);

  @override
  
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cardápio"),
      ),
      body: Column(
        children: [
          Container(
            //margin: const EdgeInsets.only(left: 12, top: 12),
            margin: const EdgeInsets.all(12),
            child: Text("Lasanha",
            style: theme.textTheme.headline4),
          ),
          Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Image.asset("assets/lasanha.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Text("Ingredientes",
            style: theme.textTheme.headline5,
            ),
          ),
            const Text("500 gramas de Massa de lasanha"),
            const Text("500 gramas de Carne moída"),
            const Text("2 caixas de Creme de leite"),
            const Text("3 colheres de Manteiga"),
            const Text("3 colheres de Farinha de trigo"),
        ],
      ),
    );
  }
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cardapio",
      theme: ThemeData(
        primaryColor: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}

void main() => runApp(const Aplicacao());