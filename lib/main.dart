import 'package:flutter/material.dart';

// Ref.: Youtub: https://www.youtube.com/playlist?list=PLHlHvK2lnJndhgbqLl5DNEvKQg5F4ZenQ
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

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Center(child: Text("Ola Mundo!")),
      ),
    );
  }
}
