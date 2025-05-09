import 'package:counter_with_bloc/app.dart';
import 'package:counter_with_bloc/injection.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(CounterWithBloc());
}


