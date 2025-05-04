import 'package:bloc_cubit_state/counter/controllers/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter')),
      body: BlocBuilder<CounterBloc, CounterState>(
        builder:
            (context, counter) => Center(
              child: Text(
                '${counter.count}',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
      ),
      floatingActionButton: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed:
                () => context.read<CounterBloc>().add(CounterIncrement()),
          ),
          const SizedBox(height: 4),
          FloatingActionButton(
            child: const Icon(Icons.remove),
            onPressed:
                () => context.read<CounterBloc>().add(CounterDecrement()),
          ),
        ],
      ),
    );
  }
}
