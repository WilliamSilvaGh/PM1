import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: num1Controller,
                decoration: const InputDecoration(
                  hintText: "Primeiro número: ",
                  border: OutlineInputBorder(),
                ),
              ),
              const Text(
                "+",
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
              TextField(
                controller: num2Controller,
                decoration: const InputDecoration(
                  labelText: "Segundo número: ",
                ),
              ),
              ElevatedButton(
                onPressed: () => soma(context),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add),
                      Text("Somar"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  void soma(BuildContext context){
    final num1 = double.parse(num1Controller.text);
    final num2 = double.parse(num2Controller.text);

    final snackbar = SnackBar(
      content: Text("$num1 + $num2 = ${num1 + num2}"),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

class Aplicacao extends StatelessWidget {
  const Aplicacao({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Soma",
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}

void main() => runApp(const Aplicacao());
