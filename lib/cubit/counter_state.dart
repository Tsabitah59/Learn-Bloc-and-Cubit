part of 'counter_cubit.dart';

@freezed
abstract class CounterState with _$CounterState {

  const factory CounterState({
    // Membuat parameter dengan nilai default
    @Default(0) int count, 
    @Default("") String name,
  }) = _CounterState;

  // Untuk mengosongkan data nantinya
  factory CounterState.empty() => CounterState(
    count: 0, 
    name: ""
  );

  // Permisalan buat initial nilai
  factory CounterState.initial() => CounterState(
    count: 10, 
    name: "Helatra"
  );
}
