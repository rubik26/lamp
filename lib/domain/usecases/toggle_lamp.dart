import 'package:my_lamp/domain/repositories/lamp_repository.dart';

class ToggleLamp {
  final LampRepository repository;

  ToggleLamp(this.repository);

  Future<bool> call() async {
    return repository.toggleLamp();
  }
}
