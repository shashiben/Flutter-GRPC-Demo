// Flutter imports:
import 'package:flutter/material.dart';
import 'package:grpcassign/app/locator.dart';
import 'package:grpcassign/core/services/grpc_service.dart';

// Package imports:

// Project imports:
import 'package:grpcassign/modules/dashboard%20module/screens/dashboard_view.dart';

// Project imports:

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  await locator<GRPCService>().createChannel();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GRPC Demo',
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
