import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_state.dart';
part 'counter_cubit.freezed.dart';

class CounterCubit extends Cubit<CounterState> {
  // Call CounterState. menjadi penghubung antara counter state dengan homepage-nya nanti
  CounterCubit() : super(CounterState.initial());

  void updateName(String newName, int newCount){
    // CopyWith adalah fitur bawaan freezed yang digunakan untuk copy 
    // dengan mengganti nilai dari suatu variable 

    // Emit sama fungsinya sebagai notifyListener di provider. 
    // Tujuannya untuk memberitahu sistem bahwa ada perubahan di aplikasi
    emit(state.copyWith(
      name: newName,
      count: newCount
    ));
  }
}
