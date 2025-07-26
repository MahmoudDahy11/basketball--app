import 'package:count_app/cubit/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit(initialState) : super(CounterInitial());
  int teamAPoint = 0;
  int teamBPoint = 0;
  void teamIncrement({required String team, required int bottonNumber}) {
    if (team == 'A') {
      teamAPoint += bottonNumber;
      emit(CounterAIncrements());
    } else {
      teamBPoint += bottonNumber;
      emit(CounterBIncrements());
    }
  }

  void counterReset() {
    teamAPoint = 0;
    teamBPoint = 0;
    emit(CounterReset());
  }
}
