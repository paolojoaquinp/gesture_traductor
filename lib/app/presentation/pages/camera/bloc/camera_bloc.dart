import 'package:flutter_bloc/flutter_bloc.dart';

enum GestureState {
  none,
  one,
  two,
  iLoveYou,
  like,
  closed
}

class CameraBloC extends Cubit<String>{
  CameraBloC() : super('Neutral');
  /* String label = 'Neutral'; */

  void setLabel(String current) {
    emit(current);
  }

/*   void setLabel(String label) {
    emit(label);
  }
  void reset() {
    counter = 0;
    emit(state);
  } */

}