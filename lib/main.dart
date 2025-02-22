import "package:flutter/material.dart";
import "package:practice/screens/FrontPage.dart";

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My Mall Partner App",
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: Color.fromARGB(172, 28, 49, 206))),
      home: Frontpage(),
    );
  }
}
