import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_lamp/data/repositoriesImpl/lamp_repository_impl.dart';
import 'package:my_lamp/domain/usecases/toggle_lamp.dart';
import 'package:my_lamp/presentation/bloc/lamp_bloc.dart';
import 'package:my_lamp/presentation/pages/lamp_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final LampRepositoryImpl repo;
  final ToggleLamp usecase;

  MyApp({super.key})
      : repo = LampRepositoryImpl(),
        usecase = ToggleLamp(LampRepositoryImpl());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LampBloc(usecase),
      child: MaterialApp(
        title: 'Lamp',
        debugShowCheckedModeBanner: false,
        home: LampWrapper(),
      ),
    );
  }
}

class LampWrapper extends StatelessWidget {
  const LampWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LampBloc, bool>(
      builder: (context, isOn) {
        return AnimatedTheme(
          data: isOn ? ThemeData.light() : ThemeData.dark(),
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
          child: LampPage(),
        );
      },
    );
  }
}
