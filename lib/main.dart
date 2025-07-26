import 'package:count_app/screens/home_page.dart';
import 'package:count_app/cubit/counter_cubit.dart';
import 'package:count_app/cubit/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  return runApp(CounterApp());
}

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(CounterInitial()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0XFFFF9800),
            title: Text(
              'Points Counter',
              style: TextStyle(color: Colors.white, fontSize: 28),
            ),
          ),
          body: HomePage(),
        ),
      ),
    );
  }
}
