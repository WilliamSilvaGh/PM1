import 'package:flutter/material.dart';
import 'package:flutter_shake_animated/flutter_shake_animated.dart';
import 'package:lista/language.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final languages = [
    Language(name: "C", like: false),
    Language(name: "C#", like: false),
    Language(name: "C++", like: false),
    Language(name: "Java", like: false),
    Language(name: "Java", like: false),
    Language(name: "Python", like: false),
    Language(name: "Javascript", like: false),
    Language(name: "Ruby", like: false),
    Language(name: "SQL", like: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("HomePage"),
        ),
        body: ListView.separated(
          itemCount: languages.length,
          itemBuilder: (context, index) => createItem(languages[index], index),
          separatorBuilder: (context, index) => const Divider(),
        ));
  }

  Widget createItem(Language language, int index) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(language.name),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
                onTap:  () => doLike(index, language),
                child: ShakeWidget(
                  duration: const Duration(seconds: 3),
                  shakeConstant: ShakeChunkConstant(),
                  child: Icon(
                      language.like ? Icons.favorite : Icons.favorite_border,
                      color: Colors.red),
                )),
          ),
        ],
      ),
    );
  }

  void doLike(int index, Language language) {
    setState(() {
      languages[index] = Language(
        name: language.name,
        like: !language.like,
      );
    });
  }
}
