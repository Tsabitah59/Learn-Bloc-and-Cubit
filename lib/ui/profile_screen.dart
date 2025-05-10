import 'dart:math';

import 'package:counter_with_bloc/cubit/counter_cubit.dart';
import 'package:counter_with_bloc/ui/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  // Sebelum pakai BlocProvider.value, kita perlu set parameter satu persatu
  // final CounterCubit counterCubit;

  // Nantinya parameter counterCubit yang kita kasih akan menerima data dari counterCubit di halaman sebelumnya

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(

          // Ini digunakan untuk membawa value dari halaman sebelumnya. tapi karena
          // BlocProvider.value, sudah tidak diperlukan

          // bloc: counterCubit,
          builder: (context, state) {
            print('Rebiuld Scaffold in Profile Page');
            return Text(
              '${state.name}, ${state.count}'
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {                   
          final randomCount = Random().nextInt(100);

          /*
          Perlu di take note kalau tidak bisa menggunakan context sebelum menggunakan 
          BlocProvider.value .Karena context yang diletakkan di button berbeda dengan 
          context yang digunakan untuk build data di BlocBuilder. Namun setelah menggunakan 
          BlocProvider.value, sudah bisa menggunakan context lagi karena context-nya sudah 
          sama seperti yang ada di BlocProvider di HomeScreen.
          */ 
          
          context.read<CounterCubit>().updateName('test', 12);

          // counterCubit.updateName('Earth', randomCount);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
