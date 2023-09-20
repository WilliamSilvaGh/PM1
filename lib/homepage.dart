import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final nomeProdutoController = TextEditingController();
  final quantidadeController = TextEditingController();
  final precoController = TextEditingController();
  final precos = ["à vista", "à prazo"];
  String? selectedPreco;
  double? valorTotal;
  double? valor;

  void onChanged(String? newValue) {
    setState(() {
      selectedPreco = newValue;
    });
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pedidos"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: nomeProdutoController,
              decoration: const InputDecoration(
                labelText: "Produto: ",
              ),
            ),
            TextField(
              controller: quantidadeController,
              decoration: const InputDecoration(
                labelText: "Quantidade: ",
              ),
            ),
            TextField(
              controller: precoController,
              decoration: const InputDecoration(
                labelText: "Preço: ",
              ),
            ),
            SizedBox(
              width: double.maxFinite,
              child: DropdownButton<String>(
                value: selectedPreco,
                items: precos.map((String preco) {
                  return DropdownMenuItem<String>(
                    value: preco,
                    child: Text(preco),
                  );
                }).toList(),
                onChanged: onChanged,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                calcularValorComDesconto();
              },
              child: const Text("Calcular Valor"),
            ),
          ],
        ),
      ),
    );
  }
  void calcularValorComDesconto() {
    if (selectedPreco == "à vista") {
      double preco = double.tryParse(precoController.text) ?? 0.0;
      double quantidade = double.tryParse(quantidadeController.text) ?? 0.0;
      
      valorTotal = (preco * quantidade); // Aplica 5% de desconto
      valor = valorTotal! * 0.95;

      ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Valor Total da ${nomeProdutoController.text}: R\$ ${valor.toString()} (${valorTotal.toString()}) "),
      ),
    );
    } else {
      double preco = double.tryParse(precoController.text) ?? 0.0;
      double quantidade = double.tryParse(quantidadeController.text) ?? 0.0;
      valorTotal = preco * quantidade; // Sem desconto

          ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Valor Total da ${nomeProdutoController.text}: R\$ ${valorTotal.toString()}"),
      ),
    );
    }

  }

}
