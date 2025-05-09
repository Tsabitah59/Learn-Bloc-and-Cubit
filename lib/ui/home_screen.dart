import 'package:counter_with_bloc/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = CounterCubit();
    
    return BlocProvider(
      create: (context) => counterCubit,
      // Semua yang mau menggunakan bloc provider harus dibungkus dengan BlocBuilder
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 20,
              children: [
                BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, state) {
                    print('Rebiuld Scaffold');
                    return Text(
                    // Digunakan untuk akses variable di CounterState.dart
                      '${state.name}, ${state.count}',
                    );
                  },
                ),
                button(counterCubit: counterCubit),
              ],
            ),
          ),
        ),
      )
    );
  }
}

class button extends StatelessWidget {
  const button({
    super.key,
    required this.counterCubit,
  });

  final CounterCubit counterCubit;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final randomCount = Random().nextInt(100);
        // Untuk update data (spesifiknya untuk variable name)
        counterCubit.updateName(
          'Sky',
          randomCount,
        );
      },
      child: Text("Set Random"),
    ); 
  }
}
