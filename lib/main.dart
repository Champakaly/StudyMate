import "package:flutter/material.dart";

import 'Frames/chat.dart';
import 'Frames/home.dart';
void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Study Mate",
        themeMode: ThemeMode.system,
        home: HomePage()
    );
  }
}