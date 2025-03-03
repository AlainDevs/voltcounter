import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:voltcounter/model/volt_counter_model.dart';
import 'package:voltcounter/view_model/volt_counter_view_model.dart';
import 'package:voltcounter/views/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<VoltCounterModel>(create: (_) => VoltCounterModel()),
        // Provide the ViewModel using ChangeNotifierProvider
        ChangeNotifierProvider<VoltCounterViewModel>(
          create:
              (context) => VoltCounterViewModel(
                Provider.of<VoltCounterModel>(context, listen: false),
              ),
        ),
      ],
      child: const VoltCounterApp(),
    ),
  );
}

class VoltCounterApp extends StatelessWidget {
  const VoltCounterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Volt Counter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
