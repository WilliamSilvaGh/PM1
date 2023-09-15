import 'package:flutter/material.dart';
import 'package:proximonumerosorteio/home_page.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Próximo Primo",
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: HomePage(),
    );
  }
}
