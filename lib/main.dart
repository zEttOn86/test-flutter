import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/TestPage1.dart';
import 'package:test_flutter/TestPage2.dart';
import 'package:test_flutter/TestPage3.dart';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool flag = false;

  _click() async {
    setState(() {
      flag = !flag;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 3),
              width: flag ? 100 : 50,
              height: flag ? 50 : 100,
              padding: flag ? EdgeInsets.all(0) : EdgeInsets.all(30), 
              margin: flag ? EdgeInsets.all(0) : EdgeInsets.all(30),
              transform: flag ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
              color: flag ? Colors.blue : Colors.grey
            ),
            AnimatedSwitcher(
              duration: Duration(seconds: 3),
              child : flag ? Text("何もない") : Icon(Icons.favorite, color: Colors.pink),
            ),
          ],
        ),
      ),
      floatingActionButton:
              Row(
                mainAxisAlignment:MainAxisAlignment.end,
                children:[
                  FloatingActionButton(
                    onPressed: _click,
                    child: Icon(Icons.add),
                  ),
                ],
              ),
    );
  }
}
