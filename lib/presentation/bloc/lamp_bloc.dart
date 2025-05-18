import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_lamp/domain/usecases/toggle_lamp.dart';

class LampBloc extends Cubit<bool> {
  final ToggleLamp toggleLamp;

  LampBloc(this.toggleLamp) : super(true);

  void toggle() async {
    final newState = await toggleLamp();
    emit(newState);
  }
}
