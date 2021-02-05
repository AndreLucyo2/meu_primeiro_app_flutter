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

//metodo que adiciona um novo item em branco com done=false
  void add() {
    //Validação se o item for vazio https://youtu.be/z1DGYDeiW7I?list=PLHlHvK2lnJndhgbqLl5DNEvKQg5F4ZenQ&t=275
    if (newTaskCtrl.text.isEmpty) return;

    setState(() {
      widget.items.add(
        Item(
          title: newTaskCtrl.text,
          done: false,
        ),
      );
      newTaskCtrl.text = "";
    });
  }

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
          //Como a lista deve ser desenhada
          return Dismissible(
            child: CheckboxListTile(
              title: Text(item.title),
              value: item.done,
              onChanged: (value) {
                setState(() {
                  item.done = value;
                });
              },
            ),
            key: Key(item.title),
            background: Container(
              color: Colors.red.withOpacity(0.2),
            ),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                print("Teste: Esquerda!");
              } else {
                print("Teste: Direita!");
              }
              print(direction);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
