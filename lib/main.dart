import 'package:flutter/material.dart';
import 'counter/controllers/cubit/counter_cubit.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter/ui/counter_page.dart';

void main() => runApp(CounterApp());

class CounterApp extends StatelessWidget {
  const CounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (_) => CounterCubit(),
        child: CounterPage(),
      ),
    );
  }
}