import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/controllers/bloc/counter_bloc.dart';
import 'counter/ui/counter_page.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}