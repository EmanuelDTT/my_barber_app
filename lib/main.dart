import 'package:flutter/material.dart';
import 'package:my_barber_app/core/theme/app_theme.dart';
import 'package:my_barber_app/views/home/home_view.dart';




void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber App',
      theme: AppTheme.lightTheme,
      initialRoute: '/home',
      routes: {
        '/home': (_) => const MyHomePage(),


      },
    );
  }
}
