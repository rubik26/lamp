import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_lamp/presentation/bloc/lamp_bloc.dart';

class LampPage extends StatefulWidget {
  const LampPage({super.key});

  @override
  State<LampPage> createState() => _LampPageState();
}

class _LampPageState extends State<LampPage> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    final savedState = box.read('lamp_state') ?? false;

    context.read<LampBloc>().add(SetLampStateEvent(savedState));
  }

  @override
  Widget build(BuildContext context) {
    final isOn = context.watch<LampBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lamp"),
        actions: [
          IconButton(
            icon: Icon(isOn ? Icons.sunny : Icons.nightlight),
            onPressed: () => context.read<LampBloc>().add(ToggleLampEvent()),
          )
        ],
      ),
      body: Center(
        child: Icon(
          Icons.lightbulb,
          size: 100,
          color: isOn ? Colors.yellow : Colors.grey,
        ),
      ),
    );
  }
}
