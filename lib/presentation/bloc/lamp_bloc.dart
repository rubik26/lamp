import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_lamp/domain/usecases/toggle_lamp.dart';
import 'package:path_provider/path_provider.dart';

sealed class LampEvent {}

final class ToggleLampEvent extends LampEvent {}

class SetLampStateEvent extends LampEvent {
  final bool isOn;
  SetLampStateEvent(this.isOn);
}

class LampBloc extends Bloc<LampEvent, bool> {
  final box = GetStorage();
  final ToggleLamp toggleLamp;

  LampBloc(this.toggleLamp) : super(true) {
    on<ToggleLampEvent>((event, emit) async {
      final newState = !state;
      emit(newState);
      box.write('lamp_state', newState);
    });
    on<SetLampStateEvent>((event, emit) => emit(event.isOn));
  }

  @override
  void onChange(Change<bool> change) {
    super.onChange(change);
    logToFile('State changed: ${change.currentState} → ${change.nextState}');
  }

  Future<void> logToFile(String message) async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/log.txt');

    final timestamp = DateTime.now().toIso8601String();
    await file.writeAsString(
      '$timestamp: $message\n',
      mode: FileMode.append,
    );
  }
}
