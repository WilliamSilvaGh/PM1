import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final produtoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final precoController = TextEditingController();

  final formatter = NumberFormat.currency(
    locale: "pt-br",
    symbol: "R\$",
  );

  late var total = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            newTextField(
              produtoController,
              "Produto",
              TextInputType.text
            ),
            newTextField(
              quantidadeController,
              "Quantidade",
              TextInputType.number
            ),
            newTextField(
              precoController,
              "Preço",
              TextInputType.number
            ),
            SizedBox(
                width: double.maxFinite,
                child: ElevatedButton(
                    onPressed: calcular, child: const Text("Calcular"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text("Total: "),
                ),
                Text(formatter.format(total)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget newTextField(
      TextEditingController controller, String text, TextInputType inputType) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: text,
      ),
      keyboardType: inputType,
    );
  }

  void calcular(){
    final quantidade = int.parse(quantidadeController.text);
    final preco = double.parse(precoController.text);

    setState(() {
      total = quantidade * preco;
    });
  }
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Pedido",
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomePage(),
    );
  }
}

void main() => runApp(const Aplicacao());
