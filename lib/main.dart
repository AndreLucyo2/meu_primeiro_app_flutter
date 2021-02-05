import 'package:flutter/material.dart';

import 'models/item.dart';

// Ref.: Youtub: https://www.youtube.com/playlist?list=PLHlHvK2lnJndhgbqLl5DNEvKQg5F4ZenQ
// objetivo é criar um appa para gravar uma lista simles de tarefas.
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Todo APP - Flutter',
      debugShowCheckedModeBanner: false, //tira sele debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

//pode ser colocado em outra classe .dart
//https://youtu.be/jStC-RKGyMY?list=PLHlHvK2lnJndhgbqLl5DNEvKQg5F4ZenQ&t=61
class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "Item 1", done: false));
    items.add(Item(title: "Item 2", done: true));
    items.add(Item(title: "Item 1", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo List"),
      ),
      body: ListView.builder(
        //contrutor
        itemCount: widget.items.length, //tamanho da lista
        itemBuilder: (BuildContext ctxt, int index) {
          //fica mais legivel com uso de variavel:
          final item = widget.items[index].title;
          //o que deve ser desenhado
          return Text(item);
        },
      ),
    );
  }
}
