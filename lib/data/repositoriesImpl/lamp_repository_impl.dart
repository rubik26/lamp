import 'package:my_lamp/domain/repositories/lamp_repository.dart';

class LampRepositoryImpl implements LampRepository {
  bool _isOn = true;

  @override
  Future<bool> toggleLamp() async {
    _isOn = !_isOn;
    return _isOn;
  }

  @override
  bool getLampState() => _isOn;
}
