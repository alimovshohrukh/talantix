import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:talantix/ui/crypto_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Talantix',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF12202F),
      body: Center(
        child: Container(
          height: 200.0,
          width: 100.0,
          alignment: Alignment.topCenter,
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: loopWidgets(),
        ),
      ),
    );
  }

  Widget loopWidgets() {
    return ListView.builder(
        itemCount: 500,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        itemBuilder: (context, itemIndex) {
          return CryptoWidget(
            index: itemIndex,
          );
        });
  }
}
