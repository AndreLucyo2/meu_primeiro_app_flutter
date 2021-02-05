import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
    // items.add(Item(title: "Item 1", done: true));
    // items.add(Item(title: "Item 2", done: true));
    // items.add(Item(title: "Item 1", done: false));
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
      //ao adiciona salva no SharedPreferences BD.
      save();
    });
  }

  //Metodo que remove um item da lista:
  void remove(int index) {
    setState(() {
      widget.items.removeAt(index);
      //ao remover salva no SharedPreferences BD.
      save();
    });
  }

//uma função assincrona para pegar os dados persistidos
//Cria uma promessa que vai retornar dados:
  Future load() async {
    //agaurdo até que a reauisição esteja carregado
    var prefs = await SharedPreferences.getInstance();

    //apos aguardar...
    var data = prefs.getString('data');
    //data pode vir nulo:
    if (data != null) {
      //se tem informação: Tranforma em json:
      Iterable decoded = jsonDecode(data);
      //semelhante a um foreach, para adicionar os itens na lista
      //Faz o mapeamento dos objetos:iteração na lista
      List<Item> result = decoded.map((x) => Item.fromJson(x)).toList();

      //percorre a lista de strings
      //Muda o stado da tela:
      setState(() {
        widget.items =
            result; // https://youtu.be/vpkdRq5L4U4?list=PLHlHvK2lnJndhgbqLl5DNEvKQg5F4ZenQ&t=494
      });
    }
  }

  //Salva os dados no SharedPreferences
  save() async {
    var prefs = await SharedPreferences.getInstance();
    //Transforma os itens em uma lista:
    await prefs.setString('data', jsonEncode(widget.items));
  }

  //Faz a leitura dos dados ao carregar  a aplicação:
  _HomePageState() {
    load();
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
                  //se trocar o item salva no SharedPreferences BD.
                  save();
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
                //chama o metodo para remover o item
                remove(index);
              } else {
                print("Teste: Direita!");
              }
              print(direction); //teste
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
