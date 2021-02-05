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
    items.add(Item(title: "Item 1", done: true));
    items.add(Item(title: "Item 2", done: true));
    items.add(Item(title: "Item 1", done: false));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //controlador do texto input pega a limpa o texto
  var newTaskCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          //faz a ligação do controlador do texto
          controller: newTaskCtrl,
          keyboardType: TextInputType.text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15,
          ),
          decoration: InputDecoration(
              labelText: "Nova Terefa:",
              labelStyle: TextStyle(
                color: Colors.white,
              )),
        ),
      ),
      body: ListView.builder(
        //contrutor
        itemCount: widget.items.length, //tamanho da lista
        itemBuilder: (BuildContext ctxt, int index) {
          //fica mais legivel com uso de variavel:
          final item = widget.items[index];
          //o que deve ser desenhado
          return CheckboxListTile(
            title: Text(item.title),
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              //altera o stado da tela: manda a tela redesenhar/buildar
              //caso algo seja alterado Video 8
              setState(() {
                item.done = value;
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
