import 'package:count_app/components/category.dart';
import 'package:flutter/material.dart';

void main() {
  return runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0XFFFF9800),
          title: Text(
            'Points Counter',
            style: TextStyle(color: Colors.white, fontSize: 28),
          ),
        ),
        body: Category(),
      ),
    );
  }
}
