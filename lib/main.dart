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
  late AnimationController _animationController;

  _play() async {
    setState(() {
      _animationController.forward();
    });
  }

  _stop() async {
    setState(() {
      _animationController.stop();
    });
  }

  _reverse() async {
    setState(() {
      _animationController.reverse();
    });
  }

  @override
  void initState() {
    super.initState();
    _animationController = 
      AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizeTransition(
              sizeFactor: _animationController,
              child: Center(
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Container(color: Colors.green),
                ),
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
                    onPressed: _play,
                    child: Icon(Icons.arrow_forward),
                  ),
                  FloatingActionButton(
                    onPressed: _stop,
                    child: Icon(Icons.pause),
                  ),
                  FloatingActionButton(
                    onPressed: _reverse,
                    child: Icon(Icons.arrow_back),
                  )
                ],
              ),
    );
  }
}
