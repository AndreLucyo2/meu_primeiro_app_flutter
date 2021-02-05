import 'package:flutter/material.dart';

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
      body: Container(
        child: Center(child: Text("Ola Mundo!")),
      ),
    );
  }
}
