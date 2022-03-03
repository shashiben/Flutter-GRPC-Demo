// Flutter imports:
import 'package:flutter/material.dart';
import 'package:grpcassign/modules/dashboard%20module/screens/dashboard_view.dart';

// Package imports:
import 'package:http/http.dart' as http;

// Project imports:

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
            style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                    const TextStyle(fontSize: 16, color: Color(0xFF1a1a1a))))),
        textTheme: Theme.of(context)
            .textTheme
            .apply(displayColor: const Color(0xFF1a1a1a)),
        backgroundColor: const Color(0xFFFFFEFE),
        scaffoldBackgroundColor: const Color(0xFFFFFEFE),
        inputDecorationTheme: const InputDecorationTheme(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Color(0xFFAA9BA1)),
            fillColor: Color(0xFFF6F7F8),
            filled: true),
        primaryColor: const Color(0xFF353B40),
      ),
      debugShowCheckedModeBanner: false,
      home: const DashboardView(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () async {
                  await http.get(Uri.parse("http://127.0.0.1:5000"));
                },
                child: const Text("Click Me"))
          ],
        ),
      ),
    );
  }
}
