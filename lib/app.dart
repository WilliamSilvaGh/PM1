import 'package:flutter/material.dart';
import 'package:pedido/homepage.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home",
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Homepage(),
    );
  }
}