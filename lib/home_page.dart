import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final numeroController = TextEditingController();

  HomePage({ Key? key }) : super(key: key);

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
            TextField(
              controller: numeroController,
              decoration: const InputDecoration(
              labelText: "Primeiro número",
            ),
            ),
             Container(
                width: double.maxFinite,
                height: 50,
               child: ElevatedButton(onPressed: () => proximoPrimo(context), child: const Text("Próximo Número"),
            ),
             ),
          ],
        ),
      ),
    );
  }
  void proximoPrimo(BuildContext context){
  var numero = int.parse(numeroController.text);

  while(!ehPrimo(numero)){
    numero++;
  }
  
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("O próximo número primo é: $numero"),
  )
  );
}

  bool ehPrimo(int numero){
    var count = 0;

    for(int i = 2; i <= numero; i++){
     if(numero % i == 0){
      count++;
     } 
    }
    return count <= 2;
  }

}


