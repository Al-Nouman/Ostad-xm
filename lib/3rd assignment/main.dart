import 'package:flutter/material.dart';
import 'src/presentation/ui/screen/home_screen.dart';

void main() => runApp(const CrudApp());

class CrudApp extends StatelessWidget {
  const CrudApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CURD App',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
