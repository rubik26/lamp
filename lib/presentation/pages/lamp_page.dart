import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_lamp/presentation/bloc/lamp_bloc.dart';

class LampPage extends StatelessWidget {
  const LampPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isOn = context.watch<LampBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lamp"),
        actions: [
          IconButton(
            icon: Icon(isOn ? Icons.sunny : Icons.nightlight),
            onPressed: () => context.read<LampBloc>().toggle(),
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
