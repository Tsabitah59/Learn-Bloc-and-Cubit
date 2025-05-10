import 'package:counter_with_bloc/cubit/counter_cubit.dart';
import 'package:counter_with_bloc/ui/profile_screen.dart';
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context, MaterialPageRoute(
                builder: (context) => BlocProvider.value(
                  value: counterCubit,
                  child: ProfileScreen(),
                )
                
                /*
                ProfileScreen(
                  *  value counterCubit diambil dari final yang diatas
                  counterCubit: counterCubit,
                )
                */
              )
            );
          },
          child: Icon(Icons.arrow_forward_ios_rounded),
        ),
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
                ElevatedButton(
                  onPressed: () {
                    final randomCount = Random().nextInt(100);
                    // Untuk update data (spesifiknya untuk variable name)
                    counterCubit.updateName(
                      'Sky',
                      randomCount,
                    );
                  },
                  child: Text("Set Random"),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}
