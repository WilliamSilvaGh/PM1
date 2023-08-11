import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);
    
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
        body: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                controller: textController,
                decoration: const InputDecoration(
                  labelText: "Informe seu nome",
                ),
              ),
                SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: ElevatedButton(onPressed: greet, child: const Text("Cumprimente!")),
                ),
              )
            ],
          ),
        ),
    );
  }
  
  void greet(){
    if(textController.text == ''){
      const messageErro = "Preencha antes de clicar!";

      final SnackBarErro = SnackBar(content: Text(messageErro));

      ScaffoldMessenger.of(context).showSnackBar(SnackBarErro);
    }else{
    final message = "Boa noite, ${textController.text}!";
    
    final snackBar = SnackBar(content: Text(message));

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
  

class Aplicacao extends StatelessWidget {
  const Aplicacao({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Greeting",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: const HomePage()
    );
  }
}
void main() => runApp(const Aplicacao());

