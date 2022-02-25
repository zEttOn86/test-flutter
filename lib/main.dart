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

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  bool flag = false;

  _click() async {
    setState(() {
      flag = !flag;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title!),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            AnimatedOpacity(
              opacity: flag ? 0.1 : 1.0, 
              duration: Duration(seconds: 3),
              child: Text(
                "消える文字",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            AnimatedSize(
              vsync: this,
              duration: Duration(seconds: 3),
              child: SizedBox(
                width: flag ? 50 : 200,
                height: flag ? 50 : 200,
                child: Container(color: Colors.purple),
              ),
            ),
            AnimatedAlign(
              alignment: flag ? Alignment.topLeft : Alignment.bottomRight, 
              duration: Duration(seconds: 3),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Container(color: Colors.green),
              ),
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
