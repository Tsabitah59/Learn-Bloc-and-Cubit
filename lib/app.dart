import 'package:counter_with_bloc/ui/home_screen.dart';
import 'package:flutter/material.dart';

class CounterWithBloc extends StatelessWidget {
  const CounterWithBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomeScreen()
    );
  }
}