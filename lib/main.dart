import 'package:flutter/material.dart';

void main() {
  runApp(
      Material(
              child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('hi'),
      ),

    );
  }
}
